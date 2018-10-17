open Prims
type lcomp_with_binder =
  (FStar_Syntax_Syntax.bv FStar_Pervasives_Native.option,FStar_Syntax_Syntax.lcomp)
    FStar_Pervasives_Native.tuple2
let (report : FStar_TypeChecker_Env.env -> Prims.string Prims.list -> unit) =
  fun env  ->
    fun errs  ->
      let uu____23 = FStar_TypeChecker_Env.get_range env  in
      let uu____24 = FStar_TypeChecker_Err.failed_to_prove_specification errs
         in
      FStar_Errors.log_issue uu____23 uu____24
  
let (new_implicit_var :
  Prims.string ->
    FStar_Range.range ->
      FStar_TypeChecker_Env.env ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,(FStar_Syntax_Syntax.ctx_uvar,FStar_Range.range)
                                      FStar_Pervasives_Native.tuple2
                                      Prims.list,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun reason  ->
    fun r  ->
      fun env  ->
        fun k  ->
          FStar_TypeChecker_Env.new_implicit_var_aux reason r env k
            FStar_Syntax_Syntax.Strict
  
let (close_guard_implicits :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun env  ->
    fun xs  ->
      fun g  ->
        let uu____81 =
          let uu____83 = FStar_Options.eager_subtyping ()  in
          FStar_All.pipe_left Prims.op_Negation uu____83  in
        if uu____81
        then g
        else
          (let uu____90 =
             FStar_All.pipe_right g.FStar_TypeChecker_Env.deferred
               (FStar_List.partition
                  (fun uu____142  ->
                     match uu____142 with
                     | (uu____149,p) ->
                         FStar_TypeChecker_Rel.flex_prob_closing env xs p))
              in
           match uu____90 with
           | (solve_now,defer) ->
               ((let uu____184 =
                   FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                     (FStar_Options.Other "Rel")
                    in
                 if uu____184
                 then
                   (FStar_Util.print_string "SOLVE BEFORE CLOSING:\n";
                    FStar_List.iter
                      (fun uu____201  ->
                         match uu____201 with
                         | (s,p) ->
                             let uu____211 =
                               FStar_TypeChecker_Rel.prob_to_string env p  in
                             FStar_Util.print2 "%s: %s\n" s uu____211)
                      solve_now;
                    FStar_Util.print_string " ...DEFERRED THE REST:\n";
                    FStar_List.iter
                      (fun uu____226  ->
                         match uu____226 with
                         | (s,p) ->
                             let uu____236 =
                               FStar_TypeChecker_Rel.prob_to_string env p  in
                             FStar_Util.print2 "%s: %s\n" s uu____236) defer;
                    FStar_Util.print_string "END\n")
                 else ());
                (let g1 =
                   FStar_TypeChecker_Rel.solve_deferred_constraints env
                     (let uu___357_244 = g  in
                      {
                        FStar_TypeChecker_Env.guard_f =
                          (uu___357_244.FStar_TypeChecker_Env.guard_f);
                        FStar_TypeChecker_Env.deferred = solve_now;
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___357_244.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
                          (uu___357_244.FStar_TypeChecker_Env.implicits)
                      })
                    in
                 let g2 =
                   let uu___358_246 = g1  in
                   {
                     FStar_TypeChecker_Env.guard_f =
                       (uu___358_246.FStar_TypeChecker_Env.guard_f);
                     FStar_TypeChecker_Env.deferred = defer;
                     FStar_TypeChecker_Env.univ_ineqs =
                       (uu___358_246.FStar_TypeChecker_Env.univ_ineqs);
                     FStar_TypeChecker_Env.implicits =
                       (uu___358_246.FStar_TypeChecker_Env.implicits)
                   }  in
                 g2)))
  
let (check_uvars : FStar_Range.range -> FStar_Syntax_Syntax.typ -> unit) =
  fun r  ->
    fun t  ->
      let uvs = FStar_Syntax_Free.uvars t  in
      let uu____261 =
        let uu____263 = FStar_Util.set_is_empty uvs  in
        Prims.op_Negation uu____263  in
      if uu____261
      then
        let us =
          let uu____268 =
            let uu____272 = FStar_Util.set_elements uvs  in
            FStar_List.map
              (fun u  ->
                 FStar_Syntax_Print.uvar_to_string
                   u.FStar_Syntax_Syntax.ctx_uvar_head) uu____272
             in
          FStar_All.pipe_right uu____268 (FStar_String.concat ", ")  in
        (FStar_Options.push ();
         FStar_Options.set_option "hide_uvar_nums" (FStar_Options.Bool false);
         FStar_Options.set_option "print_implicits" (FStar_Options.Bool true);
         (let uu____291 =
            let uu____297 =
              let uu____299 = FStar_Syntax_Print.term_to_string t  in
              FStar_Util.format2
                "Unconstrained unification variables %s in type signature %s; please add an annotation"
                us uu____299
               in
            (FStar_Errors.Error_UncontrainedUnificationVar, uu____297)  in
          FStar_Errors.log_issue r uu____291);
         FStar_Options.pop ())
      else ()
  
let (extract_let_rec_annotation :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.letbinding ->
      (FStar_Syntax_Syntax.univ_names,FStar_Syntax_Syntax.typ,Prims.bool)
        FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun uu____322  ->
      match uu____322 with
      | { FStar_Syntax_Syntax.lbname = lbname;
          FStar_Syntax_Syntax.lbunivs = univ_vars1;
          FStar_Syntax_Syntax.lbtyp = t;
          FStar_Syntax_Syntax.lbeff = uu____333;
          FStar_Syntax_Syntax.lbdef = e;
          FStar_Syntax_Syntax.lbattrs = uu____335;
          FStar_Syntax_Syntax.lbpos = uu____336;_} ->
          let rng = FStar_Syntax_Syntax.range_of_lbname lbname  in
          let t1 = FStar_Syntax_Subst.compress t  in
          (match t1.FStar_Syntax_Syntax.n with
           | FStar_Syntax_Syntax.Tm_unknown  ->
               let uu____371 = FStar_Syntax_Subst.open_univ_vars univ_vars1 e
                  in
               (match uu____371 with
                | (univ_vars2,e1) ->
                    let env1 =
                      FStar_TypeChecker_Env.push_univ_vars env univ_vars2  in
                    let r = FStar_TypeChecker_Env.get_range env1  in
                    let rec aux e2 =
                      let e3 = FStar_Syntax_Subst.compress e2  in
                      match e3.FStar_Syntax_Syntax.n with
                      | FStar_Syntax_Syntax.Tm_meta (e4,uu____409) -> aux e4
                      | FStar_Syntax_Syntax.Tm_ascribed (e4,t2,uu____416) ->
                          FStar_Pervasives_Native.fst t2
                      | FStar_Syntax_Syntax.Tm_abs (bs,body,uu____471) ->
                          let res = aux body  in
                          let c =
                            match res with
                            | FStar_Util.Inl t2 ->
                                let uu____507 = FStar_Options.ml_ish ()  in
                                if uu____507
                                then FStar_Syntax_Util.ml_comp t2 r
                                else FStar_Syntax_Syntax.mk_Total t2
                            | FStar_Util.Inr c -> c  in
                          let t2 =
                            FStar_Syntax_Syntax.mk
                              (FStar_Syntax_Syntax.Tm_arrow (bs, c))
                              FStar_Pervasives_Native.None
                              c.FStar_Syntax_Syntax.pos
                             in
                          ((let uu____529 =
                              FStar_TypeChecker_Env.debug env1
                                FStar_Options.High
                               in
                            if uu____529
                            then
                              let uu____532 = FStar_Range.string_of_range r
                                 in
                              let uu____534 =
                                FStar_Syntax_Print.term_to_string t2  in
                              FStar_Util.print2 "(%s) Using type %s\n"
                                uu____532 uu____534
                            else ());
                           FStar_Util.Inl t2)
                      | uu____539 -> FStar_Util.Inl FStar_Syntax_Syntax.tun
                       in
                    let t2 =
                      let uu____541 = aux e1  in
                      match uu____541 with
                      | FStar_Util.Inr c ->
                          let uu____547 =
                            FStar_Syntax_Util.is_tot_or_gtot_comp c  in
                          if uu____547
                          then FStar_Syntax_Util.comp_result c
                          else
                            (let uu____552 =
                               let uu____558 =
                                 let uu____560 =
                                   FStar_Syntax_Print.comp_to_string c  in
                                 FStar_Util.format1
                                   "Expected a 'let rec' to be annotated with a value type; got a computation type %s"
                                   uu____560
                                  in
                               (FStar_Errors.Fatal_UnexpectedComputationTypeForLetRec,
                                 uu____558)
                                in
                             FStar_Errors.raise_error uu____552 rng)
                      | FStar_Util.Inl t2 -> t2  in
                    (univ_vars2, t2, true))
           | uu____569 ->
               let uu____570 =
                 FStar_Syntax_Subst.open_univ_vars univ_vars1 t1  in
               (match uu____570 with
                | (univ_vars2,t2) -> (univ_vars2, t2, false)))
  
let rec (decorated_pattern_as_term :
  FStar_Syntax_Syntax.pat ->
    (FStar_Syntax_Syntax.bv Prims.list,FStar_Syntax_Syntax.term)
      FStar_Pervasives_Native.tuple2)
  =
  fun pat  ->
    let mk1 f =
      FStar_Syntax_Syntax.mk f FStar_Pervasives_Native.None
        pat.FStar_Syntax_Syntax.p
       in
    let pat_as_arg uu____634 =
      match uu____634 with
      | (p,i) ->
          let uu____654 = decorated_pattern_as_term p  in
          (match uu____654 with
           | (vars,te) ->
               let uu____677 =
                 let uu____682 = FStar_Syntax_Syntax.as_implicit i  in
                 (te, uu____682)  in
               (vars, uu____677))
       in
    match pat.FStar_Syntax_Syntax.v with
    | FStar_Syntax_Syntax.Pat_constant c ->
        let uu____696 = mk1 (FStar_Syntax_Syntax.Tm_constant c)  in
        ([], uu____696)
    | FStar_Syntax_Syntax.Pat_wild x ->
        let uu____700 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____700)
    | FStar_Syntax_Syntax.Pat_var x ->
        let uu____704 = mk1 (FStar_Syntax_Syntax.Tm_name x)  in
        ([x], uu____704)
    | FStar_Syntax_Syntax.Pat_cons (fv,pats) ->
        let uu____727 =
          let uu____746 =
            FStar_All.pipe_right pats (FStar_List.map pat_as_arg)  in
          FStar_All.pipe_right uu____746 FStar_List.unzip  in
        (match uu____727 with
         | (vars,args) ->
             let vars1 = FStar_List.flatten vars  in
             let uu____884 =
               let uu____885 =
                 let uu____886 =
                   let uu____903 = FStar_Syntax_Syntax.fv_to_tm fv  in
                   (uu____903, args)  in
                 FStar_Syntax_Syntax.Tm_app uu____886  in
               mk1 uu____885  in
             (vars1, uu____884))
    | FStar_Syntax_Syntax.Pat_dot_term (x,e) -> ([], e)
  
let (comp_univ_opt :
  FStar_Syntax_Syntax.comp' FStar_Syntax_Syntax.syntax ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun c  ->
    match c.FStar_Syntax_Syntax.n with
    | FStar_Syntax_Syntax.Total (uu____942,uopt) -> uopt
    | FStar_Syntax_Syntax.GTotal (uu____952,uopt) -> uopt
    | FStar_Syntax_Syntax.Comp c1 ->
        (match c1.FStar_Syntax_Syntax.comp_univs with
         | [] -> FStar_Pervasives_Native.None
         | hd1::uu____966 -> FStar_Pervasives_Native.Some hd1)
  
let (lcomp_univ_opt :
  FStar_Syntax_Syntax.lcomp ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option)
  =
  fun lc  ->
    let uu____977 = FStar_All.pipe_right lc FStar_Syntax_Syntax.lcomp_comp
       in
    FStar_All.pipe_right uu____977 comp_univ_opt
  
let (destruct_comp :
  FStar_Syntax_Syntax.comp_typ ->
    (FStar_Syntax_Syntax.universe,FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
      FStar_Pervasives_Native.tuple3)
  =
  fun c  ->
    let wp =
      match c.FStar_Syntax_Syntax.effect_args with
      | (wp,uu____1006)::[] -> wp
      | uu____1031 ->
          let uu____1042 =
            let uu____1044 =
              let uu____1046 =
                FStar_List.map
                  (fun uu____1060  ->
                     match uu____1060 with
                     | (x,uu____1069) -> FStar_Syntax_Print.term_to_string x)
                  c.FStar_Syntax_Syntax.effect_args
                 in
              FStar_All.pipe_right uu____1046 (FStar_String.concat ", ")  in
            FStar_Util.format2
              "Impossible: Got a computation %s with effect args [%s]"
              (c.FStar_Syntax_Syntax.effect_name).FStar_Ident.str uu____1044
             in
          failwith uu____1042
       in
    let uu____1080 = FStar_List.hd c.FStar_Syntax_Syntax.comp_univs  in
    (uu____1080, (c.FStar_Syntax_Syntax.result_typ), wp)
  
let (lift_comp :
  FStar_Syntax_Syntax.comp_typ ->
    FStar_Ident.lident ->
      FStar_TypeChecker_Env.mlift -> FStar_Syntax_Syntax.comp_typ)
  =
  fun c  ->
    fun m  ->
      fun lift  ->
        let uu____1097 = destruct_comp c  in
        match uu____1097 with
        | (u,uu____1105,wp) ->
            let uu____1107 =
              let uu____1118 =
                let uu____1127 =
                  lift.FStar_TypeChecker_Env.mlift_wp u
                    c.FStar_Syntax_Syntax.result_typ wp
                   in
                FStar_Syntax_Syntax.as_arg uu____1127  in
              [uu____1118]  in
            {
              FStar_Syntax_Syntax.comp_univs = [u];
              FStar_Syntax_Syntax.effect_name = m;
              FStar_Syntax_Syntax.result_typ =
                (c.FStar_Syntax_Syntax.result_typ);
              FStar_Syntax_Syntax.effect_args = uu____1107;
              FStar_Syntax_Syntax.flags = []
            }
  
let (join_effects :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident -> FStar_Ident.lident -> FStar_Ident.lident)
  =
  fun env  ->
    fun l1  ->
      fun l2  ->
        let uu____1160 =
          let uu____1167 = FStar_TypeChecker_Env.norm_eff_name env l1  in
          let uu____1168 = FStar_TypeChecker_Env.norm_eff_name env l2  in
          FStar_TypeChecker_Env.join env uu____1167 uu____1168  in
        match uu____1160 with | (m,uu____1170,uu____1171) -> m
  
let (join_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp ->
      FStar_Syntax_Syntax.lcomp -> FStar_Ident.lident)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let uu____1188 =
          (FStar_Syntax_Util.is_total_lcomp c1) &&
            (FStar_Syntax_Util.is_total_lcomp c2)
           in
        if uu____1188
        then FStar_Parser_Const.effect_Tot_lid
        else
          join_effects env c1.FStar_Syntax_Syntax.eff_name
            c2.FStar_Syntax_Syntax.eff_name
  
let (lift_and_destruct :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.comp ->
        ((FStar_Syntax_Syntax.eff_decl,FStar_Syntax_Syntax.bv,FStar_Syntax_Syntax.term)
           FStar_Pervasives_Native.tuple3,(FStar_Syntax_Syntax.universe,
                                            FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
                                            FStar_Pervasives_Native.tuple3,
          (FStar_Syntax_Syntax.universe,FStar_Syntax_Syntax.typ,FStar_Syntax_Syntax.typ)
            FStar_Pervasives_Native.tuple3)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun c1  ->
      fun c2  ->
        let c11 = FStar_TypeChecker_Env.unfold_effect_abbrev env c1  in
        let c21 = FStar_TypeChecker_Env.unfold_effect_abbrev env c2  in
        let uu____1235 =
          FStar_TypeChecker_Env.join env c11.FStar_Syntax_Syntax.effect_name
            c21.FStar_Syntax_Syntax.effect_name
           in
        match uu____1235 with
        | (m,lift1,lift2) ->
            let m1 = lift_comp c11 m lift1  in
            let m2 = lift_comp c21 m lift2  in
            let md = FStar_TypeChecker_Env.get_effect_decl env m  in
            let uu____1272 =
              FStar_TypeChecker_Env.wp_signature env
                md.FStar_Syntax_Syntax.mname
               in
            (match uu____1272 with
             | (a,kwp) ->
                 let uu____1303 = destruct_comp m1  in
                 let uu____1310 = destruct_comp m2  in
                 ((md, a, kwp), uu____1303, uu____1310))
  
let (is_pure_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid
  
let (is_pure_or_ghost_effect :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> Prims.bool) =
  fun env  ->
    fun l  ->
      let l1 = FStar_TypeChecker_Env.norm_eff_name env l  in
      (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_PURE_lid) ||
        (FStar_Ident.lid_equals l1 FStar_Parser_Const.effect_GHOST_lid)
  
let (mk_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun wp  ->
          fun flags1  ->
            let uu____1395 =
              let uu____1396 =
                let uu____1407 = FStar_Syntax_Syntax.as_arg wp  in
                [uu____1407]  in
              {
                FStar_Syntax_Syntax.comp_univs = [u_result];
                FStar_Syntax_Syntax.effect_name = mname;
                FStar_Syntax_Syntax.result_typ = result;
                FStar_Syntax_Syntax.effect_args = uu____1396;
                FStar_Syntax_Syntax.flags = flags1
              }  in
            FStar_Syntax_Syntax.mk_Comp uu____1395
  
let (mk_comp :
  FStar_Syntax_Syntax.eff_decl ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  = fun md  -> mk_comp_l md.FStar_Syntax_Syntax.mname 
let (lax_mk_tot_or_comp_l :
  FStar_Ident.lident ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax ->
        FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun mname  ->
    fun u_result  ->
      fun result  ->
        fun flags1  ->
          let uu____1491 =
            FStar_Ident.lid_equals mname FStar_Parser_Const.effect_Tot_lid
             in
          if uu____1491
          then
            FStar_Syntax_Syntax.mk_Total' result
              (FStar_Pervasives_Native.Some u_result)
          else mk_comp_l mname u_result result FStar_Syntax_Syntax.tun flags1
  
let (subst_lcomp :
  FStar_Syntax_Syntax.subst_t ->
    FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun subst1  ->
    fun lc  ->
      let uu____1507 =
        FStar_Syntax_Subst.subst subst1 lc.FStar_Syntax_Syntax.res_typ  in
      FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name uu____1507
        lc.FStar_Syntax_Syntax.cflags
        (fun uu____1510  ->
           let uu____1511 = FStar_Syntax_Syntax.lcomp_comp lc  in
           FStar_Syntax_Subst.subst_comp subst1 uu____1511)
  
let (is_function : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun t  ->
    let uu____1519 =
      let uu____1520 = FStar_Syntax_Subst.compress t  in
      uu____1520.FStar_Syntax_Syntax.n  in
    match uu____1519 with
    | FStar_Syntax_Syntax.Tm_arrow uu____1524 -> true
    | uu____1540 -> false
  
let (label :
  Prims.string ->
    FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun reason  ->
    fun r  ->
      fun f  ->
        FStar_Syntax_Syntax.mk
          (FStar_Syntax_Syntax.Tm_meta
             (f, (FStar_Syntax_Syntax.Meta_labeled (reason, r, false))))
          FStar_Pervasives_Native.None f.FStar_Syntax_Syntax.pos
  
let (label_opt :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Range.range -> FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.typ)
  =
  fun env  ->
    fun reason  ->
      fun r  ->
        fun f  ->
          match reason with
          | FStar_Pervasives_Native.None  -> f
          | FStar_Pervasives_Native.Some reason1 ->
              let uu____1610 =
                let uu____1612 = FStar_TypeChecker_Env.should_verify env  in
                FStar_All.pipe_left Prims.op_Negation uu____1612  in
              if uu____1610
              then f
              else (let uu____1619 = reason1 ()  in label uu____1619 r f)
  
let (label_guard :
  FStar_Range.range ->
    Prims.string ->
      FStar_TypeChecker_Env.guard_t -> FStar_TypeChecker_Env.guard_t)
  =
  fun r  ->
    fun reason  ->
      fun g  ->
        match g.FStar_TypeChecker_Env.guard_f with
        | FStar_TypeChecker_Common.Trivial  -> g
        | FStar_TypeChecker_Common.NonTrivial f ->
            let uu___359_1640 = g  in
            let uu____1641 =
              let uu____1642 = label reason r f  in
              FStar_TypeChecker_Common.NonTrivial uu____1642  in
            {
              FStar_TypeChecker_Env.guard_f = uu____1641;
              FStar_TypeChecker_Env.deferred =
                (uu___359_1640.FStar_TypeChecker_Env.deferred);
              FStar_TypeChecker_Env.univ_ineqs =
                (uu___359_1640.FStar_TypeChecker_Env.univ_ineqs);
              FStar_TypeChecker_Env.implicits =
                (uu___359_1640.FStar_TypeChecker_Env.implicits)
            }
  
let (close_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun bvs  ->
      fun c  ->
        let uu____1663 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____1663
        then c
        else
          (let uu____1668 =
             env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())  in
           if uu____1668
           then c
           else
             (let close_wp u_res md res_t bvs1 wp0 =
                FStar_List.fold_right
                  (fun x  ->
                     fun wp  ->
                       let bs =
                         let uu____1732 = FStar_Syntax_Syntax.mk_binder x  in
                         [uu____1732]  in
                       let us =
                         let uu____1754 =
                           let uu____1757 =
                             env.FStar_TypeChecker_Env.universe_of env
                               x.FStar_Syntax_Syntax.sort
                              in
                           [uu____1757]  in
                         u_res :: uu____1754  in
                       let wp1 =
                         FStar_Syntax_Util.abs bs wp
                           (FStar_Pervasives_Native.Some
                              (FStar_Syntax_Util.mk_residual_comp
                                 FStar_Parser_Const.effect_Tot_lid
                                 FStar_Pervasives_Native.None
                                 [FStar_Syntax_Syntax.TOTAL]))
                          in
                       let uu____1763 =
                         let uu____1768 =
                           FStar_TypeChecker_Env.inst_effect_fun_with us env
                             md md.FStar_Syntax_Syntax.close_wp
                            in
                         let uu____1769 =
                           let uu____1770 = FStar_Syntax_Syntax.as_arg res_t
                              in
                           let uu____1779 =
                             let uu____1790 =
                               FStar_Syntax_Syntax.as_arg
                                 x.FStar_Syntax_Syntax.sort
                                in
                             let uu____1799 =
                               let uu____1810 =
                                 FStar_Syntax_Syntax.as_arg wp1  in
                               [uu____1810]  in
                             uu____1790 :: uu____1799  in
                           uu____1770 :: uu____1779  in
                         FStar_Syntax_Syntax.mk_Tm_app uu____1768 uu____1769
                          in
                       uu____1763 FStar_Pervasives_Native.None
                         wp0.FStar_Syntax_Syntax.pos) bvs1 wp0
                 in
              let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
              let uu____1854 = destruct_comp c1  in
              match uu____1854 with
              | (u_res_t,res_t,wp) ->
                  let md =
                    FStar_TypeChecker_Env.get_effect_decl env
                      c1.FStar_Syntax_Syntax.effect_name
                     in
                  let wp1 = close_wp u_res_t md res_t bvs wp  in
                  mk_comp md u_res_t c1.FStar_Syntax_Syntax.result_typ wp1
                    c1.FStar_Syntax_Syntax.flags))
  
let (close_lcomp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.bv Prims.list ->
      FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun bvs  ->
      fun lc  ->
        FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name
          lc.FStar_Syntax_Syntax.res_typ lc.FStar_Syntax_Syntax.cflags
          (fun uu____1890  ->
             let uu____1891 = FStar_Syntax_Syntax.lcomp_comp lc  in
             close_comp env bvs uu____1891)
  
let (should_not_inline_lc : FStar_Syntax_Syntax.lcomp -> Prims.bool) =
  fun lc  ->
    FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
      (FStar_Util.for_some
         (fun uu___339_1903  ->
            match uu___339_1903 with
            | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
            | uu____1906 -> false))
  
let (should_return :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.lcomp -> Prims.bool)
  =
  fun env  ->
    fun eopt  ->
      fun lc  ->
        match eopt with
        | FStar_Pervasives_Native.None  -> false
        | FStar_Pervasives_Native.Some e ->
            (((FStar_Syntax_Util.is_pure_or_ghost_lcomp lc) &&
                (let uu____1933 =
                   FStar_Syntax_Util.is_unit lc.FStar_Syntax_Syntax.res_typ
                    in
                 Prims.op_Negation uu____1933))
               &&
               (let uu____1941 = FStar_Syntax_Util.head_and_args' e  in
                match uu____1941 with
                | (head1,uu____1958) ->
                    let uu____1979 =
                      let uu____1980 = FStar_Syntax_Util.un_uinst head1  in
                      uu____1980.FStar_Syntax_Syntax.n  in
                    (match uu____1979 with
                     | FStar_Syntax_Syntax.Tm_fvar fv ->
                         let uu____1985 =
                           let uu____1987 = FStar_Syntax_Syntax.lid_of_fv fv
                              in
                           FStar_TypeChecker_Env.is_irreducible env
                             uu____1987
                            in
                         Prims.op_Negation uu____1985
                     | uu____1988 -> true)))
              &&
              (let uu____1991 = should_not_inline_lc lc  in
               Prims.op_Negation uu____1991)
  
let (return_value :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun u_t_opt  ->
      fun t  ->
        fun v1  ->
          let c =
            let uu____2019 =
              let uu____2021 =
                FStar_TypeChecker_Env.lid_exists env
                  FStar_Parser_Const.effect_GTot_lid
                 in
              FStar_All.pipe_left Prims.op_Negation uu____2021  in
            if uu____2019
            then FStar_Syntax_Syntax.mk_Total t
            else
              (let uu____2028 = FStar_Syntax_Util.is_unit t  in
               if uu____2028
               then
                 FStar_Syntax_Syntax.mk_Total' t
                   (FStar_Pervasives_Native.Some FStar_Syntax_Syntax.U_zero)
               else
                 (let m =
                    FStar_TypeChecker_Env.get_effect_decl env
                      FStar_Parser_Const.effect_PURE_lid
                     in
                  let u_t =
                    match u_t_opt with
                    | FStar_Pervasives_Native.None  ->
                        env.FStar_TypeChecker_Env.universe_of env t
                    | FStar_Pervasives_Native.Some u_t -> u_t  in
                  let wp =
                    let uu____2037 =
                      env.FStar_TypeChecker_Env.lax &&
                        (FStar_Options.ml_ish ())
                       in
                    if uu____2037
                    then FStar_Syntax_Syntax.tun
                    else
                      (let uu____2042 =
                         FStar_TypeChecker_Env.wp_signature env
                           FStar_Parser_Const.effect_PURE_lid
                          in
                       match uu____2042 with
                       | (a,kwp) ->
                           let k =
                             FStar_Syntax_Subst.subst
                               [FStar_Syntax_Syntax.NT (a, t)] kwp
                              in
                           let uu____2052 =
                             let uu____2053 =
                               let uu____2058 =
                                 FStar_TypeChecker_Env.inst_effect_fun_with
                                   [u_t] env m m.FStar_Syntax_Syntax.ret_wp
                                  in
                               let uu____2059 =
                                 let uu____2060 =
                                   FStar_Syntax_Syntax.as_arg t  in
                                 let uu____2069 =
                                   let uu____2080 =
                                     FStar_Syntax_Syntax.as_arg v1  in
                                   [uu____2080]  in
                                 uu____2060 :: uu____2069  in
                               FStar_Syntax_Syntax.mk_Tm_app uu____2058
                                 uu____2059
                                in
                             uu____2053 FStar_Pervasives_Native.None
                               v1.FStar_Syntax_Syntax.pos
                              in
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.NoFullNorm] env uu____2052)
                     in
                  mk_comp m u_t t wp [FStar_Syntax_Syntax.RETURN]))
             in
          (let uu____2116 =
             FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
               (FStar_Options.Other "Return")
              in
           if uu____2116
           then
             let uu____2121 =
               FStar_Range.string_of_range v1.FStar_Syntax_Syntax.pos  in
             let uu____2123 = FStar_Syntax_Print.term_to_string v1  in
             let uu____2125 =
               FStar_TypeChecker_Normalize.comp_to_string env c  in
             FStar_Util.print3 "(%s) returning %s at comp type %s\n"
               uu____2121 uu____2123 uu____2125
           else ());
          c
  
let (weaken_flags :
  FStar_Syntax_Syntax.cflag Prims.list ->
    FStar_Syntax_Syntax.cflag Prims.list)
  =
  fun flags1  ->
    let uu____2142 =
      FStar_All.pipe_right flags1
        (FStar_Util.for_some
           (fun uu___340_2148  ->
              match uu___340_2148 with
              | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  -> true
              | uu____2151 -> false))
       in
    if uu____2142
    then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
    else
      FStar_All.pipe_right flags1
        (FStar_List.collect
           (fun uu___341_2163  ->
              match uu___341_2163 with
              | FStar_Syntax_Syntax.TOTAL  ->
                  [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | FStar_Syntax_Syntax.RETURN  ->
                  [FStar_Syntax_Syntax.PARTIAL_RETURN;
                  FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
              | f -> [f]))
  
let (weaken_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun c  ->
      fun formula  ->
        let uu____2183 = FStar_Syntax_Util.is_ml_comp c  in
        if uu____2183
        then c
        else
          (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
           let uu____2189 = destruct_comp c1  in
           match uu____2189 with
           | (u_res_t,res_t,wp) ->
               let md =
                 FStar_TypeChecker_Env.get_effect_decl env
                   c1.FStar_Syntax_Syntax.effect_name
                  in
               let wp1 =
                 let uu____2203 =
                   let uu____2208 =
                     FStar_TypeChecker_Env.inst_effect_fun_with [u_res_t] env
                       md md.FStar_Syntax_Syntax.assume_p
                      in
                   let uu____2209 =
                     let uu____2210 = FStar_Syntax_Syntax.as_arg res_t  in
                     let uu____2219 =
                       let uu____2230 = FStar_Syntax_Syntax.as_arg formula
                          in
                       let uu____2239 =
                         let uu____2250 = FStar_Syntax_Syntax.as_arg wp  in
                         [uu____2250]  in
                       uu____2230 :: uu____2239  in
                     uu____2210 :: uu____2219  in
                   FStar_Syntax_Syntax.mk_Tm_app uu____2208 uu____2209  in
                 uu____2203 FStar_Pervasives_Native.None
                   wp.FStar_Syntax_Syntax.pos
                  in
               let uu____2293 = weaken_flags c1.FStar_Syntax_Syntax.flags  in
               mk_comp md u_res_t res_t wp1 uu____2293)
  
let (weaken_precondition :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.lcomp ->
      FStar_TypeChecker_Common.guard_formula -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun lc  ->
      fun f  ->
        let weaken uu____2317 =
          let c = FStar_Syntax_Syntax.lcomp_comp lc  in
          let uu____2319 =
            env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())  in
          if uu____2319
          then c
          else
            (match f with
             | FStar_TypeChecker_Common.Trivial  -> c
             | FStar_TypeChecker_Common.NonTrivial f1 -> weaken_comp env c f1)
           in
        let uu____2325 = weaken_flags lc.FStar_Syntax_Syntax.cflags  in
        FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name
          lc.FStar_Syntax_Syntax.res_typ uu____2325 weaken
  
let (strengthen_comp :
  FStar_TypeChecker_Env.env ->
    (unit -> Prims.string) FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.formula ->
          FStar_Syntax_Syntax.cflag Prims.list -> FStar_Syntax_Syntax.comp)
  =
  fun env  ->
    fun reason  ->
      fun c  ->
        fun f  ->
          fun flags1  ->
            if env.FStar_TypeChecker_Env.lax
            then c
            else
              (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
               let uu____2373 = destruct_comp c1  in
               match uu____2373 with
               | (u_res_t,res_t,wp) ->
                   let md =
                     FStar_TypeChecker_Env.get_effect_decl env
                       c1.FStar_Syntax_Syntax.effect_name
                      in
                   let wp1 =
                     let uu____2387 =
                       let uu____2392 =
                         FStar_TypeChecker_Env.inst_effect_fun_with [u_res_t]
                           env md md.FStar_Syntax_Syntax.assert_p
                          in
                       let uu____2393 =
                         let uu____2394 = FStar_Syntax_Syntax.as_arg res_t
                            in
                         let uu____2403 =
                           let uu____2414 =
                             let uu____2423 =
                               let uu____2424 =
                                 FStar_TypeChecker_Env.get_range env  in
                               label_opt env reason uu____2424 f  in
                             FStar_All.pipe_left FStar_Syntax_Syntax.as_arg
                               uu____2423
                              in
                           let uu____2433 =
                             let uu____2444 = FStar_Syntax_Syntax.as_arg wp
                                in
                             [uu____2444]  in
                           uu____2414 :: uu____2433  in
                         uu____2394 :: uu____2403  in
                       FStar_Syntax_Syntax.mk_Tm_app uu____2392 uu____2393
                        in
                     uu____2387 FStar_Pervasives_Native.None
                       wp.FStar_Syntax_Syntax.pos
                      in
                   mk_comp md u_res_t res_t wp1 flags1)
  
let (strengthen_precondition :
  (unit -> Prims.string) FStar_Pervasives_Native.option ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term ->
        FStar_Syntax_Syntax.lcomp ->
          FStar_TypeChecker_Env.guard_t ->
            (FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
              FStar_Pervasives_Native.tuple2)
  =
  fun reason  ->
    fun env  ->
      fun e_for_debugging_only  ->
        fun lc  ->
          fun g0  ->
            let uu____2532 =
              FStar_TypeChecker_Env.is_trivial_guard_formula g0  in
            if uu____2532
            then (lc, g0)
            else
              (let flags1 =
                 let uu____2544 =
                   let uu____2552 = FStar_Syntax_Util.is_tot_or_gtot_lcomp lc
                      in
                   if uu____2552
                   then (true, [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION])
                   else (false, [])  in
                 match uu____2544 with
                 | (maybe_trivial_post,flags1) ->
                     let uu____2582 =
                       FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
                         (FStar_List.collect
                            (fun uu___342_2590  ->
                               match uu___342_2590 with
                               | FStar_Syntax_Syntax.RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                               | FStar_Syntax_Syntax.SOMETRIVIAL  when
                                   Prims.op_Negation maybe_trivial_post ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION 
                                   when Prims.op_Negation maybe_trivial_post
                                   ->
                                   [FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION]
                               | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                   [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                               | uu____2593 -> []))
                        in
                     FStar_List.append flags1 uu____2582
                  in
               let strengthen uu____2599 =
                 let c = FStar_Syntax_Syntax.lcomp_comp lc  in
                 if env.FStar_TypeChecker_Env.lax
                 then c
                 else
                   (let g01 = FStar_TypeChecker_Rel.simplify_guard env g0  in
                    let uu____2605 = FStar_TypeChecker_Env.guard_form g01  in
                    match uu____2605 with
                    | FStar_TypeChecker_Common.Trivial  -> c
                    | FStar_TypeChecker_Common.NonTrivial f ->
                        ((let uu____2608 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env)
                              FStar_Options.Extreme
                             in
                          if uu____2608
                          then
                            let uu____2612 =
                              FStar_TypeChecker_Normalize.term_to_string env
                                e_for_debugging_only
                               in
                            let uu____2614 =
                              FStar_TypeChecker_Normalize.term_to_string env
                                f
                               in
                            FStar_Util.print2
                              "-------------Strengthening pre-condition of term %s with guard %s\n"
                              uu____2612 uu____2614
                          else ());
                         strengthen_comp env reason c f flags1))
                  in
               let uu____2619 =
                 let uu____2620 =
                   FStar_TypeChecker_Env.norm_eff_name env
                     lc.FStar_Syntax_Syntax.eff_name
                    in
                 FStar_Syntax_Syntax.mk_lcomp uu____2620
                   lc.FStar_Syntax_Syntax.res_typ flags1 strengthen
                  in
               (uu____2619,
                 (let uu___360_2622 = g0  in
                  {
                    FStar_TypeChecker_Env.guard_f =
                      FStar_TypeChecker_Common.Trivial;
                    FStar_TypeChecker_Env.deferred =
                      (uu___360_2622.FStar_TypeChecker_Env.deferred);
                    FStar_TypeChecker_Env.univ_ineqs =
                      (uu___360_2622.FStar_TypeChecker_Env.univ_ineqs);
                    FStar_TypeChecker_Env.implicits =
                      (uu___360_2622.FStar_TypeChecker_Env.implicits)
                  })))
  
let (lcomp_has_trivial_postcondition :
  FStar_Syntax_Syntax.lcomp -> Prims.bool) =
  fun lc  ->
    (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc) ||
      (FStar_Util.for_some
         (fun uu___343_2631  ->
            match uu___343_2631 with
            | FStar_Syntax_Syntax.SOMETRIVIAL  -> true
            | FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION  -> true
            | uu____2635 -> false) lc.FStar_Syntax_Syntax.cflags)
  
let (maybe_add_with_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe FStar_Pervasives_Native.option ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_Syntax_Syntax.term ->
          FStar_Syntax_Syntax.term' FStar_Syntax_Syntax.syntax)
  =
  fun env  ->
    fun uopt  ->
      fun lc  ->
        fun e  ->
          let uu____2664 =
            (FStar_Syntax_Util.is_lcomp_partial_return lc) ||
              env.FStar_TypeChecker_Env.lax
             in
          if uu____2664
          then e
          else
            (let uu____2671 =
               (lcomp_has_trivial_postcondition lc) &&
                 (let uu____2674 =
                    FStar_TypeChecker_Env.try_lookup_lid env
                      FStar_Parser_Const.with_type_lid
                     in
                  FStar_Option.isSome uu____2674)
                in
             if uu____2671
             then
               let u =
                 match uopt with
                 | FStar_Pervasives_Native.Some u -> u
                 | FStar_Pervasives_Native.None  ->
                     env.FStar_TypeChecker_Env.universe_of env
                       lc.FStar_Syntax_Syntax.res_typ
                  in
               FStar_Syntax_Util.mk_with_type u
                 lc.FStar_Syntax_Syntax.res_typ e
             else e)
  
let (bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.lcomp ->
          lcomp_with_binder -> FStar_Syntax_Syntax.lcomp)
  =
  fun r1  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun uu____2727  ->
            match uu____2727 with
            | (b,lc2) ->
                let debug1 f =
                  let uu____2747 =
                    (FStar_TypeChecker_Env.debug env FStar_Options.Extreme)
                      ||
                      (FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "bind"))
                     in
                  if uu____2747 then f () else ()  in
                let lc11 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc1  in
                let lc21 =
                  FStar_TypeChecker_Normalize.ghost_to_pure_lcomp env lc2  in
                let joined_eff = join_lcomp env lc11 lc21  in
                let bind_flags =
                  let uu____2760 =
                    (should_not_inline_lc lc11) ||
                      (should_not_inline_lc lc21)
                     in
                  if uu____2760
                  then [FStar_Syntax_Syntax.SHOULD_NOT_INLINE]
                  else
                    (let flags1 =
                       let uu____2770 = FStar_Syntax_Util.is_total_lcomp lc11
                          in
                       if uu____2770
                       then
                         let uu____2775 =
                           FStar_Syntax_Util.is_total_lcomp lc21  in
                         (if uu____2775
                          then [FStar_Syntax_Syntax.TOTAL]
                          else
                            (let uu____2782 =
                               FStar_Syntax_Util.is_tot_or_gtot_lcomp lc21
                                in
                             if uu____2782
                             then [FStar_Syntax_Syntax.SOMETRIVIAL]
                             else []))
                       else
                         (let uu____2791 =
                            (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc11) &&
                              (FStar_Syntax_Util.is_tot_or_gtot_lcomp lc21)
                             in
                          if uu____2791
                          then [FStar_Syntax_Syntax.SOMETRIVIAL]
                          else [])
                        in
                     let uu____2798 = lcomp_has_trivial_postcondition lc21
                        in
                     if uu____2798
                     then FStar_Syntax_Syntax.TRIVIAL_POSTCONDITION :: flags1
                     else flags1)
                   in
                let bind_it uu____2810 =
                  let uu____2811 =
                    env.FStar_TypeChecker_Env.lax &&
                      (FStar_Options.ml_ish ())
                     in
                  if uu____2811
                  then
                    let u_t =
                      env.FStar_TypeChecker_Env.universe_of env
                        lc21.FStar_Syntax_Syntax.res_typ
                       in
                    lax_mk_tot_or_comp_l joined_eff u_t
                      lc21.FStar_Syntax_Syntax.res_typ []
                  else
                    (let c1 = FStar_Syntax_Syntax.lcomp_comp lc11  in
                     let c2 = FStar_Syntax_Syntax.lcomp_comp lc21  in
                     debug1
                       (fun uu____2828  ->
                          let uu____2829 =
                            FStar_Syntax_Print.comp_to_string c1  in
                          let uu____2831 =
                            match b with
                            | FStar_Pervasives_Native.None  -> "none"
                            | FStar_Pervasives_Native.Some x ->
                                FStar_Syntax_Print.bv_to_string x
                             in
                          let uu____2836 =
                            FStar_Syntax_Print.comp_to_string c2  in
                          FStar_Util.print3
                            "(1) bind: \n\tc1=%s\n\tx=%s\n\tc2=%s\n(1. end bind)\n"
                            uu____2829 uu____2831 uu____2836);
                     (let aux uu____2854 =
                        let uu____2855 = FStar_Syntax_Util.is_trivial_wp c1
                           in
                        if uu____2855
                        then
                          match b with
                          | FStar_Pervasives_Native.None  ->
                              FStar_Util.Inl (c2, "trivial no binder")
                          | FStar_Pervasives_Native.Some uu____2886 ->
                              let uu____2887 =
                                FStar_Syntax_Util.is_ml_comp c2  in
                              (if uu____2887
                               then FStar_Util.Inl (c2, "trivial ml")
                               else
                                 FStar_Util.Inr
                                   "c1 trivial; but c2 is not ML")
                        else
                          (let uu____2919 =
                             (FStar_Syntax_Util.is_ml_comp c1) &&
                               (FStar_Syntax_Util.is_ml_comp c2)
                              in
                           if uu____2919
                           then FStar_Util.Inl (c2, "both ml")
                           else
                             FStar_Util.Inr
                               "c1 not trivial, and both are not ML")
                         in
                      let subst_c2 e1opt1 reason =
                        match (e1opt1, b) with
                        | (FStar_Pervasives_Native.Some
                           e,FStar_Pervasives_Native.Some x) ->
                            let uu____3008 =
                              let uu____3014 =
                                FStar_Syntax_Subst.subst_comp
                                  [FStar_Syntax_Syntax.NT (x, e)] c2
                                 in
                              (uu____3014, reason)  in
                            FStar_Util.Inl uu____3008
                        | uu____3024 -> aux ()  in
                      let try_simplify uu____3050 =
                        let maybe_close t x c =
                          let t1 =
                            FStar_TypeChecker_Normalize.normalize_refinement
                              FStar_TypeChecker_Normalize.whnf_steps env t
                             in
                          match t1.FStar_Syntax_Syntax.n with
                          | FStar_Syntax_Syntax.Tm_refine
                              ({ FStar_Syntax_Syntax.ppname = uu____3068;
                                 FStar_Syntax_Syntax.index = uu____3069;
                                 FStar_Syntax_Syntax.sort =
                                   {
                                     FStar_Syntax_Syntax.n =
                                       FStar_Syntax_Syntax.Tm_fvar fv;
                                     FStar_Syntax_Syntax.pos = uu____3071;
                                     FStar_Syntax_Syntax.vars = uu____3072;_};_},uu____3073)
                              when
                              FStar_Syntax_Syntax.fv_eq_lid fv
                                FStar_Parser_Const.unit_lid
                              -> close_comp env [x] c
                          | uu____3081 -> c  in
                        let uu____3082 =
                          let uu____3084 =
                            FStar_TypeChecker_Env.try_lookup_effect_lid env
                              FStar_Parser_Const.effect_GTot_lid
                             in
                          FStar_Option.isNone uu____3084  in
                        if uu____3082
                        then
                          let uu____3098 =
                            (FStar_Syntax_Util.is_tot_or_gtot_comp c1) &&
                              (FStar_Syntax_Util.is_tot_or_gtot_comp c2)
                             in
                          (if uu____3098
                           then
                             FStar_Util.Inl
                               (c2, "Early in prims; we don't have bind yet")
                           else
                             (let uu____3121 =
                                FStar_TypeChecker_Env.get_range env  in
                              FStar_Errors.raise_error
                                (FStar_Errors.Fatal_NonTrivialPreConditionInPrims,
                                  "Non-trivial pre-conditions very early in prims, even before we have defined the PURE monad")
                                uu____3121))
                        else
                          (let uu____3136 =
                             (FStar_Syntax_Util.is_total_comp c1) &&
                               (FStar_Syntax_Util.is_total_comp c2)
                              in
                           if uu____3136
                           then subst_c2 e1opt "both total"
                           else
                             (let uu____3152 =
                                (FStar_Syntax_Util.is_tot_or_gtot_comp c1) &&
                                  (FStar_Syntax_Util.is_tot_or_gtot_comp c2)
                                 in
                              if uu____3152
                              then
                                let uu____3165 =
                                  let uu____3171 =
                                    FStar_Syntax_Syntax.mk_GTotal
                                      (FStar_Syntax_Util.comp_result c2)
                                     in
                                  (uu____3171, "both gtot")  in
                                FStar_Util.Inl uu____3165
                              else
                                (match (e1opt, b) with
                                 | (FStar_Pervasives_Native.Some
                                    e,FStar_Pervasives_Native.Some x) ->
                                     let uu____3202 =
                                       (FStar_Syntax_Util.is_total_comp c1)
                                         &&
                                         (let uu____3205 =
                                            FStar_Syntax_Syntax.is_null_bv x
                                             in
                                          Prims.op_Negation uu____3205)
                                        in
                                     if uu____3202
                                     then
                                       let c21 =
                                         FStar_Syntax_Subst.subst_comp
                                           [FStar_Syntax_Syntax.NT (x, e)] c2
                                          in
                                       let x1 =
                                         let uu___361_3222 = x  in
                                         {
                                           FStar_Syntax_Syntax.ppname =
                                             (uu___361_3222.FStar_Syntax_Syntax.ppname);
                                           FStar_Syntax_Syntax.index =
                                             (uu___361_3222.FStar_Syntax_Syntax.index);
                                           FStar_Syntax_Syntax.sort =
                                             (FStar_Syntax_Util.comp_result
                                                c1)
                                         }  in
                                       let uu____3223 =
                                         let uu____3229 =
                                           maybe_close
                                             x1.FStar_Syntax_Syntax.sort x1
                                             c21
                                            in
                                         (uu____3229, "c1 Tot")  in
                                       FStar_Util.Inl uu____3223
                                     else aux ()
                                 | uu____3240 -> aux ())))
                         in
                      let uu____3249 = try_simplify ()  in
                      match uu____3249 with
                      | FStar_Util.Inl (c,reason) ->
                          (debug1
                             (fun uu____3275  ->
                                let uu____3276 =
                                  FStar_Syntax_Print.comp_to_string c  in
                                FStar_Util.print2
                                  "(2) bind: Simplified (because %s) to\n\t%s\n"
                                  reason uu____3276);
                           c)
                      | FStar_Util.Inr reason ->
                          (debug1
                             (fun uu____3290  ->
                                FStar_Util.print1
                                  "(2) bind: Not simplified because %s\n"
                                  reason);
                           (let mk_bind c11 b1 c21 =
                              let uu____3312 = lift_and_destruct env c11 c21
                                 in
                              match uu____3312 with
                              | ((md,a,kwp),(u_t1,t1,wp1),(u_t2,t2,wp2)) ->
                                  let bs =
                                    match b1 with
                                    | FStar_Pervasives_Native.None  ->
                                        let uu____3365 =
                                          FStar_Syntax_Syntax.null_binder t1
                                           in
                                        [uu____3365]
                                    | FStar_Pervasives_Native.Some x ->
                                        let uu____3385 =
                                          FStar_Syntax_Syntax.mk_binder x  in
                                        [uu____3385]
                                     in
                                  let mk_lam wp =
                                    FStar_Syntax_Util.abs bs wp
                                      (FStar_Pervasives_Native.Some
                                         (FStar_Syntax_Util.mk_residual_comp
                                            FStar_Parser_Const.effect_Tot_lid
                                            FStar_Pervasives_Native.None
                                            [FStar_Syntax_Syntax.TOTAL]))
                                     in
                                  let r11 =
                                    FStar_Syntax_Syntax.mk
                                      (FStar_Syntax_Syntax.Tm_constant
                                         (FStar_Const.Const_range r1))
                                      FStar_Pervasives_Native.None r1
                                     in
                                  let wp_args =
                                    let uu____3432 =
                                      FStar_Syntax_Syntax.as_arg r11  in
                                    let uu____3441 =
                                      let uu____3452 =
                                        FStar_Syntax_Syntax.as_arg t1  in
                                      let uu____3461 =
                                        let uu____3472 =
                                          FStar_Syntax_Syntax.as_arg t2  in
                                        let uu____3481 =
                                          let uu____3492 =
                                            FStar_Syntax_Syntax.as_arg wp1
                                             in
                                          let uu____3501 =
                                            let uu____3512 =
                                              let uu____3521 = mk_lam wp2  in
                                              FStar_Syntax_Syntax.as_arg
                                                uu____3521
                                               in
                                            [uu____3512]  in
                                          uu____3492 :: uu____3501  in
                                        uu____3472 :: uu____3481  in
                                      uu____3452 :: uu____3461  in
                                    uu____3432 :: uu____3441  in
                                  let wp =
                                    let uu____3573 =
                                      let uu____3578 =
                                        FStar_TypeChecker_Env.inst_effect_fun_with
                                          [u_t1; u_t2] env md
                                          md.FStar_Syntax_Syntax.bind_wp
                                         in
                                      FStar_Syntax_Syntax.mk_Tm_app
                                        uu____3578 wp_args
                                       in
                                    uu____3573 FStar_Pervasives_Native.None
                                      t2.FStar_Syntax_Syntax.pos
                                     in
                                  mk_comp md u_t2 t2 wp bind_flags
                               in
                            let mk_seq c11 b1 c21 =
                              let c12 =
                                FStar_TypeChecker_Env.unfold_effect_abbrev
                                  env c11
                                 in
                              let c22 =
                                FStar_TypeChecker_Env.unfold_effect_abbrev
                                  env c21
                                 in
                              let uu____3603 =
                                FStar_TypeChecker_Env.join env
                                  c12.FStar_Syntax_Syntax.effect_name
                                  c22.FStar_Syntax_Syntax.effect_name
                                 in
                              match uu____3603 with
                              | (m,uu____3611,lift2) ->
                                  let c23 =
                                    let uu____3614 = lift_comp c22 m lift2
                                       in
                                    FStar_Syntax_Syntax.mk_Comp uu____3614
                                     in
                                  let uu____3615 = destruct_comp c12  in
                                  (match uu____3615 with
                                   | (u1,t1,wp1) ->
                                       let md_pure_or_ghost =
                                         FStar_TypeChecker_Env.get_effect_decl
                                           env
                                           c12.FStar_Syntax_Syntax.effect_name
                                          in
                                       let vc1 =
                                         let uu____3629 =
                                           let uu____3634 =
                                             FStar_TypeChecker_Env.inst_effect_fun_with
                                               [u1] env md_pure_or_ghost
                                               md_pure_or_ghost.FStar_Syntax_Syntax.trivial
                                              in
                                           let uu____3635 =
                                             let uu____3636 =
                                               FStar_Syntax_Syntax.as_arg t1
                                                in
                                             let uu____3645 =
                                               let uu____3656 =
                                                 FStar_Syntax_Syntax.as_arg
                                                   wp1
                                                  in
                                               [uu____3656]  in
                                             uu____3636 :: uu____3645  in
                                           FStar_Syntax_Syntax.mk_Tm_app
                                             uu____3634 uu____3635
                                            in
                                         uu____3629
                                           FStar_Pervasives_Native.None r1
                                          in
                                       strengthen_comp env
                                         FStar_Pervasives_Native.None c23 vc1
                                         bind_flags)
                               in
                            let c1_typ =
                              FStar_TypeChecker_Env.unfold_effect_abbrev env
                                c1
                               in
                            let uu____3696 = destruct_comp c1_typ  in
                            match uu____3696 with
                            | (u_res_t1,res_t1,uu____3705) ->
                                let uu____3706 =
                                  (FStar_Option.isSome b) &&
                                    (should_return env e1opt lc11)
                                   in
                                if uu____3706
                                then
                                  let e1 = FStar_Option.get e1opt  in
                                  let x = FStar_Option.get b  in
                                  let uu____3711 =
                                    FStar_Syntax_Util.is_partial_return c1
                                     in
                                  (if uu____3711
                                   then
                                     (debug1
                                        (fun uu____3721  ->
                                           let uu____3722 =
                                             FStar_TypeChecker_Normalize.term_to_string
                                               env e1
                                              in
                                           let uu____3724 =
                                             FStar_Syntax_Print.bv_to_string
                                               x
                                              in
                                           FStar_Util.print2
                                             "(3) bind (case a): Substituting %s for %s"
                                             uu____3722 uu____3724);
                                      (let c21 =
                                         FStar_Syntax_Subst.subst_comp
                                           [FStar_Syntax_Syntax.NT (x, e1)]
                                           c2
                                          in
                                       mk_bind c1 b c21))
                                   else
                                     (let uu____3732 =
                                        ((FStar_Options.vcgen_optimize_bind_as_seq
                                            ())
                                           &&
                                           (lcomp_has_trivial_postcondition
                                              lc11))
                                          &&
                                          (let uu____3735 =
                                             FStar_TypeChecker_Env.try_lookup_lid
                                               env
                                               FStar_Parser_Const.with_type_lid
                                              in
                                           FStar_Option.isSome uu____3735)
                                         in
                                      if uu____3732
                                      then
                                        let e1' =
                                          let uu____3756 =
                                            FStar_Options.vcgen_decorate_with_type
                                              ()
                                             in
                                          if uu____3756
                                          then
                                            FStar_Syntax_Util.mk_with_type
                                              u_res_t1 res_t1 e1
                                          else e1  in
                                        (debug1
                                           (fun uu____3768  ->
                                              let uu____3769 =
                                                FStar_TypeChecker_Normalize.term_to_string
                                                  env e1'
                                                 in
                                              let uu____3771 =
                                                FStar_Syntax_Print.bv_to_string
                                                  x
                                                 in
                                              FStar_Util.print2
                                                "(3) bind (case b): Substituting %s for %s"
                                                uu____3769 uu____3771);
                                         (let c21 =
                                            FStar_Syntax_Subst.subst_comp
                                              [FStar_Syntax_Syntax.NT
                                                 (x, e1')] c2
                                             in
                                          mk_seq c1 b c21))
                                      else
                                        (debug1
                                           (fun uu____3786  ->
                                              let uu____3787 =
                                                FStar_TypeChecker_Normalize.term_to_string
                                                  env e1
                                                 in
                                              let uu____3789 =
                                                FStar_Syntax_Print.bv_to_string
                                                  x
                                                 in
                                              FStar_Util.print2
                                                "(3) bind (case c): Adding equality %s = %s"
                                                uu____3787 uu____3789);
                                         (let c21 =
                                            FStar_Syntax_Subst.subst_comp
                                              [FStar_Syntax_Syntax.NT (x, e1)]
                                              c2
                                             in
                                          let x_eq_e =
                                            let uu____3796 =
                                              FStar_Syntax_Syntax.bv_to_name
                                                x
                                               in
                                            FStar_Syntax_Util.mk_eq2 u_res_t1
                                              res_t1 e1 uu____3796
                                             in
                                          let c22 =
                                            weaken_comp env c21 x_eq_e  in
                                          mk_bind c1 b c22))))
                                else mk_bind c1 b c2))))
                   in
                FStar_Syntax_Syntax.mk_lcomp joined_eff
                  lc21.FStar_Syntax_Syntax.res_typ bind_flags bind_it
  
let (weaken_guard :
  FStar_TypeChecker_Common.guard_formula ->
    FStar_TypeChecker_Common.guard_formula ->
      FStar_TypeChecker_Common.guard_formula)
  =
  fun g1  ->
    fun g2  ->
      match (g1, g2) with
      | (FStar_TypeChecker_Common.NonTrivial
         f1,FStar_TypeChecker_Common.NonTrivial f2) ->
          let g = FStar_Syntax_Util.mk_imp f1 f2  in
          FStar_TypeChecker_Common.NonTrivial g
      | uu____3814 -> g2
  
let (maybe_assume_result_eq_pure_term :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp -> FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        let should_return1 =
          (((Prims.op_Negation env.FStar_TypeChecker_Env.lax) &&
              (FStar_TypeChecker_Env.lid_exists env
                 FStar_Parser_Const.effect_GTot_lid))
             && (should_return env (FStar_Pervasives_Native.Some e) lc))
            &&
            (let uu____3838 = FStar_Syntax_Util.is_lcomp_partial_return lc
                in
             Prims.op_Negation uu____3838)
           in
        let flags1 =
          if should_return1
          then
            let uu____3846 = FStar_Syntax_Util.is_total_lcomp lc  in
            (if uu____3846
             then FStar_Syntax_Syntax.RETURN ::
               (lc.FStar_Syntax_Syntax.cflags)
             else FStar_Syntax_Syntax.PARTIAL_RETURN ::
               (lc.FStar_Syntax_Syntax.cflags))
          else lc.FStar_Syntax_Syntax.cflags  in
        let refine1 uu____3862 =
          let c = FStar_Syntax_Syntax.lcomp_comp lc  in
          let u_t =
            match comp_univ_opt c with
            | FStar_Pervasives_Native.Some u_t -> u_t
            | FStar_Pervasives_Native.None  ->
                env.FStar_TypeChecker_Env.universe_of env
                  (FStar_Syntax_Util.comp_result c)
             in
          let uu____3866 = FStar_Syntax_Util.is_tot_or_gtot_comp c  in
          if uu____3866
          then
            let retc =
              return_value env (FStar_Pervasives_Native.Some u_t)
                (FStar_Syntax_Util.comp_result c) e
               in
            let uu____3872 =
              let uu____3874 = FStar_Syntax_Util.is_pure_comp c  in
              Prims.op_Negation uu____3874  in
            (if uu____3872
             then
               let retc1 = FStar_Syntax_Util.comp_to_comp_typ retc  in
               let retc2 =
                 let uu___362_3881 = retc1  in
                 {
                   FStar_Syntax_Syntax.comp_univs =
                     (uu___362_3881.FStar_Syntax_Syntax.comp_univs);
                   FStar_Syntax_Syntax.effect_name =
                     FStar_Parser_Const.effect_GHOST_lid;
                   FStar_Syntax_Syntax.result_typ =
                     (uu___362_3881.FStar_Syntax_Syntax.result_typ);
                   FStar_Syntax_Syntax.effect_args =
                     (uu___362_3881.FStar_Syntax_Syntax.effect_args);
                   FStar_Syntax_Syntax.flags = flags1
                 }  in
               FStar_Syntax_Syntax.mk_Comp retc2
             else FStar_Syntax_Util.comp_set_flags retc flags1)
          else
            (let c1 = FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
             let t = c1.FStar_Syntax_Syntax.result_typ  in
             let c2 = FStar_Syntax_Syntax.mk_Comp c1  in
             let x =
               FStar_Syntax_Syntax.new_bv
                 (FStar_Pervasives_Native.Some (t.FStar_Syntax_Syntax.pos)) t
                in
             let xexp = FStar_Syntax_Syntax.bv_to_name x  in
             let ret1 =
               let uu____3894 =
                 let uu____3895 =
                   return_value env (FStar_Pervasives_Native.Some u_t) t xexp
                    in
                 FStar_Syntax_Util.comp_set_flags uu____3895
                   [FStar_Syntax_Syntax.PARTIAL_RETURN]
                  in
               FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp uu____3894
                in
             let eq1 = FStar_Syntax_Util.mk_eq2 u_t t xexp e  in
             let eq_ret =
               weaken_precondition env ret1
                 (FStar_TypeChecker_Common.NonTrivial eq1)
                in
             let uu____3898 =
               let uu____3899 =
                 let uu____3900 = FStar_Syntax_Util.lcomp_of_comp c2  in
                 bind e.FStar_Syntax_Syntax.pos env
                   FStar_Pervasives_Native.None uu____3900
                   ((FStar_Pervasives_Native.Some x), eq_ret)
                  in
               FStar_Syntax_Syntax.lcomp_comp uu____3899  in
             FStar_Syntax_Util.comp_set_flags uu____3898 flags1)
           in
        if Prims.op_Negation should_return1
        then lc
        else
          FStar_Syntax_Syntax.mk_lcomp lc.FStar_Syntax_Syntax.eff_name
            lc.FStar_Syntax_Syntax.res_typ flags1 refine1
  
let (maybe_return_e2_and_bind :
  FStar_Range.range ->
    FStar_TypeChecker_Env.env ->
      FStar_Syntax_Syntax.term FStar_Pervasives_Native.option ->
        FStar_Syntax_Syntax.lcomp ->
          FStar_Syntax_Syntax.term ->
            lcomp_with_binder -> FStar_Syntax_Syntax.lcomp)
  =
  fun r  ->
    fun env  ->
      fun e1opt  ->
        fun lc1  ->
          fun e2  ->
            fun uu____3938  ->
              match uu____3938 with
              | (x,lc2) ->
                  let lc21 =
                    let eff1 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc1.FStar_Syntax_Syntax.eff_name
                       in
                    let eff2 =
                      FStar_TypeChecker_Env.norm_eff_name env
                        lc2.FStar_Syntax_Syntax.eff_name
                       in
                    let uu____3950 =
                      ((let uu____3954 = is_pure_or_ghost_effect env eff1  in
                        Prims.op_Negation uu____3954) ||
                         (should_not_inline_lc lc1))
                        && (is_pure_or_ghost_effect env eff2)
                       in
                    if uu____3950
                    then maybe_assume_result_eq_pure_term env e2 lc2
                    else lc2  in
                  bind r env e1opt lc1 (x, lc21)
  
let (fvar_const :
  FStar_TypeChecker_Env.env -> FStar_Ident.lident -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun lid  ->
      let uu____3972 =
        let uu____3973 = FStar_TypeChecker_Env.get_range env  in
        FStar_Ident.set_lid_range lid uu____3973  in
      FStar_Syntax_Syntax.fvar uu____3972 FStar_Syntax_Syntax.delta_constant
        FStar_Pervasives_Native.None
  
let (bind_cases :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.typ ->
      (FStar_Syntax_Syntax.typ,FStar_Ident.lident,FStar_Syntax_Syntax.cflag
                                                    Prims.list,Prims.bool ->
                                                                 FStar_Syntax_Syntax.lcomp)
        FStar_Pervasives_Native.tuple4 Prims.list ->
        FStar_Syntax_Syntax.lcomp)
  =
  fun env  ->
    fun res_t  ->
      fun lcases  ->
        let eff =
          FStar_List.fold_left
            (fun eff  ->
               fun uu____4043  ->
                 match uu____4043 with
                 | (uu____4057,eff_label,uu____4059,uu____4060) ->
                     join_effects env eff eff_label)
            FStar_Parser_Const.effect_PURE_lid lcases
           in
        let uu____4073 =
          let uu____4081 =
            FStar_All.pipe_right lcases
              (FStar_Util.for_some
                 (fun uu____4119  ->
                    match uu____4119 with
                    | (uu____4134,uu____4135,flags1,uu____4137) ->
                        FStar_All.pipe_right flags1
                          (FStar_Util.for_some
                             (fun uu___344_4154  ->
                                match uu___344_4154 with
                                | FStar_Syntax_Syntax.SHOULD_NOT_INLINE  ->
                                    true
                                | uu____4157 -> false))))
             in
          if uu____4081
          then (true, [FStar_Syntax_Syntax.SHOULD_NOT_INLINE])
          else (false, [])  in
        match uu____4073 with
        | (should_not_inline_whole_match,bind_cases_flags) ->
            let bind_cases uu____4190 =
              let u_res_t = env.FStar_TypeChecker_Env.universe_of env res_t
                 in
              let uu____4192 =
                env.FStar_TypeChecker_Env.lax && (FStar_Options.ml_ish ())
                 in
              if uu____4192
              then lax_mk_tot_or_comp_l eff u_res_t res_t []
              else
                (let ifthenelse md res_t1 g wp_t wp_e =
                   let uu____4233 =
                     FStar_Range.union_ranges wp_t.FStar_Syntax_Syntax.pos
                       wp_e.FStar_Syntax_Syntax.pos
                      in
                   let uu____4234 =
                     let uu____4239 =
                       FStar_TypeChecker_Env.inst_effect_fun_with [u_res_t]
                         env md md.FStar_Syntax_Syntax.if_then_else
                        in
                     let uu____4240 =
                       let uu____4241 = FStar_Syntax_Syntax.as_arg res_t1  in
                       let uu____4250 =
                         let uu____4261 = FStar_Syntax_Syntax.as_arg g  in
                         let uu____4270 =
                           let uu____4281 = FStar_Syntax_Syntax.as_arg wp_t
                              in
                           let uu____4290 =
                             let uu____4301 = FStar_Syntax_Syntax.as_arg wp_e
                                in
                             [uu____4301]  in
                           uu____4281 :: uu____4290  in
                         uu____4261 :: uu____4270  in
                       uu____4241 :: uu____4250  in
                     FStar_Syntax_Syntax.mk_Tm_app uu____4239 uu____4240  in
                   uu____4234 FStar_Pervasives_Native.None uu____4233  in
                 let default_case =
                   let post_k =
                     let uu____4356 =
                       let uu____4365 = FStar_Syntax_Syntax.null_binder res_t
                          in
                       [uu____4365]  in
                     let uu____4384 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____4356 uu____4384  in
                   let kwp =
                     let uu____4390 =
                       let uu____4399 =
                         FStar_Syntax_Syntax.null_binder post_k  in
                       [uu____4399]  in
                     let uu____4418 =
                       FStar_Syntax_Syntax.mk_Total FStar_Syntax_Util.ktype0
                        in
                     FStar_Syntax_Util.arrow uu____4390 uu____4418  in
                   let post =
                     FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None
                       post_k
                      in
                   let wp =
                     let uu____4425 =
                       let uu____4426 = FStar_Syntax_Syntax.mk_binder post
                          in
                       [uu____4426]  in
                     let uu____4445 =
                       let uu____4448 =
                         let uu____4455 = FStar_TypeChecker_Env.get_range env
                            in
                         label FStar_TypeChecker_Err.exhaustiveness_check
                           uu____4455
                          in
                       let uu____4456 =
                         fvar_const env FStar_Parser_Const.false_lid  in
                       FStar_All.pipe_left uu____4448 uu____4456  in
                     FStar_Syntax_Util.abs uu____4425 uu____4445
                       (FStar_Pervasives_Native.Some
                          (FStar_Syntax_Util.mk_residual_comp
                             FStar_Parser_Const.effect_Tot_lid
                             FStar_Pervasives_Native.None
                             [FStar_Syntax_Syntax.TOTAL]))
                      in
                   let md =
                     FStar_TypeChecker_Env.get_effect_decl env
                       FStar_Parser_Const.effect_PURE_lid
                      in
                   mk_comp md u_res_t res_t wp []  in
                 let maybe_return eff_label_then cthen =
                   let uu____4480 =
                     should_not_inline_whole_match ||
                       (let uu____4483 = is_pure_or_ghost_effect env eff  in
                        Prims.op_Negation uu____4483)
                      in
                   if uu____4480 then cthen true else cthen false  in
                 let comp =
                   FStar_List.fold_right
                     (fun uu____4522  ->
                        fun celse  ->
                          match uu____4522 with
                          | (g,eff_label,uu____4539,cthen) ->
                              let uu____4553 =
                                let uu____4578 =
                                  let uu____4579 =
                                    maybe_return eff_label cthen  in
                                  FStar_Syntax_Syntax.lcomp_comp uu____4579
                                   in
                                lift_and_destruct env uu____4578 celse  in
                              (match uu____4553 with
                               | ((md,uu____4581,uu____4582),(uu____4583,uu____4584,wp_then),
                                  (uu____4586,uu____4587,wp_else)) ->
                                   let uu____4607 =
                                     ifthenelse md res_t g wp_then wp_else
                                      in
                                   mk_comp md u_res_t res_t uu____4607 []))
                     lcases default_case
                    in
                 match lcases with
                 | [] -> comp
                 | uu____4622::[] -> comp
                 | uu____4665 ->
                     let comp1 =
                       FStar_TypeChecker_Env.comp_to_comp_typ env comp  in
                     let md =
                       FStar_TypeChecker_Env.get_effect_decl env
                         comp1.FStar_Syntax_Syntax.effect_name
                        in
                     let uu____4684 = destruct_comp comp1  in
                     (match uu____4684 with
                      | (uu____4691,uu____4692,wp) ->
                          let wp1 =
                            let uu____4697 =
                              let uu____4702 =
                                FStar_TypeChecker_Env.inst_effect_fun_with
                                  [u_res_t] env md
                                  md.FStar_Syntax_Syntax.ite_wp
                                 in
                              let uu____4703 =
                                let uu____4704 =
                                  FStar_Syntax_Syntax.as_arg res_t  in
                                let uu____4713 =
                                  let uu____4724 =
                                    FStar_Syntax_Syntax.as_arg wp  in
                                  [uu____4724]  in
                                uu____4704 :: uu____4713  in
                              FStar_Syntax_Syntax.mk_Tm_app uu____4702
                                uu____4703
                               in
                            uu____4697 FStar_Pervasives_Native.None
                              wp.FStar_Syntax_Syntax.pos
                             in
                          mk_comp md u_res_t res_t wp1 bind_cases_flags))
               in
            FStar_Syntax_Syntax.mk_lcomp eff res_t bind_cases_flags
              bind_cases
  
let (check_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.comp ->
        FStar_Syntax_Syntax.comp ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun c'  ->
          let uu____4792 = FStar_TypeChecker_Rel.sub_comp env c c'  in
          match uu____4792 with
          | FStar_Pervasives_Native.None  ->
              if env.FStar_TypeChecker_Env.use_eq
              then
                let uu____4808 =
                  FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation_eq
                    env e c c'
                   in
                let uu____4814 = FStar_TypeChecker_Env.get_range env  in
                FStar_Errors.raise_error uu____4808 uu____4814
              else
                (let uu____4823 =
                   FStar_TypeChecker_Err.computed_computation_type_does_not_match_annotation
                     env e c c'
                    in
                 let uu____4829 = FStar_TypeChecker_Env.get_range env  in
                 FStar_Errors.raise_error uu____4823 uu____4829)
          | FStar_Pervasives_Native.Some g -> (e, c', g)
  
let (universe_of_comp :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe ->
      FStar_Syntax_Syntax.comp -> FStar_Syntax_Syntax.universe)
  =
  fun env  ->
    fun u_res  ->
      fun c  ->
        let c_lid =
          let uu____4854 =
            FStar_All.pipe_right c FStar_Syntax_Util.comp_effect_name  in
          FStar_All.pipe_right uu____4854
            (FStar_TypeChecker_Env.norm_eff_name env)
           in
        let uu____4857 = FStar_Syntax_Util.is_pure_or_ghost_effect c_lid  in
        if uu____4857
        then u_res
        else
          (let is_total =
             let uu____4864 =
               FStar_TypeChecker_Env.lookup_effect_quals env c_lid  in
             FStar_All.pipe_right uu____4864
               (FStar_List.existsb
                  (fun q  -> q = FStar_Syntax_Syntax.TotalEffect))
              in
           if Prims.op_Negation is_total
           then FStar_Syntax_Syntax.U_zero
           else
             (let uu____4875 = FStar_TypeChecker_Env.effect_repr env c u_res
                 in
              match uu____4875 with
              | FStar_Pervasives_Native.None  ->
                  let uu____4878 =
                    let uu____4884 =
                      let uu____4886 = FStar_Syntax_Print.lid_to_string c_lid
                         in
                      FStar_Util.format1
                        "Effect %s is marked total but does not have a repr"
                        uu____4886
                       in
                    (FStar_Errors.Fatal_EffectCannotBeReified, uu____4884)
                     in
                  FStar_Errors.raise_error uu____4878
                    c.FStar_Syntax_Syntax.pos
              | FStar_Pervasives_Native.Some tm ->
                  env.FStar_TypeChecker_Env.universe_of env tm))
  
let (maybe_coerce_bool_to_type :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp)
            FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          if env.FStar_TypeChecker_Env.is_pattern
          then (e, lc)
          else
            (let is_type1 t1 =
               let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
               let uu____4931 =
                 let uu____4932 = FStar_Syntax_Subst.compress t2  in
                 uu____4932.FStar_Syntax_Syntax.n  in
               match uu____4931 with
               | FStar_Syntax_Syntax.Tm_type uu____4936 -> true
               | uu____4938 -> false  in
             let uu____4940 =
               let uu____4941 =
                 FStar_Syntax_Util.unrefine lc.FStar_Syntax_Syntax.res_typ
                  in
               uu____4941.FStar_Syntax_Syntax.n  in
             match uu____4940 with
             | FStar_Syntax_Syntax.Tm_fvar fv when
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.bool_lid)
                   && (is_type1 t)
                 ->
                 let uu____4949 =
                   FStar_TypeChecker_Env.lookup_lid env
                     FStar_Parser_Const.b2t_lid
                    in
                 let b2t1 =
                   let uu____4959 =
                     FStar_Ident.set_lid_range FStar_Parser_Const.b2t_lid
                       e.FStar_Syntax_Syntax.pos
                      in
                   FStar_Syntax_Syntax.fvar uu____4959
                     (FStar_Syntax_Syntax.Delta_constant_at_level
                        (Prims.parse_int "1")) FStar_Pervasives_Native.None
                    in
                 let lc1 =
                   let uu____4962 =
                     let uu____4963 =
                       let uu____4964 =
                         FStar_Syntax_Syntax.mk_Total
                           FStar_Syntax_Util.ktype0
                          in
                       FStar_All.pipe_left FStar_Syntax_Util.lcomp_of_comp
                         uu____4964
                        in
                     (FStar_Pervasives_Native.None, uu____4963)  in
                   bind e.FStar_Syntax_Syntax.pos env
                     (FStar_Pervasives_Native.Some e) lc uu____4962
                    in
                 let e1 =
                   let uu____4970 =
                     let uu____4975 =
                       let uu____4976 = FStar_Syntax_Syntax.as_arg e  in
                       [uu____4976]  in
                     FStar_Syntax_Syntax.mk_Tm_app b2t1 uu____4975  in
                   uu____4970 FStar_Pervasives_Native.None
                     e.FStar_Syntax_Syntax.pos
                    in
                 (e1, lc1)
             | uu____5003 -> (e, lc))
  
let (weaken_result_typ :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.lcomp ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.lcomp,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun lc  ->
        fun t  ->
          (let uu____5038 =
             FStar_TypeChecker_Env.debug env FStar_Options.High  in
           if uu____5038
           then
             let uu____5041 = FStar_Syntax_Print.term_to_string e  in
             let uu____5043 = FStar_Syntax_Print.lcomp_to_string lc  in
             let uu____5045 = FStar_Syntax_Print.term_to_string t  in
             FStar_Util.print3 "weaken_result_typ e=(%s) lc=(%s) t=(%s)\n"
               uu____5041 uu____5043 uu____5045
           else ());
          (let use_eq =
             env.FStar_TypeChecker_Env.use_eq ||
               (let uu____5055 =
                  FStar_TypeChecker_Env.effect_decl_opt env
                    lc.FStar_Syntax_Syntax.eff_name
                   in
                match uu____5055 with
                | FStar_Pervasives_Native.Some (ed,qualifiers) ->
                    FStar_All.pipe_right qualifiers
                      (FStar_List.contains FStar_Syntax_Syntax.Reifiable)
                | uu____5080 -> false)
              in
           let gopt =
             if use_eq
             then
               let uu____5106 =
                 FStar_TypeChecker_Rel.try_teq true env
                   lc.FStar_Syntax_Syntax.res_typ t
                  in
               (uu____5106, false)
             else
               (let uu____5116 =
                  FStar_TypeChecker_Rel.get_subtyping_predicate env
                    lc.FStar_Syntax_Syntax.res_typ t
                   in
                (uu____5116, true))
              in
           match gopt with
           | (FStar_Pervasives_Native.None ,uu____5129) ->
               if env.FStar_TypeChecker_Env.failhard
               then
                 let uu____5141 =
                   FStar_TypeChecker_Err.basic_type_error env
                     (FStar_Pervasives_Native.Some e) t
                     lc.FStar_Syntax_Syntax.res_typ
                    in
                 FStar_Errors.raise_error uu____5141
                   e.FStar_Syntax_Syntax.pos
               else
                 (FStar_TypeChecker_Rel.subtype_fail env e
                    lc.FStar_Syntax_Syntax.res_typ t;
                  (e,
                    ((let uu___363_5157 = lc  in
                      {
                        FStar_Syntax_Syntax.eff_name =
                          (uu___363_5157.FStar_Syntax_Syntax.eff_name);
                        FStar_Syntax_Syntax.res_typ = t;
                        FStar_Syntax_Syntax.cflags =
                          (uu___363_5157.FStar_Syntax_Syntax.cflags);
                        FStar_Syntax_Syntax.comp_thunk =
                          (uu___363_5157.FStar_Syntax_Syntax.comp_thunk)
                      })), FStar_TypeChecker_Env.trivial_guard))
           | (FStar_Pervasives_Native.Some g,apply_guard1) ->
               let uu____5164 = FStar_TypeChecker_Env.guard_form g  in
               (match uu____5164 with
                | FStar_TypeChecker_Common.Trivial  ->
                    let strengthen_trivial uu____5176 =
                      let c = FStar_Syntax_Syntax.lcomp_comp lc  in
                      let res_t = FStar_Syntax_Util.comp_result c  in
                      let uu____5181 =
                        (let uu____5185 =
                           let uu____5186 =
                             FStar_All.pipe_right c
                               FStar_Syntax_Util.comp_effect_name
                              in
                           FStar_All.pipe_right uu____5186
                             (FStar_TypeChecker_Env.norm_eff_name env)
                            in
                         FStar_All.pipe_right uu____5185
                           FStar_Syntax_Util.is_pure_or_ghost_effect)
                          ||
                          (let uu____5191 = FStar_Syntax_Util.eq_tm t res_t
                              in
                           uu____5191 = FStar_Syntax_Util.Equal)
                         in
                      if uu____5181
                      then
                        ((let uu____5194 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env)
                              FStar_Options.Extreme
                             in
                          if uu____5194
                          then
                            let uu____5198 =
                              FStar_Syntax_Print.lid_to_string
                                (FStar_Syntax_Util.comp_effect_name c)
                               in
                            let uu____5200 =
                              FStar_Syntax_Print.term_to_string res_t  in
                            let uu____5202 =
                              FStar_Syntax_Print.term_to_string t  in
                            FStar_Util.print3
                              "weaken_result_type::strengthen_trivial: Not inserting the return since either the comp c:%s is pure/ghost or res_t:%s is same as t:%s\n"
                              uu____5198 uu____5200 uu____5202
                          else ());
                         FStar_Syntax_Util.set_result_typ c t)
                      else
                        (let x =
                           FStar_Syntax_Syntax.new_bv
                             (FStar_Pervasives_Native.Some
                                (res_t.FStar_Syntax_Syntax.pos)) res_t
                            in
                         let cret =
                           let uu____5211 = FStar_Syntax_Syntax.bv_to_name x
                              in
                           return_value env (comp_univ_opt c) res_t
                             uu____5211
                            in
                         let lc1 =
                           let uu____5213 = FStar_Syntax_Util.lcomp_of_comp c
                              in
                           let uu____5214 =
                             let uu____5215 =
                               FStar_Syntax_Util.lcomp_of_comp cret  in
                             ((FStar_Pervasives_Native.Some x), uu____5215)
                              in
                           bind e.FStar_Syntax_Syntax.pos env
                             (FStar_Pervasives_Native.Some e) uu____5213
                             uu____5214
                            in
                         (let uu____5219 =
                            FStar_All.pipe_left
                              (FStar_TypeChecker_Env.debug env)
                              FStar_Options.Extreme
                             in
                          if uu____5219
                          then
                            let uu____5223 =
                              FStar_Syntax_Print.term_to_string e  in
                            let uu____5225 =
                              FStar_Syntax_Print.comp_to_string c  in
                            let uu____5227 =
                              FStar_Syntax_Print.term_to_string t  in
                            let uu____5229 =
                              FStar_Syntax_Print.lcomp_to_string lc1  in
                            FStar_Util.print4
                              "weaken_result_type::strengthen_trivial: Inserting a return for e: %s, c: %s, t: %s, and then post return lc: %s\n"
                              uu____5223 uu____5225 uu____5227 uu____5229
                          else ());
                         (let uu____5234 = FStar_Syntax_Syntax.lcomp_comp lc1
                             in
                          FStar_Syntax_Util.set_result_typ uu____5234 t))
                       in
                    let lc1 =
                      FStar_Syntax_Syntax.mk_lcomp
                        lc.FStar_Syntax_Syntax.eff_name t
                        lc.FStar_Syntax_Syntax.cflags strengthen_trivial
                       in
                    (e, lc1, g)
                | FStar_TypeChecker_Common.NonTrivial f ->
                    let g1 =
                      let uu___364_5240 = g  in
                      {
                        FStar_TypeChecker_Env.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Env.deferred =
                          (uu___364_5240.FStar_TypeChecker_Env.deferred);
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___364_5240.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
                          (uu___364_5240.FStar_TypeChecker_Env.implicits)
                      }  in
                    let strengthen uu____5246 =
                      let uu____5247 =
                        env.FStar_TypeChecker_Env.lax &&
                          (FStar_Options.ml_ish ())
                         in
                      if uu____5247
                      then FStar_Syntax_Syntax.lcomp_comp lc
                      else
                        (let f1 =
                           FStar_TypeChecker_Normalize.normalize
                             [FStar_TypeChecker_Env.Beta;
                             FStar_TypeChecker_Env.Eager_unfolding;
                             FStar_TypeChecker_Env.Simplify;
                             FStar_TypeChecker_Env.Primops] env f
                            in
                         let uu____5253 =
                           let uu____5254 = FStar_Syntax_Subst.compress f1
                              in
                           uu____5254.FStar_Syntax_Syntax.n  in
                         match uu____5253 with
                         | FStar_Syntax_Syntax.Tm_abs
                             (uu____5257,{
                                           FStar_Syntax_Syntax.n =
                                             FStar_Syntax_Syntax.Tm_fvar fv;
                                           FStar_Syntax_Syntax.pos =
                                             uu____5259;
                                           FStar_Syntax_Syntax.vars =
                                             uu____5260;_},uu____5261)
                             when
                             FStar_Syntax_Syntax.fv_eq_lid fv
                               FStar_Parser_Const.true_lid
                             ->
                             let lc1 =
                               let uu___365_5287 = lc  in
                               {
                                 FStar_Syntax_Syntax.eff_name =
                                   (uu___365_5287.FStar_Syntax_Syntax.eff_name);
                                 FStar_Syntax_Syntax.res_typ = t;
                                 FStar_Syntax_Syntax.cflags =
                                   (uu___365_5287.FStar_Syntax_Syntax.cflags);
                                 FStar_Syntax_Syntax.comp_thunk =
                                   (uu___365_5287.FStar_Syntax_Syntax.comp_thunk)
                               }  in
                             FStar_Syntax_Syntax.lcomp_comp lc1
                         | uu____5288 ->
                             let c = FStar_Syntax_Syntax.lcomp_comp lc  in
                             ((let uu____5291 =
                                 FStar_All.pipe_left
                                   (FStar_TypeChecker_Env.debug env)
                                   FStar_Options.Extreme
                                  in
                               if uu____5291
                               then
                                 let uu____5295 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env lc.FStar_Syntax_Syntax.res_typ
                                    in
                                 let uu____5297 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env t
                                    in
                                 let uu____5299 =
                                   FStar_TypeChecker_Normalize.comp_to_string
                                     env c
                                    in
                                 let uu____5301 =
                                   FStar_TypeChecker_Normalize.term_to_string
                                     env f1
                                    in
                                 FStar_Util.print4
                                   "Weakened from %s to %s\nStrengthening %s with guard %s\n"
                                   uu____5295 uu____5297 uu____5299
                                   uu____5301
                               else ());
                              (let u_t_opt = comp_univ_opt c  in
                               let x =
                                 FStar_Syntax_Syntax.new_bv
                                   (FStar_Pervasives_Native.Some
                                      (t.FStar_Syntax_Syntax.pos)) t
                                  in
                               let xexp = FStar_Syntax_Syntax.bv_to_name x
                                  in
                               let cret = return_value env u_t_opt t xexp  in
                               let guard =
                                 if apply_guard1
                                 then
                                   let uu____5314 =
                                     let uu____5319 =
                                       let uu____5320 =
                                         FStar_Syntax_Syntax.as_arg xexp  in
                                       [uu____5320]  in
                                     FStar_Syntax_Syntax.mk_Tm_app f1
                                       uu____5319
                                      in
                                   uu____5314 FStar_Pervasives_Native.None
                                     f1.FStar_Syntax_Syntax.pos
                                 else f1  in
                               let uu____5349 =
                                 let uu____5354 =
                                   FStar_All.pipe_left
                                     (fun _0_1  ->
                                        FStar_Pervasives_Native.Some _0_1)
                                     (FStar_TypeChecker_Err.subtyping_failed
                                        env lc.FStar_Syntax_Syntax.res_typ t)
                                    in
                                 let uu____5375 =
                                   FStar_TypeChecker_Env.set_range env
                                     e.FStar_Syntax_Syntax.pos
                                    in
                                 let uu____5376 =
                                   FStar_Syntax_Util.lcomp_of_comp cret  in
                                 let uu____5377 =
                                   FStar_All.pipe_left
                                     FStar_TypeChecker_Env.guard_of_guard_formula
                                     (FStar_TypeChecker_Common.NonTrivial
                                        guard)
                                    in
                                 strengthen_precondition uu____5354
                                   uu____5375 e uu____5376 uu____5377
                                  in
                               match uu____5349 with
                               | (eq_ret,_trivial_so_ok_to_discard) ->
                                   let x1 =
                                     let uu___366_5381 = x  in
                                     {
                                       FStar_Syntax_Syntax.ppname =
                                         (uu___366_5381.FStar_Syntax_Syntax.ppname);
                                       FStar_Syntax_Syntax.index =
                                         (uu___366_5381.FStar_Syntax_Syntax.index);
                                       FStar_Syntax_Syntax.sort =
                                         (lc.FStar_Syntax_Syntax.res_typ)
                                     }  in
                                   let c1 =
                                     let uu____5383 =
                                       FStar_Syntax_Util.lcomp_of_comp c  in
                                     bind e.FStar_Syntax_Syntax.pos env
                                       (FStar_Pervasives_Native.Some e)
                                       uu____5383
                                       ((FStar_Pervasives_Native.Some x1),
                                         eq_ret)
                                      in
                                   let c2 = FStar_Syntax_Syntax.lcomp_comp c1
                                      in
                                   ((let uu____5388 =
                                       FStar_All.pipe_left
                                         (FStar_TypeChecker_Env.debug env)
                                         FStar_Options.Extreme
                                        in
                                     if uu____5388
                                     then
                                       let uu____5392 =
                                         FStar_TypeChecker_Normalize.comp_to_string
                                           env c2
                                          in
                                       FStar_Util.print1
                                         "Strengthened to %s\n" uu____5392
                                     else ());
                                    c2))))
                       in
                    let flags1 =
                      FStar_All.pipe_right lc.FStar_Syntax_Syntax.cflags
                        (FStar_List.collect
                           (fun uu___345_5405  ->
                              match uu___345_5405 with
                              | FStar_Syntax_Syntax.RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.PARTIAL_RETURN  ->
                                  [FStar_Syntax_Syntax.PARTIAL_RETURN]
                              | FStar_Syntax_Syntax.CPS  ->
                                  [FStar_Syntax_Syntax.CPS]
                              | uu____5408 -> []))
                       in
                    let lc1 =
                      let uu____5410 =
                        FStar_TypeChecker_Env.norm_eff_name env
                          lc.FStar_Syntax_Syntax.eff_name
                         in
                      FStar_Syntax_Syntax.mk_lcomp uu____5410 t flags1
                        strengthen
                       in
                    let g2 =
                      let uu___367_5412 = g1  in
                      {
                        FStar_TypeChecker_Env.guard_f =
                          FStar_TypeChecker_Common.Trivial;
                        FStar_TypeChecker_Env.deferred =
                          (uu___367_5412.FStar_TypeChecker_Env.deferred);
                        FStar_TypeChecker_Env.univ_ineqs =
                          (uu___367_5412.FStar_TypeChecker_Env.univ_ineqs);
                        FStar_TypeChecker_Env.implicits =
                          (uu___367_5412.FStar_TypeChecker_Env.implicits)
                      }  in
                    (e, lc1, g2)))
  
let (pure_or_ghost_pre_and_post :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.comp ->
      (FStar_Syntax_Syntax.typ FStar_Pervasives_Native.option,FStar_Syntax_Syntax.typ)
        FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun comp  ->
      let mk_post_type res_t ens =
        let x = FStar_Syntax_Syntax.new_bv FStar_Pervasives_Native.None res_t
           in
        let uu____5448 =
          let uu____5451 =
            let uu____5456 =
              let uu____5457 =
                let uu____5466 = FStar_Syntax_Syntax.bv_to_name x  in
                FStar_Syntax_Syntax.as_arg uu____5466  in
              [uu____5457]  in
            FStar_Syntax_Syntax.mk_Tm_app ens uu____5456  in
          uu____5451 FStar_Pervasives_Native.None
            res_t.FStar_Syntax_Syntax.pos
           in
        FStar_Syntax_Util.refine x uu____5448  in
      let norm1 t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses] env t
         in
      let uu____5491 = FStar_Syntax_Util.is_tot_or_gtot_comp comp  in
      if uu____5491
      then
        (FStar_Pervasives_Native.None, (FStar_Syntax_Util.comp_result comp))
      else
        (match comp.FStar_Syntax_Syntax.n with
         | FStar_Syntax_Syntax.GTotal uu____5510 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Total uu____5526 -> failwith "Impossible"
         | FStar_Syntax_Syntax.Comp ct ->
             let uu____5543 =
               (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                  FStar_Parser_Const.effect_Pure_lid)
                 ||
                 (FStar_Ident.lid_equals ct.FStar_Syntax_Syntax.effect_name
                    FStar_Parser_Const.effect_Ghost_lid)
                in
             if uu____5543
             then
               (match ct.FStar_Syntax_Syntax.effect_args with
                | (req,uu____5559)::(ens,uu____5561)::uu____5562 ->
                    let uu____5605 =
                      let uu____5608 = norm1 req  in
                      FStar_Pervasives_Native.Some uu____5608  in
                    let uu____5609 =
                      let uu____5610 =
                        mk_post_type ct.FStar_Syntax_Syntax.result_typ ens
                         in
                      FStar_All.pipe_left norm1 uu____5610  in
                    (uu____5605, uu____5609)
                | uu____5613 ->
                    let uu____5624 =
                      let uu____5630 =
                        let uu____5632 =
                          FStar_Syntax_Print.comp_to_string comp  in
                        FStar_Util.format1
                          "Effect constructor is not fully applied; got %s"
                          uu____5632
                         in
                      (FStar_Errors.Fatal_EffectConstructorNotFullyApplied,
                        uu____5630)
                       in
                    FStar_Errors.raise_error uu____5624
                      comp.FStar_Syntax_Syntax.pos)
             else
               (let ct1 = FStar_TypeChecker_Env.unfold_effect_abbrev env comp
                   in
                match ct1.FStar_Syntax_Syntax.effect_args with
                | (wp,uu____5652)::uu____5653 ->
                    let uu____5680 =
                      let uu____5685 =
                        FStar_TypeChecker_Env.lookup_lid env
                          FStar_Parser_Const.as_requires
                         in
                      FStar_All.pipe_left FStar_Pervasives_Native.fst
                        uu____5685
                       in
                    (match uu____5680 with
                     | (us_r,uu____5717) ->
                         let uu____5718 =
                           let uu____5723 =
                             FStar_TypeChecker_Env.lookup_lid env
                               FStar_Parser_Const.as_ensures
                              in
                           FStar_All.pipe_left FStar_Pervasives_Native.fst
                             uu____5723
                            in
                         (match uu____5718 with
                          | (us_e,uu____5755) ->
                              let r =
                                (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let as_req =
                                let uu____5758 =
                                  let uu____5759 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_requires r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____5759
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____5758
                                  us_r
                                 in
                              let as_ens =
                                let uu____5761 =
                                  let uu____5762 =
                                    FStar_Ident.set_lid_range
                                      FStar_Parser_Const.as_ensures r
                                     in
                                  FStar_Syntax_Syntax.fvar uu____5762
                                    FStar_Syntax_Syntax.delta_equational
                                    FStar_Pervasives_Native.None
                                   in
                                FStar_Syntax_Syntax.mk_Tm_uinst uu____5761
                                  us_e
                                 in
                              let req =
                                let uu____5766 =
                                  let uu____5771 =
                                    let uu____5772 =
                                      let uu____5783 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____5783]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____5772
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_req
                                    uu____5771
                                   in
                                uu____5766 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let ens =
                                let uu____5825 =
                                  let uu____5830 =
                                    let uu____5831 =
                                      let uu____5842 =
                                        FStar_Syntax_Syntax.as_arg wp  in
                                      [uu____5842]  in
                                    ((ct1.FStar_Syntax_Syntax.result_typ),
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag))
                                      :: uu____5831
                                     in
                                  FStar_Syntax_Syntax.mk_Tm_app as_ens
                                    uu____5830
                                   in
                                uu____5825 FStar_Pervasives_Native.None
                                  (ct1.FStar_Syntax_Syntax.result_typ).FStar_Syntax_Syntax.pos
                                 in
                              let uu____5881 =
                                let uu____5884 = norm1 req  in
                                FStar_Pervasives_Native.Some uu____5884  in
                              let uu____5885 =
                                let uu____5886 =
                                  mk_post_type
                                    ct1.FStar_Syntax_Syntax.result_typ ens
                                   in
                                norm1 uu____5886  in
                              (uu____5881, uu____5885)))
                | uu____5889 -> failwith "Impossible"))
  
let (reify_body :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun t  ->
      let tm = FStar_Syntax_Util.mk_reify t  in
      let tm' =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.Reify;
          FStar_TypeChecker_Env.Eager_unfolding;
          FStar_TypeChecker_Env.EraseUniverses;
          FStar_TypeChecker_Env.AllowUnboundUniverses] env tm
         in
      (let uu____5923 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "SMTEncodingReify")
          in
       if uu____5923
       then
         let uu____5928 = FStar_Syntax_Print.term_to_string tm  in
         let uu____5930 = FStar_Syntax_Print.term_to_string tm'  in
         FStar_Util.print2 "Reified body %s \nto %s\n" uu____5928 uu____5930
       else ());
      tm'
  
let (reify_body_with_arg :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.arg -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun head1  ->
      fun arg  ->
        let tm =
          FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_app (head1, [arg]))
            FStar_Pervasives_Native.None head1.FStar_Syntax_Syntax.pos
           in
        let tm' =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.Reify;
            FStar_TypeChecker_Env.Eager_unfolding;
            FStar_TypeChecker_Env.EraseUniverses;
            FStar_TypeChecker_Env.AllowUnboundUniverses] env tm
           in
        (let uu____5984 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "SMTEncodingReify")
            in
         if uu____5984
         then
           let uu____5989 = FStar_Syntax_Print.term_to_string tm  in
           let uu____5991 = FStar_Syntax_Print.term_to_string tm'  in
           FStar_Util.print2 "Reified body %s \nto %s\n" uu____5989
             uu____5991
         else ());
        tm'
  
let (remove_reify : FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.term) =
  fun t  ->
    let uu____6002 =
      let uu____6004 =
        let uu____6005 = FStar_Syntax_Subst.compress t  in
        uu____6005.FStar_Syntax_Syntax.n  in
      match uu____6004 with
      | FStar_Syntax_Syntax.Tm_app uu____6009 -> false
      | uu____6027 -> true  in
    if uu____6002
    then t
    else
      (let uu____6032 = FStar_Syntax_Util.head_and_args t  in
       match uu____6032 with
       | (head1,args) ->
           let uu____6075 =
             let uu____6077 =
               let uu____6078 = FStar_Syntax_Subst.compress head1  in
               uu____6078.FStar_Syntax_Syntax.n  in
             match uu____6077 with
             | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_reify ) ->
                 true
             | uu____6083 -> false  in
           if uu____6075
           then
             (match args with
              | x::[] -> FStar_Pervasives_Native.fst x
              | uu____6115 ->
                  failwith
                    "Impossible : Reify applied to multiple arguments after normalization.")
           else t)
  
let (maybe_instantiate :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        (FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.typ,FStar_TypeChecker_Env.guard_t)
          FStar_Pervasives_Native.tuple3)
  =
  fun env  ->
    fun e  ->
      fun t  ->
        let torig = FStar_Syntax_Subst.compress t  in
        if Prims.op_Negation env.FStar_TypeChecker_Env.instantiate_imp
        then (e, torig, FStar_TypeChecker_Env.trivial_guard)
        else
          ((let uu____6162 =
              FStar_TypeChecker_Env.debug env FStar_Options.High  in
            if uu____6162
            then
              let uu____6165 = FStar_Syntax_Print.term_to_string e  in
              let uu____6167 = FStar_Syntax_Print.term_to_string t  in
              let uu____6169 =
                let uu____6171 = FStar_TypeChecker_Env.expected_typ env  in
                FStar_Common.string_of_option
                  FStar_Syntax_Print.term_to_string uu____6171
                 in
              FStar_Util.print3
                "maybe_instantiate: starting check for (%s) of type (%s), expected type is %s\n"
                uu____6165 uu____6167 uu____6169
            else ());
           (let number_of_implicits t1 =
              let t2 = FStar_TypeChecker_Normalize.unfold_whnf env t1  in
              let uu____6184 = FStar_Syntax_Util.arrow_formals t2  in
              match uu____6184 with
              | (formals,uu____6200) ->
                  let n_implicits =
                    let uu____6222 =
                      FStar_All.pipe_right formals
                        (FStar_Util.prefix_until
                           (fun uu____6300  ->
                              match uu____6300 with
                              | (uu____6308,imp) ->
                                  (FStar_Option.isNone imp) ||
                                    (let uu____6315 =
                                       FStar_Syntax_Util.eq_aqual imp
                                         (FStar_Pervasives_Native.Some
                                            FStar_Syntax_Syntax.Equality)
                                        in
                                     uu____6315 = FStar_Syntax_Util.Equal)))
                       in
                    match uu____6222 with
                    | FStar_Pervasives_Native.None  ->
                        FStar_List.length formals
                    | FStar_Pervasives_Native.Some
                        (implicits,_first_explicit,_rest) ->
                        FStar_List.length implicits
                     in
                  n_implicits
               in
            let inst_n_binders t1 =
              let uu____6442 = FStar_TypeChecker_Env.expected_typ env  in
              match uu____6442 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some expected_t ->
                  let n_expected = number_of_implicits expected_t  in
                  let n_available = number_of_implicits t1  in
                  if n_available < n_expected
                  then
                    let uu____6470 =
                      let uu____6476 =
                        let uu____6478 = FStar_Util.string_of_int n_expected
                           in
                        let uu____6486 = FStar_Syntax_Print.term_to_string e
                           in
                        let uu____6488 = FStar_Util.string_of_int n_available
                           in
                        FStar_Util.format3
                          "Expected a term with %s implicit arguments, but %s has only %s"
                          uu____6478 uu____6486 uu____6488
                         in
                      (FStar_Errors.Fatal_MissingImplicitArguments,
                        uu____6476)
                       in
                    let uu____6498 = FStar_TypeChecker_Env.get_range env  in
                    FStar_Errors.raise_error uu____6470 uu____6498
                  else
                    FStar_Pervasives_Native.Some (n_available - n_expected)
               in
            let decr_inst uu___346_6526 =
              match uu___346_6526 with
              | FStar_Pervasives_Native.None  -> FStar_Pervasives_Native.None
              | FStar_Pervasives_Native.Some i ->
                  FStar_Pervasives_Native.Some (i - (Prims.parse_int "1"))
               in
            let t1 = FStar_TypeChecker_Normalize.unfold_whnf env t  in
            match t1.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_arrow (bs,c) ->
                let uu____6569 = FStar_Syntax_Subst.open_comp bs c  in
                (match uu____6569 with
                 | (bs1,c1) ->
                     let rec aux subst1 inst_n bs2 =
                       match (inst_n, bs2) with
                       | (FStar_Pervasives_Native.Some _0_2,uu____6687) when
                           _0_2 = (Prims.parse_int "0") ->
                           ([], bs2, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                       | (uu____6732,(x,FStar_Pervasives_Native.Some
                                      (FStar_Syntax_Syntax.Implicit
                                      uu____6734))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____6768 =
                             new_implicit_var
                               "Instantiation of implicit argument"
                               e.FStar_Syntax_Syntax.pos env t2
                              in
                           (match uu____6768 with
                            | (v1,uu____6809,g) ->
                                ((let uu____6824 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____6824
                                  then
                                    let uu____6827 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating implicit with %s\n"
                                      uu____6827
                                  else ());
                                 (let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____6837 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____6837 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____6930 =
                                        FStar_TypeChecker_Env.conj_guard g g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____6930))))
                       | (uu____6957,(x,FStar_Pervasives_Native.Some
                                      (FStar_Syntax_Syntax.Meta tau))::rest)
                           ->
                           let t2 =
                             FStar_Syntax_Subst.subst subst1
                               x.FStar_Syntax_Syntax.sort
                              in
                           let uu____6994 =
                             new_implicit_var
                               "Instantiation of meta argument"
                               e.FStar_Syntax_Syntax.pos env t2
                              in
                           (match uu____6994 with
                            | (v1,uu____7035,g) ->
                                ((let uu____7050 =
                                    FStar_TypeChecker_Env.debug env
                                      FStar_Options.High
                                     in
                                  if uu____7050
                                  then
                                    let uu____7053 =
                                      FStar_Syntax_Print.term_to_string v1
                                       in
                                    FStar_Util.print1
                                      "maybe_instantiate: Instantiating meta argument with %s\n"
                                      uu____7053
                                  else ());
                                 (let mark_meta_implicits tau1 g1 =
                                    let uu___368_7069 = g1  in
                                    let uu____7070 =
                                      FStar_List.map
                                        (fun imp  ->
                                           let uu___369_7076 = imp  in
                                           {
                                             FStar_TypeChecker_Env.imp_reason
                                               =
                                               (uu___369_7076.FStar_TypeChecker_Env.imp_reason);
                                             FStar_TypeChecker_Env.imp_uvar =
                                               (uu___369_7076.FStar_TypeChecker_Env.imp_uvar);
                                             FStar_TypeChecker_Env.imp_tm =
                                               (uu___369_7076.FStar_TypeChecker_Env.imp_tm);
                                             FStar_TypeChecker_Env.imp_range
                                               =
                                               (uu___369_7076.FStar_TypeChecker_Env.imp_range);
                                             FStar_TypeChecker_Env.imp_meta =
                                               (FStar_Pervasives_Native.Some
                                                  (env, tau1))
                                           })
                                        g1.FStar_TypeChecker_Env.implicits
                                       in
                                    {
                                      FStar_TypeChecker_Env.guard_f =
                                        (uu___368_7069.FStar_TypeChecker_Env.guard_f);
                                      FStar_TypeChecker_Env.deferred =
                                        (uu___368_7069.FStar_TypeChecker_Env.deferred);
                                      FStar_TypeChecker_Env.univ_ineqs =
                                        (uu___368_7069.FStar_TypeChecker_Env.univ_ineqs);
                                      FStar_TypeChecker_Env.implicits =
                                        uu____7070
                                    }  in
                                  let g1 = mark_meta_implicits tau g  in
                                  let subst2 =
                                    (FStar_Syntax_Syntax.NT (x, v1)) ::
                                    subst1  in
                                  let uu____7087 =
                                    aux subst2 (decr_inst inst_n) rest  in
                                  match uu____7087 with
                                  | (args,bs3,subst3,g') ->
                                      let uu____7180 =
                                        FStar_TypeChecker_Env.conj_guard g1
                                          g'
                                         in
                                      (((v1,
                                          (FStar_Pervasives_Native.Some
                                             FStar_Syntax_Syntax.imp_tag)) ::
                                        args), bs3, subst3, uu____7180))))
                       | (uu____7207,bs3) ->
                           ([], bs3, subst1,
                             FStar_TypeChecker_Env.trivial_guard)
                        in
                     let uu____7255 =
                       let uu____7282 = inst_n_binders t1  in
                       aux [] uu____7282 bs1  in
                     (match uu____7255 with
                      | (args,bs2,subst1,guard) ->
                          (match (args, bs2) with
                           | ([],uu____7354) -> (e, torig, guard)
                           | (uu____7385,[]) when
                               let uu____7416 =
                                 FStar_Syntax_Util.is_total_comp c1  in
                               Prims.op_Negation uu____7416 ->
                               (e, torig,
                                 FStar_TypeChecker_Env.trivial_guard)
                           | uu____7418 ->
                               let t2 =
                                 match bs2 with
                                 | [] -> FStar_Syntax_Util.comp_result c1
                                 | uu____7446 ->
                                     FStar_Syntax_Util.arrow bs2 c1
                                  in
                               let t3 = FStar_Syntax_Subst.subst subst1 t2
                                  in
                               let e1 =
                                 FStar_Syntax_Syntax.mk_Tm_app e args
                                   FStar_Pervasives_Native.None
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               (e1, t3, guard))))
            | uu____7459 -> (e, torig, FStar_TypeChecker_Env.trivial_guard)))
  
let (string_of_univs :
  FStar_Syntax_Syntax.universe_uvar FStar_Util.set -> Prims.string) =
  fun univs1  ->
    let uu____7471 =
      let uu____7475 = FStar_Util.set_elements univs1  in
      FStar_All.pipe_right uu____7475
        (FStar_List.map
           (fun u  ->
              let uu____7487 = FStar_Syntax_Unionfind.univ_uvar_id u  in
              FStar_All.pipe_right uu____7487 FStar_Util.string_of_int))
       in
    FStar_All.pipe_right uu____7471 (FStar_String.concat ", ")
  
let (gen_univs :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.universe_uvar FStar_Util.set ->
      FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun x  ->
      let uu____7515 = FStar_Util.set_is_empty x  in
      if uu____7515
      then []
      else
        (let s =
           let uu____7533 =
             let uu____7536 = FStar_TypeChecker_Env.univ_vars env  in
             FStar_Util.set_difference x uu____7536  in
           FStar_All.pipe_right uu____7533 FStar_Util.set_elements  in
         (let uu____7552 =
            FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
              (FStar_Options.Other "Gen")
             in
          if uu____7552
          then
            let uu____7557 =
              let uu____7559 = FStar_TypeChecker_Env.univ_vars env  in
              string_of_univs uu____7559  in
            FStar_Util.print1 "univ_vars in env: %s\n" uu____7557
          else ());
         (let r =
            let uu____7568 = FStar_TypeChecker_Env.get_range env  in
            FStar_Pervasives_Native.Some uu____7568  in
          let u_names =
            FStar_All.pipe_right s
              (FStar_List.map
                 (fun u  ->
                    let u_name = FStar_Syntax_Syntax.new_univ_name r  in
                    (let uu____7607 =
                       FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                         (FStar_Options.Other "Gen")
                        in
                     if uu____7607
                     then
                       let uu____7612 =
                         let uu____7614 =
                           FStar_Syntax_Unionfind.univ_uvar_id u  in
                         FStar_All.pipe_left FStar_Util.string_of_int
                           uu____7614
                          in
                       let uu____7618 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_unif u)
                          in
                       let uu____7620 =
                         FStar_Syntax_Print.univ_to_string
                           (FStar_Syntax_Syntax.U_name u_name)
                          in
                       FStar_Util.print3 "Setting ?%s (%s) to %s\n"
                         uu____7612 uu____7618 uu____7620
                     else ());
                    FStar_Syntax_Unionfind.univ_change u
                      (FStar_Syntax_Syntax.U_name u_name);
                    u_name))
             in
          u_names))
  
let (gather_free_univnames :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun env  ->
    fun t  ->
      let ctx_univnames = FStar_TypeChecker_Env.univnames env  in
      let tm_univnames = FStar_Syntax_Free.univnames t  in
      let univnames1 =
        let uu____7650 = FStar_Util.set_difference tm_univnames ctx_univnames
           in
        FStar_All.pipe_right uu____7650 FStar_Util.set_elements  in
      univnames1
  
let (check_universe_generalization :
  FStar_Syntax_Syntax.univ_name Prims.list ->
    FStar_Syntax_Syntax.univ_name Prims.list ->
      FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.univ_name Prims.list)
  =
  fun explicit_univ_names  ->
    fun generalized_univ_names  ->
      fun t  ->
        match (explicit_univ_names, generalized_univ_names) with
        | ([],uu____7689) -> generalized_univ_names
        | (uu____7696,[]) -> explicit_univ_names
        | uu____7703 ->
            let uu____7712 =
              let uu____7718 =
                let uu____7720 = FStar_Syntax_Print.term_to_string t  in
                Prims.strcat
                  "Generalized universe in a term containing explicit universe annotation : "
                  uu____7720
                 in
              (FStar_Errors.Fatal_UnexpectedGeneralizedUniverse, uu____7718)
               in
            FStar_Errors.raise_error uu____7712 t.FStar_Syntax_Syntax.pos
  
let (generalize_universes :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term -> FStar_Syntax_Syntax.tscheme)
  =
  fun env  ->
    fun t0  ->
      let t =
        FStar_TypeChecker_Normalize.normalize
          [FStar_TypeChecker_Env.NoFullNorm;
          FStar_TypeChecker_Env.Beta;
          FStar_TypeChecker_Env.DoNotUnfoldPureLets] env t0
         in
      let univnames1 = gather_free_univnames env t  in
      (let uu____7742 =
         FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
           (FStar_Options.Other "Gen")
          in
       if uu____7742
       then
         let uu____7747 = FStar_Syntax_Print.term_to_string t  in
         let uu____7749 = FStar_Syntax_Print.univ_names_to_string univnames1
            in
         FStar_Util.print2
           "generalizing universes in the term (post norm): %s with univnames: %s\n"
           uu____7747 uu____7749
       else ());
      (let univs1 = FStar_Syntax_Free.univs t  in
       (let uu____7758 =
          FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
            (FStar_Options.Other "Gen")
           in
        if uu____7758
        then
          let uu____7763 = string_of_univs univs1  in
          FStar_Util.print1 "univs to gen : %s\n" uu____7763
        else ());
       (let gen1 = gen_univs env univs1  in
        (let uu____7772 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Gen")
            in
         if uu____7772
         then
           let uu____7777 = FStar_Syntax_Print.term_to_string t  in
           let uu____7779 = FStar_Syntax_Print.univ_names_to_string gen1  in
           FStar_Util.print2 "After generalization, t: %s and univs: %s\n"
             uu____7777 uu____7779
         else ());
        (let univs2 = check_universe_generalization univnames1 gen1 t0  in
         let t1 = FStar_TypeChecker_Normalize.reduce_uvar_solutions env t  in
         let ts = FStar_Syntax_Subst.close_univ_vars univs2 t1  in
         (univs2, ts))))
  
let (gen :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp)
        FStar_Pervasives_Native.tuple3 Prims.list ->
        (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.univ_name Prims.list,
          FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp,FStar_Syntax_Syntax.binder
                                                              Prims.list)
          FStar_Pervasives_Native.tuple5 Prims.list
          FStar_Pervasives_Native.option)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        let uu____7863 =
          let uu____7865 =
            FStar_Util.for_all
              (fun uu____7879  ->
                 match uu____7879 with
                 | (uu____7889,uu____7890,c) ->
                     FStar_Syntax_Util.is_pure_or_ghost_comp c) lecs
             in
          FStar_All.pipe_left Prims.op_Negation uu____7865  in
        if uu____7863
        then FStar_Pervasives_Native.None
        else
          (let norm1 c =
             (let uu____7942 =
                FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
              if uu____7942
              then
                let uu____7945 = FStar_Syntax_Print.comp_to_string c  in
                FStar_Util.print1 "Normalizing before generalizing:\n\t %s\n"
                  uu____7945
              else ());
             (let c1 =
                FStar_TypeChecker_Normalize.normalize_comp
                  [FStar_TypeChecker_Env.Beta;
                  FStar_TypeChecker_Env.Exclude FStar_TypeChecker_Env.Zeta;
                  FStar_TypeChecker_Env.NoFullNorm;
                  FStar_TypeChecker_Env.DoNotUnfoldPureLets] env c
                 in
              (let uu____7952 =
                 FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
               if uu____7952
               then
                 let uu____7955 = FStar_Syntax_Print.comp_to_string c1  in
                 FStar_Util.print1 "Normalized to:\n\t %s\n" uu____7955
               else ());
              c1)
              in
           let env_uvars = FStar_TypeChecker_Env.uvars_in_env env  in
           let gen_uvars uvs =
             let uu____7973 = FStar_Util.set_difference uvs env_uvars  in
             FStar_All.pipe_right uu____7973 FStar_Util.set_elements  in
           let univs_and_uvars_of_lec uu____8007 =
             match uu____8007 with
             | (lbname,e,c) ->
                 let c1 = norm1 c  in
                 let t = FStar_Syntax_Util.comp_result c1  in
                 let univs1 = FStar_Syntax_Free.univs t  in
                 let uvt = FStar_Syntax_Free.uvars t  in
                 ((let uu____8044 =
                     FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                       (FStar_Options.Other "Gen")
                      in
                   if uu____8044
                   then
                     let uu____8049 =
                       let uu____8051 =
                         let uu____8055 = FStar_Util.set_elements univs1  in
                         FStar_All.pipe_right uu____8055
                           (FStar_List.map
                              (fun u  ->
                                 FStar_Syntax_Print.univ_to_string
                                   (FStar_Syntax_Syntax.U_unif u)))
                          in
                       FStar_All.pipe_right uu____8051
                         (FStar_String.concat ", ")
                        in
                     let uu____8103 =
                       let uu____8105 =
                         let uu____8109 = FStar_Util.set_elements uvt  in
                         FStar_All.pipe_right uu____8109
                           (FStar_List.map
                              (fun u  ->
                                 let uu____8122 =
                                   FStar_Syntax_Print.uvar_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                    in
                                 let uu____8124 =
                                   FStar_Syntax_Print.term_to_string
                                     u.FStar_Syntax_Syntax.ctx_uvar_typ
                                    in
                                 FStar_Util.format2 "(%s : %s)" uu____8122
                                   uu____8124))
                          in
                       FStar_All.pipe_right uu____8105
                         (FStar_String.concat ", ")
                        in
                     FStar_Util.print2
                       "^^^^\n\tFree univs = %s\n\tFree uvt=%s\n" uu____8049
                       uu____8103
                   else ());
                  (let univs2 =
                     let uu____8138 = FStar_Util.set_elements uvt  in
                     FStar_List.fold_left
                       (fun univs2  ->
                          fun uv  ->
                            let uu____8150 =
                              FStar_Syntax_Free.univs
                                uv.FStar_Syntax_Syntax.ctx_uvar_typ
                               in
                            FStar_Util.set_union univs2 uu____8150) univs1
                       uu____8138
                      in
                   let uvs = gen_uvars uvt  in
                   (let uu____8157 =
                      FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                        (FStar_Options.Other "Gen")
                       in
                    if uu____8157
                    then
                      let uu____8162 =
                        let uu____8164 =
                          let uu____8168 = FStar_Util.set_elements univs2  in
                          FStar_All.pipe_right uu____8168
                            (FStar_List.map
                               (fun u  ->
                                  FStar_Syntax_Print.univ_to_string
                                    (FStar_Syntax_Syntax.U_unif u)))
                           in
                        FStar_All.pipe_right uu____8164
                          (FStar_String.concat ", ")
                         in
                      let uu____8216 =
                        let uu____8218 =
                          FStar_All.pipe_right uvs
                            (FStar_List.map
                               (fun u  ->
                                  let uu____8232 =
                                    FStar_Syntax_Print.uvar_to_string
                                      u.FStar_Syntax_Syntax.ctx_uvar_head
                                     in
                                  let uu____8234 =
                                    FStar_TypeChecker_Normalize.term_to_string
                                      env u.FStar_Syntax_Syntax.ctx_uvar_typ
                                     in
                                  FStar_Util.format2 "(%s : %s)" uu____8232
                                    uu____8234))
                           in
                        FStar_All.pipe_right uu____8218
                          (FStar_String.concat ", ")
                         in
                      FStar_Util.print2
                        "^^^^\n\tFree univs = %s\n\tgen_uvars =%s" uu____8162
                        uu____8216
                    else ());
                   (univs2, uvs, (lbname, e, c1))))
              in
           let uu____8255 =
             let uu____8272 = FStar_List.hd lecs  in
             univs_and_uvars_of_lec uu____8272  in
           match uu____8255 with
           | (univs1,uvs,lec_hd) ->
               let force_univs_eq lec2 u1 u2 =
                 let uu____8362 =
                   (FStar_Util.set_is_subset_of u1 u2) &&
                     (FStar_Util.set_is_subset_of u2 u1)
                    in
                 if uu____8362
                 then ()
                 else
                   (let uu____8367 = lec_hd  in
                    match uu____8367 with
                    | (lb1,uu____8375,uu____8376) ->
                        let uu____8377 = lec2  in
                        (match uu____8377 with
                         | (lb2,uu____8385,uu____8386) ->
                             let msg =
                               let uu____8389 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____8391 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible set of universes for %s and %s"
                                 uu____8389 uu____8391
                                in
                             let uu____8394 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleSetOfUniverse,
                                 msg) uu____8394))
                  in
               let force_uvars_eq lec2 u1 u2 =
                 let uvars_subseteq u11 u21 =
                   FStar_All.pipe_right u11
                     (FStar_Util.for_all
                        (fun u  ->
                           FStar_All.pipe_right u21
                             (FStar_Util.for_some
                                (fun u'  ->
                                   FStar_Syntax_Unionfind.equiv
                                     u.FStar_Syntax_Syntax.ctx_uvar_head
                                     u'.FStar_Syntax_Syntax.ctx_uvar_head))))
                    in
                 let uu____8462 =
                   (uvars_subseteq u1 u2) && (uvars_subseteq u2 u1)  in
                 if uu____8462
                 then ()
                 else
                   (let uu____8467 = lec_hd  in
                    match uu____8467 with
                    | (lb1,uu____8475,uu____8476) ->
                        let uu____8477 = lec2  in
                        (match uu____8477 with
                         | (lb2,uu____8485,uu____8486) ->
                             let msg =
                               let uu____8489 =
                                 FStar_Syntax_Print.lbname_to_string lb1  in
                               let uu____8491 =
                                 FStar_Syntax_Print.lbname_to_string lb2  in
                               FStar_Util.format2
                                 "Generalizing the types of these mutually recursive definitions requires an incompatible number of types for %s and %s"
                                 uu____8489 uu____8491
                                in
                             let uu____8494 =
                               FStar_TypeChecker_Env.get_range env  in
                             FStar_Errors.raise_error
                               (FStar_Errors.Fatal_IncompatibleNumberOfTypes,
                                 msg) uu____8494))
                  in
               let lecs1 =
                 let uu____8505 = FStar_List.tl lecs  in
                 FStar_List.fold_right
                   (fun this_lec  ->
                      fun lecs1  ->
                        let uu____8558 = univs_and_uvars_of_lec this_lec  in
                        match uu____8558 with
                        | (this_univs,this_uvs,this_lec1) ->
                            (force_univs_eq this_lec1 univs1 this_univs;
                             force_uvars_eq this_lec1 uvs this_uvs;
                             this_lec1
                             ::
                             lecs1)) uu____8505 []
                  in
               let lecs2 = lec_hd :: lecs1  in
               let gen_types uvs1 =
                 let fail1 k =
                   let uu____8659 = lec_hd  in
                   match uu____8659 with
                   | (lbname,e,c) ->
                       let uu____8669 =
                         let uu____8675 =
                           let uu____8677 =
                             FStar_Syntax_Print.term_to_string k  in
                           let uu____8679 =
                             FStar_Syntax_Print.lbname_to_string lbname  in
                           let uu____8681 =
                             FStar_Syntax_Print.term_to_string
                               (FStar_Syntax_Util.comp_result c)
                              in
                           FStar_Util.format3
                             "Failed to resolve implicit argument of type '%s' in the type of %s (%s)"
                             uu____8677 uu____8679 uu____8681
                            in
                         (FStar_Errors.Fatal_FailToResolveImplicitArgument,
                           uu____8675)
                          in
                       let uu____8685 = FStar_TypeChecker_Env.get_range env
                          in
                       FStar_Errors.raise_error uu____8669 uu____8685
                    in
                 FStar_All.pipe_right uvs1
                   (FStar_List.map
                      (fun u  ->
                         let uu____8706 =
                           FStar_Syntax_Unionfind.find
                             u.FStar_Syntax_Syntax.ctx_uvar_head
                            in
                         match uu____8706 with
                         | FStar_Pervasives_Native.Some uu____8715 ->
                             failwith
                               "Unexpected instantiation of mutually recursive uvar"
                         | uu____8723 ->
                             let k =
                               FStar_TypeChecker_Normalize.normalize
                                 [FStar_TypeChecker_Env.Beta;
                                 FStar_TypeChecker_Env.Exclude
                                   FStar_TypeChecker_Env.Zeta] env
                                 u.FStar_Syntax_Syntax.ctx_uvar_typ
                                in
                             let uu____8727 =
                               FStar_Syntax_Util.arrow_formals k  in
                             (match uu____8727 with
                              | (bs,kres) ->
                                  ((let uu____8771 =
                                      let uu____8772 =
                                        let uu____8775 =
                                          FStar_TypeChecker_Normalize.unfold_whnf
                                            env kres
                                           in
                                        FStar_Syntax_Util.unrefine uu____8775
                                         in
                                      uu____8772.FStar_Syntax_Syntax.n  in
                                    match uu____8771 with
                                    | FStar_Syntax_Syntax.Tm_type uu____8776
                                        ->
                                        let free =
                                          FStar_Syntax_Free.names kres  in
                                        let uu____8780 =
                                          let uu____8782 =
                                            FStar_Util.set_is_empty free  in
                                          Prims.op_Negation uu____8782  in
                                        if uu____8780 then fail1 kres else ()
                                    | uu____8787 -> fail1 kres);
                                   (let a =
                                      let uu____8789 =
                                        let uu____8792 =
                                          FStar_TypeChecker_Env.get_range env
                                           in
                                        FStar_All.pipe_left
                                          (fun _0_3  ->
                                             FStar_Pervasives_Native.Some
                                               _0_3) uu____8792
                                         in
                                      FStar_Syntax_Syntax.new_bv uu____8789
                                        kres
                                       in
                                    let t =
                                      match bs with
                                      | [] ->
                                          FStar_Syntax_Syntax.bv_to_name a
                                      | uu____8802 ->
                                          let uu____8811 =
                                            FStar_Syntax_Syntax.bv_to_name a
                                             in
                                          FStar_Syntax_Util.abs bs uu____8811
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_tot
                                                  kres))
                                       in
                                    FStar_Syntax_Util.set_uvar
                                      u.FStar_Syntax_Syntax.ctx_uvar_head t;
                                    (a,
                                      (FStar_Pervasives_Native.Some
                                         FStar_Syntax_Syntax.imp_tag)))))))
                  in
               let gen_univs1 = gen_univs env univs1  in
               let gen_tvars = gen_types uvs  in
               let ecs =
                 FStar_All.pipe_right lecs2
                   (FStar_List.map
                      (fun uu____8918  ->
                         match uu____8918 with
                         | (lbname,e,c) ->
                             let uu____8966 =
                               match (gen_tvars, gen_univs1) with
                               | ([],[]) -> (e, c, [])
                               | uu____9041 ->
                                   let uu____9056 = (e, c)  in
                                   (match uu____9056 with
                                    | (e0,c0) ->
                                        let c1 =
                                          FStar_TypeChecker_Normalize.normalize_comp
                                            [FStar_TypeChecker_Env.Beta;
                                            FStar_TypeChecker_Env.DoNotUnfoldPureLets;
                                            FStar_TypeChecker_Env.CompressUvars;
                                            FStar_TypeChecker_Env.NoFullNorm;
                                            FStar_TypeChecker_Env.Exclude
                                              FStar_TypeChecker_Env.Zeta] env
                                            c
                                           in
                                        let e1 =
                                          FStar_TypeChecker_Normalize.reduce_uvar_solutions
                                            env e
                                           in
                                        let e2 =
                                          if is_rec
                                          then
                                            let tvar_args =
                                              FStar_List.map
                                                (fun uu____9100  ->
                                                   match uu____9100 with
                                                   | (x,uu____9108) ->
                                                       let uu____9113 =
                                                         FStar_Syntax_Syntax.bv_to_name
                                                           x
                                                          in
                                                       FStar_Syntax_Syntax.iarg
                                                         uu____9113)
                                                gen_tvars
                                               in
                                            let instantiate_lbname_with_app
                                              tm fv =
                                              let uu____9131 =
                                                let uu____9133 =
                                                  FStar_Util.right lbname  in
                                                FStar_Syntax_Syntax.fv_eq fv
                                                  uu____9133
                                                 in
                                              if uu____9131
                                              then
                                                FStar_Syntax_Syntax.mk_Tm_app
                                                  tm tvar_args
                                                  FStar_Pervasives_Native.None
                                                  tm.FStar_Syntax_Syntax.pos
                                              else tm  in
                                            FStar_Syntax_InstFV.inst
                                              instantiate_lbname_with_app e1
                                          else e1  in
                                        let t =
                                          let uu____9142 =
                                            let uu____9143 =
                                              FStar_Syntax_Subst.compress
                                                (FStar_Syntax_Util.comp_result
                                                   c1)
                                               in
                                            uu____9143.FStar_Syntax_Syntax.n
                                             in
                                          match uu____9142 with
                                          | FStar_Syntax_Syntax.Tm_arrow
                                              (bs,cod) ->
                                              let uu____9168 =
                                                FStar_Syntax_Subst.open_comp
                                                  bs cod
                                                 in
                                              (match uu____9168 with
                                               | (bs1,cod1) ->
                                                   FStar_Syntax_Util.arrow
                                                     (FStar_List.append
                                                        gen_tvars bs1) cod1)
                                          | uu____9181 ->
                                              FStar_Syntax_Util.arrow
                                                gen_tvars c1
                                           in
                                        let e' =
                                          FStar_Syntax_Util.abs gen_tvars e2
                                            (FStar_Pervasives_Native.Some
                                               (FStar_Syntax_Util.residual_comp_of_comp
                                                  c1))
                                           in
                                        let uu____9185 =
                                          FStar_Syntax_Syntax.mk_Total t  in
                                        (e', uu____9185, gen_tvars))
                                in
                             (match uu____8966 with
                              | (e1,c1,gvs) ->
                                  (lbname, gen_univs1, e1, c1, gvs))))
                  in
               FStar_Pervasives_Native.Some ecs)
  
let (generalize :
  FStar_TypeChecker_Env.env ->
    Prims.bool ->
      (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.term,FStar_Syntax_Syntax.comp)
        FStar_Pervasives_Native.tuple3 Prims.list ->
        (FStar_Syntax_Syntax.lbname,FStar_Syntax_Syntax.univ_names,FStar_Syntax_Syntax.term,
          FStar_Syntax_Syntax.comp,FStar_Syntax_Syntax.binder Prims.list)
          FStar_Pervasives_Native.tuple5 Prims.list)
  =
  fun env  ->
    fun is_rec  ->
      fun lecs  ->
        (let uu____9342 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____9342
         then
           let uu____9345 =
             let uu____9347 =
               FStar_List.map
                 (fun uu____9362  ->
                    match uu____9362 with
                    | (lb,uu____9371,uu____9372) ->
                        FStar_Syntax_Print.lbname_to_string lb) lecs
                in
             FStar_All.pipe_right uu____9347 (FStar_String.concat ", ")  in
           FStar_Util.print1 "Generalizing: %s\n" uu____9345
         else ());
        (let univnames_lecs =
           FStar_List.map
             (fun uu____9398  ->
                match uu____9398 with
                | (l,t,c) -> gather_free_univnames env t) lecs
            in
         let generalized_lecs =
           let uu____9427 = gen env is_rec lecs  in
           match uu____9427 with
           | FStar_Pervasives_Native.None  ->
               FStar_All.pipe_right lecs
                 (FStar_List.map
                    (fun uu____9526  ->
                       match uu____9526 with | (l,t,c) -> (l, [], t, c, [])))
           | FStar_Pervasives_Native.Some luecs ->
               ((let uu____9588 =
                   FStar_TypeChecker_Env.debug env FStar_Options.Medium  in
                 if uu____9588
                 then
                   FStar_All.pipe_right luecs
                     (FStar_List.iter
                        (fun uu____9636  ->
                           match uu____9636 with
                           | (l,us,e,c,gvs) ->
                               let uu____9670 =
                                 FStar_Range.string_of_range
                                   e.FStar_Syntax_Syntax.pos
                                  in
                               let uu____9672 =
                                 FStar_Syntax_Print.lbname_to_string l  in
                               let uu____9674 =
                                 FStar_Syntax_Print.term_to_string
                                   (FStar_Syntax_Util.comp_result c)
                                  in
                               let uu____9676 =
                                 FStar_Syntax_Print.term_to_string e  in
                               let uu____9678 =
                                 FStar_Syntax_Print.binders_to_string ", "
                                   gvs
                                  in
                               FStar_Util.print5
                                 "(%s) Generalized %s at type %s\n%s\nVars = (%s)\n"
                                 uu____9670 uu____9672 uu____9674 uu____9676
                                 uu____9678))
                 else ());
                luecs)
            in
         FStar_List.map2
           (fun univnames1  ->
              fun uu____9723  ->
                match uu____9723 with
                | (l,generalized_univs,t,c,gvs) ->
                    let uu____9767 =
                      check_universe_generalization univnames1
                        generalized_univs t
                       in
                    (l, uu____9767, t, c, gvs)) univnames_lecs
           generalized_lecs)
  
let (check_and_ascribe :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Syntax_Syntax.typ ->
        FStar_Syntax_Syntax.typ ->
          (FStar_Syntax_Syntax.term,FStar_TypeChecker_Env.guard_t)
            FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun e  ->
      fun t1  ->
        fun t2  ->
          let env1 =
            FStar_TypeChecker_Env.set_range env e.FStar_Syntax_Syntax.pos  in
          let check1 env2 t11 t21 =
            if env2.FStar_TypeChecker_Env.use_eq
            then FStar_TypeChecker_Rel.try_teq true env2 t11 t21
            else
              (let uu____9828 =
                 FStar_TypeChecker_Rel.get_subtyping_predicate env2 t11 t21
                  in
               match uu____9828 with
               | FStar_Pervasives_Native.None  ->
                   FStar_Pervasives_Native.None
               | FStar_Pervasives_Native.Some f ->
                   let uu____9834 = FStar_TypeChecker_Env.apply_guard f e  in
                   FStar_All.pipe_left
                     (fun _0_4  -> FStar_Pervasives_Native.Some _0_4)
                     uu____9834)
             in
          let is_var e1 =
            let uu____9844 =
              let uu____9845 = FStar_Syntax_Subst.compress e1  in
              uu____9845.FStar_Syntax_Syntax.n  in
            match uu____9844 with
            | FStar_Syntax_Syntax.Tm_name uu____9849 -> true
            | uu____9851 -> false  in
          let decorate e1 t =
            let e2 = FStar_Syntax_Subst.compress e1  in
            match e2.FStar_Syntax_Syntax.n with
            | FStar_Syntax_Syntax.Tm_name x ->
                FStar_Syntax_Syntax.mk
                  (FStar_Syntax_Syntax.Tm_name
                     (let uu___370_9872 = x  in
                      {
                        FStar_Syntax_Syntax.ppname =
                          (uu___370_9872.FStar_Syntax_Syntax.ppname);
                        FStar_Syntax_Syntax.index =
                          (uu___370_9872.FStar_Syntax_Syntax.index);
                        FStar_Syntax_Syntax.sort = t2
                      })) FStar_Pervasives_Native.None
                  e2.FStar_Syntax_Syntax.pos
            | uu____9873 -> e2  in
          let env2 =
            let uu___371_9875 = env1  in
            let uu____9876 =
              env1.FStar_TypeChecker_Env.use_eq ||
                (env1.FStar_TypeChecker_Env.is_pattern && (is_var e))
               in
            {
              FStar_TypeChecker_Env.solver =
                (uu___371_9875.FStar_TypeChecker_Env.solver);
              FStar_TypeChecker_Env.range =
                (uu___371_9875.FStar_TypeChecker_Env.range);
              FStar_TypeChecker_Env.curmodule =
                (uu___371_9875.FStar_TypeChecker_Env.curmodule);
              FStar_TypeChecker_Env.gamma =
                (uu___371_9875.FStar_TypeChecker_Env.gamma);
              FStar_TypeChecker_Env.gamma_sig =
                (uu___371_9875.FStar_TypeChecker_Env.gamma_sig);
              FStar_TypeChecker_Env.gamma_cache =
                (uu___371_9875.FStar_TypeChecker_Env.gamma_cache);
              FStar_TypeChecker_Env.modules =
                (uu___371_9875.FStar_TypeChecker_Env.modules);
              FStar_TypeChecker_Env.expected_typ =
                (uu___371_9875.FStar_TypeChecker_Env.expected_typ);
              FStar_TypeChecker_Env.sigtab =
                (uu___371_9875.FStar_TypeChecker_Env.sigtab);
              FStar_TypeChecker_Env.attrtab =
                (uu___371_9875.FStar_TypeChecker_Env.attrtab);
              FStar_TypeChecker_Env.is_pattern =
                (uu___371_9875.FStar_TypeChecker_Env.is_pattern);
              FStar_TypeChecker_Env.instantiate_imp =
                (uu___371_9875.FStar_TypeChecker_Env.instantiate_imp);
              FStar_TypeChecker_Env.effects =
                (uu___371_9875.FStar_TypeChecker_Env.effects);
              FStar_TypeChecker_Env.generalize =
                (uu___371_9875.FStar_TypeChecker_Env.generalize);
              FStar_TypeChecker_Env.letrecs =
                (uu___371_9875.FStar_TypeChecker_Env.letrecs);
              FStar_TypeChecker_Env.top_level =
                (uu___371_9875.FStar_TypeChecker_Env.top_level);
              FStar_TypeChecker_Env.check_uvars =
                (uu___371_9875.FStar_TypeChecker_Env.check_uvars);
              FStar_TypeChecker_Env.use_eq = uu____9876;
              FStar_TypeChecker_Env.is_iface =
                (uu___371_9875.FStar_TypeChecker_Env.is_iface);
              FStar_TypeChecker_Env.admit =
                (uu___371_9875.FStar_TypeChecker_Env.admit);
              FStar_TypeChecker_Env.lax =
                (uu___371_9875.FStar_TypeChecker_Env.lax);
              FStar_TypeChecker_Env.lax_universes =
                (uu___371_9875.FStar_TypeChecker_Env.lax_universes);
              FStar_TypeChecker_Env.phase1 =
                (uu___371_9875.FStar_TypeChecker_Env.phase1);
              FStar_TypeChecker_Env.failhard =
                (uu___371_9875.FStar_TypeChecker_Env.failhard);
              FStar_TypeChecker_Env.nosynth =
                (uu___371_9875.FStar_TypeChecker_Env.nosynth);
              FStar_TypeChecker_Env.uvar_subtyping =
                (uu___371_9875.FStar_TypeChecker_Env.uvar_subtyping);
              FStar_TypeChecker_Env.tc_term =
                (uu___371_9875.FStar_TypeChecker_Env.tc_term);
              FStar_TypeChecker_Env.type_of =
                (uu___371_9875.FStar_TypeChecker_Env.type_of);
              FStar_TypeChecker_Env.universe_of =
                (uu___371_9875.FStar_TypeChecker_Env.universe_of);
              FStar_TypeChecker_Env.check_type_of =
                (uu___371_9875.FStar_TypeChecker_Env.check_type_of);
              FStar_TypeChecker_Env.use_bv_sorts =
                (uu___371_9875.FStar_TypeChecker_Env.use_bv_sorts);
              FStar_TypeChecker_Env.qtbl_name_and_index =
                (uu___371_9875.FStar_TypeChecker_Env.qtbl_name_and_index);
              FStar_TypeChecker_Env.normalized_eff_names =
                (uu___371_9875.FStar_TypeChecker_Env.normalized_eff_names);
              FStar_TypeChecker_Env.fv_delta_depths =
                (uu___371_9875.FStar_TypeChecker_Env.fv_delta_depths);
              FStar_TypeChecker_Env.proof_ns =
                (uu___371_9875.FStar_TypeChecker_Env.proof_ns);
              FStar_TypeChecker_Env.synth_hook =
                (uu___371_9875.FStar_TypeChecker_Env.synth_hook);
              FStar_TypeChecker_Env.splice =
                (uu___371_9875.FStar_TypeChecker_Env.splice);
              FStar_TypeChecker_Env.postprocess =
                (uu___371_9875.FStar_TypeChecker_Env.postprocess);
              FStar_TypeChecker_Env.is_native_tactic =
                (uu___371_9875.FStar_TypeChecker_Env.is_native_tactic);
              FStar_TypeChecker_Env.identifier_info =
                (uu___371_9875.FStar_TypeChecker_Env.identifier_info);
              FStar_TypeChecker_Env.tc_hooks =
                (uu___371_9875.FStar_TypeChecker_Env.tc_hooks);
              FStar_TypeChecker_Env.dsenv =
                (uu___371_9875.FStar_TypeChecker_Env.dsenv);
              FStar_TypeChecker_Env.nbe =
                (uu___371_9875.FStar_TypeChecker_Env.nbe)
            }  in
          let uu____9878 = check1 env2 t1 t2  in
          match uu____9878 with
          | FStar_Pervasives_Native.None  ->
              let uu____9885 =
                FStar_TypeChecker_Err.expected_expression_of_type env2 t2 e
                  t1
                 in
              let uu____9891 = FStar_TypeChecker_Env.get_range env2  in
              FStar_Errors.raise_error uu____9885 uu____9891
          | FStar_Pervasives_Native.Some g ->
              ((let uu____9898 =
                  FStar_All.pipe_left (FStar_TypeChecker_Env.debug env2)
                    (FStar_Options.Other "Rel")
                   in
                if uu____9898
                then
                  let uu____9903 =
                    FStar_TypeChecker_Rel.guard_to_string env2 g  in
                  FStar_All.pipe_left
                    (FStar_Util.print1 "Applied guard is %s\n") uu____9903
                else ());
               (let uu____9909 = decorate e t2  in (uu____9909, g)))
  
let (check_top_level :
  FStar_TypeChecker_Env.env ->
    FStar_TypeChecker_Env.guard_t ->
      FStar_Syntax_Syntax.lcomp ->
        (Prims.bool,FStar_Syntax_Syntax.comp) FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun g  ->
      fun lc  ->
        (let uu____9937 = FStar_TypeChecker_Env.debug env FStar_Options.Low
            in
         if uu____9937
         then
           let uu____9940 = FStar_Syntax_Print.lcomp_to_string lc  in
           FStar_Util.print1 "check_top_level, lc = %s\n" uu____9940
         else ());
        (let discharge g1 =
           FStar_TypeChecker_Rel.force_trivial_guard env g1;
           FStar_Syntax_Util.is_pure_lcomp lc  in
         let g1 = FStar_TypeChecker_Rel.solve_deferred_constraints env g  in
         let uu____9954 = FStar_Syntax_Util.is_total_lcomp lc  in
         if uu____9954
         then
           let uu____9962 = discharge g1  in
           let uu____9964 = FStar_Syntax_Syntax.lcomp_comp lc  in
           (uu____9962, uu____9964)
         else
           (let c = FStar_Syntax_Syntax.lcomp_comp lc  in
            let steps =
              [FStar_TypeChecker_Env.Beta;
              FStar_TypeChecker_Env.NoFullNorm;
              FStar_TypeChecker_Env.DoNotUnfoldPureLets]  in
            let c1 =
              let uu____9973 =
                let uu____9974 =
                  let uu____9975 =
                    FStar_TypeChecker_Env.unfold_effect_abbrev env c  in
                  FStar_All.pipe_right uu____9975 FStar_Syntax_Syntax.mk_Comp
                   in
                FStar_All.pipe_right uu____9974
                  (FStar_TypeChecker_Normalize.normalize_comp steps env)
                 in
              FStar_All.pipe_right uu____9973
                (FStar_TypeChecker_Env.comp_to_comp_typ env)
               in
            let md =
              FStar_TypeChecker_Env.get_effect_decl env
                c1.FStar_Syntax_Syntax.effect_name
               in
            let uu____9977 = destruct_comp c1  in
            match uu____9977 with
            | (u_t,t,wp) ->
                let vc =
                  let uu____9995 = FStar_TypeChecker_Env.get_range env  in
                  let uu____9996 =
                    let uu____10001 =
                      FStar_TypeChecker_Env.inst_effect_fun_with [u_t] env md
                        md.FStar_Syntax_Syntax.trivial
                       in
                    let uu____10002 =
                      let uu____10003 = FStar_Syntax_Syntax.as_arg t  in
                      let uu____10012 =
                        let uu____10023 = FStar_Syntax_Syntax.as_arg wp  in
                        [uu____10023]  in
                      uu____10003 :: uu____10012  in
                    FStar_Syntax_Syntax.mk_Tm_app uu____10001 uu____10002  in
                  uu____9996 FStar_Pervasives_Native.None uu____9995  in
                ((let uu____10059 =
                    FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
                      (FStar_Options.Other "Simplification")
                     in
                  if uu____10059
                  then
                    let uu____10064 = FStar_Syntax_Print.term_to_string vc
                       in
                    FStar_Util.print1 "top-level VC: %s\n" uu____10064
                  else ());
                 (let g2 =
                    let uu____10070 =
                      FStar_All.pipe_left
                        FStar_TypeChecker_Env.guard_of_guard_formula
                        (FStar_TypeChecker_Common.NonTrivial vc)
                       in
                    FStar_TypeChecker_Env.conj_guard g1 uu____10070  in
                  let uu____10071 = discharge g2  in
                  let uu____10073 = FStar_Syntax_Syntax.mk_Comp c1  in
                  (uu____10071, uu____10073)))))
  
let (short_circuit :
  FStar_Syntax_Syntax.term ->
    FStar_Syntax_Syntax.args -> FStar_TypeChecker_Common.guard_formula)
  =
  fun head1  ->
    fun seen_args  ->
      let short_bin_op f uu___347_10107 =
        match uu___347_10107 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (fst1,uu____10117)::[] -> f fst1
        | uu____10142 -> failwith "Unexpexted args to binary operator"  in
      let op_and_e e =
        let uu____10154 = FStar_Syntax_Util.b2t e  in
        FStar_All.pipe_right uu____10154
          (fun _0_5  -> FStar_TypeChecker_Common.NonTrivial _0_5)
         in
      let op_or_e e =
        let uu____10165 =
          let uu____10166 = FStar_Syntax_Util.b2t e  in
          FStar_Syntax_Util.mk_neg uu____10166  in
        FStar_All.pipe_right uu____10165
          (fun _0_6  -> FStar_TypeChecker_Common.NonTrivial _0_6)
         in
      let op_and_t t =
        FStar_All.pipe_right t
          (fun _0_7  -> FStar_TypeChecker_Common.NonTrivial _0_7)
         in
      let op_or_t t =
        let uu____10185 = FStar_All.pipe_right t FStar_Syntax_Util.mk_neg  in
        FStar_All.pipe_right uu____10185
          (fun _0_8  -> FStar_TypeChecker_Common.NonTrivial _0_8)
         in
      let op_imp_t t =
        FStar_All.pipe_right t
          (fun _0_9  -> FStar_TypeChecker_Common.NonTrivial _0_9)
         in
      let short_op_ite uu___348_10199 =
        match uu___348_10199 with
        | [] -> FStar_TypeChecker_Common.Trivial
        | (guard,uu____10209)::[] ->
            FStar_TypeChecker_Common.NonTrivial guard
        | _then::(guard,uu____10236)::[] ->
            let uu____10277 = FStar_Syntax_Util.mk_neg guard  in
            FStar_All.pipe_right uu____10277
              (fun _0_10  -> FStar_TypeChecker_Common.NonTrivial _0_10)
        | uu____10278 -> failwith "Unexpected args to ITE"  in
      let table =
        let uu____10290 =
          let uu____10298 = short_bin_op op_and_e  in
          (FStar_Parser_Const.op_And, uu____10298)  in
        let uu____10306 =
          let uu____10316 =
            let uu____10324 = short_bin_op op_or_e  in
            (FStar_Parser_Const.op_Or, uu____10324)  in
          let uu____10332 =
            let uu____10342 =
              let uu____10350 = short_bin_op op_and_t  in
              (FStar_Parser_Const.and_lid, uu____10350)  in
            let uu____10358 =
              let uu____10368 =
                let uu____10376 = short_bin_op op_or_t  in
                (FStar_Parser_Const.or_lid, uu____10376)  in
              let uu____10384 =
                let uu____10394 =
                  let uu____10402 = short_bin_op op_imp_t  in
                  (FStar_Parser_Const.imp_lid, uu____10402)  in
                [uu____10394; (FStar_Parser_Const.ite_lid, short_op_ite)]  in
              uu____10368 :: uu____10384  in
            uu____10342 :: uu____10358  in
          uu____10316 :: uu____10332  in
        uu____10290 :: uu____10306  in
      match head1.FStar_Syntax_Syntax.n with
      | FStar_Syntax_Syntax.Tm_fvar fv ->
          let lid = (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
             in
          let uu____10464 =
            FStar_Util.find_map table
              (fun uu____10479  ->
                 match uu____10479 with
                 | (x,mk1) ->
                     let uu____10496 = FStar_Ident.lid_equals x lid  in
                     if uu____10496
                     then
                       let uu____10501 = mk1 seen_args  in
                       FStar_Pervasives_Native.Some uu____10501
                     else FStar_Pervasives_Native.None)
             in
          (match uu____10464 with
           | FStar_Pervasives_Native.None  ->
               FStar_TypeChecker_Common.Trivial
           | FStar_Pervasives_Native.Some g -> g)
      | uu____10505 -> FStar_TypeChecker_Common.Trivial
  
let (short_circuit_head : FStar_Syntax_Syntax.term -> Prims.bool) =
  fun l  ->
    let uu____10513 =
      let uu____10514 = FStar_Syntax_Util.un_uinst l  in
      uu____10514.FStar_Syntax_Syntax.n  in
    match uu____10513 with
    | FStar_Syntax_Syntax.Tm_fvar fv ->
        FStar_Util.for_some (FStar_Syntax_Syntax.fv_eq_lid fv)
          [FStar_Parser_Const.op_And;
          FStar_Parser_Const.op_Or;
          FStar_Parser_Const.and_lid;
          FStar_Parser_Const.or_lid;
          FStar_Parser_Const.imp_lid;
          FStar_Parser_Const.ite_lid]
    | uu____10519 -> false
  
let (maybe_add_implicit_binders :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.binders -> FStar_Syntax_Syntax.binders)
  =
  fun env  ->
    fun bs  ->
      let pos bs1 =
        match bs1 with
        | (hd1,uu____10555)::uu____10556 ->
            FStar_Syntax_Syntax.range_of_bv hd1
        | uu____10575 -> FStar_TypeChecker_Env.get_range env  in
      match bs with
      | (uu____10584,FStar_Pervasives_Native.Some
         (FStar_Syntax_Syntax.Implicit uu____10585))::uu____10586 -> bs
      | uu____10604 ->
          let uu____10605 = FStar_TypeChecker_Env.expected_typ env  in
          (match uu____10605 with
           | FStar_Pervasives_Native.None  -> bs
           | FStar_Pervasives_Native.Some t ->
               let uu____10609 =
                 let uu____10610 = FStar_Syntax_Subst.compress t  in
                 uu____10610.FStar_Syntax_Syntax.n  in
               (match uu____10609 with
                | FStar_Syntax_Syntax.Tm_arrow (bs',uu____10614) ->
                    let uu____10635 =
                      FStar_Util.prefix_until
                        (fun uu___349_10675  ->
                           match uu___349_10675 with
                           | (uu____10683,FStar_Pervasives_Native.Some
                              (FStar_Syntax_Syntax.Implicit uu____10684)) ->
                               false
                           | uu____10689 -> true) bs'
                       in
                    (match uu____10635 with
                     | FStar_Pervasives_Native.None  -> bs
                     | FStar_Pervasives_Native.Some
                         ([],uu____10725,uu____10726) -> bs
                     | FStar_Pervasives_Native.Some
                         (imps,uu____10798,uu____10799) ->
                         let uu____10872 =
                           FStar_All.pipe_right imps
                             (FStar_Util.for_all
                                (fun uu____10892  ->
                                   match uu____10892 with
                                   | (x,uu____10901) ->
                                       FStar_Util.starts_with
                                         (x.FStar_Syntax_Syntax.ppname).FStar_Ident.idText
                                         "'"))
                            in
                         if uu____10872
                         then
                           let r = pos bs  in
                           let imps1 =
                             FStar_All.pipe_right imps
                               (FStar_List.map
                                  (fun uu____10950  ->
                                     match uu____10950 with
                                     | (x,i) ->
                                         let uu____10969 =
                                           FStar_Syntax_Syntax.set_range_of_bv
                                             x r
                                            in
                                         (uu____10969, i)))
                              in
                           FStar_List.append imps1 bs
                         else bs)
                | uu____10980 -> bs))
  
let (maybe_lift :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Ident.lident ->
          FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c1  ->
        fun c2  ->
          fun t  ->
            let m1 = FStar_TypeChecker_Env.norm_eff_name env c1  in
            let m2 = FStar_TypeChecker_Env.norm_eff_name env c2  in
            let uu____11009 =
              ((FStar_Ident.lid_equals m1 m2) ||
                 ((FStar_Syntax_Util.is_pure_effect c1) &&
                    (FStar_Syntax_Util.is_ghost_effect c2)))
                ||
                ((FStar_Syntax_Util.is_pure_effect c2) &&
                   (FStar_Syntax_Util.is_ghost_effect c1))
               in
            if uu____11009
            then e
            else
              FStar_Syntax_Syntax.mk
                (FStar_Syntax_Syntax.Tm_meta
                   (e, (FStar_Syntax_Syntax.Meta_monadic_lift (m1, m2, t))))
                FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (maybe_monadic :
  FStar_TypeChecker_Env.env ->
    FStar_Syntax_Syntax.term ->
      FStar_Ident.lident ->
        FStar_Syntax_Syntax.typ -> FStar_Syntax_Syntax.term)
  =
  fun env  ->
    fun e  ->
      fun c  ->
        fun t  ->
          let m = FStar_TypeChecker_Env.norm_eff_name env c  in
          let uu____11040 =
            ((is_pure_or_ghost_effect env m) ||
               (FStar_Ident.lid_equals m FStar_Parser_Const.effect_Tot_lid))
              ||
              (FStar_Ident.lid_equals m FStar_Parser_Const.effect_GTot_lid)
             in
          if uu____11040
          then e
          else
            FStar_Syntax_Syntax.mk
              (FStar_Syntax_Syntax.Tm_meta
                 (e, (FStar_Syntax_Syntax.Meta_monadic (m, t))))
              FStar_Pervasives_Native.None e.FStar_Syntax_Syntax.pos
  
let (d : Prims.string -> unit) =
  fun s  -> FStar_Util.print1 "\027[01;36m%s\027[00m\n" s 
let (mk_toplevel_definition :
  FStar_TypeChecker_Env.env ->
    FStar_Ident.lident ->
      FStar_Syntax_Syntax.term ->
        (FStar_Syntax_Syntax.sigelt,FStar_Syntax_Syntax.term)
          FStar_Pervasives_Native.tuple2)
  =
  fun env  ->
    fun lident  ->
      fun def  ->
        (let uu____11083 =
           FStar_TypeChecker_Env.debug env (FStar_Options.Other "ED")  in
         if uu____11083
         then
           ((let uu____11088 = FStar_Ident.text_of_lid lident  in
             d uu____11088);
            (let uu____11090 = FStar_Ident.text_of_lid lident  in
             let uu____11092 = FStar_Syntax_Print.term_to_string def  in
             FStar_Util.print2 "Registering top-level definition: %s\n%s\n"
               uu____11090 uu____11092))
         else ());
        (let fv =
           let uu____11098 = FStar_Syntax_Util.incr_delta_qualifier def  in
           FStar_Syntax_Syntax.lid_as_fv lident uu____11098
             FStar_Pervasives_Native.None
            in
         let lbname = FStar_Util.Inr fv  in
         let lb =
           (false,
             [FStar_Syntax_Util.mk_letbinding lbname []
                FStar_Syntax_Syntax.tun FStar_Parser_Const.effect_Tot_lid def
                [] FStar_Range.dummyRange])
            in
         let sig_ctx =
           FStar_Syntax_Syntax.mk_sigelt
             (FStar_Syntax_Syntax.Sig_let (lb, [lident]))
            in
         let uu____11110 =
           FStar_Syntax_Syntax.mk (FStar_Syntax_Syntax.Tm_fvar fv)
             FStar_Pervasives_Native.None FStar_Range.dummyRange
            in
         ((let uu___372_11112 = sig_ctx  in
           {
             FStar_Syntax_Syntax.sigel =
               (uu___372_11112.FStar_Syntax_Syntax.sigel);
             FStar_Syntax_Syntax.sigrng =
               (uu___372_11112.FStar_Syntax_Syntax.sigrng);
             FStar_Syntax_Syntax.sigquals =
               [FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen];
             FStar_Syntax_Syntax.sigmeta =
               (uu___372_11112.FStar_Syntax_Syntax.sigmeta);
             FStar_Syntax_Syntax.sigattrs =
               (uu___372_11112.FStar_Syntax_Syntax.sigattrs)
           }), uu____11110))
  
let (check_sigelt_quals :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.sigelt -> unit) =
  fun env  ->
    fun se  ->
      let visibility uu___350_11130 =
        match uu___350_11130 with
        | FStar_Syntax_Syntax.Private  -> true
        | uu____11133 -> false  in
      let reducibility uu___351_11141 =
        match uu___351_11141 with
        | FStar_Syntax_Syntax.Abstract  -> true
        | FStar_Syntax_Syntax.Irreducible  -> true
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  -> true
        | FStar_Syntax_Syntax.Visible_default  -> true
        | FStar_Syntax_Syntax.Inline_for_extraction  -> true
        | uu____11148 -> false  in
      let assumption uu___352_11156 =
        match uu___352_11156 with
        | FStar_Syntax_Syntax.Assumption  -> true
        | FStar_Syntax_Syntax.New  -> true
        | uu____11160 -> false  in
      let reification uu___353_11168 =
        match uu___353_11168 with
        | FStar_Syntax_Syntax.Reifiable  -> true
        | FStar_Syntax_Syntax.Reflectable uu____11171 -> true
        | uu____11173 -> false  in
      let inferred uu___354_11181 =
        match uu___354_11181 with
        | FStar_Syntax_Syntax.Discriminator uu____11183 -> true
        | FStar_Syntax_Syntax.Projector uu____11185 -> true
        | FStar_Syntax_Syntax.RecordType uu____11191 -> true
        | FStar_Syntax_Syntax.RecordConstructor uu____11201 -> true
        | FStar_Syntax_Syntax.ExceptionConstructor  -> true
        | FStar_Syntax_Syntax.HasMaskedEffect  -> true
        | FStar_Syntax_Syntax.Effect  -> true
        | uu____11214 -> false  in
      let has_eq uu___355_11222 =
        match uu___355_11222 with
        | FStar_Syntax_Syntax.Noeq  -> true
        | FStar_Syntax_Syntax.Unopteq  -> true
        | uu____11226 -> false  in
      let quals_combo_ok quals q =
        match q with
        | FStar_Syntax_Syntax.Assumption  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                          (inferred x))
                         || (visibility x))
                        || (assumption x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Inline_for_extraction)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.New  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (assumption x)))
        | FStar_Syntax_Syntax.Inline_for_extraction  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (visibility x))
                           || (reducibility x))
                          || (reification x))
                         || (inferred x))
                        || (has_eq x))
                       ||
                       (env.FStar_TypeChecker_Env.is_iface &&
                          (x = FStar_Syntax_Syntax.Assumption)))
                      || (x = FStar_Syntax_Syntax.NoExtract)))
        | FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Visible_default  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Irreducible  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Abstract  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Noeq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.Unopteq  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((((((x = q) || (x = FStar_Syntax_Syntax.Logic)) ||
                            (x = FStar_Syntax_Syntax.Abstract))
                           || (x = FStar_Syntax_Syntax.Inline_for_extraction))
                          || (x = FStar_Syntax_Syntax.NoExtract))
                         || (has_eq x))
                        || (inferred x))
                       || (visibility x))
                      || (reification x)))
        | FStar_Syntax_Syntax.TotalEffect  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    (((x = q) || (inferred x)) || (visibility x)) ||
                      (reification x)))
        | FStar_Syntax_Syntax.Logic  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((x = q) || (x = FStar_Syntax_Syntax.Assumption)) ||
                        (inferred x))
                       || (visibility x))
                      || (reducibility x)))
        | FStar_Syntax_Syntax.Reifiable  ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Reflectable uu____11305 ->
            FStar_All.pipe_right quals
              (FStar_List.for_all
                 (fun x  ->
                    ((((reification x) || (inferred x)) || (visibility x)) ||
                       (x = FStar_Syntax_Syntax.TotalEffect))
                      || (x = FStar_Syntax_Syntax.Visible_default)))
        | FStar_Syntax_Syntax.Private  -> true
        | uu____11312 -> true  in
      let quals =
        FStar_All.pipe_right (FStar_Syntax_Util.quals_of_sigelt se)
          (FStar_List.filter
             (fun x  -> Prims.op_Negation (x = FStar_Syntax_Syntax.Logic)))
         in
      let uu____11323 =
        let uu____11325 =
          FStar_All.pipe_right quals
            (FStar_Util.for_some
               (fun uu___356_11331  ->
                  match uu___356_11331 with
                  | FStar_Syntax_Syntax.OnlyName  -> true
                  | uu____11334 -> false))
           in
        FStar_All.pipe_right uu____11325 Prims.op_Negation  in
      if uu____11323
      then
        let r = FStar_Syntax_Util.range_of_sigelt se  in
        let no_dup_quals =
          FStar_Util.remove_dups (fun x  -> fun y  -> x = y) quals  in
        let err' msg =
          let uu____11355 =
            let uu____11361 =
              let uu____11363 = FStar_Syntax_Print.quals_to_string quals  in
              FStar_Util.format2
                "The qualifier list \"[%s]\" is not permissible for this element%s"
                uu____11363 msg
               in
            (FStar_Errors.Fatal_QulifierListNotPermitted, uu____11361)  in
          FStar_Errors.raise_error uu____11355 r  in
        let err msg = err' (Prims.strcat ": " msg)  in
        let err'1 uu____11381 = err' ""  in
        (if (FStar_List.length quals) <> (FStar_List.length no_dup_quals)
         then err "duplicate qualifiers"
         else ();
         (let uu____11389 =
            let uu____11391 =
              FStar_All.pipe_right quals
                (FStar_List.for_all (quals_combo_ok quals))
               in
            Prims.op_Negation uu____11391  in
          if uu____11389 then err "ill-formed combination" else ());
         (match se.FStar_Syntax_Syntax.sigel with
          | FStar_Syntax_Syntax.Sig_let ((is_rec,uu____11401),uu____11402) ->
              ((let uu____11414 =
                  is_rec &&
                    (FStar_All.pipe_right quals
                       (FStar_List.contains
                          FStar_Syntax_Syntax.Unfold_for_unification_and_vcgen))
                   in
                if uu____11414
                then err "recursive definitions cannot be marked inline"
                else ());
               (let uu____11423 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_some
                       (fun x  -> (assumption x) || (has_eq x)))
                   in
                if uu____11423
                then
                  err
                    "definitions cannot be assumed or marked with equality qualifiers"
                else ()))
          | FStar_Syntax_Syntax.Sig_bundle uu____11434 ->
              let uu____11443 =
                let uu____11445 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((((x = FStar_Syntax_Syntax.Abstract) ||
                                (x =
                                   FStar_Syntax_Syntax.Inline_for_extraction))
                               || (x = FStar_Syntax_Syntax.NoExtract))
                              || (inferred x))
                             || (visibility x))
                            || (has_eq x)))
                   in
                Prims.op_Negation uu____11445  in
              if uu____11443 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_declare_typ uu____11455 ->
              let uu____11462 =
                FStar_All.pipe_right quals (FStar_Util.for_some has_eq)  in
              if uu____11462 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_assume uu____11470 ->
              let uu____11477 =
                let uu____11479 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (visibility x) ||
                            (x = FStar_Syntax_Syntax.Assumption)))
                   in
                Prims.op_Negation uu____11479  in
              if uu____11477 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect uu____11489 ->
              let uu____11490 =
                let uu____11492 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
                Prims.op_Negation uu____11492  in
              if uu____11490 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_new_effect_for_free uu____11502 ->
              let uu____11503 =
                let uu____11505 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  ->
                          (((x = FStar_Syntax_Syntax.TotalEffect) ||
                              (inferred x))
                             || (visibility x))
                            || (reification x)))
                   in
                Prims.op_Negation uu____11505  in
              if uu____11503 then err'1 () else ()
          | FStar_Syntax_Syntax.Sig_effect_abbrev uu____11515 ->
              let uu____11528 =
                let uu____11530 =
                  FStar_All.pipe_right quals
                    (FStar_Util.for_all
                       (fun x  -> (inferred x) || (visibility x)))
                   in
                Prims.op_Negation uu____11530  in
              if uu____11528 then err'1 () else ()
          | uu____11540 -> ()))
      else ()
  
let (must_erase_for_extraction :
  FStar_TypeChecker_Env.env -> FStar_Syntax_Syntax.term -> Prims.bool) =
  fun g  ->
    fun t  ->
      let has_erased_for_extraction_attr fv =
        let uu____11563 =
          let uu____11568 =
            FStar_All.pipe_right fv FStar_Syntax_Syntax.lid_of_fv  in
          FStar_All.pipe_right uu____11568
            (FStar_TypeChecker_Env.lookup_attrs_of_lid g)
           in
        FStar_All.pipe_right uu____11563
          (fun l_opt  ->
             (FStar_Util.is_some l_opt) &&
               (let uu____11587 = FStar_All.pipe_right l_opt FStar_Util.must
                   in
                FStar_All.pipe_right uu____11587
                  (FStar_List.existsb
                     (fun t1  ->
                        let uu____11605 =
                          let uu____11606 = FStar_Syntax_Subst.compress t1
                             in
                          uu____11606.FStar_Syntax_Syntax.n  in
                        match uu____11605 with
                        | FStar_Syntax_Syntax.Tm_fvar fv1 when
                            FStar_Ident.lid_equals
                              (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v
                              FStar_Parser_Const.must_erase_for_extraction_attr
                            -> true
                        | uu____11612 -> false))))
         in
      let rec aux_whnf env t1 =
        let uu____11638 =
          let uu____11639 = FStar_Syntax_Subst.compress t1  in
          uu____11639.FStar_Syntax_Syntax.n  in
        match uu____11638 with
        | FStar_Syntax_Syntax.Tm_type uu____11643 -> true
        | FStar_Syntax_Syntax.Tm_fvar fv ->
            (FStar_Syntax_Syntax.fv_eq_lid fv FStar_Parser_Const.unit_lid) ||
              (has_erased_for_extraction_attr fv)
        | FStar_Syntax_Syntax.Tm_arrow uu____11646 ->
            let uu____11661 = FStar_Syntax_Util.arrow_formals_comp t1  in
            (match uu____11661 with
             | (bs,c) ->
                 let env1 = FStar_TypeChecker_Env.push_binders env bs  in
                 let uu____11694 = FStar_Syntax_Util.is_pure_comp c  in
                 if uu____11694
                 then aux env1 (FStar_Syntax_Util.comp_result c)
                 else FStar_Syntax_Util.is_pure_or_ghost_comp c)
        | FStar_Syntax_Syntax.Tm_refine
            ({ FStar_Syntax_Syntax.ppname = uu____11700;
               FStar_Syntax_Syntax.index = uu____11701;
               FStar_Syntax_Syntax.sort = t2;_},uu____11703)
            -> aux env t2
        | FStar_Syntax_Syntax.Tm_ascribed (t2,uu____11712,uu____11713) ->
            aux env t2
        | FStar_Syntax_Syntax.Tm_app (head1,uu____11755::[]) ->
            let uu____11794 =
              let uu____11795 = FStar_Syntax_Util.un_uinst head1  in
              uu____11795.FStar_Syntax_Syntax.n  in
            (match uu____11794 with
             | FStar_Syntax_Syntax.Tm_fvar fv ->
                 (FStar_Syntax_Syntax.fv_eq_lid fv
                    FStar_Parser_Const.erased_lid)
                   || (has_erased_for_extraction_attr fv)
             | uu____11800 -> false)
        | uu____11802 -> false
      
      and aux env t1 =
        let t2 =
          FStar_TypeChecker_Normalize.normalize
            [FStar_TypeChecker_Env.Primops;
            FStar_TypeChecker_Env.Weak;
            FStar_TypeChecker_Env.HNF;
            FStar_TypeChecker_Env.UnfoldUntil
              FStar_Syntax_Syntax.delta_constant;
            FStar_TypeChecker_Env.Beta;
            FStar_TypeChecker_Env.AllowUnboundUniverses;
            FStar_TypeChecker_Env.Zeta;
            FStar_TypeChecker_Env.Iota] env t1
           in
        let res = aux_whnf env t2  in
        (let uu____11812 =
           FStar_All.pipe_left (FStar_TypeChecker_Env.debug env)
             (FStar_Options.Other "Extraction")
            in
         if uu____11812
         then
           let uu____11817 = FStar_Syntax_Print.term_to_string t2  in
           FStar_Util.print2 "must_erase=%s: %s\n"
             (if res then "true" else "false") uu____11817
         else ());
        res
       in aux g t
  