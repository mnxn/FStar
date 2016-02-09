
open Prims
type binding =
| Binding_var of (FStar_Absyn_Syntax.bvvdef * FStar_Absyn_Syntax.typ)
| Binding_typ of (FStar_Absyn_Syntax.btvdef * FStar_Absyn_Syntax.knd)
| Binding_lid of (FStar_Ident.lident * FStar_Absyn_Syntax.typ)
| Binding_sig of FStar_Absyn_Syntax.sigelt

let is_Binding_var : binding  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Binding_var (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_typ : binding  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Binding_typ (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_lid : binding  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Binding_lid (_) -> begin
true
end
| _ -> begin
false
end))

let is_Binding_sig : binding  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Binding_sig (_) -> begin
true
end
| _ -> begin
false
end))

let ___Binding_var____0 : binding  ->  (FStar_Absyn_Syntax.bvvdef * FStar_Absyn_Syntax.typ) = (fun projectee -> (match (projectee) with
| Binding_var (_44_16) -> begin
_44_16
end))

let ___Binding_typ____0 : binding  ->  (FStar_Absyn_Syntax.btvdef * FStar_Absyn_Syntax.knd) = (fun projectee -> (match (projectee) with
| Binding_typ (_44_19) -> begin
_44_19
end))

let ___Binding_lid____0 : binding  ->  (FStar_Ident.lident * FStar_Absyn_Syntax.typ) = (fun projectee -> (match (projectee) with
| Binding_lid (_44_22) -> begin
_44_22
end))

let ___Binding_sig____0 : binding  ->  FStar_Absyn_Syntax.sigelt = (fun projectee -> (match (projectee) with
| Binding_sig (_44_25) -> begin
_44_25
end))

type sigtable =
FStar_Absyn_Syntax.sigelt FStar_Util.smap

let default_table_size : Prims.int = 200

let strlid_of_sigelt : FStar_Absyn_Syntax.sigelt  ->  Prims.string Prims.option = (fun se -> (match ((FStar_Absyn_Util.lid_of_sigelt se)) with
| None -> begin
None
end
| Some (l) -> begin
Some ((FStar_Ident.text_of_lid l))
end))

let signature_to_sigtables : FStar_Absyn_Syntax.sigelt Prims.list  ->  FStar_Absyn_Syntax.sigelt FStar_Util.smap = (fun s -> (let ht = (FStar_Util.smap_create default_table_size)
in (let _44_35 = (FStar_List.iter (fun se -> (let lids = (FStar_Absyn_Util.lids_of_sigelt se)
in (FStar_List.iter (fun l -> (FStar_Util.smap_add ht l.FStar_Ident.str se)) lids))) s)
in ht)))

let modules_to_sigtables = (fun mods -> (let _146_65 = (FStar_List.collect (fun _44_41 -> (match (_44_41) with
| (_44_39, m) -> begin
m.FStar_Absyn_Syntax.declarations
end)) mods)
in (signature_to_sigtables _146_65)))

type level =
| Expr
| Type
| Kind

let is_Expr : level  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Expr -> begin
true
end
| _ -> begin
false
end))

let is_Type : level  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Type -> begin
true
end
| _ -> begin
false
end))

let is_Kind : level  ->  Prims.bool = (fun _discr_ -> (match (_discr_) with
| Kind -> begin
true
end
| _ -> begin
false
end))

type mlift =
FStar_Absyn_Syntax.typ  ->  FStar_Absyn_Syntax.typ  ->  FStar_Absyn_Syntax.typ

type edge =
{msource : FStar_Ident.lident; mtarget : FStar_Ident.lident; mlift : mlift}

let is_Mkedge : edge  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkedge"))))

type effects =
{decls : FStar_Absyn_Syntax.eff_decl Prims.list; order : edge Prims.list; joins : (FStar_Ident.lident * FStar_Ident.lident * FStar_Ident.lident * mlift * mlift) Prims.list}

let is_Mkeffects : effects  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkeffects"))))

type env =
{solver : solver_t; range : FStar_Range.range; curmodule : FStar_Ident.lident; gamma : binding Prims.list; modules : FStar_Absyn_Syntax.modul Prims.list; expected_typ : FStar_Absyn_Syntax.typ Prims.option; level : level; sigtab : sigtable Prims.list; is_pattern : Prims.bool; instantiate_targs : Prims.bool; instantiate_vargs : Prims.bool; effects : effects; generalize : Prims.bool; letrecs : (FStar_Absyn_Syntax.lbname * FStar_Absyn_Syntax.typ) Prims.list; top_level : Prims.bool; check_uvars : Prims.bool; use_eq : Prims.bool; is_iface : Prims.bool; admit : Prims.bool; default_effects : (FStar_Ident.lident * FStar_Ident.lident) Prims.list} 
 and solver_t =
{init : env  ->  Prims.unit; push : Prims.string  ->  Prims.unit; pop : Prims.string  ->  Prims.unit; mark : Prims.string  ->  Prims.unit; reset_mark : Prims.string  ->  Prims.unit; commit_mark : Prims.string  ->  Prims.unit; encode_modul : env  ->  FStar_Absyn_Syntax.modul  ->  Prims.unit; encode_sig : env  ->  FStar_Absyn_Syntax.sigelt  ->  Prims.unit; solve : env  ->  FStar_Absyn_Syntax.typ  ->  Prims.unit; is_trivial : env  ->  FStar_Absyn_Syntax.typ  ->  Prims.bool; finish : Prims.unit  ->  Prims.unit; refresh : Prims.unit  ->  Prims.unit}

let is_Mkenv : env  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mkenv"))))

let is_Mksolver_t : solver_t  ->  Prims.bool = (Obj.magic ((fun _ -> (FStar_All.failwith "Not yet implemented:is_Mksolver_t"))))

let bound_vars : env  ->  (FStar_Absyn_Syntax.btvar, FStar_Absyn_Syntax.bvvar) FStar_Util.either Prims.list = (fun env -> (FStar_All.pipe_right env.gamma (FStar_List.collect (fun _44_1 -> (match (_44_1) with
| Binding_typ (a, k) -> begin
(let _146_291 = (FStar_All.pipe_left (fun _146_290 -> FStar_Util.Inl (_146_290)) (FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_146_291)::[])
end
| Binding_var (x, t) -> begin
(let _146_293 = (FStar_All.pipe_left (fun _146_292 -> FStar_Util.Inr (_146_292)) (FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_146_293)::[])
end
| Binding_lid (_44_95) -> begin
[]
end
| Binding_sig (_44_98) -> begin
[]
end)))))

let has_interface : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env l -> (FStar_All.pipe_right env.modules (FStar_Util.for_some (fun m -> (m.FStar_Absyn_Syntax.is_interface && (FStar_Ident.lid_equals m.FStar_Absyn_Syntax.name l))))))

let debug : env  ->  FStar_Options.debug_level_t  ->  Prims.bool = (fun env l -> ((let _146_304 = (FStar_ST.read FStar_Options.debug)
in (FStar_All.pipe_right _146_304 (FStar_Util.for_some (fun x -> (env.curmodule.FStar_Ident.str = x))))) && (FStar_Options.debug_level_geq l)))

let show : env  ->  Prims.bool = (fun env -> (let _146_308 = (FStar_ST.read FStar_Options.show_signatures)
in (FStar_All.pipe_right _146_308 (FStar_Util.for_some (fun x -> (env.curmodule.FStar_Ident.str = x))))))

let new_sigtab = (fun _44_108 -> (match (()) with
| () -> begin
(FStar_Util.smap_create default_table_size)
end))

let sigtab : env  ->  sigtable = (fun env -> (FStar_List.hd env.sigtab))

let push : env  ->  Prims.string  ->  env = (fun env msg -> (let _44_112 = (env.solver.push msg)
in (let _44_114 = env
in (let _146_318 = (let _146_317 = (let _146_316 = (sigtab env)
in (FStar_Util.smap_copy _146_316))
in (_146_317)::env.sigtab)
in {solver = _44_114.solver; range = _44_114.range; curmodule = _44_114.curmodule; gamma = _44_114.gamma; modules = _44_114.modules; expected_typ = _44_114.expected_typ; level = _44_114.level; sigtab = _146_318; is_pattern = _44_114.is_pattern; instantiate_targs = _44_114.instantiate_targs; instantiate_vargs = _44_114.instantiate_vargs; effects = _44_114.effects; generalize = _44_114.generalize; letrecs = _44_114.letrecs; top_level = _44_114.top_level; check_uvars = _44_114.check_uvars; use_eq = _44_114.use_eq; is_iface = _44_114.is_iface; admit = _44_114.admit; default_effects = _44_114.default_effects}))))

let mark : env  ->  env = (fun env -> (let _44_117 = (env.solver.mark "USER MARK")
in (let _44_119 = env
in (let _146_323 = (let _146_322 = (let _146_321 = (sigtab env)
in (FStar_Util.smap_copy _146_321))
in (_146_322)::env.sigtab)
in {solver = _44_119.solver; range = _44_119.range; curmodule = _44_119.curmodule; gamma = _44_119.gamma; modules = _44_119.modules; expected_typ = _44_119.expected_typ; level = _44_119.level; sigtab = _146_323; is_pattern = _44_119.is_pattern; instantiate_targs = _44_119.instantiate_targs; instantiate_vargs = _44_119.instantiate_vargs; effects = _44_119.effects; generalize = _44_119.generalize; letrecs = _44_119.letrecs; top_level = _44_119.top_level; check_uvars = _44_119.check_uvars; use_eq = _44_119.use_eq; is_iface = _44_119.is_iface; admit = _44_119.admit; default_effects = _44_119.default_effects}))))

let commit_mark : env  ->  env = (fun env -> (let _44_122 = (env.solver.commit_mark "USER MARK")
in (let sigtab = (match (env.sigtab) with
| hd::_44_126::tl -> begin
(hd)::tl
end
| _44_131 -> begin
(FStar_All.failwith "Impossible")
end)
in (let _44_133 = env
in {solver = _44_133.solver; range = _44_133.range; curmodule = _44_133.curmodule; gamma = _44_133.gamma; modules = _44_133.modules; expected_typ = _44_133.expected_typ; level = _44_133.level; sigtab = sigtab; is_pattern = _44_133.is_pattern; instantiate_targs = _44_133.instantiate_targs; instantiate_vargs = _44_133.instantiate_vargs; effects = _44_133.effects; generalize = _44_133.generalize; letrecs = _44_133.letrecs; top_level = _44_133.top_level; check_uvars = _44_133.check_uvars; use_eq = _44_133.use_eq; is_iface = _44_133.is_iface; admit = _44_133.admit; default_effects = _44_133.default_effects}))))

let reset_mark : env  ->  env = (fun env -> (let _44_136 = (env.solver.reset_mark "USER MARK")
in (let _44_138 = env
in (let _146_328 = (FStar_List.tl env.sigtab)
in {solver = _44_138.solver; range = _44_138.range; curmodule = _44_138.curmodule; gamma = _44_138.gamma; modules = _44_138.modules; expected_typ = _44_138.expected_typ; level = _44_138.level; sigtab = _146_328; is_pattern = _44_138.is_pattern; instantiate_targs = _44_138.instantiate_targs; instantiate_vargs = _44_138.instantiate_vargs; effects = _44_138.effects; generalize = _44_138.generalize; letrecs = _44_138.letrecs; top_level = _44_138.top_level; check_uvars = _44_138.check_uvars; use_eq = _44_138.use_eq; is_iface = _44_138.is_iface; admit = _44_138.admit; default_effects = _44_138.default_effects}))))

let pop : env  ->  Prims.string  ->  env = (fun env msg -> (match (env.sigtab) with
| ([]) | (_::[]) -> begin
(FStar_All.failwith "Too many pops")
end
| _44_148::tl -> begin
(let _44_150 = (env.solver.pop msg)
in (let _44_152 = env
in {solver = _44_152.solver; range = _44_152.range; curmodule = _44_152.curmodule; gamma = _44_152.gamma; modules = _44_152.modules; expected_typ = _44_152.expected_typ; level = _44_152.level; sigtab = tl; is_pattern = _44_152.is_pattern; instantiate_targs = _44_152.instantiate_targs; instantiate_vargs = _44_152.instantiate_vargs; effects = _44_152.effects; generalize = _44_152.generalize; letrecs = _44_152.letrecs; top_level = _44_152.top_level; check_uvars = _44_152.check_uvars; use_eq = _44_152.use_eq; is_iface = _44_152.is_iface; admit = _44_152.admit; default_effects = _44_152.default_effects}))
end))

let initial_env : solver_t  ->  FStar_Absyn_Syntax.lident  ->  env = (fun solver module_lid -> (let _146_338 = (let _146_337 = (new_sigtab ())
in (_146_337)::[])
in {solver = solver; range = FStar_Absyn_Syntax.dummyRange; curmodule = module_lid; gamma = []; modules = []; expected_typ = None; level = Expr; sigtab = _146_338; is_pattern = false; instantiate_targs = true; instantiate_vargs = true; effects = {decls = []; order = []; joins = []}; generalize = true; letrecs = []; top_level = true; check_uvars = false; use_eq = false; is_iface = false; admit = false; default_effects = []}))

let effect_decl_opt : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.eff_decl Prims.option = (fun env l -> (FStar_All.pipe_right env.effects.decls (FStar_Util.find_opt (fun d -> (FStar_Ident.lid_equals d.FStar_Absyn_Syntax.mname l)))))

let name_not_found : FStar_Absyn_Syntax.lident  ->  Prims.string = (fun l -> (FStar_Util.format1 "Name \"%s\" not found" l.FStar_Ident.str))

let variable_not_found = (fun v -> (let _146_347 = (FStar_Absyn_Print.strBvd v)
in (FStar_Util.format1 "Variable \"%s\" not found" _146_347)))

let get_effect_decl : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.eff_decl = (fun env l -> (match ((effect_decl_opt env l)) with
| None -> begin
(let _146_354 = (let _146_353 = (let _146_352 = (name_not_found l)
in (_146_352, (FStar_Ident.range_of_lid l)))
in FStar_Absyn_Syntax.Error (_146_353))
in (Prims.raise _146_354))
end
| Some (md) -> begin
md
end))

let join : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.lident * mlift * mlift) = (fun env l1 l2 -> if (FStar_Ident.lid_equals l1 l2) then begin
(l1, (fun t wp -> wp), (fun t wp -> wp))
end else begin
(match ((FStar_All.pipe_right env.effects.joins (FStar_Util.find_opt (fun _44_181 -> (match (_44_181) with
| (m1, m2, _44_176, _44_178, _44_180) -> begin
((FStar_Ident.lid_equals l1 m1) && (FStar_Ident.lid_equals l2 m2))
end))))) with
| None -> begin
(let _146_410 = (let _146_409 = (let _146_408 = (let _146_407 = (FStar_Absyn_Print.sli l1)
in (let _146_406 = (FStar_Absyn_Print.sli l2)
in (FStar_Util.format2 "Effects %s and %s cannot be composed" _146_407 _146_406)))
in (_146_408, env.range))
in FStar_Absyn_Syntax.Error (_146_409))
in (Prims.raise _146_410))
end
| Some (_44_184, _44_186, m3, j1, j2) -> begin
(m3, j1, j2)
end)
end)

let monad_leq : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.lident  ->  edge Prims.option = (fun env l1 l2 -> if (FStar_Ident.lid_equals l1 l2) then begin
Some ({msource = l1; mtarget = l2; mlift = (fun t wp -> wp)})
end else begin
(FStar_All.pipe_right env.effects.order (FStar_Util.find_opt (fun e -> ((FStar_Ident.lid_equals l1 e.msource) && (FStar_Ident.lid_equals l2 e.mtarget)))))
end)

let wp_sig_aux : FStar_Absyn_Syntax.eff_decl Prims.list  ->  FStar_Ident.lident  ->  (((FStar_Absyn_Syntax.typ', (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.syntax FStar_Absyn_Syntax.bvdef, (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) FStar_Absyn_Syntax.withinfo_t * (FStar_Absyn_Syntax.knd', Prims.unit) FStar_Absyn_Syntax.syntax) = (fun decls m -> (match ((FStar_All.pipe_right decls (FStar_Util.find_opt (fun d -> (FStar_Ident.lid_equals d.FStar_Absyn_Syntax.mname m))))) with
| None -> begin
(let _146_425 = (FStar_Util.format1 "Impossible: declaration for monad %s not found" m.FStar_Ident.str)
in (FStar_All.failwith _146_425))
end
| Some (md) -> begin
(match (md.FStar_Absyn_Syntax.signature.FStar_Absyn_Syntax.n) with
| FStar_Absyn_Syntax.Kind_arrow ((FStar_Util.Inl (a), _44_217)::(FStar_Util.Inl (wp), _44_212)::(FStar_Util.Inl (wlp), _44_207)::[], {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Kind_effect; FStar_Absyn_Syntax.tk = _44_227; FStar_Absyn_Syntax.pos = _44_225; FStar_Absyn_Syntax.fvs = _44_223; FStar_Absyn_Syntax.uvs = _44_221}) -> begin
(a, wp.FStar_Absyn_Syntax.sort)
end
| _44_233 -> begin
(FStar_All.failwith "Impossible")
end)
end))

let wp_signature : env  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.btvar * FStar_Absyn_Syntax.knd) = (fun env m -> (wp_sig_aux env.effects.decls m))

let default_effect : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.lident Prims.option = (fun env l -> (FStar_Util.find_map env.default_effects (fun _44_240 -> (match (_44_240) with
| (l', m) -> begin
if (FStar_Ident.lid_equals l l') then begin
Some (m)
end else begin
None
end
end))))

let build_lattice : env  ->  FStar_Absyn_Syntax.sigelt  ->  env = (fun env se -> (match (se) with
| FStar_Absyn_Syntax.Sig_effect_abbrev (l, _44_245, c, quals, r) -> begin
(match ((FStar_Util.find_map quals (fun _44_2 -> (match (_44_2) with
| FStar_Absyn_Syntax.DefaultEffect (n) -> begin
n
end
| _44_255 -> begin
None
end)))) with
| None -> begin
env
end
| Some (e) -> begin
(let _44_259 = env
in {solver = _44_259.solver; range = _44_259.range; curmodule = _44_259.curmodule; gamma = _44_259.gamma; modules = _44_259.modules; expected_typ = _44_259.expected_typ; level = _44_259.level; sigtab = _44_259.sigtab; is_pattern = _44_259.is_pattern; instantiate_targs = _44_259.instantiate_targs; instantiate_vargs = _44_259.instantiate_vargs; effects = _44_259.effects; generalize = _44_259.generalize; letrecs = _44_259.letrecs; top_level = _44_259.top_level; check_uvars = _44_259.check_uvars; use_eq = _44_259.use_eq; is_iface = _44_259.is_iface; admit = _44_259.admit; default_effects = ((e, l))::env.default_effects})
end)
end
| FStar_Absyn_Syntax.Sig_new_effect (ne, _44_263) -> begin
(let effects = (let _44_266 = env.effects
in {decls = (ne)::env.effects.decls; order = _44_266.order; joins = _44_266.joins})
in (let _44_269 = env
in {solver = _44_269.solver; range = _44_269.range; curmodule = _44_269.curmodule; gamma = _44_269.gamma; modules = _44_269.modules; expected_typ = _44_269.expected_typ; level = _44_269.level; sigtab = _44_269.sigtab; is_pattern = _44_269.is_pattern; instantiate_targs = _44_269.instantiate_targs; instantiate_vargs = _44_269.instantiate_vargs; effects = effects; generalize = _44_269.generalize; letrecs = _44_269.letrecs; top_level = _44_269.top_level; check_uvars = _44_269.check_uvars; use_eq = _44_269.use_eq; is_iface = _44_269.is_iface; admit = _44_269.admit; default_effects = _44_269.default_effects}))
end
| FStar_Absyn_Syntax.Sig_sub_effect (sub, _44_273) -> begin
(let compose_edges = (fun e1 e2 -> {msource = e1.msource; mtarget = e2.mtarget; mlift = (fun r wp1 -> (let _146_446 = (e1.mlift r wp1)
in (e2.mlift r _146_446)))})
in (let mk_lift = (fun lift_t r wp1 -> (FStar_Absyn_Syntax.mk_Typ_app (lift_t, ((FStar_Absyn_Syntax.targ r))::((FStar_Absyn_Syntax.targ wp1))::[]) None wp1.FStar_Absyn_Syntax.pos))
in (let edge = {msource = sub.FStar_Absyn_Syntax.source; mtarget = sub.FStar_Absyn_Syntax.target; mlift = (mk_lift sub.FStar_Absyn_Syntax.lift)}
in (let id_edge = (fun l -> {msource = sub.FStar_Absyn_Syntax.source; mtarget = sub.FStar_Absyn_Syntax.target; mlift = (fun t wp -> wp)})
in (let print_mlift = (fun l -> (let arg = (let _146_469 = (FStar_Absyn_Syntax.lid_of_path (("ARG")::[]) FStar_Absyn_Syntax.dummyRange)
in (FStar_Absyn_Util.ftv _146_469 FStar_Absyn_Syntax.mk_Kind_type))
in (let wp = (let _146_470 = (FStar_Absyn_Syntax.lid_of_path (("WP")::[]) FStar_Absyn_Syntax.dummyRange)
in (FStar_Absyn_Util.ftv _146_470 FStar_Absyn_Syntax.mk_Kind_unknown))
in (let _146_471 = (l arg wp)
in (FStar_Absyn_Print.typ_to_string _146_471)))))
in (let order = (edge)::env.effects.order
in (let ms = (FStar_All.pipe_right env.effects.decls (FStar_List.map (fun e -> e.FStar_Absyn_Syntax.mname)))
in (let find_edge = (fun order _44_301 -> (match (_44_301) with
| (i, j) -> begin
if (FStar_Ident.lid_equals i j) then begin
(FStar_All.pipe_right (id_edge i) (fun _146_477 -> Some (_146_477)))
end else begin
(FStar_All.pipe_right order (FStar_Util.find_opt (fun e -> ((FStar_Ident.lid_equals e.msource i) && (FStar_Ident.lid_equals e.mtarget j)))))
end
end))
in (let order = (FStar_All.pipe_right ms (FStar_List.fold_left (fun order k -> (let _146_485 = (FStar_All.pipe_right ms (FStar_List.collect (fun i -> if (FStar_Ident.lid_equals i k) then begin
[]
end else begin
(FStar_All.pipe_right ms (FStar_List.collect (fun j -> if (FStar_Ident.lid_equals j k) then begin
[]
end else begin
(match ((let _146_484 = (find_edge order (i, k))
in (let _146_483 = (find_edge order (k, j))
in (_146_484, _146_483)))) with
| (Some (e1), Some (e2)) -> begin
((compose_edges e1 e2))::[]
end
| _44_313 -> begin
[]
end)
end)))
end)))
in (FStar_List.append order _146_485))) order))
in (let order = (FStar_Util.remove_dups (fun e1 e2 -> ((FStar_Ident.lid_equals e1.msource e2.msource) && (FStar_Ident.lid_equals e1.mtarget e2.mtarget))) order)
in (let joins = (FStar_All.pipe_right ms (FStar_List.collect (fun i -> (FStar_All.pipe_right ms (FStar_List.collect (fun j -> (let join_opt = (FStar_All.pipe_right ms (FStar_List.fold_left (fun bopt k -> (match ((let _146_493 = (find_edge order (i, k))
in (let _146_492 = (find_edge order (j, k))
in (_146_493, _146_492)))) with
| (Some (ik), Some (jk)) -> begin
(match (bopt) with
| None -> begin
Some ((k, ik, jk))
end
| Some (ub, _44_330, _44_332) -> begin
if ((let _146_494 = (find_edge order (k, ub))
in (FStar_Util.is_some _146_494)) && (not ((let _146_495 = (find_edge order (ub, k))
in (FStar_Util.is_some _146_495))))) then begin
Some ((k, ik, jk))
end else begin
bopt
end
end)
end
| _44_336 -> begin
bopt
end)) None))
in (match (join_opt) with
| None -> begin
[]
end
| Some (k, e1, e2) -> begin
((i, j, k, e1.mlift, e2.mlift))::[]
end))))))))
in (let effects = (let _44_345 = env.effects
in {decls = _44_345.decls; order = order; joins = joins})
in (let _44_348 = env
in {solver = _44_348.solver; range = _44_348.range; curmodule = _44_348.curmodule; gamma = _44_348.gamma; modules = _44_348.modules; expected_typ = _44_348.expected_typ; level = _44_348.level; sigtab = _44_348.sigtab; is_pattern = _44_348.is_pattern; instantiate_targs = _44_348.instantiate_targs; instantiate_vargs = _44_348.instantiate_vargs; effects = effects; generalize = _44_348.generalize; letrecs = _44_348.letrecs; top_level = _44_348.top_level; check_uvars = _44_348.check_uvars; use_eq = _44_348.use_eq; is_iface = _44_348.is_iface; admit = _44_348.admit; default_effects = _44_348.default_effects})))))))))))))
end
| _44_351 -> begin
env
end))

let rec add_sigelt : env  ->  FStar_Absyn_Syntax.sigelt  ->  Prims.unit = (fun env se -> (match (se) with
| FStar_Absyn_Syntax.Sig_bundle (ses, _44_356, _44_358, _44_360) -> begin
(add_sigelts env ses)
end
| _44_364 -> begin
(let lids = (FStar_Absyn_Util.lids_of_sigelt se)
in (FStar_List.iter (fun l -> (let _146_503 = (sigtab env)
in (FStar_Util.smap_add _146_503 l.FStar_Ident.str se))) lids))
end))
and add_sigelts : env  ->  FStar_Absyn_Syntax.sigelt Prims.list  ->  Prims.unit = (fun env ses -> (FStar_All.pipe_right ses (FStar_List.iter (add_sigelt env))))

let empty_lid : FStar_Ident.lident = (FStar_Absyn_Syntax.lid_of_ids (((FStar_Absyn_Syntax.id_of_text ""))::[]))

let finish_module : env  ->  FStar_Absyn_Syntax.modul  ->  env = (fun env m -> (let sigs = if (FStar_Ident.lid_equals m.FStar_Absyn_Syntax.name FStar_Absyn_Const.prims_lid) then begin
(FStar_All.pipe_right env.gamma (FStar_List.collect (fun _44_3 -> (match (_44_3) with
| Binding_sig (se) -> begin
(se)::[]
end
| _44_375 -> begin
[]
end))))
end else begin
m.FStar_Absyn_Syntax.exports
end
in (let _44_377 = (add_sigelts env sigs)
in (let _44_379 = env
in {solver = _44_379.solver; range = _44_379.range; curmodule = empty_lid; gamma = []; modules = (m)::env.modules; expected_typ = _44_379.expected_typ; level = _44_379.level; sigtab = _44_379.sigtab; is_pattern = _44_379.is_pattern; instantiate_targs = _44_379.instantiate_targs; instantiate_vargs = _44_379.instantiate_vargs; effects = _44_379.effects; generalize = _44_379.generalize; letrecs = _44_379.letrecs; top_level = _44_379.top_level; check_uvars = _44_379.check_uvars; use_eq = _44_379.use_eq; is_iface = _44_379.is_iface; admit = _44_379.admit; default_effects = _44_379.default_effects}))))

let set_level : env  ->  level  ->  env = (fun env level -> (let _44_383 = env
in {solver = _44_383.solver; range = _44_383.range; curmodule = _44_383.curmodule; gamma = _44_383.gamma; modules = _44_383.modules; expected_typ = _44_383.expected_typ; level = level; sigtab = _44_383.sigtab; is_pattern = _44_383.is_pattern; instantiate_targs = _44_383.instantiate_targs; instantiate_vargs = _44_383.instantiate_vargs; effects = _44_383.effects; generalize = _44_383.generalize; letrecs = _44_383.letrecs; top_level = _44_383.top_level; check_uvars = _44_383.check_uvars; use_eq = _44_383.use_eq; is_iface = _44_383.is_iface; admit = _44_383.admit; default_effects = _44_383.default_effects}))

let is_level : env  ->  level  ->  Prims.bool = (fun env level -> (env.level = level))

let modules : env  ->  FStar_Absyn_Syntax.modul Prims.list = (fun env -> env.modules)

let current_module : env  ->  FStar_Absyn_Syntax.lident = (fun env -> env.curmodule)

let set_current_module : env  ->  FStar_Absyn_Syntax.lident  ->  env = (fun env lid -> (let _44_391 = env
in {solver = _44_391.solver; range = _44_391.range; curmodule = lid; gamma = _44_391.gamma; modules = _44_391.modules; expected_typ = _44_391.expected_typ; level = _44_391.level; sigtab = _44_391.sigtab; is_pattern = _44_391.is_pattern; instantiate_targs = _44_391.instantiate_targs; instantiate_vargs = _44_391.instantiate_vargs; effects = _44_391.effects; generalize = _44_391.generalize; letrecs = _44_391.letrecs; top_level = _44_391.top_level; check_uvars = _44_391.check_uvars; use_eq = _44_391.use_eq; is_iface = _44_391.is_iface; admit = _44_391.admit; default_effects = _44_391.default_effects}))

let set_range : env  ->  FStar_Range.range  ->  env = (fun e r -> if (r = FStar_Absyn_Syntax.dummyRange) then begin
e
end else begin
(let _44_395 = e
in {solver = _44_395.solver; range = r; curmodule = _44_395.curmodule; gamma = _44_395.gamma; modules = _44_395.modules; expected_typ = _44_395.expected_typ; level = _44_395.level; sigtab = _44_395.sigtab; is_pattern = _44_395.is_pattern; instantiate_targs = _44_395.instantiate_targs; instantiate_vargs = _44_395.instantiate_vargs; effects = _44_395.effects; generalize = _44_395.generalize; letrecs = _44_395.letrecs; top_level = _44_395.top_level; check_uvars = _44_395.check_uvars; use_eq = _44_395.use_eq; is_iface = _44_395.is_iface; admit = _44_395.admit; default_effects = _44_395.default_effects})
end)

let get_range : env  ->  FStar_Range.range = (fun e -> e.range)

let find_in_sigtab : env  ->  FStar_Ident.lident  ->  FStar_Absyn_Syntax.sigelt Prims.option = (fun env lid -> (let _146_537 = (sigtab env)
in (FStar_Util.smap_try_find _146_537 (FStar_Ident.text_of_lid lid))))

let lookup_bvvdef : env  ->  FStar_Absyn_Syntax.bvvdef  ->  FStar_Absyn_Syntax.typ Prims.option = (fun env bvvd -> (FStar_Util.find_map env.gamma (fun _44_4 -> (match (_44_4) with
| Binding_var (id, t) when (FStar_Absyn_Util.bvd_eq id bvvd) -> begin
Some (t)
end
| _44_408 -> begin
None
end))))

let lookup_bvar : env  ->  FStar_Absyn_Syntax.bvvar  ->  FStar_Absyn_Syntax.typ = (fun env bv -> (match ((lookup_bvvdef env bv.FStar_Absyn_Syntax.v)) with
| None -> begin
(let _146_549 = (let _146_548 = (let _146_547 = (variable_not_found bv.FStar_Absyn_Syntax.v)
in (_146_547, (FStar_Absyn_Util.range_of_bvd bv.FStar_Absyn_Syntax.v)))
in FStar_Absyn_Syntax.Error (_146_548))
in (Prims.raise _146_549))
end
| Some (t) -> begin
t
end))

let in_cur_mod : env  ->  FStar_Ident.lident  ->  Prims.bool = (fun env l -> (let cur = (current_module env)
in if (l.FStar_Ident.nsstr = cur.FStar_Ident.str) then begin
true
end else begin
if (FStar_Util.starts_with l.FStar_Ident.nsstr cur.FStar_Ident.str) then begin
(let lns = (FStar_List.append l.FStar_Ident.ns ((l.FStar_Ident.ident)::[]))
in (let cur = (FStar_List.append cur.FStar_Ident.ns ((cur.FStar_Ident.ident)::[]))
in (let rec aux = (fun c l -> (match ((c, l)) with
| ([], _44_424) -> begin
true
end
| (_44_427, []) -> begin
false
end
| (hd::tl, hd'::tl') when (hd.FStar_Ident.idText = hd'.FStar_Ident.idText) -> begin
(aux tl tl')
end
| _44_438 -> begin
false
end))
in (aux cur lns))))
end else begin
false
end
end))

let lookup_qname : env  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.typ, FStar_Absyn_Syntax.sigelt) FStar_Util.either Prims.option = (fun env lid -> (let cur_mod = (in_cur_mod env lid)
in (let found = if cur_mod then begin
(FStar_Util.find_map env.gamma (fun _44_5 -> (match (_44_5) with
| Binding_lid (l, t) -> begin
if (FStar_Ident.lid_equals lid l) then begin
Some (FStar_Util.Inl (t))
end else begin
None
end
end
| Binding_sig (FStar_Absyn_Syntax.Sig_bundle (ses, _44_449, _44_451, _44_453)) -> begin
(FStar_Util.find_map ses (fun se -> if (let _146_564 = (FStar_Absyn_Util.lids_of_sigelt se)
in (FStar_All.pipe_right _146_564 (FStar_Util.for_some (FStar_Ident.lid_equals lid)))) then begin
Some (FStar_Util.Inr (se))
end else begin
None
end))
end
| Binding_sig (s) -> begin
(let lids = (FStar_Absyn_Util.lids_of_sigelt s)
in if (FStar_All.pipe_right lids (FStar_Util.for_some (FStar_Ident.lid_equals lid))) then begin
Some (FStar_Util.Inr (s))
end else begin
None
end)
end
| _44_462 -> begin
None
end)))
end else begin
None
end
in if (FStar_Util.is_some found) then begin
found
end else begin
if ((not (cur_mod)) || (has_interface env env.curmodule)) then begin
(match ((find_in_sigtab env lid)) with
| Some (se) -> begin
Some (FStar_Util.Inr (se))
end
| None -> begin
None
end)
end else begin
None
end
end)))

let lookup_datacon : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.typ = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_datacon (_44_470, t, (_44_473, tps, _44_476), _44_479, _44_481, _44_483))) -> begin
(let _146_570 = (FStar_List.map (fun _44_491 -> (match (_44_491) with
| (x, _44_490) -> begin
(x, Some (FStar_Absyn_Syntax.Implicit))
end)) tps)
in (FStar_Absyn_Util.close_typ _146_570 t))
end
| _44_493 -> begin
(let _146_573 = (let _146_572 = (let _146_571 = (name_not_found lid)
in (_146_571, (FStar_Ident.range_of_lid lid)))
in FStar_Absyn_Syntax.Error (_146_572))
in (Prims.raise _146_573))
end))

let lookup_kind_abbrev : env  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.lident * FStar_Absyn_Syntax.binders * FStar_Absyn_Syntax.knd) = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_kind_abbrev (l, binders, k, _44_500))) -> begin
(l, binders, k)
end
| _44_506 -> begin
(let _146_580 = (let _146_579 = (let _146_578 = (name_not_found lid)
in (_146_578, (FStar_Ident.range_of_lid lid)))
in FStar_Absyn_Syntax.Error (_146_579))
in (Prims.raise _146_580))
end))

let lookup_projector : env  ->  FStar_Absyn_Syntax.lident  ->  Prims.int  ->  FStar_Absyn_Syntax.lident = (fun env lid i -> (let fail = (fun _44_511 -> (match (()) with
| () -> begin
(let _146_591 = (let _146_590 = (FStar_Util.string_of_int i)
in (let _146_589 = (FStar_Absyn_Print.sli lid)
in (FStar_Util.format2 "Impossible: projecting field #%s from constructor %s is undefined" _146_590 _146_589)))
in (FStar_All.failwith _146_591))
end))
in (let t = (lookup_datacon env lid)
in (match ((let _146_592 = (FStar_Absyn_Util.compress_typ t)
in _146_592.FStar_Absyn_Syntax.n)) with
| FStar_Absyn_Syntax.Typ_fun (binders, _44_515) -> begin
if ((i < 0) || (i >= (FStar_List.length binders))) then begin
(fail ())
end else begin
(let b = (FStar_List.nth binders i)
in (match ((Prims.fst b)) with
| FStar_Util.Inl (a) -> begin
(let _146_593 = (FStar_Absyn_Util.mk_field_projector_name lid a i)
in (FStar_All.pipe_right _146_593 Prims.fst))
end
| FStar_Util.Inr (x) -> begin
(let _146_594 = (FStar_Absyn_Util.mk_field_projector_name lid x i)
in (FStar_All.pipe_right _146_594 Prims.fst))
end))
end
end
| _44_524 -> begin
(fail ())
end))))

let try_lookup_val_decl : env  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.typ * FStar_Absyn_Syntax.qualifier Prims.list) Prims.option = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_val_decl (_44_528, t, q, _44_532))) -> begin
Some ((t, q))
end
| _44_538 -> begin
None
end))

let lookup_val_decl : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.typ = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_val_decl (_44_542, t, _44_545, _44_547))) -> begin
t
end
| _44_553 -> begin
(let _146_605 = (let _146_604 = (let _146_603 = (name_not_found lid)
in (_146_603, (FStar_Ident.range_of_lid lid)))
in FStar_Absyn_Syntax.Error (_146_604))
in (Prims.raise _146_605))
end))

let lookup_lid : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.typ = (fun env lid -> (let not_found = (fun _44_557 -> (match (()) with
| () -> begin
(let _146_614 = (let _146_613 = (let _146_612 = (name_not_found lid)
in (_146_612, (FStar_Ident.range_of_lid lid)))
in FStar_Absyn_Syntax.Error (_146_613))
in (Prims.raise _146_614))
end))
in (let mapper = (fun _44_6 -> (match (_44_6) with
| FStar_Util.Inr (FStar_Absyn_Syntax.Sig_datacon (_44_560, t, (_44_563, tps, _44_566), _44_569, _44_571, _44_573)) -> begin
(let _146_619 = (let _146_618 = (FStar_List.map (fun _44_580 -> (match (_44_580) with
| (x, _44_579) -> begin
(x, Some (FStar_Absyn_Syntax.Implicit))
end)) tps)
in (FStar_Absyn_Util.close_typ _146_618 t))
in Some (_146_619))
end
| FStar_Util.Inl (t) -> begin
Some (t)
end
| FStar_Util.Inr (FStar_Absyn_Syntax.Sig_val_decl (l, t, qs, _44_587)) -> begin
if (in_cur_mod env l) then begin
if ((FStar_All.pipe_right qs (FStar_List.contains FStar_Absyn_Syntax.Assumption)) || env.is_iface) then begin
Some (t)
end else begin
None
end
end else begin
Some (t)
end
end
| FStar_Util.Inr (FStar_Absyn_Syntax.Sig_let ((_44_592, {FStar_Absyn_Syntax.lbname = _44_599; FStar_Absyn_Syntax.lbtyp = t; FStar_Absyn_Syntax.lbeff = _44_596; FStar_Absyn_Syntax.lbdef = _44_594}::[]), _44_604, _44_606, _44_608)) -> begin
Some (t)
end
| FStar_Util.Inr (FStar_Absyn_Syntax.Sig_let ((_44_613, lbs), _44_617, _44_619, _44_621)) -> begin
(FStar_Util.find_map lbs (fun lb -> (match (lb.FStar_Absyn_Syntax.lbname) with
| FStar_Util.Inl (_44_627) -> begin
(FStar_All.failwith "impossible")
end
| FStar_Util.Inr (lid') -> begin
if (FStar_Ident.lid_equals lid lid') then begin
Some (lb.FStar_Absyn_Syntax.lbtyp)
end else begin
None
end
end)))
end
| t -> begin
None
end))
in (match ((let _146_621 = (lookup_qname env lid)
in (FStar_Util.bind_opt _146_621 mapper))) with
| Some (t) -> begin
(let _44_635 = t
in {FStar_Absyn_Syntax.n = _44_635.FStar_Absyn_Syntax.n; FStar_Absyn_Syntax.tk = _44_635.FStar_Absyn_Syntax.tk; FStar_Absyn_Syntax.pos = (FStar_Absyn_Syntax.range_of_lid lid); FStar_Absyn_Syntax.fvs = _44_635.FStar_Absyn_Syntax.fvs; FStar_Absyn_Syntax.uvs = _44_635.FStar_Absyn_Syntax.uvs})
end
| None -> begin
(not_found ())
end))))

let is_datacon : env  ->  FStar_Absyn_Syntax.lident  ->  Prims.bool = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_val_decl (_44_641, _44_643, quals, _44_646))) -> begin
(FStar_All.pipe_right quals (FStar_Util.for_some (fun _44_7 -> (match (_44_7) with
| FStar_Absyn_Syntax.Assumption -> begin
true
end
| _44_654 -> begin
false
end))))
end
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_datacon (_44_656, t, _44_659, _44_661, _44_663, _44_665))) -> begin
true
end
| _44_671 -> begin
false
end))

let is_record : env  ->  FStar_Absyn_Syntax.lident  ->  Prims.bool = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_tycon (_44_675, _44_677, _44_679, _44_681, _44_683, tags, _44_686))) -> begin
(FStar_Util.for_some (fun _44_8 -> (match (_44_8) with
| (FStar_Absyn_Syntax.RecordType (_)) | (FStar_Absyn_Syntax.RecordConstructor (_)) -> begin
true
end
| _44_699 -> begin
false
end)) tags)
end
| _44_701 -> begin
false
end))

let lookup_datacons_of_typ : env  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.lident * FStar_Absyn_Syntax.typ) Prims.list Prims.option = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_tycon (_44_705, _44_707, _44_709, _44_711, datas, _44_714, _44_716))) -> begin
(let _146_638 = (FStar_List.map (fun l -> (let _146_637 = (lookup_lid env l)
in (l, _146_637))) datas)
in Some (_146_638))
end
| _44_723 -> begin
None
end))

let lookup_effect_abbrev : env  ->  FStar_Absyn_Syntax.lident  ->  (FStar_Absyn_Syntax.binders * FStar_Absyn_Syntax.comp) Prims.option = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_effect_abbrev (lid, binders, c, quals, _44_731))) -> begin
if (FStar_All.pipe_right quals (FStar_Util.for_some (fun _44_9 -> (match (_44_9) with
| FStar_Absyn_Syntax.Opaque -> begin
true
end
| _44_739 -> begin
false
end)))) then begin
None
end else begin
Some ((binders, c))
end
end
| _44_741 -> begin
None
end))

let lookup_typ_abbrev : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.typ Prims.option = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_typ_abbrev (lid, tps, _44_747, t, quals, _44_751))) -> begin
if (FStar_All.pipe_right quals (FStar_Util.for_some (fun _44_10 -> (match (_44_10) with
| FStar_Absyn_Syntax.Opaque -> begin
true
end
| _44_759 -> begin
false
end)))) then begin
None
end else begin
(let t = (FStar_Absyn_Util.close_with_lam tps t)
in (let _146_649 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_named ((t, lid))))
in Some (_146_649)))
end
end
| _44_762 -> begin
None
end))

let lookup_opaque_typ_abbrev : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.typ Prims.option = (fun env lid -> (match ((lookup_qname env lid)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_typ_abbrev (lid, tps, _44_768, t, quals, _44_772))) -> begin
(let t = (FStar_Absyn_Util.close_with_lam tps t)
in (let _146_654 = (FStar_Absyn_Syntax.mk_Typ_meta (FStar_Absyn_Syntax.Meta_named ((t, lid))))
in Some (_146_654)))
end
| _44_779 -> begin
None
end))

let lookup_btvdef : env  ->  FStar_Absyn_Syntax.btvdef  ->  FStar_Absyn_Syntax.knd Prims.option = (fun env btvd -> (FStar_Util.find_map env.gamma (fun _44_11 -> (match (_44_11) with
| Binding_typ (id, k) when (FStar_Absyn_Util.bvd_eq id btvd) -> begin
Some (k)
end
| _44_788 -> begin
None
end))))

let lookup_btvar : env  ->  FStar_Absyn_Syntax.btvar  ->  FStar_Absyn_Syntax.knd = (fun env btv -> (match ((lookup_btvdef env btv.FStar_Absyn_Syntax.v)) with
| None -> begin
(let _146_666 = (let _146_665 = (let _146_664 = (variable_not_found btv.FStar_Absyn_Syntax.v)
in (_146_664, (FStar_Absyn_Util.range_of_bvd btv.FStar_Absyn_Syntax.v)))
in FStar_Absyn_Syntax.Error (_146_665))
in (Prims.raise _146_666))
end
| Some (k) -> begin
k
end))

let lookup_typ_lid : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.knd = (fun env ftv -> (match ((lookup_qname env ftv)) with
| (Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_tycon (lid, tps, k, _, _, _, _)))) | (Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_typ_abbrev (lid, tps, k, _, _, _)))) -> begin
(FStar_Absyn_Util.close_kind tps k)
end
| _44_822 -> begin
(let _146_673 = (let _146_672 = (let _146_671 = (name_not_found ftv)
in (_146_671, (FStar_Ident.range_of_lid ftv)))
in FStar_Absyn_Syntax.Error (_146_672))
in (Prims.raise _146_673))
end))

let is_projector : env  ->  FStar_Absyn_Syntax.lident  ->  Prims.bool = (fun env l -> (match ((lookup_qname env l)) with
| (Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_tycon (_, _, _, _, _, quals, _)))) | (Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_val_decl (_, _, quals, _)))) -> begin
(FStar_Util.for_some (fun _44_12 -> (match (_44_12) with
| FStar_Absyn_Syntax.Projector (_44_854) -> begin
true
end
| _44_857 -> begin
false
end)) quals)
end
| _44_859 -> begin
false
end))

let try_lookup_effect_lid : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.knd Prims.option = (fun env ftv -> (match ((lookup_qname env ftv)) with
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_new_effect (ne, _44_864))) -> begin
(let _146_684 = (FStar_Absyn_Util.close_kind ne.FStar_Absyn_Syntax.binders ne.FStar_Absyn_Syntax.signature)
in (FStar_All.pipe_right _146_684 (fun _146_683 -> Some (_146_683))))
end
| Some (FStar_Util.Inr (FStar_Absyn_Syntax.Sig_effect_abbrev (lid, binders, _44_872, _44_874, _44_876))) -> begin
(let _146_686 = (FStar_Absyn_Util.close_kind binders FStar_Absyn_Syntax.mk_Kind_effect)
in (FStar_All.pipe_right _146_686 (fun _146_685 -> Some (_146_685))))
end
| _44_882 -> begin
None
end))

let lookup_effect_lid : env  ->  FStar_Absyn_Syntax.lident  ->  FStar_Absyn_Syntax.knd = (fun env ftv -> (match ((try_lookup_effect_lid env ftv)) with
| None -> begin
(let _146_693 = (let _146_692 = (let _146_691 = (name_not_found ftv)
in (_146_691, (FStar_Ident.range_of_lid ftv)))
in FStar_Absyn_Syntax.Error (_146_692))
in (Prims.raise _146_693))
end
| Some (k) -> begin
k
end))

let lookup_operator : env  ->  FStar_Absyn_Syntax.ident  ->  FStar_Absyn_Syntax.typ = (fun env opname -> (let primName = (FStar_Ident.lid_of_path (("Prims")::((Prims.strcat "_dummy_" opname.FStar_Ident.idText))::[]) FStar_Absyn_Syntax.dummyRange)
in (lookup_lid env primName)))

let push_sigelt : env  ->  FStar_Absyn_Syntax.sigelt  ->  env = (fun env s -> (build_lattice (let _44_893 = env
in {solver = _44_893.solver; range = _44_893.range; curmodule = _44_893.curmodule; gamma = (Binding_sig (s))::env.gamma; modules = _44_893.modules; expected_typ = _44_893.expected_typ; level = _44_893.level; sigtab = _44_893.sigtab; is_pattern = _44_893.is_pattern; instantiate_targs = _44_893.instantiate_targs; instantiate_vargs = _44_893.instantiate_vargs; effects = _44_893.effects; generalize = _44_893.generalize; letrecs = _44_893.letrecs; top_level = _44_893.top_level; check_uvars = _44_893.check_uvars; use_eq = _44_893.use_eq; is_iface = _44_893.is_iface; admit = _44_893.admit; default_effects = _44_893.default_effects}) s))

let push_local_binding : env  ->  binding  ->  env = (fun env b -> (let _44_897 = env
in {solver = _44_897.solver; range = _44_897.range; curmodule = _44_897.curmodule; gamma = (b)::env.gamma; modules = _44_897.modules; expected_typ = _44_897.expected_typ; level = _44_897.level; sigtab = _44_897.sigtab; is_pattern = _44_897.is_pattern; instantiate_targs = _44_897.instantiate_targs; instantiate_vargs = _44_897.instantiate_vargs; effects = _44_897.effects; generalize = _44_897.generalize; letrecs = _44_897.letrecs; top_level = _44_897.top_level; check_uvars = _44_897.check_uvars; use_eq = _44_897.use_eq; is_iface = _44_897.is_iface; admit = _44_897.admit; default_effects = _44_897.default_effects}))

let uvars_in_env : env  ->  FStar_Absyn_Syntax.uvars = (fun env -> (let no_uvs = (let _146_710 = (FStar_Absyn_Syntax.new_uv_set ())
in (let _146_709 = (FStar_Absyn_Syntax.new_uvt_set ())
in (let _146_708 = (FStar_Absyn_Syntax.new_uvt_set ())
in {FStar_Absyn_Syntax.uvars_k = _146_710; FStar_Absyn_Syntax.uvars_t = _146_709; FStar_Absyn_Syntax.uvars_e = _146_708})))
in (let ext = (fun out uvs -> (let _44_904 = out
in (let _146_717 = (FStar_Util.set_union out.FStar_Absyn_Syntax.uvars_k uvs.FStar_Absyn_Syntax.uvars_k)
in (let _146_716 = (FStar_Util.set_union out.FStar_Absyn_Syntax.uvars_t uvs.FStar_Absyn_Syntax.uvars_t)
in (let _146_715 = (FStar_Util.set_union out.FStar_Absyn_Syntax.uvars_e uvs.FStar_Absyn_Syntax.uvars_e)
in {FStar_Absyn_Syntax.uvars_k = _146_717; FStar_Absyn_Syntax.uvars_t = _146_716; FStar_Absyn_Syntax.uvars_e = _146_715})))))
in (let rec aux = (fun out g -> (match (g) with
| [] -> begin
out
end
| (Binding_lid (_, t)::tl) | (Binding_var (_, t)::tl) -> begin
(let _146_723 = (let _146_722 = (FStar_Absyn_Util.uvars_in_typ t)
in (ext out _146_722))
in (aux _146_723 tl))
end
| Binding_typ (_44_924, k)::tl -> begin
(let _146_725 = (let _146_724 = (FStar_Absyn_Util.uvars_in_kind k)
in (ext out _146_724))
in (aux _146_725 tl))
end
| Binding_sig (_44_932)::_44_930 -> begin
out
end))
in (aux no_uvs env.gamma)))))

let push_module : env  ->  FStar_Absyn_Syntax.modul  ->  env = (fun env m -> (let _44_937 = (add_sigelts env m.FStar_Absyn_Syntax.exports)
in (let _44_939 = env
in {solver = _44_939.solver; range = _44_939.range; curmodule = _44_939.curmodule; gamma = []; modules = (m)::env.modules; expected_typ = None; level = _44_939.level; sigtab = _44_939.sigtab; is_pattern = _44_939.is_pattern; instantiate_targs = _44_939.instantiate_targs; instantiate_vargs = _44_939.instantiate_vargs; effects = _44_939.effects; generalize = _44_939.generalize; letrecs = _44_939.letrecs; top_level = _44_939.top_level; check_uvars = _44_939.check_uvars; use_eq = _44_939.use_eq; is_iface = _44_939.is_iface; admit = _44_939.admit; default_effects = _44_939.default_effects})))

let set_expected_typ : env  ->  FStar_Absyn_Syntax.typ  ->  env = (fun env t -> (match (t) with
| {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Typ_const ({FStar_Absyn_Syntax.v = _44_964; FStar_Absyn_Syntax.sort = {FStar_Absyn_Syntax.n = FStar_Absyn_Syntax.Kind_unknown; FStar_Absyn_Syntax.tk = _44_960; FStar_Absyn_Syntax.pos = _44_958; FStar_Absyn_Syntax.fvs = _44_956; FStar_Absyn_Syntax.uvs = _44_954}; FStar_Absyn_Syntax.p = _44_952}); FStar_Absyn_Syntax.tk = _44_950; FStar_Absyn_Syntax.pos = _44_948; FStar_Absyn_Syntax.fvs = _44_946; FStar_Absyn_Syntax.uvs = _44_944} -> begin
(let _146_735 = (let _146_734 = (FStar_Absyn_Print.typ_to_string t)
in (FStar_Util.format1 "Setting expected type to %s with kind unknown" _146_734))
in (FStar_All.failwith _146_735))
end
| _44_969 -> begin
(let _44_970 = env
in {solver = _44_970.solver; range = _44_970.range; curmodule = _44_970.curmodule; gamma = _44_970.gamma; modules = _44_970.modules; expected_typ = Some (t); level = _44_970.level; sigtab = _44_970.sigtab; is_pattern = _44_970.is_pattern; instantiate_targs = _44_970.instantiate_targs; instantiate_vargs = _44_970.instantiate_vargs; effects = _44_970.effects; generalize = _44_970.generalize; letrecs = _44_970.letrecs; top_level = _44_970.top_level; check_uvars = _44_970.check_uvars; use_eq = false; is_iface = _44_970.is_iface; admit = _44_970.admit; default_effects = _44_970.default_effects})
end))

let expected_typ : env  ->  FStar_Absyn_Syntax.typ Prims.option = (fun env -> (match (env.expected_typ) with
| None -> begin
None
end
| Some (t) -> begin
Some (t)
end))

let clear_expected_typ : env  ->  (env * FStar_Absyn_Syntax.typ Prims.option) = (fun env -> (let _146_740 = (expected_typ env)
in ((let _44_977 = env
in {solver = _44_977.solver; range = _44_977.range; curmodule = _44_977.curmodule; gamma = _44_977.gamma; modules = _44_977.modules; expected_typ = None; level = _44_977.level; sigtab = _44_977.sigtab; is_pattern = _44_977.is_pattern; instantiate_targs = _44_977.instantiate_targs; instantiate_vargs = _44_977.instantiate_vargs; effects = _44_977.effects; generalize = _44_977.generalize; letrecs = _44_977.letrecs; top_level = _44_977.top_level; check_uvars = _44_977.check_uvars; use_eq = false; is_iface = _44_977.is_iface; admit = _44_977.admit; default_effects = _44_977.default_effects}), _146_740)))

let fold_env = (fun env f a -> (FStar_List.fold_right (fun e a -> (f a e)) env.gamma a))

let binding_of_binder : FStar_Absyn_Syntax.binder  ->  binding = (fun b -> (match ((Prims.fst b)) with
| FStar_Util.Inl (a) -> begin
Binding_typ ((a.FStar_Absyn_Syntax.v, a.FStar_Absyn_Syntax.sort))
end
| FStar_Util.Inr (x) -> begin
Binding_var ((x.FStar_Absyn_Syntax.v, x.FStar_Absyn_Syntax.sort))
end))

let binders : env  ->  FStar_Absyn_Syntax.binders = (fun env -> (FStar_List.fold_left (fun out b -> (match (b) with
| Binding_var (x, t) -> begin
(let _146_758 = (FStar_All.pipe_left FStar_Absyn_Syntax.v_binder (FStar_Absyn_Util.bvd_to_bvar_s x t))
in (_146_758)::out)
end
| Binding_typ (a, k) -> begin
(let _146_759 = (FStar_All.pipe_left FStar_Absyn_Syntax.t_binder (FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_146_759)::out)
end
| _44_1001 -> begin
out
end)) [] env.gamma))

let t_binders : env  ->  FStar_Absyn_Syntax.binders = (fun env -> (FStar_List.fold_left (fun out b -> (match (b) with
| Binding_var (_44_1006) -> begin
out
end
| Binding_typ (a, k) -> begin
(let _146_764 = (FStar_All.pipe_left FStar_Absyn_Syntax.t_binder (FStar_Absyn_Util.bvd_to_bvar_s a k))
in (_146_764)::out)
end
| _44_1013 -> begin
out
end)) [] env.gamma))

let idents : env  ->  FStar_Absyn_Syntax.freevars = (fun env -> (let _146_768 = (let _146_767 = (binders env)
in (FStar_All.pipe_right _146_767 (FStar_List.map Prims.fst)))
in (FStar_Absyn_Syntax.freevars_of_list _146_768)))

let lidents : env  ->  FStar_Absyn_Syntax.lident Prims.list = (fun env -> (let keys = (FStar_List.fold_left (fun keys _44_13 -> (match (_44_13) with
| Binding_sig (s) -> begin
(let _146_773 = (FStar_Absyn_Util.lids_of_sigelt s)
in (FStar_List.append _146_773 keys))
end
| _44_1021 -> begin
keys
end)) [] env.gamma)
in (let _146_778 = (sigtab env)
in (FStar_Util.smap_fold _146_778 (fun _44_1023 v keys -> (let _146_777 = (FStar_Absyn_Util.lids_of_sigelt v)
in (FStar_List.append _146_777 keys))) keys))))




