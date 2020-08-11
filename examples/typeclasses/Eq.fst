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
module Eq

open FStar.Tactics.Typeclasses

(* A class for decidable equality *)
class deq a = {
  eq    : a -> a -> bool;
  eq_ok : (x:a) -> (y:a) -> Lemma (eq x y <==> x == y)
}

(* These methods are generated by the splice *)
(* [@@tcnorm] let eq_ok (#a:Type) {|d : deq a|} = d.eq_ok *)
(* [@@tcnorm] let eq    (#a:Type) {|d : deq a|} = d.eq *)

(* A way to get `deq a` for any `a : eqtype` *)
let eq_instance_of_eqtype (#a:eqtype) : deq a =
  Mkdeq (fun x y -> x = y) (fun x y -> ())

(* Two concrete instances *)
instance _ : deq int = eq_instance_of_eqtype
instance _ : deq bool = eq_instance_of_eqtype
instance _ : deq string = eq_instance_of_eqtype

let rec eqList {|deq 'a|} (xs ys : list 'a) : Tot (b:bool{b <==> xs == ys}) =
  match xs, ys with
  | [], [] -> true
  | x::xs, y::ys -> eq_ok x y; eq x y && eqList xs ys
  | _, _ -> false

(* Parametric instances *)
instance eq_list (_ : deq 'a) : deq (list 'a) =
  Mkdeq eqList (fun x y -> ())

instance eq_pair (_ : deq 'a) (_ : deq 'b) : deq ('a * 'b) =
  Mkdeq (fun (a,b) (c,d) -> eq a c && eq b d)
        (fun (a,b) (c,d) -> eq_ok a c; eq_ok b d)

(* A few tests *)
let _ = assert (eq 1 1)
let _ = assert (not (eq 1 2))

let _ = assert (eq true true)
let _ = assert (not (eq true false))

let _ = assert (eq [1;2] [1;2])
let _ = assert (not (eq [2;1] [1;2]))

let _ = assert (eq (1, "A") (1, "A"))
let _ = assert (not (eq (1, "A") (1, "B")))
let _ = assert (not (eq (2, "A") (1, "B")))
let _ = assert (not (eq (2, "A") (1, "A")))
