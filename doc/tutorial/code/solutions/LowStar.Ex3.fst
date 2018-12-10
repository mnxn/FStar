(*
   Copyright 2008-2018 Microsoft Research

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*)
/// This module is standalone and can be successfully compiled with:
/// krml -no-prefix Solution.FiniteListGhostRepr Solution.FiniteListGhostRepr.fst
module LowStar.Ex3

open FStar.Integers

/// We some common abbreviations, taking care to shadow ST to make sure
/// we don't end up referring to FStar.ST by accident.
module B = LowStar.Buffer
module HS = FStar.HyperStack
module M = LowStar.Modifies
module ST = FStar.HyperStack.ST
module S = FStar.Seq

/// This brings into scope the ``!*`` and ``*=`` operators, which are
/// specifically designed to operate on buffers of size 1, i.e. on pointers.
open LowStar.BufferOps
open FStar.HyperStack.ST
open LowStar.Modifies

/// A finite list `t a` is a pointer to a struct with 3 fields
noeq
type t_struct a = {
  b: B.buffer a;              //An underlying array to hold the elements
  total_length: uint_32;      //of fixed maximum size
  first: uint_32;             //the position of the head of the list
}
type t a = B.pointer (t_struct a)

/// To facilitate writing predicates, we define a handy shortcut that is the
/// reflection of the ``!*`` operator at the proof level.
unfold
let deref #a (h: HS.mem) (x: B.pointer a) = B.get h x 0

/// Here's a well-formedness predicate on a finite list `xs: t a`
/// in a given heap `h`
unfold
let ok #a (h: HS.mem) (xs: t a) =
  B.live h xs /\ //Temporal safety: the reference to the struct is live
  (let x = deref h xs in
   B.live h x.b /\  //Temporal safety: the array within the struct is live
   M.loc_disjoint (M.loc_buffer x.b) (M.loc_buffer xs) /\ //Anti-aliasing, needed for framing
   B.len x.b = x.total_length /\ //Spatial safety: the total_length field really is the length
   x.first <= x.total_length)  //Spatial safety: the first field is within bounds of the array

/// Computing the representation of the mutable finite list
/// as a pure sequence (for use in specification)
let repr #a h (xs:t a{ok h xs}) : GTot (Seq.seq a) =
    let x = deref h xs in
    B.as_seq h (B.gsub x.b x.first (x.total_length - x.first))

/// A predicate stating that xs has no elements
let empty #a h (xs: t a{ok h xs}) =
  Seq.equal (repr h xs) Seq.createEmpty

/// A predicate stating that xs has no more capacity
let full #a h (xs: t a{ok h xs}) =
  Seq.length (repr h xs) == v (deref h xs).total_length

/// Your goal is now to write suitable pre- and post-conditions for this
/// function, along with its body. Start with the pre-condition: what is the
/// predicate that will allow us to always pop an element off the front of the
/// list? Then, provide a suitable post-condition that captures both the memory
/// safety and the semantics of the function.
let pop #a (x: t a): Stack a
  (requires fun h -> ok h x /\ ~(empty h x))
  (ensures fun h0 r h1 ->
            ok h1 x
         /\  Seq.equal (repr h1 x) (Seq.tail (repr h0 x))
         /\  r == Seq.head (repr h0 x)
         /\  modifies (loc_union (loc_buffer x)
                                (loc_buffer (deref h0 x).b)) h0 h1)
= let v = !* x in
  let res : a = v.b.(v.first) in
  let next = v.first + 1ul in
  x *= {v with first=next};
  res

/// Similar thing with push.
let push #a (x: t a) (e:a) : Stack unit
  (requires fun h -> ok h x /\ ~(full h x))
  (ensures fun h0 _ h1 ->
            ok h1 x
         /\  Seq.equal (repr h1 x) (Seq.cons e (repr h0 x))
         /\  modifies (loc_union (loc_buffer x)
                                (loc_buffer (deref h0 x).b)) h0 h1)
= let v = !* x in
  let next = v.first - 1ul in
  v.b.(next) <- e;
  x *= {v with first=next}

unfold inline_for_extraction
let malloc #a (init: a) len = B.malloc #a HS.root init len

/// Finally, the create function. Find a suitable pre-condition, and reflect the
/// semantics and memory changes in the post-condition.
let create #a (def:a) (len:uint_32) : ST (t a)
  (requires fun h -> len <> 0ul)
  (ensures fun h0 r h1 ->
            ok h1 r
          /\ Seq.equal (repr h1 r) Seq.createEmpty
          /\ (deref h1 r).total_length = len
          /\ modifies loc_none h0 h1)
 = let buf = {
       b = malloc def len;
       first = len;
       total_length = len
   } in
   B.malloc HS.root buf 1ul

/// This main function forces suitable monomorphizations to be generated by KreMLin.
let main (): St int_32 =
  let l = create 1l 120ul in
  push l 0l;
  pop l
