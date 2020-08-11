open Prims
type fsteps =
  {
  beta: Prims.bool ;
  iota: Prims.bool ;
  zeta: Prims.bool ;
  zeta_full: Prims.bool ;
  weak: Prims.bool ;
  hnf: Prims.bool ;
  primops: Prims.bool ;
  do_not_unfold_pure_lets: Prims.bool ;
  unfold_until:
    FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option ;
  unfold_only: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_fully: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_attr: FStar_Ident.lid Prims.list FStar_Pervasives_Native.option ;
  unfold_tac: Prims.bool ;
  pure_subterms_within_computations: Prims.bool ;
  simplify: Prims.bool ;
  erase_universes: Prims.bool ;
  allow_unbound_universes: Prims.bool ;
  reify_: Prims.bool ;
  compress_uvars: Prims.bool ;
  no_full_norm: Prims.bool ;
  check_no_uvars: Prims.bool ;
  unmeta: Prims.bool ;
  unascribe: Prims.bool ;
  in_full_norm_request: Prims.bool ;
  weakly_reduce_scrutinee: Prims.bool ;
  nbe_step: Prims.bool ;
  for_extraction: Prims.bool }
let (__proj__Mkfsteps__item__beta : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> beta
let (__proj__Mkfsteps__item__iota : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> iota
let (__proj__Mkfsteps__item__zeta : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> zeta
let (__proj__Mkfsteps__item__zeta_full : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> zeta_full
let (__proj__Mkfsteps__item__weak : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> weak
let (__proj__Mkfsteps__item__hnf : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> hnf
let (__proj__Mkfsteps__item__primops : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> primops
let (__proj__Mkfsteps__item__do_not_unfold_pure_lets : fsteps -> Prims.bool)
  =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> do_not_unfold_pure_lets
let (__proj__Mkfsteps__item__unfold_until :
  fsteps -> FStar_Syntax_Syntax.delta_depth FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unfold_until
let (__proj__Mkfsteps__item__unfold_only :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unfold_only
let (__proj__Mkfsteps__item__unfold_fully :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unfold_fully
let (__proj__Mkfsteps__item__unfold_attr :
  fsteps -> FStar_Ident.lid Prims.list FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unfold_attr
let (__proj__Mkfsteps__item__unfold_tac : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unfold_tac
let (__proj__Mkfsteps__item__pure_subterms_within_computations :
  fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> pure_subterms_within_computations
let (__proj__Mkfsteps__item__simplify : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> simplify
let (__proj__Mkfsteps__item__erase_universes : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> erase_universes
let (__proj__Mkfsteps__item__allow_unbound_universes : fsteps -> Prims.bool)
  =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> allow_unbound_universes
let (__proj__Mkfsteps__item__reify_ : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> reify_
let (__proj__Mkfsteps__item__compress_uvars : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> compress_uvars
let (__proj__Mkfsteps__item__no_full_norm : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> no_full_norm
let (__proj__Mkfsteps__item__check_no_uvars : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> check_no_uvars
let (__proj__Mkfsteps__item__unmeta : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unmeta
let (__proj__Mkfsteps__item__unascribe : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> unascribe
let (__proj__Mkfsteps__item__in_full_norm_request : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> in_full_norm_request
let (__proj__Mkfsteps__item__weakly_reduce_scrutinee : fsteps -> Prims.bool)
  =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> weakly_reduce_scrutinee
let (__proj__Mkfsteps__item__nbe_step : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> nbe_step
let (__proj__Mkfsteps__item__for_extraction : fsteps -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { beta; iota; zeta; zeta_full; weak; hnf; primops;
        do_not_unfold_pure_lets; unfold_until; unfold_only; unfold_fully;
        unfold_attr; unfold_tac; pure_subterms_within_computations; simplify;
        erase_universes; allow_unbound_universes; reify_; compress_uvars;
        no_full_norm; check_no_uvars; unmeta; unascribe;
        in_full_norm_request; weakly_reduce_scrutinee; nbe_step;
        for_extraction;_} -> for_extraction
let (steps_to_string : fsteps -> Prims.string) =
  fun f ->
    let format_opt f1 o =
      match o with
      | FStar_Pervasives_Native.None -> "None"
      | FStar_Pervasives_Native.Some x ->
          let uu____1508 =
            let uu____1509 = f1 x in FStar_String.op_Hat uu____1509 ")" in
          FStar_String.op_Hat "Some (" uu____1508 in
    let b = FStar_Util.string_of_bool in
    let uu____1515 =
      let uu____1518 = FStar_All.pipe_right f.beta b in
      let uu____1519 =
        let uu____1522 = FStar_All.pipe_right f.iota b in
        let uu____1523 =
          let uu____1526 = FStar_All.pipe_right f.zeta b in
          let uu____1527 =
            let uu____1530 = FStar_All.pipe_right f.zeta_full b in
            let uu____1531 =
              let uu____1534 = FStar_All.pipe_right f.weak b in
              let uu____1535 =
                let uu____1538 = FStar_All.pipe_right f.hnf b in
                let uu____1539 =
                  let uu____1542 = FStar_All.pipe_right f.primops b in
                  let uu____1543 =
                    let uu____1546 =
                      FStar_All.pipe_right f.do_not_unfold_pure_lets b in
                    let uu____1547 =
                      let uu____1550 =
                        FStar_All.pipe_right f.unfold_until
                          (format_opt
                             FStar_Syntax_Print.delta_depth_to_string) in
                      let uu____1553 =
                        let uu____1556 =
                          FStar_All.pipe_right f.unfold_only
                            (format_opt
                               (fun x ->
                                  let uu____1568 =
                                    FStar_List.map FStar_Ident.string_of_lid
                                      x in
                                  FStar_All.pipe_right uu____1568
                                    (FStar_String.concat ", "))) in
                        let uu____1573 =
                          let uu____1576 =
                            FStar_All.pipe_right f.unfold_fully
                              (format_opt
                                 (fun x ->
                                    let uu____1588 =
                                      FStar_List.map
                                        FStar_Ident.string_of_lid x in
                                    FStar_All.pipe_right uu____1588
                                      (FStar_String.concat ", "))) in
                          let uu____1593 =
                            let uu____1596 =
                              FStar_All.pipe_right f.unfold_attr
                                (format_opt
                                   (fun x ->
                                      let uu____1608 =
                                        FStar_List.map
                                          FStar_Ident.string_of_lid x in
                                      FStar_All.pipe_right uu____1608
                                        (FStar_String.concat ", "))) in
                            let uu____1613 =
                              let uu____1616 =
                                FStar_All.pipe_right f.unfold_tac b in
                              let uu____1617 =
                                let uu____1620 =
                                  FStar_All.pipe_right
                                    f.pure_subterms_within_computations b in
                                let uu____1621 =
                                  let uu____1624 =
                                    FStar_All.pipe_right f.simplify b in
                                  let uu____1625 =
                                    let uu____1628 =
                                      FStar_All.pipe_right f.erase_universes
                                        b in
                                    let uu____1629 =
                                      let uu____1632 =
                                        FStar_All.pipe_right
                                          f.allow_unbound_universes b in
                                      let uu____1633 =
                                        let uu____1636 =
                                          FStar_All.pipe_right f.reify_ b in
                                        let uu____1637 =
                                          let uu____1640 =
                                            FStar_All.pipe_right
                                              f.compress_uvars b in
                                          let uu____1641 =
                                            let uu____1644 =
                                              FStar_All.pipe_right
                                                f.no_full_norm b in
                                            let uu____1645 =
                                              let uu____1648 =
                                                FStar_All.pipe_right
                                                  f.check_no_uvars b in
                                              let uu____1649 =
                                                let uu____1652 =
                                                  FStar_All.pipe_right
                                                    f.unmeta b in
                                                let uu____1653 =
                                                  let uu____1656 =
                                                    FStar_All.pipe_right
                                                      f.unascribe b in
                                                  let uu____1657 =
                                                    let uu____1660 =
                                                      FStar_All.pipe_right
                                                        f.in_full_norm_request
                                                        b in
                                                    let uu____1661 =
                                                      let uu____1664 =
                                                        FStar_All.pipe_right
                                                          f.weakly_reduce_scrutinee
                                                          b in
                                                      let uu____1665 =
                                                        let uu____1668 =
                                                          FStar_All.pipe_right
                                                            f.for_extraction
                                                            b in
                                                        [uu____1668] in
                                                      uu____1664 ::
                                                        uu____1665 in
                                                    uu____1660 :: uu____1661 in
                                                  uu____1656 :: uu____1657 in
                                                uu____1652 :: uu____1653 in
                                              uu____1648 :: uu____1649 in
                                            uu____1644 :: uu____1645 in
                                          uu____1640 :: uu____1641 in
                                        uu____1636 :: uu____1637 in
                                      uu____1632 :: uu____1633 in
                                    uu____1628 :: uu____1629 in
                                  uu____1624 :: uu____1625 in
                                uu____1620 :: uu____1621 in
                              uu____1616 :: uu____1617 in
                            uu____1596 :: uu____1613 in
                          uu____1576 :: uu____1593 in
                        uu____1556 :: uu____1573 in
                      uu____1550 :: uu____1553 in
                    uu____1546 :: uu____1547 in
                  uu____1542 :: uu____1543 in
                uu____1538 :: uu____1539 in
              uu____1534 :: uu____1535 in
            uu____1530 :: uu____1531 in
          uu____1526 :: uu____1527 in
        uu____1522 :: uu____1523 in
      uu____1518 :: uu____1519 in
    FStar_Util.format
      "{\nbeta = %s;\niota = %s;\nzeta = %s;\nzeta_full = %s;\nweak = %s;\nhnf  = %s;\nprimops = %s;\ndo_not_unfold_pure_lets = %s;\nunfold_until = %s;\nunfold_only = %s;\nunfold_fully = %s;\nunfold_attr = %s;\nunfold_tac = %s;\npure_subterms_within_computations = %s;\nsimplify = %s;\nerase_universes = %s;\nallow_unbound_universes = %s;\nreify_ = %s;\ncompress_uvars = %s;\nno_full_norm = %s;\ncheck_no_uvars = %s;\nunmeta = %s;\nunascribe = %s;\nin_full_norm_request = %s;\nweakly_reduce_scrutinee = %s;\nfor_extraction = %s;\n}"
      uu____1515
let (default_steps : fsteps) =
  {
    beta = true;
    iota = true;
    zeta = true;
    zeta_full = false;
    weak = false;
    hnf = false;
    primops = false;
    do_not_unfold_pure_lets = false;
    unfold_until = FStar_Pervasives_Native.None;
    unfold_only = FStar_Pervasives_Native.None;
    unfold_fully = FStar_Pervasives_Native.None;
    unfold_attr = FStar_Pervasives_Native.None;
    unfold_tac = false;
    pure_subterms_within_computations = false;
    simplify = false;
    erase_universes = false;
    allow_unbound_universes = false;
    reify_ = false;
    compress_uvars = false;
    no_full_norm = false;
    check_no_uvars = false;
    unmeta = false;
    unascribe = false;
    in_full_norm_request = false;
    weakly_reduce_scrutinee = true;
    nbe_step = false;
    for_extraction = false
  }
let (fstep_add_one : FStar_TypeChecker_Env.step -> fsteps -> fsteps) =
  fun s ->
    fun fs ->
      match s with
      | FStar_TypeChecker_Env.Beta ->
          let uu___97_1685 = fs in
          {
            beta = true;
            iota = (uu___97_1685.iota);
            zeta = (uu___97_1685.zeta);
            zeta_full = (uu___97_1685.zeta_full);
            weak = (uu___97_1685.weak);
            hnf = (uu___97_1685.hnf);
            primops = (uu___97_1685.primops);
            do_not_unfold_pure_lets = (uu___97_1685.do_not_unfold_pure_lets);
            unfold_until = (uu___97_1685.unfold_until);
            unfold_only = (uu___97_1685.unfold_only);
            unfold_fully = (uu___97_1685.unfold_fully);
            unfold_attr = (uu___97_1685.unfold_attr);
            unfold_tac = (uu___97_1685.unfold_tac);
            pure_subterms_within_computations =
              (uu___97_1685.pure_subterms_within_computations);
            simplify = (uu___97_1685.simplify);
            erase_universes = (uu___97_1685.erase_universes);
            allow_unbound_universes = (uu___97_1685.allow_unbound_universes);
            reify_ = (uu___97_1685.reify_);
            compress_uvars = (uu___97_1685.compress_uvars);
            no_full_norm = (uu___97_1685.no_full_norm);
            check_no_uvars = (uu___97_1685.check_no_uvars);
            unmeta = (uu___97_1685.unmeta);
            unascribe = (uu___97_1685.unascribe);
            in_full_norm_request = (uu___97_1685.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___97_1685.weakly_reduce_scrutinee);
            nbe_step = (uu___97_1685.nbe_step);
            for_extraction = (uu___97_1685.for_extraction)
          }
      | FStar_TypeChecker_Env.Iota ->
          let uu___100_1686 = fs in
          {
            beta = (uu___100_1686.beta);
            iota = true;
            zeta = (uu___100_1686.zeta);
            zeta_full = (uu___100_1686.zeta_full);
            weak = (uu___100_1686.weak);
            hnf = (uu___100_1686.hnf);
            primops = (uu___100_1686.primops);
            do_not_unfold_pure_lets = (uu___100_1686.do_not_unfold_pure_lets);
            unfold_until = (uu___100_1686.unfold_until);
            unfold_only = (uu___100_1686.unfold_only);
            unfold_fully = (uu___100_1686.unfold_fully);
            unfold_attr = (uu___100_1686.unfold_attr);
            unfold_tac = (uu___100_1686.unfold_tac);
            pure_subterms_within_computations =
              (uu___100_1686.pure_subterms_within_computations);
            simplify = (uu___100_1686.simplify);
            erase_universes = (uu___100_1686.erase_universes);
            allow_unbound_universes = (uu___100_1686.allow_unbound_universes);
            reify_ = (uu___100_1686.reify_);
            compress_uvars = (uu___100_1686.compress_uvars);
            no_full_norm = (uu___100_1686.no_full_norm);
            check_no_uvars = (uu___100_1686.check_no_uvars);
            unmeta = (uu___100_1686.unmeta);
            unascribe = (uu___100_1686.unascribe);
            in_full_norm_request = (uu___100_1686.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___100_1686.weakly_reduce_scrutinee);
            nbe_step = (uu___100_1686.nbe_step);
            for_extraction = (uu___100_1686.for_extraction)
          }
      | FStar_TypeChecker_Env.Zeta ->
          let uu___103_1687 = fs in
          {
            beta = (uu___103_1687.beta);
            iota = (uu___103_1687.iota);
            zeta = true;
            zeta_full = (uu___103_1687.zeta_full);
            weak = (uu___103_1687.weak);
            hnf = (uu___103_1687.hnf);
            primops = (uu___103_1687.primops);
            do_not_unfold_pure_lets = (uu___103_1687.do_not_unfold_pure_lets);
            unfold_until = (uu___103_1687.unfold_until);
            unfold_only = (uu___103_1687.unfold_only);
            unfold_fully = (uu___103_1687.unfold_fully);
            unfold_attr = (uu___103_1687.unfold_attr);
            unfold_tac = (uu___103_1687.unfold_tac);
            pure_subterms_within_computations =
              (uu___103_1687.pure_subterms_within_computations);
            simplify = (uu___103_1687.simplify);
            erase_universes = (uu___103_1687.erase_universes);
            allow_unbound_universes = (uu___103_1687.allow_unbound_universes);
            reify_ = (uu___103_1687.reify_);
            compress_uvars = (uu___103_1687.compress_uvars);
            no_full_norm = (uu___103_1687.no_full_norm);
            check_no_uvars = (uu___103_1687.check_no_uvars);
            unmeta = (uu___103_1687.unmeta);
            unascribe = (uu___103_1687.unascribe);
            in_full_norm_request = (uu___103_1687.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___103_1687.weakly_reduce_scrutinee);
            nbe_step = (uu___103_1687.nbe_step);
            for_extraction = (uu___103_1687.for_extraction)
          }
      | FStar_TypeChecker_Env.ZetaFull ->
          let uu___106_1688 = fs in
          {
            beta = (uu___106_1688.beta);
            iota = (uu___106_1688.iota);
            zeta = (uu___106_1688.zeta);
            zeta_full = true;
            weak = (uu___106_1688.weak);
            hnf = (uu___106_1688.hnf);
            primops = (uu___106_1688.primops);
            do_not_unfold_pure_lets = (uu___106_1688.do_not_unfold_pure_lets);
            unfold_until = (uu___106_1688.unfold_until);
            unfold_only = (uu___106_1688.unfold_only);
            unfold_fully = (uu___106_1688.unfold_fully);
            unfold_attr = (uu___106_1688.unfold_attr);
            unfold_tac = (uu___106_1688.unfold_tac);
            pure_subterms_within_computations =
              (uu___106_1688.pure_subterms_within_computations);
            simplify = (uu___106_1688.simplify);
            erase_universes = (uu___106_1688.erase_universes);
            allow_unbound_universes = (uu___106_1688.allow_unbound_universes);
            reify_ = (uu___106_1688.reify_);
            compress_uvars = (uu___106_1688.compress_uvars);
            no_full_norm = (uu___106_1688.no_full_norm);
            check_no_uvars = (uu___106_1688.check_no_uvars);
            unmeta = (uu___106_1688.unmeta);
            unascribe = (uu___106_1688.unascribe);
            in_full_norm_request = (uu___106_1688.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___106_1688.weakly_reduce_scrutinee);
            nbe_step = (uu___106_1688.nbe_step);
            for_extraction = (uu___106_1688.for_extraction)
          }
      | FStar_TypeChecker_Env.Exclude (FStar_TypeChecker_Env.Beta) ->
          let uu___110_1689 = fs in
          {
            beta = false;
            iota = (uu___110_1689.iota);
            zeta = (uu___110_1689.zeta);
            zeta_full = (uu___110_1689.zeta_full);
            weak = (uu___110_1689.weak);
            hnf = (uu___110_1689.hnf);
            primops = (uu___110_1689.primops);
            do_not_unfold_pure_lets = (uu___110_1689.do_not_unfold_pure_lets);
            unfold_until = (uu___110_1689.unfold_until);
            unfold_only = (uu___110_1689.unfold_only);
            unfold_fully = (uu___110_1689.unfold_fully);
            unfold_attr = (uu___110_1689.unfold_attr);
            unfold_tac = (uu___110_1689.unfold_tac);
            pure_subterms_within_computations =
              (uu___110_1689.pure_subterms_within_computations);
            simplify = (uu___110_1689.simplify);
            erase_universes = (uu___110_1689.erase_universes);
            allow_unbound_universes = (uu___110_1689.allow_unbound_universes);
            reify_ = (uu___110_1689.reify_);
            compress_uvars = (uu___110_1689.compress_uvars);
            no_full_norm = (uu___110_1689.no_full_norm);
            check_no_uvars = (uu___110_1689.check_no_uvars);
            unmeta = (uu___110_1689.unmeta);
            unascribe = (uu___110_1689.unascribe);
            in_full_norm_request = (uu___110_1689.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___110_1689.weakly_reduce_scrutinee);
            nbe_step = (uu___110_1689.nbe_step);
            for_extraction = (uu___110_1689.for_extraction)
          }
      | FStar_TypeChecker_Env.Exclude (FStar_TypeChecker_Env.Iota) ->
          let uu___114_1690 = fs in
          {
            beta = (uu___114_1690.beta);
            iota = false;
            zeta = (uu___114_1690.zeta);
            zeta_full = (uu___114_1690.zeta_full);
            weak = (uu___114_1690.weak);
            hnf = (uu___114_1690.hnf);
            primops = (uu___114_1690.primops);
            do_not_unfold_pure_lets = (uu___114_1690.do_not_unfold_pure_lets);
            unfold_until = (uu___114_1690.unfold_until);
            unfold_only = (uu___114_1690.unfold_only);
            unfold_fully = (uu___114_1690.unfold_fully);
            unfold_attr = (uu___114_1690.unfold_attr);
            unfold_tac = (uu___114_1690.unfold_tac);
            pure_subterms_within_computations =
              (uu___114_1690.pure_subterms_within_computations);
            simplify = (uu___114_1690.simplify);
            erase_universes = (uu___114_1690.erase_universes);
            allow_unbound_universes = (uu___114_1690.allow_unbound_universes);
            reify_ = (uu___114_1690.reify_);
            compress_uvars = (uu___114_1690.compress_uvars);
            no_full_norm = (uu___114_1690.no_full_norm);
            check_no_uvars = (uu___114_1690.check_no_uvars);
            unmeta = (uu___114_1690.unmeta);
            unascribe = (uu___114_1690.unascribe);
            in_full_norm_request = (uu___114_1690.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___114_1690.weakly_reduce_scrutinee);
            nbe_step = (uu___114_1690.nbe_step);
            for_extraction = (uu___114_1690.for_extraction)
          }
      | FStar_TypeChecker_Env.Exclude (FStar_TypeChecker_Env.Zeta) ->
          let uu___118_1691 = fs in
          {
            beta = (uu___118_1691.beta);
            iota = (uu___118_1691.iota);
            zeta = false;
            zeta_full = (uu___118_1691.zeta_full);
            weak = (uu___118_1691.weak);
            hnf = (uu___118_1691.hnf);
            primops = (uu___118_1691.primops);
            do_not_unfold_pure_lets = (uu___118_1691.do_not_unfold_pure_lets);
            unfold_until = (uu___118_1691.unfold_until);
            unfold_only = (uu___118_1691.unfold_only);
            unfold_fully = (uu___118_1691.unfold_fully);
            unfold_attr = (uu___118_1691.unfold_attr);
            unfold_tac = (uu___118_1691.unfold_tac);
            pure_subterms_within_computations =
              (uu___118_1691.pure_subterms_within_computations);
            simplify = (uu___118_1691.simplify);
            erase_universes = (uu___118_1691.erase_universes);
            allow_unbound_universes = (uu___118_1691.allow_unbound_universes);
            reify_ = (uu___118_1691.reify_);
            compress_uvars = (uu___118_1691.compress_uvars);
            no_full_norm = (uu___118_1691.no_full_norm);
            check_no_uvars = (uu___118_1691.check_no_uvars);
            unmeta = (uu___118_1691.unmeta);
            unascribe = (uu___118_1691.unascribe);
            in_full_norm_request = (uu___118_1691.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___118_1691.weakly_reduce_scrutinee);
            nbe_step = (uu___118_1691.nbe_step);
            for_extraction = (uu___118_1691.for_extraction)
          }
      | FStar_TypeChecker_Env.Exclude uu____1692 -> failwith "Bad exclude"
      | FStar_TypeChecker_Env.Weak ->
          let uu___123_1693 = fs in
          {
            beta = (uu___123_1693.beta);
            iota = (uu___123_1693.iota);
            zeta = (uu___123_1693.zeta);
            zeta_full = (uu___123_1693.zeta_full);
            weak = true;
            hnf = (uu___123_1693.hnf);
            primops = (uu___123_1693.primops);
            do_not_unfold_pure_lets = (uu___123_1693.do_not_unfold_pure_lets);
            unfold_until = (uu___123_1693.unfold_until);
            unfold_only = (uu___123_1693.unfold_only);
            unfold_fully = (uu___123_1693.unfold_fully);
            unfold_attr = (uu___123_1693.unfold_attr);
            unfold_tac = (uu___123_1693.unfold_tac);
            pure_subterms_within_computations =
              (uu___123_1693.pure_subterms_within_computations);
            simplify = (uu___123_1693.simplify);
            erase_universes = (uu___123_1693.erase_universes);
            allow_unbound_universes = (uu___123_1693.allow_unbound_universes);
            reify_ = (uu___123_1693.reify_);
            compress_uvars = (uu___123_1693.compress_uvars);
            no_full_norm = (uu___123_1693.no_full_norm);
            check_no_uvars = (uu___123_1693.check_no_uvars);
            unmeta = (uu___123_1693.unmeta);
            unascribe = (uu___123_1693.unascribe);
            in_full_norm_request = (uu___123_1693.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___123_1693.weakly_reduce_scrutinee);
            nbe_step = (uu___123_1693.nbe_step);
            for_extraction = (uu___123_1693.for_extraction)
          }
      | FStar_TypeChecker_Env.HNF ->
          let uu___126_1694 = fs in
          {
            beta = (uu___126_1694.beta);
            iota = (uu___126_1694.iota);
            zeta = (uu___126_1694.zeta);
            zeta_full = (uu___126_1694.zeta_full);
            weak = (uu___126_1694.weak);
            hnf = true;
            primops = (uu___126_1694.primops);
            do_not_unfold_pure_lets = (uu___126_1694.do_not_unfold_pure_lets);
            unfold_until = (uu___126_1694.unfold_until);
            unfold_only = (uu___126_1694.unfold_only);
            unfold_fully = (uu___126_1694.unfold_fully);
            unfold_attr = (uu___126_1694.unfold_attr);
            unfold_tac = (uu___126_1694.unfold_tac);
            pure_subterms_within_computations =
              (uu___126_1694.pure_subterms_within_computations);
            simplify = (uu___126_1694.simplify);
            erase_universes = (uu___126_1694.erase_universes);
            allow_unbound_universes = (uu___126_1694.allow_unbound_universes);
            reify_ = (uu___126_1694.reify_);
            compress_uvars = (uu___126_1694.compress_uvars);
            no_full_norm = (uu___126_1694.no_full_norm);
            check_no_uvars = (uu___126_1694.check_no_uvars);
            unmeta = (uu___126_1694.unmeta);
            unascribe = (uu___126_1694.unascribe);
            in_full_norm_request = (uu___126_1694.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___126_1694.weakly_reduce_scrutinee);
            nbe_step = (uu___126_1694.nbe_step);
            for_extraction = (uu___126_1694.for_extraction)
          }
      | FStar_TypeChecker_Env.Primops ->
          let uu___129_1695 = fs in
          {
            beta = (uu___129_1695.beta);
            iota = (uu___129_1695.iota);
            zeta = (uu___129_1695.zeta);
            zeta_full = (uu___129_1695.zeta_full);
            weak = (uu___129_1695.weak);
            hnf = (uu___129_1695.hnf);
            primops = true;
            do_not_unfold_pure_lets = (uu___129_1695.do_not_unfold_pure_lets);
            unfold_until = (uu___129_1695.unfold_until);
            unfold_only = (uu___129_1695.unfold_only);
            unfold_fully = (uu___129_1695.unfold_fully);
            unfold_attr = (uu___129_1695.unfold_attr);
            unfold_tac = (uu___129_1695.unfold_tac);
            pure_subterms_within_computations =
              (uu___129_1695.pure_subterms_within_computations);
            simplify = (uu___129_1695.simplify);
            erase_universes = (uu___129_1695.erase_universes);
            allow_unbound_universes = (uu___129_1695.allow_unbound_universes);
            reify_ = (uu___129_1695.reify_);
            compress_uvars = (uu___129_1695.compress_uvars);
            no_full_norm = (uu___129_1695.no_full_norm);
            check_no_uvars = (uu___129_1695.check_no_uvars);
            unmeta = (uu___129_1695.unmeta);
            unascribe = (uu___129_1695.unascribe);
            in_full_norm_request = (uu___129_1695.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___129_1695.weakly_reduce_scrutinee);
            nbe_step = (uu___129_1695.nbe_step);
            for_extraction = (uu___129_1695.for_extraction)
          }
      | FStar_TypeChecker_Env.Eager_unfolding -> fs
      | FStar_TypeChecker_Env.Inlining -> fs
      | FStar_TypeChecker_Env.DoNotUnfoldPureLets ->
          let uu___134_1696 = fs in
          {
            beta = (uu___134_1696.beta);
            iota = (uu___134_1696.iota);
            zeta = (uu___134_1696.zeta);
            zeta_full = (uu___134_1696.zeta_full);
            weak = (uu___134_1696.weak);
            hnf = (uu___134_1696.hnf);
            primops = (uu___134_1696.primops);
            do_not_unfold_pure_lets = true;
            unfold_until = (uu___134_1696.unfold_until);
            unfold_only = (uu___134_1696.unfold_only);
            unfold_fully = (uu___134_1696.unfold_fully);
            unfold_attr = (uu___134_1696.unfold_attr);
            unfold_tac = (uu___134_1696.unfold_tac);
            pure_subterms_within_computations =
              (uu___134_1696.pure_subterms_within_computations);
            simplify = (uu___134_1696.simplify);
            erase_universes = (uu___134_1696.erase_universes);
            allow_unbound_universes = (uu___134_1696.allow_unbound_universes);
            reify_ = (uu___134_1696.reify_);
            compress_uvars = (uu___134_1696.compress_uvars);
            no_full_norm = (uu___134_1696.no_full_norm);
            check_no_uvars = (uu___134_1696.check_no_uvars);
            unmeta = (uu___134_1696.unmeta);
            unascribe = (uu___134_1696.unascribe);
            in_full_norm_request = (uu___134_1696.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___134_1696.weakly_reduce_scrutinee);
            nbe_step = (uu___134_1696.nbe_step);
            for_extraction = (uu___134_1696.for_extraction)
          }
      | FStar_TypeChecker_Env.UnfoldUntil d ->
          let uu___138_1698 = fs in
          {
            beta = (uu___138_1698.beta);
            iota = (uu___138_1698.iota);
            zeta = (uu___138_1698.zeta);
            zeta_full = (uu___138_1698.zeta_full);
            weak = (uu___138_1698.weak);
            hnf = (uu___138_1698.hnf);
            primops = (uu___138_1698.primops);
            do_not_unfold_pure_lets = (uu___138_1698.do_not_unfold_pure_lets);
            unfold_until = (FStar_Pervasives_Native.Some d);
            unfold_only = (uu___138_1698.unfold_only);
            unfold_fully = (uu___138_1698.unfold_fully);
            unfold_attr = (uu___138_1698.unfold_attr);
            unfold_tac = (uu___138_1698.unfold_tac);
            pure_subterms_within_computations =
              (uu___138_1698.pure_subterms_within_computations);
            simplify = (uu___138_1698.simplify);
            erase_universes = (uu___138_1698.erase_universes);
            allow_unbound_universes = (uu___138_1698.allow_unbound_universes);
            reify_ = (uu___138_1698.reify_);
            compress_uvars = (uu___138_1698.compress_uvars);
            no_full_norm = (uu___138_1698.no_full_norm);
            check_no_uvars = (uu___138_1698.check_no_uvars);
            unmeta = (uu___138_1698.unmeta);
            unascribe = (uu___138_1698.unascribe);
            in_full_norm_request = (uu___138_1698.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___138_1698.weakly_reduce_scrutinee);
            nbe_step = (uu___138_1698.nbe_step);
            for_extraction = (uu___138_1698.for_extraction)
          }
      | FStar_TypeChecker_Env.UnfoldOnly lids ->
          let uu___142_1702 = fs in
          {
            beta = (uu___142_1702.beta);
            iota = (uu___142_1702.iota);
            zeta = (uu___142_1702.zeta);
            zeta_full = (uu___142_1702.zeta_full);
            weak = (uu___142_1702.weak);
            hnf = (uu___142_1702.hnf);
            primops = (uu___142_1702.primops);
            do_not_unfold_pure_lets = (uu___142_1702.do_not_unfold_pure_lets);
            unfold_until = (uu___142_1702.unfold_until);
            unfold_only = (FStar_Pervasives_Native.Some lids);
            unfold_fully = (uu___142_1702.unfold_fully);
            unfold_attr = (uu___142_1702.unfold_attr);
            unfold_tac = (uu___142_1702.unfold_tac);
            pure_subterms_within_computations =
              (uu___142_1702.pure_subterms_within_computations);
            simplify = (uu___142_1702.simplify);
            erase_universes = (uu___142_1702.erase_universes);
            allow_unbound_universes = (uu___142_1702.allow_unbound_universes);
            reify_ = (uu___142_1702.reify_);
            compress_uvars = (uu___142_1702.compress_uvars);
            no_full_norm = (uu___142_1702.no_full_norm);
            check_no_uvars = (uu___142_1702.check_no_uvars);
            unmeta = (uu___142_1702.unmeta);
            unascribe = (uu___142_1702.unascribe);
            in_full_norm_request = (uu___142_1702.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___142_1702.weakly_reduce_scrutinee);
            nbe_step = (uu___142_1702.nbe_step);
            for_extraction = (uu___142_1702.for_extraction)
          }
      | FStar_TypeChecker_Env.UnfoldFully lids ->
          let uu___146_1708 = fs in
          {
            beta = (uu___146_1708.beta);
            iota = (uu___146_1708.iota);
            zeta = (uu___146_1708.zeta);
            zeta_full = (uu___146_1708.zeta_full);
            weak = (uu___146_1708.weak);
            hnf = (uu___146_1708.hnf);
            primops = (uu___146_1708.primops);
            do_not_unfold_pure_lets = (uu___146_1708.do_not_unfold_pure_lets);
            unfold_until = (uu___146_1708.unfold_until);
            unfold_only = (uu___146_1708.unfold_only);
            unfold_fully = (FStar_Pervasives_Native.Some lids);
            unfold_attr = (uu___146_1708.unfold_attr);
            unfold_tac = (uu___146_1708.unfold_tac);
            pure_subterms_within_computations =
              (uu___146_1708.pure_subterms_within_computations);
            simplify = (uu___146_1708.simplify);
            erase_universes = (uu___146_1708.erase_universes);
            allow_unbound_universes = (uu___146_1708.allow_unbound_universes);
            reify_ = (uu___146_1708.reify_);
            compress_uvars = (uu___146_1708.compress_uvars);
            no_full_norm = (uu___146_1708.no_full_norm);
            check_no_uvars = (uu___146_1708.check_no_uvars);
            unmeta = (uu___146_1708.unmeta);
            unascribe = (uu___146_1708.unascribe);
            in_full_norm_request = (uu___146_1708.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___146_1708.weakly_reduce_scrutinee);
            nbe_step = (uu___146_1708.nbe_step);
            for_extraction = (uu___146_1708.for_extraction)
          }
      | FStar_TypeChecker_Env.UnfoldAttr lids ->
          let uu___150_1714 = fs in
          {
            beta = (uu___150_1714.beta);
            iota = (uu___150_1714.iota);
            zeta = (uu___150_1714.zeta);
            zeta_full = (uu___150_1714.zeta_full);
            weak = (uu___150_1714.weak);
            hnf = (uu___150_1714.hnf);
            primops = (uu___150_1714.primops);
            do_not_unfold_pure_lets = (uu___150_1714.do_not_unfold_pure_lets);
            unfold_until = (uu___150_1714.unfold_until);
            unfold_only = (uu___150_1714.unfold_only);
            unfold_fully = (uu___150_1714.unfold_fully);
            unfold_attr = (FStar_Pervasives_Native.Some lids);
            unfold_tac = (uu___150_1714.unfold_tac);
            pure_subterms_within_computations =
              (uu___150_1714.pure_subterms_within_computations);
            simplify = (uu___150_1714.simplify);
            erase_universes = (uu___150_1714.erase_universes);
            allow_unbound_universes = (uu___150_1714.allow_unbound_universes);
            reify_ = (uu___150_1714.reify_);
            compress_uvars = (uu___150_1714.compress_uvars);
            no_full_norm = (uu___150_1714.no_full_norm);
            check_no_uvars = (uu___150_1714.check_no_uvars);
            unmeta = (uu___150_1714.unmeta);
            unascribe = (uu___150_1714.unascribe);
            in_full_norm_request = (uu___150_1714.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___150_1714.weakly_reduce_scrutinee);
            nbe_step = (uu___150_1714.nbe_step);
            for_extraction = (uu___150_1714.for_extraction)
          }
      | FStar_TypeChecker_Env.UnfoldTac ->
          let uu___153_1717 = fs in
          {
            beta = (uu___153_1717.beta);
            iota = (uu___153_1717.iota);
            zeta = (uu___153_1717.zeta);
            zeta_full = (uu___153_1717.zeta_full);
            weak = (uu___153_1717.weak);
            hnf = (uu___153_1717.hnf);
            primops = (uu___153_1717.primops);
            do_not_unfold_pure_lets = (uu___153_1717.do_not_unfold_pure_lets);
            unfold_until = (uu___153_1717.unfold_until);
            unfold_only = (uu___153_1717.unfold_only);
            unfold_fully = (uu___153_1717.unfold_fully);
            unfold_attr = (uu___153_1717.unfold_attr);
            unfold_tac = true;
            pure_subterms_within_computations =
              (uu___153_1717.pure_subterms_within_computations);
            simplify = (uu___153_1717.simplify);
            erase_universes = (uu___153_1717.erase_universes);
            allow_unbound_universes = (uu___153_1717.allow_unbound_universes);
            reify_ = (uu___153_1717.reify_);
            compress_uvars = (uu___153_1717.compress_uvars);
            no_full_norm = (uu___153_1717.no_full_norm);
            check_no_uvars = (uu___153_1717.check_no_uvars);
            unmeta = (uu___153_1717.unmeta);
            unascribe = (uu___153_1717.unascribe);
            in_full_norm_request = (uu___153_1717.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___153_1717.weakly_reduce_scrutinee);
            nbe_step = (uu___153_1717.nbe_step);
            for_extraction = (uu___153_1717.for_extraction)
          }
      | FStar_TypeChecker_Env.PureSubtermsWithinComputations ->
          let uu___156_1718 = fs in
          {
            beta = (uu___156_1718.beta);
            iota = (uu___156_1718.iota);
            zeta = (uu___156_1718.zeta);
            zeta_full = (uu___156_1718.zeta_full);
            weak = (uu___156_1718.weak);
            hnf = (uu___156_1718.hnf);
            primops = (uu___156_1718.primops);
            do_not_unfold_pure_lets = (uu___156_1718.do_not_unfold_pure_lets);
            unfold_until = (uu___156_1718.unfold_until);
            unfold_only = (uu___156_1718.unfold_only);
            unfold_fully = (uu___156_1718.unfold_fully);
            unfold_attr = (uu___156_1718.unfold_attr);
            unfold_tac = (uu___156_1718.unfold_tac);
            pure_subterms_within_computations = true;
            simplify = (uu___156_1718.simplify);
            erase_universes = (uu___156_1718.erase_universes);
            allow_unbound_universes = (uu___156_1718.allow_unbound_universes);
            reify_ = (uu___156_1718.reify_);
            compress_uvars = (uu___156_1718.compress_uvars);
            no_full_norm = (uu___156_1718.no_full_norm);
            check_no_uvars = (uu___156_1718.check_no_uvars);
            unmeta = (uu___156_1718.unmeta);
            unascribe = (uu___156_1718.unascribe);
            in_full_norm_request = (uu___156_1718.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___156_1718.weakly_reduce_scrutinee);
            nbe_step = (uu___156_1718.nbe_step);
            for_extraction = (uu___156_1718.for_extraction)
          }
      | FStar_TypeChecker_Env.Simplify ->
          let uu___159_1719 = fs in
          {
            beta = (uu___159_1719.beta);
            iota = (uu___159_1719.iota);
            zeta = (uu___159_1719.zeta);
            zeta_full = (uu___159_1719.zeta_full);
            weak = (uu___159_1719.weak);
            hnf = (uu___159_1719.hnf);
            primops = (uu___159_1719.primops);
            do_not_unfold_pure_lets = (uu___159_1719.do_not_unfold_pure_lets);
            unfold_until = (uu___159_1719.unfold_until);
            unfold_only = (uu___159_1719.unfold_only);
            unfold_fully = (uu___159_1719.unfold_fully);
            unfold_attr = (uu___159_1719.unfold_attr);
            unfold_tac = (uu___159_1719.unfold_tac);
            pure_subterms_within_computations =
              (uu___159_1719.pure_subterms_within_computations);
            simplify = true;
            erase_universes = (uu___159_1719.erase_universes);
            allow_unbound_universes = (uu___159_1719.allow_unbound_universes);
            reify_ = (uu___159_1719.reify_);
            compress_uvars = (uu___159_1719.compress_uvars);
            no_full_norm = (uu___159_1719.no_full_norm);
            check_no_uvars = (uu___159_1719.check_no_uvars);
            unmeta = (uu___159_1719.unmeta);
            unascribe = (uu___159_1719.unascribe);
            in_full_norm_request = (uu___159_1719.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___159_1719.weakly_reduce_scrutinee);
            nbe_step = (uu___159_1719.nbe_step);
            for_extraction = (uu___159_1719.for_extraction)
          }
      | FStar_TypeChecker_Env.EraseUniverses ->
          let uu___162_1720 = fs in
          {
            beta = (uu___162_1720.beta);
            iota = (uu___162_1720.iota);
            zeta = (uu___162_1720.zeta);
            zeta_full = (uu___162_1720.zeta_full);
            weak = (uu___162_1720.weak);
            hnf = (uu___162_1720.hnf);
            primops = (uu___162_1720.primops);
            do_not_unfold_pure_lets = (uu___162_1720.do_not_unfold_pure_lets);
            unfold_until = (uu___162_1720.unfold_until);
            unfold_only = (uu___162_1720.unfold_only);
            unfold_fully = (uu___162_1720.unfold_fully);
            unfold_attr = (uu___162_1720.unfold_attr);
            unfold_tac = (uu___162_1720.unfold_tac);
            pure_subterms_within_computations =
              (uu___162_1720.pure_subterms_within_computations);
            simplify = (uu___162_1720.simplify);
            erase_universes = true;
            allow_unbound_universes = (uu___162_1720.allow_unbound_universes);
            reify_ = (uu___162_1720.reify_);
            compress_uvars = (uu___162_1720.compress_uvars);
            no_full_norm = (uu___162_1720.no_full_norm);
            check_no_uvars = (uu___162_1720.check_no_uvars);
            unmeta = (uu___162_1720.unmeta);
            unascribe = (uu___162_1720.unascribe);
            in_full_norm_request = (uu___162_1720.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___162_1720.weakly_reduce_scrutinee);
            nbe_step = (uu___162_1720.nbe_step);
            for_extraction = (uu___162_1720.for_extraction)
          }
      | FStar_TypeChecker_Env.AllowUnboundUniverses ->
          let uu___165_1721 = fs in
          {
            beta = (uu___165_1721.beta);
            iota = (uu___165_1721.iota);
            zeta = (uu___165_1721.zeta);
            zeta_full = (uu___165_1721.zeta_full);
            weak = (uu___165_1721.weak);
            hnf = (uu___165_1721.hnf);
            primops = (uu___165_1721.primops);
            do_not_unfold_pure_lets = (uu___165_1721.do_not_unfold_pure_lets);
            unfold_until = (uu___165_1721.unfold_until);
            unfold_only = (uu___165_1721.unfold_only);
            unfold_fully = (uu___165_1721.unfold_fully);
            unfold_attr = (uu___165_1721.unfold_attr);
            unfold_tac = (uu___165_1721.unfold_tac);
            pure_subterms_within_computations =
              (uu___165_1721.pure_subterms_within_computations);
            simplify = (uu___165_1721.simplify);
            erase_universes = (uu___165_1721.erase_universes);
            allow_unbound_universes = true;
            reify_ = (uu___165_1721.reify_);
            compress_uvars = (uu___165_1721.compress_uvars);
            no_full_norm = (uu___165_1721.no_full_norm);
            check_no_uvars = (uu___165_1721.check_no_uvars);
            unmeta = (uu___165_1721.unmeta);
            unascribe = (uu___165_1721.unascribe);
            in_full_norm_request = (uu___165_1721.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___165_1721.weakly_reduce_scrutinee);
            nbe_step = (uu___165_1721.nbe_step);
            for_extraction = (uu___165_1721.for_extraction)
          }
      | FStar_TypeChecker_Env.Reify ->
          let uu___168_1722 = fs in
          {
            beta = (uu___168_1722.beta);
            iota = (uu___168_1722.iota);
            zeta = (uu___168_1722.zeta);
            zeta_full = (uu___168_1722.zeta_full);
            weak = (uu___168_1722.weak);
            hnf = (uu___168_1722.hnf);
            primops = (uu___168_1722.primops);
            do_not_unfold_pure_lets = (uu___168_1722.do_not_unfold_pure_lets);
            unfold_until = (uu___168_1722.unfold_until);
            unfold_only = (uu___168_1722.unfold_only);
            unfold_fully = (uu___168_1722.unfold_fully);
            unfold_attr = (uu___168_1722.unfold_attr);
            unfold_tac = (uu___168_1722.unfold_tac);
            pure_subterms_within_computations =
              (uu___168_1722.pure_subterms_within_computations);
            simplify = (uu___168_1722.simplify);
            erase_universes = (uu___168_1722.erase_universes);
            allow_unbound_universes = (uu___168_1722.allow_unbound_universes);
            reify_ = true;
            compress_uvars = (uu___168_1722.compress_uvars);
            no_full_norm = (uu___168_1722.no_full_norm);
            check_no_uvars = (uu___168_1722.check_no_uvars);
            unmeta = (uu___168_1722.unmeta);
            unascribe = (uu___168_1722.unascribe);
            in_full_norm_request = (uu___168_1722.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___168_1722.weakly_reduce_scrutinee);
            nbe_step = (uu___168_1722.nbe_step);
            for_extraction = (uu___168_1722.for_extraction)
          }
      | FStar_TypeChecker_Env.CompressUvars ->
          let uu___171_1723 = fs in
          {
            beta = (uu___171_1723.beta);
            iota = (uu___171_1723.iota);
            zeta = (uu___171_1723.zeta);
            zeta_full = (uu___171_1723.zeta_full);
            weak = (uu___171_1723.weak);
            hnf = (uu___171_1723.hnf);
            primops = (uu___171_1723.primops);
            do_not_unfold_pure_lets = (uu___171_1723.do_not_unfold_pure_lets);
            unfold_until = (uu___171_1723.unfold_until);
            unfold_only = (uu___171_1723.unfold_only);
            unfold_fully = (uu___171_1723.unfold_fully);
            unfold_attr = (uu___171_1723.unfold_attr);
            unfold_tac = (uu___171_1723.unfold_tac);
            pure_subterms_within_computations =
              (uu___171_1723.pure_subterms_within_computations);
            simplify = (uu___171_1723.simplify);
            erase_universes = (uu___171_1723.erase_universes);
            allow_unbound_universes = (uu___171_1723.allow_unbound_universes);
            reify_ = (uu___171_1723.reify_);
            compress_uvars = true;
            no_full_norm = (uu___171_1723.no_full_norm);
            check_no_uvars = (uu___171_1723.check_no_uvars);
            unmeta = (uu___171_1723.unmeta);
            unascribe = (uu___171_1723.unascribe);
            in_full_norm_request = (uu___171_1723.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___171_1723.weakly_reduce_scrutinee);
            nbe_step = (uu___171_1723.nbe_step);
            for_extraction = (uu___171_1723.for_extraction)
          }
      | FStar_TypeChecker_Env.NoFullNorm ->
          let uu___174_1724 = fs in
          {
            beta = (uu___174_1724.beta);
            iota = (uu___174_1724.iota);
            zeta = (uu___174_1724.zeta);
            zeta_full = (uu___174_1724.zeta_full);
            weak = (uu___174_1724.weak);
            hnf = (uu___174_1724.hnf);
            primops = (uu___174_1724.primops);
            do_not_unfold_pure_lets = (uu___174_1724.do_not_unfold_pure_lets);
            unfold_until = (uu___174_1724.unfold_until);
            unfold_only = (uu___174_1724.unfold_only);
            unfold_fully = (uu___174_1724.unfold_fully);
            unfold_attr = (uu___174_1724.unfold_attr);
            unfold_tac = (uu___174_1724.unfold_tac);
            pure_subterms_within_computations =
              (uu___174_1724.pure_subterms_within_computations);
            simplify = (uu___174_1724.simplify);
            erase_universes = (uu___174_1724.erase_universes);
            allow_unbound_universes = (uu___174_1724.allow_unbound_universes);
            reify_ = (uu___174_1724.reify_);
            compress_uvars = (uu___174_1724.compress_uvars);
            no_full_norm = true;
            check_no_uvars = (uu___174_1724.check_no_uvars);
            unmeta = (uu___174_1724.unmeta);
            unascribe = (uu___174_1724.unascribe);
            in_full_norm_request = (uu___174_1724.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___174_1724.weakly_reduce_scrutinee);
            nbe_step = (uu___174_1724.nbe_step);
            for_extraction = (uu___174_1724.for_extraction)
          }
      | FStar_TypeChecker_Env.CheckNoUvars ->
          let uu___177_1725 = fs in
          {
            beta = (uu___177_1725.beta);
            iota = (uu___177_1725.iota);
            zeta = (uu___177_1725.zeta);
            zeta_full = (uu___177_1725.zeta_full);
            weak = (uu___177_1725.weak);
            hnf = (uu___177_1725.hnf);
            primops = (uu___177_1725.primops);
            do_not_unfold_pure_lets = (uu___177_1725.do_not_unfold_pure_lets);
            unfold_until = (uu___177_1725.unfold_until);
            unfold_only = (uu___177_1725.unfold_only);
            unfold_fully = (uu___177_1725.unfold_fully);
            unfold_attr = (uu___177_1725.unfold_attr);
            unfold_tac = (uu___177_1725.unfold_tac);
            pure_subterms_within_computations =
              (uu___177_1725.pure_subterms_within_computations);
            simplify = (uu___177_1725.simplify);
            erase_universes = (uu___177_1725.erase_universes);
            allow_unbound_universes = (uu___177_1725.allow_unbound_universes);
            reify_ = (uu___177_1725.reify_);
            compress_uvars = (uu___177_1725.compress_uvars);
            no_full_norm = (uu___177_1725.no_full_norm);
            check_no_uvars = true;
            unmeta = (uu___177_1725.unmeta);
            unascribe = (uu___177_1725.unascribe);
            in_full_norm_request = (uu___177_1725.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___177_1725.weakly_reduce_scrutinee);
            nbe_step = (uu___177_1725.nbe_step);
            for_extraction = (uu___177_1725.for_extraction)
          }
      | FStar_TypeChecker_Env.Unmeta ->
          let uu___180_1726 = fs in
          {
            beta = (uu___180_1726.beta);
            iota = (uu___180_1726.iota);
            zeta = (uu___180_1726.zeta);
            zeta_full = (uu___180_1726.zeta_full);
            weak = (uu___180_1726.weak);
            hnf = (uu___180_1726.hnf);
            primops = (uu___180_1726.primops);
            do_not_unfold_pure_lets = (uu___180_1726.do_not_unfold_pure_lets);
            unfold_until = (uu___180_1726.unfold_until);
            unfold_only = (uu___180_1726.unfold_only);
            unfold_fully = (uu___180_1726.unfold_fully);
            unfold_attr = (uu___180_1726.unfold_attr);
            unfold_tac = (uu___180_1726.unfold_tac);
            pure_subterms_within_computations =
              (uu___180_1726.pure_subterms_within_computations);
            simplify = (uu___180_1726.simplify);
            erase_universes = (uu___180_1726.erase_universes);
            allow_unbound_universes = (uu___180_1726.allow_unbound_universes);
            reify_ = (uu___180_1726.reify_);
            compress_uvars = (uu___180_1726.compress_uvars);
            no_full_norm = (uu___180_1726.no_full_norm);
            check_no_uvars = (uu___180_1726.check_no_uvars);
            unmeta = true;
            unascribe = (uu___180_1726.unascribe);
            in_full_norm_request = (uu___180_1726.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___180_1726.weakly_reduce_scrutinee);
            nbe_step = (uu___180_1726.nbe_step);
            for_extraction = (uu___180_1726.for_extraction)
          }
      | FStar_TypeChecker_Env.Unascribe ->
          let uu___183_1727 = fs in
          {
            beta = (uu___183_1727.beta);
            iota = (uu___183_1727.iota);
            zeta = (uu___183_1727.zeta);
            zeta_full = (uu___183_1727.zeta_full);
            weak = (uu___183_1727.weak);
            hnf = (uu___183_1727.hnf);
            primops = (uu___183_1727.primops);
            do_not_unfold_pure_lets = (uu___183_1727.do_not_unfold_pure_lets);
            unfold_until = (uu___183_1727.unfold_until);
            unfold_only = (uu___183_1727.unfold_only);
            unfold_fully = (uu___183_1727.unfold_fully);
            unfold_attr = (uu___183_1727.unfold_attr);
            unfold_tac = (uu___183_1727.unfold_tac);
            pure_subterms_within_computations =
              (uu___183_1727.pure_subterms_within_computations);
            simplify = (uu___183_1727.simplify);
            erase_universes = (uu___183_1727.erase_universes);
            allow_unbound_universes = (uu___183_1727.allow_unbound_universes);
            reify_ = (uu___183_1727.reify_);
            compress_uvars = (uu___183_1727.compress_uvars);
            no_full_norm = (uu___183_1727.no_full_norm);
            check_no_uvars = (uu___183_1727.check_no_uvars);
            unmeta = (uu___183_1727.unmeta);
            unascribe = true;
            in_full_norm_request = (uu___183_1727.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___183_1727.weakly_reduce_scrutinee);
            nbe_step = (uu___183_1727.nbe_step);
            for_extraction = (uu___183_1727.for_extraction)
          }
      | FStar_TypeChecker_Env.NBE ->
          let uu___186_1728 = fs in
          {
            beta = (uu___186_1728.beta);
            iota = (uu___186_1728.iota);
            zeta = (uu___186_1728.zeta);
            zeta_full = (uu___186_1728.zeta_full);
            weak = (uu___186_1728.weak);
            hnf = (uu___186_1728.hnf);
            primops = (uu___186_1728.primops);
            do_not_unfold_pure_lets = (uu___186_1728.do_not_unfold_pure_lets);
            unfold_until = (uu___186_1728.unfold_until);
            unfold_only = (uu___186_1728.unfold_only);
            unfold_fully = (uu___186_1728.unfold_fully);
            unfold_attr = (uu___186_1728.unfold_attr);
            unfold_tac = (uu___186_1728.unfold_tac);
            pure_subterms_within_computations =
              (uu___186_1728.pure_subterms_within_computations);
            simplify = (uu___186_1728.simplify);
            erase_universes = (uu___186_1728.erase_universes);
            allow_unbound_universes = (uu___186_1728.allow_unbound_universes);
            reify_ = (uu___186_1728.reify_);
            compress_uvars = (uu___186_1728.compress_uvars);
            no_full_norm = (uu___186_1728.no_full_norm);
            check_no_uvars = (uu___186_1728.check_no_uvars);
            unmeta = (uu___186_1728.unmeta);
            unascribe = (uu___186_1728.unascribe);
            in_full_norm_request = (uu___186_1728.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___186_1728.weakly_reduce_scrutinee);
            nbe_step = true;
            for_extraction = (uu___186_1728.for_extraction)
          }
      | FStar_TypeChecker_Env.ForExtraction ->
          let uu___189_1729 = fs in
          {
            beta = (uu___189_1729.beta);
            iota = (uu___189_1729.iota);
            zeta = (uu___189_1729.zeta);
            zeta_full = (uu___189_1729.zeta_full);
            weak = (uu___189_1729.weak);
            hnf = (uu___189_1729.hnf);
            primops = (uu___189_1729.primops);
            do_not_unfold_pure_lets = (uu___189_1729.do_not_unfold_pure_lets);
            unfold_until = (uu___189_1729.unfold_until);
            unfold_only = (uu___189_1729.unfold_only);
            unfold_fully = (uu___189_1729.unfold_fully);
            unfold_attr = (uu___189_1729.unfold_attr);
            unfold_tac = (uu___189_1729.unfold_tac);
            pure_subterms_within_computations =
              (uu___189_1729.pure_subterms_within_computations);
            simplify = (uu___189_1729.simplify);
            erase_universes = (uu___189_1729.erase_universes);
            allow_unbound_universes = (uu___189_1729.allow_unbound_universes);
            reify_ = (uu___189_1729.reify_);
            compress_uvars = (uu___189_1729.compress_uvars);
            no_full_norm = (uu___189_1729.no_full_norm);
            check_no_uvars = (uu___189_1729.check_no_uvars);
            unmeta = (uu___189_1729.unmeta);
            unascribe = (uu___189_1729.unascribe);
            in_full_norm_request = (uu___189_1729.in_full_norm_request);
            weakly_reduce_scrutinee = (uu___189_1729.weakly_reduce_scrutinee);
            nbe_step = (uu___189_1729.nbe_step);
            for_extraction = true
          }
let (to_fsteps : FStar_TypeChecker_Env.step Prims.list -> fsteps) =
  fun s -> FStar_List.fold_right fstep_add_one s default_steps
type psc =
  {
  psc_range: FStar_Range.range ;
  psc_subst: unit -> FStar_Syntax_Syntax.subst_t }
let (__proj__Mkpsc__item__psc_range : psc -> FStar_Range.range) =
  fun projectee ->
    match projectee with | { psc_range; psc_subst;_} -> psc_range
let (__proj__Mkpsc__item__psc_subst :
  psc -> unit -> FStar_Syntax_Syntax.subst_t) =
  fun projectee ->
    match projectee with | { psc_range; psc_subst;_} -> psc_subst
let (null_psc : psc) =
  { psc_range = FStar_Range.dummyRange; psc_subst = (fun uu____1782 -> []) }
let (psc_range : psc -> FStar_Range.range) = fun psc1 -> psc1.psc_range
let (psc_subst : psc -> FStar_Syntax_Syntax.subst_t) =
  fun psc1 -> psc1.psc_subst ()
type debug_switches =
  {
  gen: Prims.bool ;
  top: Prims.bool ;
  cfg: Prims.bool ;
  primop: Prims.bool ;
  unfolding: Prims.bool ;
  b380: Prims.bool ;
  wpe: Prims.bool ;
  norm_delayed: Prims.bool ;
  print_normalized: Prims.bool ;
  debug_nbe: Prims.bool }
let (__proj__Mkdebug_switches__item__gen : debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> gen
let (__proj__Mkdebug_switches__item__top : debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> top
let (__proj__Mkdebug_switches__item__cfg : debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> cfg
let (__proj__Mkdebug_switches__item__primop : debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> primop
let (__proj__Mkdebug_switches__item__unfolding :
  debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> unfolding
let (__proj__Mkdebug_switches__item__b380 : debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> b380
let (__proj__Mkdebug_switches__item__wpe : debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> wpe
let (__proj__Mkdebug_switches__item__norm_delayed :
  debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> norm_delayed
let (__proj__Mkdebug_switches__item__print_normalized :
  debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> print_normalized
let (__proj__Mkdebug_switches__item__debug_nbe :
  debug_switches -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { gen; top; cfg; primop; unfolding; b380; wpe; norm_delayed;
        print_normalized; debug_nbe;_} -> debug_nbe
let (no_debug_switches : debug_switches) =
  {
    gen = false;
    top = false;
    cfg = false;
    primop = false;
    unfolding = false;
    b380 = false;
    wpe = false;
    norm_delayed = false;
    print_normalized = false;
    debug_nbe = false
  }
type primitive_step =
  {
  name: FStar_Ident.lid ;
  arity: Prims.int ;
  univ_arity: Prims.int ;
  auto_reflect: Prims.int FStar_Pervasives_Native.option ;
  strong_reduction_ok: Prims.bool ;
  requires_binder_substitution: Prims.bool ;
  interpretation:
    psc ->
      FStar_Syntax_Embeddings.norm_cb ->
        FStar_Syntax_Syntax.args ->
          FStar_Syntax_Syntax.term FStar_Pervasives_Native.option
    ;
  interpretation_nbe:
    FStar_TypeChecker_NBETerm.nbe_cbs ->
      FStar_TypeChecker_NBETerm.args ->
        FStar_TypeChecker_NBETerm.t FStar_Pervasives_Native.option
    }
let (__proj__Mkprimitive_step__item__name :
  primitive_step -> FStar_Ident.lid) =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> name
let (__proj__Mkprimitive_step__item__arity : primitive_step -> Prims.int) =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> arity
let (__proj__Mkprimitive_step__item__univ_arity :
  primitive_step -> Prims.int) =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> univ_arity
let (__proj__Mkprimitive_step__item__auto_reflect :
  primitive_step -> Prims.int FStar_Pervasives_Native.option) =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> auto_reflect
let (__proj__Mkprimitive_step__item__strong_reduction_ok :
  primitive_step -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> strong_reduction_ok
let (__proj__Mkprimitive_step__item__requires_binder_substitution :
  primitive_step -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> requires_binder_substitution
let (__proj__Mkprimitive_step__item__interpretation :
  primitive_step ->
    psc ->
      FStar_Syntax_Embeddings.norm_cb ->
        FStar_Syntax_Syntax.args ->
          FStar_Syntax_Syntax.term FStar_Pervasives_Native.option)
  =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> interpretation
let (__proj__Mkprimitive_step__item__interpretation_nbe :
  primitive_step ->
    FStar_TypeChecker_NBETerm.nbe_cbs ->
      FStar_TypeChecker_NBETerm.args ->
        FStar_TypeChecker_NBETerm.t FStar_Pervasives_Native.option)
  =
  fun projectee ->
    match projectee with
    | { name; arity; univ_arity; auto_reflect; strong_reduction_ok;
        requires_binder_substitution; interpretation; interpretation_nbe;_}
        -> interpretation_nbe
type prim_step_set = primitive_step FStar_Util.psmap
let (empty_prim_steps : unit -> prim_step_set) =
  fun uu____2401 -> FStar_Util.psmap_empty ()
let (add_step :
  primitive_step -> prim_step_set -> primitive_step FStar_Util.psmap) =
  fun s ->
    fun ss ->
      let uu____2414 = FStar_Ident.string_of_lid s.name in
      FStar_Util.psmap_add ss uu____2414 s
let (merge_steps : prim_step_set -> prim_step_set -> prim_step_set) =
  fun s1 -> fun s2 -> FStar_Util.psmap_merge s1 s2
let (add_steps : prim_step_set -> primitive_step Prims.list -> prim_step_set)
  = fun m -> fun l -> FStar_List.fold_right add_step l m
let (prim_from_list : primitive_step Prims.list -> prim_step_set) =
  fun l -> let uu____2448 = empty_prim_steps () in add_steps uu____2448 l
type cfg =
  {
  steps: fsteps ;
  tcenv: FStar_TypeChecker_Env.env ;
  debug: debug_switches ;
  delta_level: FStar_TypeChecker_Env.delta_level Prims.list ;
  primitive_steps: prim_step_set ;
  strong: Prims.bool ;
  memoize_lazy: Prims.bool ;
  normalize_pure_lets: Prims.bool ;
  reifying: Prims.bool }
let (__proj__Mkcfg__item__steps : cfg -> fsteps) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> steps
let (__proj__Mkcfg__item__tcenv : cfg -> FStar_TypeChecker_Env.env) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> tcenv
let (__proj__Mkcfg__item__debug : cfg -> debug_switches) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> debug
let (__proj__Mkcfg__item__delta_level :
  cfg -> FStar_TypeChecker_Env.delta_level Prims.list) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> delta_level
let (__proj__Mkcfg__item__primitive_steps : cfg -> prim_step_set) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> primitive_steps
let (__proj__Mkcfg__item__strong : cfg -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> strong
let (__proj__Mkcfg__item__memoize_lazy : cfg -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> memoize_lazy
let (__proj__Mkcfg__item__normalize_pure_lets : cfg -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> normalize_pure_lets
let (__proj__Mkcfg__item__reifying : cfg -> Prims.bool) =
  fun projectee ->
    match projectee with
    | { steps; tcenv; debug; delta_level; primitive_steps; strong;
        memoize_lazy; normalize_pure_lets; reifying;_} -> reifying
let (cfg_to_string : cfg -> Prims.string) =
  fun cfg1 ->
    let uu____2649 =
      let uu____2652 =
        let uu____2655 =
          let uu____2656 = steps_to_string cfg1.steps in
          FStar_Util.format1 "  steps = %s" uu____2656 in
        [uu____2655; "}"] in
      "{" :: uu____2652 in
    FStar_String.concat "\n" uu____2649
let (cfg_env : cfg -> FStar_TypeChecker_Env.env) = fun cfg1 -> cfg1.tcenv
let (find_prim_step :
  cfg ->
    FStar_Syntax_Syntax.fv -> primitive_step FStar_Pervasives_Native.option)
  =
  fun cfg1 ->
    fun fv ->
      let uu____2674 =
        FStar_Ident.string_of_lid
          (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
      FStar_Util.psmap_try_find cfg1.primitive_steps uu____2674
let (is_prim_step : cfg -> FStar_Syntax_Syntax.fv -> Prims.bool) =
  fun cfg1 ->
    fun fv ->
      let uu____2685 =
        let uu____2688 =
          FStar_Ident.string_of_lid
            (fv.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
        FStar_Util.psmap_try_find cfg1.primitive_steps uu____2688 in
      FStar_Util.is_some uu____2685
let (log : cfg -> (unit -> unit) -> unit) =
  fun cfg1 -> fun f -> if (cfg1.debug).gen then f () else ()
let (log_top : cfg -> (unit -> unit) -> unit) =
  fun cfg1 -> fun f -> if (cfg1.debug).top then f () else ()
let (log_cfg : cfg -> (unit -> unit) -> unit) =
  fun cfg1 -> fun f -> if (cfg1.debug).cfg then f () else ()
let (log_primops : cfg -> (unit -> unit) -> unit) =
  fun cfg1 -> fun f -> if (cfg1.debug).primop then f () else ()
let (log_unfolding : cfg -> (unit -> unit) -> unit) =
  fun cfg1 -> fun f -> if (cfg1.debug).unfolding then f () else ()
let (log_nbe : cfg -> (unit -> unit) -> unit) =
  fun cfg1 -> fun f -> if (cfg1.debug).debug_nbe then f () else ()
let embed_simple :
  'a .
    'a FStar_Syntax_Embeddings.embedding ->
      FStar_Range.range -> 'a -> FStar_Syntax_Syntax.term
  =
  fun emb ->
    fun r ->
      fun x ->
        let uu____2813 = FStar_Syntax_Embeddings.embed emb x in
        uu____2813 r FStar_Pervasives_Native.None
          FStar_Syntax_Embeddings.id_norm_cb
let try_unembed_simple :
  'a .
    'a FStar_Syntax_Embeddings.embedding ->
      FStar_Syntax_Syntax.term -> 'a FStar_Pervasives_Native.option
  =
  fun emb ->
    fun x ->
      let uu____2845 = FStar_Syntax_Embeddings.unembed emb x in
      uu____2845 false FStar_Syntax_Embeddings.id_norm_cb
let (built_in_primitive_steps : primitive_step FStar_Util.psmap) =
  let arg_as_int a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_int) in
  let arg_as_bool a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_bool) in
  let arg_as_char a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_char) in
  let arg_as_string a =
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a)
      (try_unembed_simple FStar_Syntax_Embeddings.e_string) in
  let arg_as_list e a1 =
    let uu____2948 =
      let uu____2957 = FStar_Syntax_Embeddings.e_list e in
      try_unembed_simple uu____2957 in
    FStar_All.pipe_right (FStar_Pervasives_Native.fst a1) uu____2948 in
  let arg_as_bounded_int uu____2987 =
    match uu____2987 with
    | (a, uu____3001) ->
        let uu____3012 = FStar_Syntax_Util.head_and_args' a in
        (match uu____3012 with
         | (hd, args) ->
             let a1 = FStar_Syntax_Util.unlazy_emb a in
             let uu____3056 =
               let uu____3071 =
                 let uu____3072 = FStar_Syntax_Subst.compress hd in
                 uu____3072.FStar_Syntax_Syntax.n in
               (uu____3071, args) in
             (match uu____3056 with
              | (FStar_Syntax_Syntax.Tm_fvar fv1, (arg, uu____3093)::[]) when
                  let uu____3128 =
                    FStar_Ident.string_of_lid
                      (fv1.FStar_Syntax_Syntax.fv_name).FStar_Syntax_Syntax.v in
                  FStar_Util.ends_with uu____3128 "int_to_t" ->
                  let arg1 = FStar_Syntax_Util.unlazy_emb arg in
                  let uu____3130 =
                    let uu____3131 = FStar_Syntax_Subst.compress arg1 in
                    uu____3131.FStar_Syntax_Syntax.n in
                  (match uu____3130 with
                   | FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_int
                       (i, FStar_Pervasives_Native.None)) ->
                       let uu____3151 =
                         let uu____3156 = FStar_BigInt.big_int_of_string i in
                         (fv1, uu____3156) in
                       FStar_Pervasives_Native.Some uu____3151
                   | uu____3161 -> FStar_Pervasives_Native.None)
              | uu____3166 -> FStar_Pervasives_Native.None)) in
  let lift_unary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a1)::[] ->
        let uu____3228 = f a1 in FStar_Pervasives_Native.Some uu____3228
    | uu____3229 -> FStar_Pervasives_Native.None in
  let lift_binary f aopts =
    match aopts with
    | (FStar_Pervasives_Native.Some a0)::(FStar_Pervasives_Native.Some
        a1)::[] ->
        let uu____3285 = f a0 a1 in FStar_Pervasives_Native.Some uu____3285
    | uu____3286 -> FStar_Pervasives_Native.None in
  let unary_op as_a f res norm_cb args =
    let uu____3353 = FStar_List.map as_a args in
    lift_unary (f res.psc_range) uu____3353 in
  let binary_op as_a f res n args =
    let uu____3435 = FStar_List.map as_a args in
    lift_binary (f res.psc_range) uu____3435 in
  let as_primitive_step is_strong uu____3487 =
    match uu____3487 with
    | (l, arity, u_arity, f, f_nbe) ->
        {
          name = l;
          arity;
          univ_arity = u_arity;
          auto_reflect = FStar_Pervasives_Native.None;
          strong_reduction_ok = is_strong;
          requires_binder_substitution = false;
          interpretation = f;
          interpretation_nbe = ((fun _cb -> f_nbe))
        } in
  let unary_int_op f =
    unary_op arg_as_int
      (fun r ->
         fun x ->
           let uu____3586 = f x in
           embed_simple FStar_Syntax_Embeddings.e_int r uu____3586) in
  let binary_int_op f =
    binary_op arg_as_int
      (fun r ->
         fun x ->
           fun y ->
             let uu____3628 = f x y in
             embed_simple FStar_Syntax_Embeddings.e_int r uu____3628) in
  let unary_bool_op f =
    unary_op arg_as_bool
      (fun r ->
         fun x ->
           let uu____3663 = f x in
           embed_simple FStar_Syntax_Embeddings.e_bool r uu____3663) in
  let binary_bool_op f =
    binary_op arg_as_bool
      (fun r ->
         fun x ->
           fun y ->
             let uu____3705 = f x y in
             embed_simple FStar_Syntax_Embeddings.e_bool r uu____3705) in
  let binary_string_op f =
    binary_op arg_as_string
      (fun r ->
         fun x ->
           fun y ->
             let uu____3747 = f x y in
             embed_simple FStar_Syntax_Embeddings.e_string r uu____3747) in
  let mixed_binary_op as_a as_b embed_c f res _norm_cb args =
    match args with
    | a1::b1::[] ->
        let uu____3898 =
          let uu____3907 = as_a a1 in
          let uu____3910 = as_b b1 in (uu____3907, uu____3910) in
        (match uu____3898 with
         | (FStar_Pervasives_Native.Some a2, FStar_Pervasives_Native.Some b2)
             ->
             let uu____3925 =
               let uu____3926 = f res.psc_range a2 b2 in
               embed_c res.psc_range uu____3926 in
             FStar_Pervasives_Native.Some uu____3925
         | uu____3927 -> FStar_Pervasives_Native.None)
    | uu____3936 -> FStar_Pervasives_Native.None in
  let list_of_string' rng s =
    let name l =
      let uu____3956 =
        let uu____3957 =
          FStar_Syntax_Syntax.lid_as_fv l FStar_Syntax_Syntax.delta_constant
            FStar_Pervasives_Native.None in
        FStar_Syntax_Syntax.Tm_fvar uu____3957 in
      FStar_Syntax_Syntax.mk uu____3956 rng in
    let char_t = name FStar_Parser_Const.char_lid in
    let charterm c =
      FStar_Syntax_Syntax.mk
        (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_char c)) rng in
    let uu____3969 =
      let uu____3972 = FStar_String.list_of_string s in
      FStar_List.map charterm uu____3972 in
    FStar_All.pipe_left (FStar_Syntax_Util.mk_list char_t rng) uu____3969 in
  let string_of_list' rng l =
    let s = FStar_String.string_of_list l in FStar_Syntax_Util.exp_string s in
  let string_compare' rng s1 s2 =
    let r = FStar_String.compare s1 s2 in
    let uu____4010 =
      let uu____4011 = FStar_Util.string_of_int r in
      FStar_BigInt.big_int_of_string uu____4011 in
    embed_simple FStar_Syntax_Embeddings.e_int rng uu____4010 in
  let string_concat' psc1 _n args =
    match args with
    | a1::a2::[] ->
        let uu____4096 = arg_as_string a1 in
        (match uu____4096 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____4102 = arg_as_list FStar_Syntax_Embeddings.e_string a2 in
             (match uu____4102 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.concat s1 s2 in
                  let uu____4115 =
                    embed_simple FStar_Syntax_Embeddings.e_string
                      psc1.psc_range r in
                  FStar_Pervasives_Native.Some uu____4115
              | uu____4116 -> FStar_Pervasives_Native.None)
         | uu____4121 -> FStar_Pervasives_Native.None)
    | uu____4124 -> FStar_Pervasives_Native.None in
  let string_split' psc1 _norm_cb args =
    match args with
    | a1::a2::[] ->
        let uu____4205 = arg_as_list FStar_Syntax_Embeddings.e_char a1 in
        (match uu____4205 with
         | FStar_Pervasives_Native.Some s1 ->
             let uu____4217 = arg_as_string a2 in
             (match uu____4217 with
              | FStar_Pervasives_Native.Some s2 ->
                  let r = FStar_String.split s1 s2 in
                  let uu____4226 =
                    let uu____4227 =
                      FStar_Syntax_Embeddings.e_list
                        FStar_Syntax_Embeddings.e_string in
                    embed_simple uu____4227 psc1.psc_range r in
                  FStar_Pervasives_Native.Some uu____4226
              | uu____4234 -> FStar_Pervasives_Native.None)
         | uu____4237 -> FStar_Pervasives_Native.None)
    | uu____4242 -> FStar_Pervasives_Native.None in
  let string_substring' psc1 _norm_cb args =
    match args with
    | a1::a2::a3::[] ->
        let uu____4280 =
          let uu____4293 = arg_as_string a1 in
          let uu____4296 = arg_as_int a2 in
          let uu____4299 = arg_as_int a3 in
          (uu____4293, uu____4296, uu____4299) in
        (match uu____4280 with
         | (FStar_Pervasives_Native.Some s1, FStar_Pervasives_Native.Some n1,
            FStar_Pervasives_Native.Some n2) ->
             let n11 = FStar_BigInt.to_int_fs n1 in
             let n21 = FStar_BigInt.to_int_fs n2 in
             (try
                (fun uu___510_4326 ->
                   match () with
                   | () ->
                       let r = FStar_String.substring s1 n11 n21 in
                       let uu____4330 =
                         embed_simple FStar_Syntax_Embeddings.e_string
                           psc1.psc_range r in
                       FStar_Pervasives_Native.Some uu____4330) ()
              with | uu___509_4332 -> FStar_Pervasives_Native.None)
         | uu____4335 -> FStar_Pervasives_Native.None)
    | uu____4348 -> FStar_Pervasives_Native.None in
  let string_of_int rng i =
    let uu____4362 = FStar_BigInt.string_of_big_int i in
    embed_simple FStar_Syntax_Embeddings.e_string rng uu____4362 in
  let string_of_bool rng b =
    embed_simple FStar_Syntax_Embeddings.e_string rng
      (if b then "true" else "false") in
  let lowercase rng s =
    embed_simple FStar_Syntax_Embeddings.e_string rng
      (FStar_String.lowercase s) in
  let uppercase rng s =
    embed_simple FStar_Syntax_Embeddings.e_string rng
      (FStar_String.uppercase s) in
  let string_index psc1 _norm_cb args =
    match args with
    | a1::a2::[] ->
        let uu____4425 =
          let uu____4434 = arg_as_string a1 in
          let uu____4437 = arg_as_int a2 in (uu____4434, uu____4437) in
        (match uu____4425 with
         | (FStar_Pervasives_Native.Some s, FStar_Pervasives_Native.Some i)
             ->
             (try
                (fun uu___544_4457 ->
                   match () with
                   | () ->
                       let r = FStar_String.index s i in
                       let uu____4461 =
                         embed_simple FStar_Syntax_Embeddings.e_char
                           psc1.psc_range r in
                       FStar_Pervasives_Native.Some uu____4461) ()
              with | uu___543_4463 -> FStar_Pervasives_Native.None)
         | uu____4466 -> FStar_Pervasives_Native.None)
    | uu____4475 -> FStar_Pervasives_Native.None in
  let string_index_of psc1 _norm_cb args =
    match args with
    | a1::a2::[] ->
        let uu____4506 =
          let uu____4515 = arg_as_string a1 in
          let uu____4518 = arg_as_char a2 in (uu____4515, uu____4518) in
        (match uu____4506 with
         | (FStar_Pervasives_Native.Some s, FStar_Pervasives_Native.Some c)
             ->
             (try
                (fun uu___565_4538 ->
                   match () with
                   | () ->
                       let r = FStar_String.index_of s c in
                       let uu____4542 =
                         embed_simple FStar_Syntax_Embeddings.e_int
                           psc1.psc_range r in
                       FStar_Pervasives_Native.Some uu____4542) ()
              with | uu___564_4544 -> FStar_Pervasives_Native.None)
         | uu____4547 -> FStar_Pervasives_Native.None)
    | uu____4556 -> FStar_Pervasives_Native.None in
  let mk_range psc1 _norm_cb args =
    match args with
    | fn::from_line::from_col::to_line::to_col::[] ->
        let uu____4590 =
          let uu____4611 = arg_as_string fn in
          let uu____4614 = arg_as_int from_line in
          let uu____4617 = arg_as_int from_col in
          let uu____4620 = arg_as_int to_line in
          let uu____4623 = arg_as_int to_col in
          (uu____4611, uu____4614, uu____4617, uu____4620, uu____4623) in
        (match uu____4590 with
         | (FStar_Pervasives_Native.Some fn1, FStar_Pervasives_Native.Some
            from_l, FStar_Pervasives_Native.Some from_c,
            FStar_Pervasives_Native.Some to_l, FStar_Pervasives_Native.Some
            to_c) ->
             let r =
               let uu____4654 =
                 let uu____4655 = FStar_BigInt.to_int_fs from_l in
                 let uu____4656 = FStar_BigInt.to_int_fs from_c in
                 FStar_Range.mk_pos uu____4655 uu____4656 in
               let uu____4657 =
                 let uu____4658 = FStar_BigInt.to_int_fs to_l in
                 let uu____4659 = FStar_BigInt.to_int_fs to_c in
                 FStar_Range.mk_pos uu____4658 uu____4659 in
               FStar_Range.mk_range fn1 uu____4654 uu____4657 in
             let uu____4660 =
               embed_simple FStar_Syntax_Embeddings.e_range psc1.psc_range r in
             FStar_Pervasives_Native.Some uu____4660
         | uu____4661 -> FStar_Pervasives_Native.None)
    | uu____4682 -> FStar_Pervasives_Native.None in
  let decidable_eq neg psc1 _norm_cb args =
    let r = psc1.psc_range in
    let tru =
      FStar_Syntax_Syntax.mk
        (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool true)) r in
    let fal =
      FStar_Syntax_Syntax.mk
        (FStar_Syntax_Syntax.Tm_constant (FStar_Const.Const_bool false)) r in
    match args with
    | (_typ, uu____4722)::(a1, uu____4724)::(a2, uu____4726)::[] ->
        let uu____4783 = FStar_Syntax_Util.eq_tm a1 a2 in
        (match uu____4783 with
         | FStar_Syntax_Util.Equal ->
             FStar_Pervasives_Native.Some (if neg then fal else tru)
         | FStar_Syntax_Util.NotEqual ->
             FStar_Pervasives_Native.Some (if neg then tru else fal)
         | uu____4788 -> FStar_Pervasives_Native.None)
    | uu____4789 -> failwith "Unexpected number of arguments" in
  let prims_to_fstar_range_step psc1 _norm_cb args =
    match args with
    | (a1, uu____4831)::[] ->
        let uu____4848 =
          try_unembed_simple FStar_Syntax_Embeddings.e_range a1 in
        (match uu____4848 with
         | FStar_Pervasives_Native.Some r ->
             let uu____4854 =
               embed_simple FStar_Syntax_Embeddings.e_range psc1.psc_range r in
             FStar_Pervasives_Native.Some uu____4854
         | FStar_Pervasives_Native.None -> FStar_Pervasives_Native.None)
    | uu____4855 -> failwith "Unexpected number of arguments" in
  let division_op psc1 _norm_cb args =
    match args with
    | (a1, FStar_Pervasives_Native.None)::(a2, FStar_Pervasives_Native.None)::[]
        ->
        let uu____4926 =
          let uu____4935 =
            try_unembed_simple FStar_Syntax_Embeddings.e_int a1 in
          let uu____4938 =
            try_unembed_simple FStar_Syntax_Embeddings.e_int a2 in
          (uu____4935, uu____4938) in
        (match uu____4926 with
         | (FStar_Pervasives_Native.Some m, FStar_Pervasives_Native.Some n)
             ->
             let uu____4953 =
               let uu____4954 = FStar_BigInt.to_int_fs n in
               uu____4954 <> Prims.int_zero in
             if uu____4953
             then
               let uu____4957 =
                 let uu____4958 = FStar_BigInt.div_big_int m n in
                 embed_simple FStar_Syntax_Embeddings.e_int psc1.psc_range
                   uu____4958 in
               FStar_Pervasives_Native.Some uu____4957
             else FStar_Pervasives_Native.None
         | uu____4960 -> FStar_Pervasives_Native.None)
    | uu____4969 -> failwith "Unexpected number of arguments" in
  let bogus_cbs =
    {
      FStar_TypeChecker_NBETerm.iapp = (fun h -> fun _args -> h);
      FStar_TypeChecker_NBETerm.translate =
        (fun uu____4980 -> failwith "bogus_cbs translate")
    } in
  let basic_ops =
    let uu____5011 =
      let uu____5039 =
        FStar_TypeChecker_NBETerm.unary_int_op
          (fun x -> FStar_BigInt.minus_big_int x) in
      (FStar_Parser_Const.op_Minus, Prims.int_one, Prims.int_zero,
        (unary_int_op (fun x -> FStar_BigInt.minus_big_int x)), uu____5039) in
    let uu____5069 =
      let uu____5099 =
        let uu____5127 =
          FStar_TypeChecker_NBETerm.binary_int_op
            (fun x -> fun y -> FStar_BigInt.add_big_int x y) in
        (FStar_Parser_Const.op_Addition, (Prims.of_int (2)), Prims.int_zero,
          (binary_int_op (fun x -> fun y -> FStar_BigInt.add_big_int x y)),
          uu____5127) in
      let uu____5163 =
        let uu____5193 =
          let uu____5221 =
            FStar_TypeChecker_NBETerm.binary_int_op
              (fun x -> fun y -> FStar_BigInt.sub_big_int x y) in
          (FStar_Parser_Const.op_Subtraction, (Prims.of_int (2)),
            Prims.int_zero,
            (binary_int_op (fun x -> fun y -> FStar_BigInt.sub_big_int x y)),
            uu____5221) in
        let uu____5257 =
          let uu____5287 =
            let uu____5315 =
              FStar_TypeChecker_NBETerm.binary_int_op
                (fun x -> fun y -> FStar_BigInt.mult_big_int x y) in
            (FStar_Parser_Const.op_Multiply, (Prims.of_int (2)),
              Prims.int_zero,
              (binary_int_op
                 (fun x -> fun y -> FStar_BigInt.mult_big_int x y)),
              uu____5315) in
          let uu____5351 =
            let uu____5381 =
              let uu____5411 =
                let uu____5439 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_int
                    (fun x ->
                       fun y ->
                         let uu____5451 = FStar_BigInt.lt_big_int x y in
                         FStar_TypeChecker_NBETerm.embed
                           FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                           uu____5451) in
                (FStar_Parser_Const.op_LT, (Prims.of_int (2)),
                  Prims.int_zero,
                  (binary_op arg_as_int
                     (fun r ->
                        fun x ->
                          fun y ->
                            let uu____5476 = FStar_BigInt.lt_big_int x y in
                            embed_simple FStar_Syntax_Embeddings.e_bool r
                              uu____5476)), uu____5439) in
              let uu____5477 =
                let uu____5507 =
                  let uu____5535 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_int
                      (fun x ->
                         fun y ->
                           let uu____5547 = FStar_BigInt.le_big_int x y in
                           FStar_TypeChecker_NBETerm.embed
                             FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                             uu____5547) in
                  (FStar_Parser_Const.op_LTE, (Prims.of_int (2)),
                    Prims.int_zero,
                    (binary_op arg_as_int
                       (fun r ->
                          fun x ->
                            fun y ->
                              let uu____5572 = FStar_BigInt.le_big_int x y in
                              embed_simple FStar_Syntax_Embeddings.e_bool r
                                uu____5572)), uu____5535) in
                let uu____5573 =
                  let uu____5603 =
                    let uu____5631 =
                      FStar_TypeChecker_NBETerm.binary_op
                        FStar_TypeChecker_NBETerm.arg_as_int
                        (fun x ->
                           fun y ->
                             let uu____5643 = FStar_BigInt.gt_big_int x y in
                             FStar_TypeChecker_NBETerm.embed
                               FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                               uu____5643) in
                    (FStar_Parser_Const.op_GT, (Prims.of_int (2)),
                      Prims.int_zero,
                      (binary_op arg_as_int
                         (fun r ->
                            fun x ->
                              fun y ->
                                let uu____5668 = FStar_BigInt.gt_big_int x y in
                                embed_simple FStar_Syntax_Embeddings.e_bool r
                                  uu____5668)), uu____5631) in
                  let uu____5669 =
                    let uu____5699 =
                      let uu____5727 =
                        FStar_TypeChecker_NBETerm.binary_op
                          FStar_TypeChecker_NBETerm.arg_as_int
                          (fun x ->
                             fun y ->
                               let uu____5739 = FStar_BigInt.ge_big_int x y in
                               FStar_TypeChecker_NBETerm.embed
                                 FStar_TypeChecker_NBETerm.e_bool bogus_cbs
                                 uu____5739) in
                      (FStar_Parser_Const.op_GTE, (Prims.of_int (2)),
                        Prims.int_zero,
                        (binary_op arg_as_int
                           (fun r ->
                              fun x ->
                                fun y ->
                                  let uu____5764 =
                                    FStar_BigInt.ge_big_int x y in
                                  embed_simple FStar_Syntax_Embeddings.e_bool
                                    r uu____5764)), uu____5727) in
                    let uu____5765 =
                      let uu____5795 =
                        let uu____5823 =
                          FStar_TypeChecker_NBETerm.binary_int_op
                            (fun x -> fun y -> FStar_BigInt.mod_big_int x y) in
                        (FStar_Parser_Const.op_Modulus, (Prims.of_int (2)),
                          Prims.int_zero,
                          (binary_int_op
                             (fun x -> fun y -> FStar_BigInt.mod_big_int x y)),
                          uu____5823) in
                      let uu____5859 =
                        let uu____5889 =
                          let uu____5917 =
                            FStar_TypeChecker_NBETerm.unary_bool_op
                              (fun x -> Prims.op_Negation x) in
                          (FStar_Parser_Const.op_Negation, Prims.int_one,
                            Prims.int_zero,
                            (unary_bool_op (fun x -> Prims.op_Negation x)),
                            uu____5917) in
                        let uu____5947 =
                          let uu____5977 =
                            let uu____6005 =
                              FStar_TypeChecker_NBETerm.binary_bool_op
                                (fun x -> fun y -> x && y) in
                            (FStar_Parser_Const.op_And, (Prims.of_int (2)),
                              Prims.int_zero,
                              (binary_bool_op (fun x -> fun y -> x && y)),
                              uu____6005) in
                          let uu____6041 =
                            let uu____6071 =
                              let uu____6099 =
                                FStar_TypeChecker_NBETerm.binary_bool_op
                                  (fun x -> fun y -> x || y) in
                              (FStar_Parser_Const.op_Or, (Prims.of_int (2)),
                                Prims.int_zero,
                                (binary_bool_op (fun x -> fun y -> x || y)),
                                uu____6099) in
                            let uu____6135 =
                              let uu____6165 =
                                let uu____6193 =
                                  FStar_TypeChecker_NBETerm.unary_op
                                    FStar_TypeChecker_NBETerm.arg_as_int
                                    FStar_TypeChecker_NBETerm.string_of_int in
                                (FStar_Parser_Const.string_of_int_lid,
                                  Prims.int_one, Prims.int_zero,
                                  (unary_op arg_as_int string_of_int),
                                  uu____6193) in
                              let uu____6217 =
                                let uu____6247 =
                                  let uu____6275 =
                                    FStar_TypeChecker_NBETerm.unary_op
                                      FStar_TypeChecker_NBETerm.arg_as_bool
                                      FStar_TypeChecker_NBETerm.string_of_bool in
                                  (FStar_Parser_Const.string_of_bool_lid,
                                    Prims.int_one, Prims.int_zero,
                                    (unary_op arg_as_bool string_of_bool),
                                    uu____6275) in
                                let uu____6299 =
                                  let uu____6329 =
                                    let uu____6357 =
                                      FStar_TypeChecker_NBETerm.unary_op
                                        FStar_TypeChecker_NBETerm.arg_as_string
                                        FStar_TypeChecker_NBETerm.list_of_string' in
                                    (FStar_Parser_Const.string_list_of_string_lid,
                                      Prims.int_one, Prims.int_zero,
                                      (unary_op arg_as_string list_of_string'),
                                      uu____6357) in
                                  let uu____6381 =
                                    let uu____6411 =
                                      let uu____6439 =
                                        FStar_TypeChecker_NBETerm.unary_op
                                          (FStar_TypeChecker_NBETerm.arg_as_list
                                             FStar_TypeChecker_NBETerm.e_char)
                                          FStar_TypeChecker_NBETerm.string_of_list' in
                                      (FStar_Parser_Const.string_string_of_list_lid,
                                        Prims.int_one, Prims.int_zero,
                                        (unary_op
                                           (arg_as_list
                                              FStar_Syntax_Embeddings.e_char)
                                           string_of_list'), uu____6439) in
                                    let uu____6467 =
                                      let uu____6497 =
                                        let uu____6527 =
                                          let uu____6557 =
                                            let uu____6585 =
                                              FStar_TypeChecker_NBETerm.binary_string_op
                                                (fun x ->
                                                   fun y ->
                                                     FStar_String.op_Hat x y) in
                                            (FStar_Parser_Const.prims_strcat_lid,
                                              (Prims.of_int (2)),
                                              Prims.int_zero,
                                              (binary_string_op
                                                 (fun x ->
                                                    fun y ->
                                                      FStar_String.op_Hat x y)),
                                              uu____6585) in
                                          let uu____6621 =
                                            let uu____6651 =
                                              let uu____6681 =
                                                let uu____6709 =
                                                  FStar_TypeChecker_NBETerm.binary_op
                                                    FStar_TypeChecker_NBETerm.arg_as_string
                                                    FStar_TypeChecker_NBETerm.string_compare' in
                                                (FStar_Parser_Const.string_compare_lid,
                                                  (Prims.of_int (2)),
                                                  Prims.int_zero,
                                                  (binary_op arg_as_string
                                                     string_compare'),
                                                  uu____6709) in
                                              let uu____6733 =
                                                let uu____6763 =
                                                  let uu____6791 =
                                                    FStar_TypeChecker_NBETerm.unary_op
                                                      FStar_TypeChecker_NBETerm.arg_as_string
                                                      FStar_TypeChecker_NBETerm.string_lowercase in
                                                  (FStar_Parser_Const.string_lowercase_lid,
                                                    Prims.int_one,
                                                    Prims.int_zero,
                                                    (unary_op arg_as_string
                                                       lowercase),
                                                    uu____6791) in
                                                let uu____6815 =
                                                  let uu____6845 =
                                                    let uu____6873 =
                                                      FStar_TypeChecker_NBETerm.unary_op
                                                        FStar_TypeChecker_NBETerm.arg_as_string
                                                        FStar_TypeChecker_NBETerm.string_uppercase in
                                                    (FStar_Parser_Const.string_uppercase_lid,
                                                      Prims.int_one,
                                                      Prims.int_zero,
                                                      (unary_op arg_as_string
                                                         uppercase),
                                                      uu____6873) in
                                                  let uu____6897 =
                                                    let uu____6927 =
                                                      let uu____6957 =
                                                        let uu____6987 =
                                                          let uu____7017 =
                                                            let uu____7047 =
                                                              let uu____7077
                                                                =
                                                                let uu____7105
                                                                  =
                                                                  FStar_Parser_Const.p2l
                                                                    ["Prims";
                                                                    "mk_range"] in
                                                                (uu____7105,
                                                                  (Prims.of_int (5)),
                                                                  Prims.int_zero,
                                                                  mk_range,
                                                                  FStar_TypeChecker_NBETerm.mk_range) in
                                                              let uu____7123
                                                                =
                                                                let uu____7153
                                                                  =
                                                                  let uu____7181
                                                                    =
                                                                    FStar_Parser_Const.p2l
                                                                    ["FStar";
                                                                    "Range";
                                                                    "prims_to_fstar_range"] in
                                                                  (uu____7181,
                                                                    Prims.int_one,
                                                                    Prims.int_zero,
                                                                    prims_to_fstar_range_step,
                                                                    FStar_TypeChecker_NBETerm.prims_to_fstar_range_step) in
                                                                [uu____7153] in
                                                              uu____7077 ::
                                                                uu____7123 in
                                                            (FStar_Parser_Const.op_notEq,
                                                              (Prims.of_int (3)),
                                                              Prims.int_zero,
                                                              (decidable_eq
                                                                 true),
                                                              (FStar_TypeChecker_NBETerm.decidable_eq
                                                                 true))
                                                              :: uu____7047 in
                                                          (FStar_Parser_Const.op_Eq,
                                                            (Prims.of_int (3)),
                                                            Prims.int_zero,
                                                            (decidable_eq
                                                               false),
                                                            (FStar_TypeChecker_NBETerm.decidable_eq
                                                               false))
                                                            :: uu____7017 in
                                                        (FStar_Parser_Const.string_sub_lid,
                                                          (Prims.of_int (3)),
                                                          Prims.int_zero,
                                                          string_substring',
                                                          FStar_TypeChecker_NBETerm.string_substring')
                                                          :: uu____6987 in
                                                      (FStar_Parser_Const.string_index_of_lid,
                                                        (Prims.of_int (2)),
                                                        Prims.int_zero,
                                                        string_index_of,
                                                        FStar_TypeChecker_NBETerm.string_index_of)
                                                        :: uu____6957 in
                                                    (FStar_Parser_Const.string_index_lid,
                                                      (Prims.of_int (2)),
                                                      Prims.int_zero,
                                                      string_index,
                                                      FStar_TypeChecker_NBETerm.string_index)
                                                      :: uu____6927 in
                                                  uu____6845 :: uu____6897 in
                                                uu____6763 :: uu____6815 in
                                              uu____6681 :: uu____6733 in
                                            (FStar_Parser_Const.string_concat_lid,
                                              (Prims.of_int (2)),
                                              Prims.int_zero, string_concat',
                                              FStar_TypeChecker_NBETerm.string_concat')
                                              :: uu____6651 in
                                          uu____6557 :: uu____6621 in
                                        (FStar_Parser_Const.string_split_lid,
                                          (Prims.of_int (2)), Prims.int_zero,
                                          string_split',
                                          FStar_TypeChecker_NBETerm.string_split')
                                          :: uu____6527 in
                                      (FStar_Parser_Const.string_make_lid,
                                        (Prims.of_int (2)), Prims.int_zero,
                                        (mixed_binary_op arg_as_int
                                           arg_as_char
                                           (embed_simple
                                              FStar_Syntax_Embeddings.e_string)
                                           (fun r ->
                                              fun x ->
                                                fun y ->
                                                  let uu____7747 =
                                                    FStar_BigInt.to_int_fs x in
                                                  FStar_String.make
                                                    uu____7747 y)),
                                        (FStar_TypeChecker_NBETerm.mixed_binary_op
                                           FStar_TypeChecker_NBETerm.arg_as_int
                                           FStar_TypeChecker_NBETerm.arg_as_char
                                           (FStar_TypeChecker_NBETerm.embed
                                              FStar_TypeChecker_NBETerm.e_string
                                              bogus_cbs)
                                           (fun x ->
                                              fun y ->
                                                let uu____7753 =
                                                  FStar_BigInt.to_int_fs x in
                                                FStar_String.make uu____7753
                                                  y)))
                                        :: uu____6497 in
                                    uu____6411 :: uu____6467 in
                                  uu____6329 :: uu____6381 in
                                uu____6247 :: uu____6299 in
                              uu____6165 :: uu____6217 in
                            uu____6071 :: uu____6135 in
                          uu____5977 :: uu____6041 in
                        uu____5889 :: uu____5947 in
                      uu____5795 :: uu____5859 in
                    uu____5699 :: uu____5765 in
                  uu____5603 :: uu____5669 in
                uu____5507 :: uu____5573 in
              uu____5411 :: uu____5477 in
            (FStar_Parser_Const.op_Division, (Prims.of_int (2)),
              Prims.int_zero, division_op,
              FStar_TypeChecker_NBETerm.division_op) :: uu____5381 in
          uu____5287 :: uu____5351 in
        uu____5193 :: uu____5257 in
      uu____5099 :: uu____5163 in
    uu____5011 :: uu____5069 in
  let weak_ops = [] in
  let bounded_arith_ops =
    let bounded_signed_int_types = ["Int8"; "Int16"; "Int32"; "Int64"] in
    let bounded_unsigned_int_types =
      ["UInt8"; "UInt16"; "UInt32"; "UInt64"; "UInt128"] in
    let int_as_bounded r int_to_t n =
      let c = embed_simple FStar_Syntax_Embeddings.e_int r n in
      let int_to_t1 = FStar_Syntax_Syntax.fv_to_tm int_to_t in
      let uu____8341 =
        let uu____8342 = FStar_Syntax_Syntax.as_arg c in [uu____8342] in
      FStar_Syntax_Syntax.mk_Tm_app int_to_t1 uu____8341 r in
    let add_sub_mul_v =
      FStar_All.pipe_right
        (FStar_List.append bounded_signed_int_types
           bounded_unsigned_int_types)
        (FStar_List.collect
           (fun m ->
              let uu____8459 =
                let uu____8487 = FStar_Parser_Const.p2l ["FStar"; m; "add"] in
                let uu____8488 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_bounded_int
                    (fun uu____8506 ->
                       fun uu____8507 ->
                         match (uu____8506, uu____8507) with
                         | ((int_to_t, x), (uu____8526, y)) ->
                             let uu____8536 = FStar_BigInt.add_big_int x y in
                             FStar_TypeChecker_NBETerm.int_as_bounded
                               int_to_t uu____8536) in
                (uu____8487, (Prims.of_int (2)), Prims.int_zero,
                  (binary_op arg_as_bounded_int
                     (fun r ->
                        fun uu____8567 ->
                          fun uu____8568 ->
                            match (uu____8567, uu____8568) with
                            | ((int_to_t, x), (uu____8587, y)) ->
                                let uu____8597 = FStar_BigInt.add_big_int x y in
                                int_as_bounded r int_to_t uu____8597)),
                  uu____8488) in
              let uu____8598 =
                let uu____8628 =
                  let uu____8656 = FStar_Parser_Const.p2l ["FStar"; m; "sub"] in
                  let uu____8657 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_bounded_int
                      (fun uu____8675 ->
                         fun uu____8676 ->
                           match (uu____8675, uu____8676) with
                           | ((int_to_t, x), (uu____8695, y)) ->
                               let uu____8705 = FStar_BigInt.sub_big_int x y in
                               FStar_TypeChecker_NBETerm.int_as_bounded
                                 int_to_t uu____8705) in
                  (uu____8656, (Prims.of_int (2)), Prims.int_zero,
                    (binary_op arg_as_bounded_int
                       (fun r ->
                          fun uu____8736 ->
                            fun uu____8737 ->
                              match (uu____8736, uu____8737) with
                              | ((int_to_t, x), (uu____8756, y)) ->
                                  let uu____8766 =
                                    FStar_BigInt.sub_big_int x y in
                                  int_as_bounded r int_to_t uu____8766)),
                    uu____8657) in
                let uu____8767 =
                  let uu____8797 =
                    let uu____8825 =
                      FStar_Parser_Const.p2l ["FStar"; m; "mul"] in
                    let uu____8826 =
                      FStar_TypeChecker_NBETerm.binary_op
                        FStar_TypeChecker_NBETerm.arg_as_bounded_int
                        (fun uu____8844 ->
                           fun uu____8845 ->
                             match (uu____8844, uu____8845) with
                             | ((int_to_t, x), (uu____8864, y)) ->
                                 let uu____8874 =
                                   FStar_BigInt.mult_big_int x y in
                                 FStar_TypeChecker_NBETerm.int_as_bounded
                                   int_to_t uu____8874) in
                    (uu____8825, (Prims.of_int (2)), Prims.int_zero,
                      (binary_op arg_as_bounded_int
                         (fun r ->
                            fun uu____8905 ->
                              fun uu____8906 ->
                                match (uu____8905, uu____8906) with
                                | ((int_to_t, x), (uu____8925, y)) ->
                                    let uu____8935 =
                                      FStar_BigInt.mult_big_int x y in
                                    int_as_bounded r int_to_t uu____8935)),
                      uu____8826) in
                  let uu____8936 =
                    let uu____8966 =
                      let uu____8994 =
                        FStar_Parser_Const.p2l ["FStar"; m; "v"] in
                      let uu____8995 =
                        FStar_TypeChecker_NBETerm.unary_op
                          FStar_TypeChecker_NBETerm.arg_as_bounded_int
                          (fun uu____9009 ->
                             match uu____9009 with
                             | (int_to_t, x) ->
                                 FStar_TypeChecker_NBETerm.embed
                                   FStar_TypeChecker_NBETerm.e_int bogus_cbs
                                   x) in
                      (uu____8994, Prims.int_one, Prims.int_zero,
                        (unary_op arg_as_bounded_int
                           (fun r ->
                              fun uu____9042 ->
                                match uu____9042 with
                                | (int_to_t, x) ->
                                    embed_simple
                                      FStar_Syntax_Embeddings.e_int r x)),
                        uu____8995) in
                    [uu____8966] in
                  uu____8797 :: uu____8936 in
                uu____8628 :: uu____8767 in
              uu____8459 :: uu____8598)) in
    let div_mod_unsigned =
      FStar_All.pipe_right bounded_unsigned_int_types
        (FStar_List.collect
           (fun m ->
              let uu____9276 =
                let uu____9304 = FStar_Parser_Const.p2l ["FStar"; m; "div"] in
                let uu____9305 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_bounded_int
                    (fun uu____9323 ->
                       fun uu____9324 ->
                         match (uu____9323, uu____9324) with
                         | ((int_to_t, x), (uu____9343, y)) ->
                             let uu____9353 = FStar_BigInt.div_big_int x y in
                             FStar_TypeChecker_NBETerm.int_as_bounded
                               int_to_t uu____9353) in
                (uu____9304, (Prims.of_int (2)), Prims.int_zero,
                  (binary_op arg_as_bounded_int
                     (fun r ->
                        fun uu____9384 ->
                          fun uu____9385 ->
                            match (uu____9384, uu____9385) with
                            | ((int_to_t, x), (uu____9404, y)) ->
                                let uu____9414 = FStar_BigInt.div_big_int x y in
                                int_as_bounded r int_to_t uu____9414)),
                  uu____9305) in
              let uu____9415 =
                let uu____9445 =
                  let uu____9473 = FStar_Parser_Const.p2l ["FStar"; m; "rem"] in
                  let uu____9474 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_bounded_int
                      (fun uu____9492 ->
                         fun uu____9493 ->
                           match (uu____9492, uu____9493) with
                           | ((int_to_t, x), (uu____9512, y)) ->
                               let uu____9522 = FStar_BigInt.mod_big_int x y in
                               FStar_TypeChecker_NBETerm.int_as_bounded
                                 int_to_t uu____9522) in
                  (uu____9473, (Prims.of_int (2)), Prims.int_zero,
                    (binary_op arg_as_bounded_int
                       (fun r ->
                          fun uu____9553 ->
                            fun uu____9554 ->
                              match (uu____9553, uu____9554) with
                              | ((int_to_t, x), (uu____9573, y)) ->
                                  let uu____9583 =
                                    FStar_BigInt.mod_big_int x y in
                                  int_as_bounded r int_to_t uu____9583)),
                    uu____9474) in
                [uu____9445] in
              uu____9276 :: uu____9415)) in
    let mask m =
      match m with
      | "UInt8" -> FStar_BigInt.of_hex "ff"
      | "UInt16" -> FStar_BigInt.of_hex "ffff"
      | "UInt32" -> FStar_BigInt.of_hex "ffffffff"
      | "UInt64" -> FStar_BigInt.of_hex "ffffffffffffffff"
      | "UInt128" -> FStar_BigInt.of_hex "ffffffffffffffffffffffffffffffff"
      | uu____9671 ->
          let uu____9672 =
            FStar_Util.format1 "Impossible: bad string on mask: %s\n" m in
          failwith uu____9672 in
    let bitwise =
      FStar_All.pipe_right bounded_unsigned_int_types
        (FStar_List.collect
           (fun m ->
              let uu____9765 =
                let uu____9793 = FStar_Parser_Const.p2l ["FStar"; m; "logor"] in
                let uu____9794 =
                  FStar_TypeChecker_NBETerm.binary_op
                    FStar_TypeChecker_NBETerm.arg_as_bounded_int
                    (fun uu____9812 ->
                       fun uu____9813 ->
                         match (uu____9812, uu____9813) with
                         | ((int_to_t, x), (uu____9832, y)) ->
                             let uu____9842 = FStar_BigInt.logor_big_int x y in
                             FStar_TypeChecker_NBETerm.int_as_bounded
                               int_to_t uu____9842) in
                (uu____9793, (Prims.of_int (2)), Prims.int_zero,
                  (binary_op arg_as_bounded_int
                     (fun r ->
                        fun uu____9873 ->
                          fun uu____9874 ->
                            match (uu____9873, uu____9874) with
                            | ((int_to_t, x), (uu____9893, y)) ->
                                let uu____9903 =
                                  FStar_BigInt.logor_big_int x y in
                                int_as_bounded r int_to_t uu____9903)),
                  uu____9794) in
              let uu____9904 =
                let uu____9934 =
                  let uu____9962 =
                    FStar_Parser_Const.p2l ["FStar"; m; "logand"] in
                  let uu____9963 =
                    FStar_TypeChecker_NBETerm.binary_op
                      FStar_TypeChecker_NBETerm.arg_as_bounded_int
                      (fun uu____9981 ->
                         fun uu____9982 ->
                           match (uu____9981, uu____9982) with
                           | ((int_to_t, x), (uu____10001, y)) ->
                               let uu____10011 =
                                 FStar_BigInt.logand_big_int x y in
                               FStar_TypeChecker_NBETerm.int_as_bounded
                                 int_to_t uu____10011) in
                  (uu____9962, (Prims.of_int (2)), Prims.int_zero,
                    (binary_op arg_as_bounded_int
                       (fun r ->
                          fun uu____10042 ->
                            fun uu____10043 ->
                              match (uu____10042, uu____10043) with
                              | ((int_to_t, x), (uu____10062, y)) ->
                                  let uu____10072 =
                                    FStar_BigInt.logand_big_int x y in
                                  int_as_bounded r int_to_t uu____10072)),
                    uu____9963) in
                let uu____10073 =
                  let uu____10103 =
                    let uu____10131 =
                      FStar_Parser_Const.p2l ["FStar"; m; "logxor"] in
                    let uu____10132 =
                      FStar_TypeChecker_NBETerm.binary_op
                        FStar_TypeChecker_NBETerm.arg_as_bounded_int
                        (fun uu____10150 ->
                           fun uu____10151 ->
                             match (uu____10150, uu____10151) with
                             | ((int_to_t, x), (uu____10170, y)) ->
                                 let uu____10180 =
                                   FStar_BigInt.logxor_big_int x y in
                                 FStar_TypeChecker_NBETerm.int_as_bounded
                                   int_to_t uu____10180) in
                    (uu____10131, (Prims.of_int (2)), Prims.int_zero,
                      (binary_op arg_as_bounded_int
                         (fun r ->
                            fun uu____10211 ->
                              fun uu____10212 ->
                                match (uu____10211, uu____10212) with
                                | ((int_to_t, x), (uu____10231, y)) ->
                                    let uu____10241 =
                                      FStar_BigInt.logxor_big_int x y in
                                    int_as_bounded r int_to_t uu____10241)),
                      uu____10132) in
                  let uu____10242 =
                    let uu____10272 =
                      let uu____10300 =
                        FStar_Parser_Const.p2l ["FStar"; m; "lognot"] in
                      let uu____10301 =
                        FStar_TypeChecker_NBETerm.unary_op
                          FStar_TypeChecker_NBETerm.arg_as_bounded_int
                          (fun uu____10316 ->
                             match uu____10316 with
                             | (int_to_t, x) ->
                                 let uu____10323 =
                                   let uu____10324 =
                                     FStar_BigInt.lognot_big_int x in
                                   let uu____10325 = mask m in
                                   FStar_BigInt.logand_big_int uu____10324
                                     uu____10325 in
                                 FStar_TypeChecker_NBETerm.int_as_bounded
                                   int_to_t uu____10323) in
                      (uu____10300, Prims.int_one, Prims.int_zero,
                        (unary_op arg_as_bounded_int
                           (fun r ->
                              fun uu____10353 ->
                                match uu____10353 with
                                | (int_to_t, x) ->
                                    let uu____10360 =
                                      let uu____10361 =
                                        FStar_BigInt.lognot_big_int x in
                                      let uu____10362 = mask m in
                                      FStar_BigInt.logand_big_int uu____10361
                                        uu____10362 in
                                    int_as_bounded r int_to_t uu____10360)),
                        uu____10301) in
                    let uu____10363 =
                      let uu____10393 =
                        let uu____10421 =
                          FStar_Parser_Const.p2l ["FStar"; m; "shift_left"] in
                        let uu____10422 =
                          FStar_TypeChecker_NBETerm.binary_op
                            FStar_TypeChecker_NBETerm.arg_as_bounded_int
                            (fun uu____10440 ->
                               fun uu____10441 ->
                                 match (uu____10440, uu____10441) with
                                 | ((int_to_t, x), (uu____10460, y)) ->
                                     let uu____10470 =
                                       let uu____10471 =
                                         FStar_BigInt.shift_left_big_int x y in
                                       let uu____10472 = mask m in
                                       FStar_BigInt.logand_big_int
                                         uu____10471 uu____10472 in
                                     FStar_TypeChecker_NBETerm.int_as_bounded
                                       int_to_t uu____10470) in
                        (uu____10421, (Prims.of_int (2)), Prims.int_zero,
                          (binary_op arg_as_bounded_int
                             (fun r ->
                                fun uu____10503 ->
                                  fun uu____10504 ->
                                    match (uu____10503, uu____10504) with
                                    | ((int_to_t, x), (uu____10523, y)) ->
                                        let uu____10533 =
                                          let uu____10534 =
                                            FStar_BigInt.shift_left_big_int x
                                              y in
                                          let uu____10535 = mask m in
                                          FStar_BigInt.logand_big_int
                                            uu____10534 uu____10535 in
                                        int_as_bounded r int_to_t uu____10533)),
                          uu____10422) in
                      let uu____10536 =
                        let uu____10566 =
                          let uu____10594 =
                            FStar_Parser_Const.p2l
                              ["FStar"; m; "shift_right"] in
                          let uu____10595 =
                            FStar_TypeChecker_NBETerm.binary_op
                              FStar_TypeChecker_NBETerm.arg_as_bounded_int
                              (fun uu____10613 ->
                                 fun uu____10614 ->
                                   match (uu____10613, uu____10614) with
                                   | ((int_to_t, x), (uu____10633, y)) ->
                                       let uu____10643 =
                                         FStar_BigInt.shift_right_big_int x y in
                                       FStar_TypeChecker_NBETerm.int_as_bounded
                                         int_to_t uu____10643) in
                          (uu____10594, (Prims.of_int (2)), Prims.int_zero,
                            (binary_op arg_as_bounded_int
                               (fun r ->
                                  fun uu____10674 ->
                                    fun uu____10675 ->
                                      match (uu____10674, uu____10675) with
                                      | ((int_to_t, x), (uu____10694, y)) ->
                                          let uu____10704 =
                                            FStar_BigInt.shift_right_big_int
                                              x y in
                                          int_as_bounded r int_to_t
                                            uu____10704)), uu____10595) in
                        [uu____10566] in
                      uu____10393 :: uu____10536 in
                    uu____10272 :: uu____10363 in
                  uu____10103 :: uu____10242 in
                uu____9934 :: uu____10073 in
              uu____9765 :: uu____9904)) in
    FStar_List.append add_sub_mul_v
      (FStar_List.append div_mod_unsigned bitwise) in
  let strong_steps =
    FStar_List.map (as_primitive_step true)
      (FStar_List.append basic_ops bounded_arith_ops) in
  let weak_steps = FStar_List.map (as_primitive_step false) weak_ops in
  FStar_All.pipe_left prim_from_list
    (FStar_List.append strong_steps weak_steps)
let (equality_ops : primitive_step FStar_Util.psmap) =
  let interp_prop_eq2 psc1 _norm_cb args =
    let r = psc1.psc_range in
    match args with
    | (_typ, uu____11065)::(a1, uu____11067)::(a2, uu____11069)::[] ->
        let uu____11126 = FStar_Syntax_Util.eq_tm a1 a2 in
        (match uu____11126 with
         | FStar_Syntax_Util.Equal ->
             FStar_Pervasives_Native.Some
               (let uu___900_11130 = FStar_Syntax_Util.t_true in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___900_11130.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___900_11130.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual ->
             FStar_Pervasives_Native.Some
               (let uu___903_11132 = FStar_Syntax_Util.t_false in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___903_11132.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___903_11132.FStar_Syntax_Syntax.vars)
                })
         | uu____11133 -> FStar_Pervasives_Native.None)
    | uu____11134 -> failwith "Unexpected number of arguments" in
  let interp_prop_eq3 psc1 _norm_cb args =
    let r = psc1.psc_range in
    match args with
    | (t1, uu____11163)::(t2, uu____11165)::(a1, uu____11167)::(a2,
                                                                uu____11169)::[]
        ->
        let uu____11242 =
          let uu____11243 = FStar_Syntax_Util.eq_tm t1 t2 in
          let uu____11244 = FStar_Syntax_Util.eq_tm a1 a2 in
          FStar_Syntax_Util.eq_inj uu____11243 uu____11244 in
        (match uu____11242 with
         | FStar_Syntax_Util.Equal ->
             FStar_Pervasives_Native.Some
               (let uu___926_11248 = FStar_Syntax_Util.t_true in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___926_11248.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___926_11248.FStar_Syntax_Syntax.vars)
                })
         | FStar_Syntax_Util.NotEqual ->
             FStar_Pervasives_Native.Some
               (let uu___929_11250 = FStar_Syntax_Util.t_false in
                {
                  FStar_Syntax_Syntax.n =
                    (uu___929_11250.FStar_Syntax_Syntax.n);
                  FStar_Syntax_Syntax.pos = r;
                  FStar_Syntax_Syntax.vars =
                    (uu___929_11250.FStar_Syntax_Syntax.vars)
                })
         | uu____11251 -> FStar_Pervasives_Native.None)
    | uu____11252 -> failwith "Unexpected number of arguments" in
  let propositional_equality =
    {
      name = FStar_Parser_Const.eq2_lid;
      arity = (Prims.of_int (3));
      univ_arity = Prims.int_one;
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop_eq2;
      interpretation_nbe =
        (fun _cb -> FStar_TypeChecker_NBETerm.interp_prop_eq2)
    } in
  let hetero_propositional_equality =
    {
      name = FStar_Parser_Const.eq3_lid;
      arity = (Prims.of_int (4));
      univ_arity = (Prims.of_int (2));
      auto_reflect = FStar_Pervasives_Native.None;
      strong_reduction_ok = true;
      requires_binder_substitution = false;
      interpretation = interp_prop_eq3;
      interpretation_nbe =
        (fun _cb -> FStar_TypeChecker_NBETerm.interp_prop_eq3)
    } in
  prim_from_list [propositional_equality; hetero_propositional_equality]
let (primop_time_map : Prims.int FStar_Util.smap) =
  FStar_Util.smap_create (Prims.of_int (50))
let (primop_time_reset : unit -> unit) =
  fun uu____11267 -> FStar_Util.smap_clear primop_time_map
let (primop_time_count : Prims.string -> Prims.int -> unit) =
  fun nm ->
    fun ms ->
      let uu____11278 = FStar_Util.smap_try_find primop_time_map nm in
      match uu____11278 with
      | FStar_Pervasives_Native.None ->
          FStar_Util.smap_add primop_time_map nm ms
      | FStar_Pervasives_Native.Some ms0 ->
          FStar_Util.smap_add primop_time_map nm (ms0 + ms)
let (fixto : Prims.int -> Prims.string -> Prims.string) =
  fun n ->
    fun s ->
      if (FStar_String.length s) < n
      then
        let uu____11292 = FStar_String.make (n - (FStar_String.length s)) 32 in
        FStar_String.op_Hat uu____11292 s
      else s
let (primop_time_report : unit -> Prims.string) =
  fun uu____11298 ->
    let pairs =
      FStar_Util.smap_fold primop_time_map
        (fun nm -> fun ms -> fun rest -> (nm, ms) :: rest) [] in
    let pairs1 =
      FStar_Util.sort_with
        (fun uu____11349 ->
           fun uu____11350 ->
             match (uu____11349, uu____11350) with
             | ((uu____11367, t1), (uu____11369, t2)) -> t1 - t2) pairs in
    FStar_List.fold_right
      (fun uu____11388 ->
         fun rest ->
           match uu____11388 with
           | (nm, ms) ->
               let uu____11396 =
                 let uu____11397 =
                   let uu____11398 = FStar_Util.string_of_int ms in
                   fixto (Prims.of_int (10)) uu____11398 in
                 FStar_Util.format2 "%sms --- %s\n" uu____11397 nm in
               FStar_String.op_Hat uu____11396 rest) pairs1 ""
let (extendable_primops_dirty : Prims.bool FStar_ST.ref) =
  FStar_Util.mk_ref true
type register_prim_step_t = primitive_step -> unit
type retrieve_prim_step_t = unit -> prim_step_set
let (mk_extendable_primop_set :
  unit -> (register_prim_step_t * retrieve_prim_step_t)) =
  fun uu____11417 ->
    let steps =
      let uu____11427 = empty_prim_steps () in FStar_Util.mk_ref uu____11427 in
    let register p =
      FStar_ST.op_Colon_Equals extendable_primops_dirty true;
      (let uu____11441 =
         let uu____11442 = FStar_ST.op_Bang steps in add_step p uu____11442 in
       FStar_ST.op_Colon_Equals steps uu____11441) in
    let retrieve uu____11460 = FStar_ST.op_Bang steps in (register, retrieve)
let (plugins : (register_prim_step_t * retrieve_prim_step_t)) =
  mk_extendable_primop_set ()
let (extra_steps : (register_prim_step_t * retrieve_prim_step_t)) =
  mk_extendable_primop_set ()
let (register_plugin : primitive_step -> unit) =
  fun p -> FStar_Pervasives_Native.fst plugins p
let (retrieve_plugins : unit -> prim_step_set) =
  fun uu____11492 ->
    let uu____11493 = FStar_Options.no_plugins () in
    if uu____11493
    then empty_prim_steps ()
    else FStar_Pervasives_Native.snd plugins ()
let (register_extra_step : primitive_step -> unit) =
  fun p -> FStar_Pervasives_Native.fst extra_steps p
let (retrieve_extra_steps : unit -> prim_step_set) =
  fun uu____11508 -> FStar_Pervasives_Native.snd extra_steps ()
let (cached_steps : unit -> prim_step_set) =
  let memo =
    let uu____11518 = empty_prim_steps () in FStar_Util.mk_ref uu____11518 in
  fun uu____11519 ->
    let uu____11520 = FStar_ST.op_Bang extendable_primops_dirty in
    if uu____11520
    then
      let steps =
        let uu____11528 =
          let uu____11529 = retrieve_plugins () in
          let uu____11530 = retrieve_extra_steps () in
          merge_steps uu____11529 uu____11530 in
        merge_steps built_in_primitive_steps uu____11528 in
      (FStar_ST.op_Colon_Equals memo steps;
       FStar_ST.op_Colon_Equals extendable_primops_dirty false;
       steps)
    else FStar_ST.op_Bang memo
let (add_nbe : fsteps -> fsteps) =
  fun s ->
    let uu____11557 = FStar_Options.use_nbe () in
    if uu____11557
    then
      let uu___982_11558 = s in
      {
        beta = (uu___982_11558.beta);
        iota = (uu___982_11558.iota);
        zeta = (uu___982_11558.zeta);
        zeta_full = (uu___982_11558.zeta_full);
        weak = (uu___982_11558.weak);
        hnf = (uu___982_11558.hnf);
        primops = (uu___982_11558.primops);
        do_not_unfold_pure_lets = (uu___982_11558.do_not_unfold_pure_lets);
        unfold_until = (uu___982_11558.unfold_until);
        unfold_only = (uu___982_11558.unfold_only);
        unfold_fully = (uu___982_11558.unfold_fully);
        unfold_attr = (uu___982_11558.unfold_attr);
        unfold_tac = (uu___982_11558.unfold_tac);
        pure_subterms_within_computations =
          (uu___982_11558.pure_subterms_within_computations);
        simplify = (uu___982_11558.simplify);
        erase_universes = (uu___982_11558.erase_universes);
        allow_unbound_universes = (uu___982_11558.allow_unbound_universes);
        reify_ = (uu___982_11558.reify_);
        compress_uvars = (uu___982_11558.compress_uvars);
        no_full_norm = (uu___982_11558.no_full_norm);
        check_no_uvars = (uu___982_11558.check_no_uvars);
        unmeta = (uu___982_11558.unmeta);
        unascribe = (uu___982_11558.unascribe);
        in_full_norm_request = (uu___982_11558.in_full_norm_request);
        weakly_reduce_scrutinee = (uu___982_11558.weakly_reduce_scrutinee);
        nbe_step = true;
        for_extraction = (uu___982_11558.for_extraction)
      }
    else s
let (config' :
  primitive_step Prims.list ->
    FStar_TypeChecker_Env.step Prims.list -> FStar_TypeChecker_Env.env -> cfg)
  =
  fun psteps ->
    fun s ->
      fun e ->
        let d =
          FStar_All.pipe_right s
            (FStar_List.collect
               (fun uu___0_11592 ->
                  match uu___0_11592 with
                  | FStar_TypeChecker_Env.UnfoldUntil k ->
                      [FStar_TypeChecker_Env.Unfold k]
                  | FStar_TypeChecker_Env.Eager_unfolding ->
                      [FStar_TypeChecker_Env.Eager_unfolding_only]
                  | FStar_TypeChecker_Env.Inlining ->
                      [FStar_TypeChecker_Env.InliningDelta]
                  | uu____11596 -> [])) in
        let d1 =
          match d with
          | [] -> [FStar_TypeChecker_Env.NoDelta]
          | uu____11602 -> d in
        let steps =
          let uu____11606 = to_fsteps s in
          FStar_All.pipe_right uu____11606 add_nbe in
        let psteps1 =
          let uu____11608 = cached_steps () in add_steps uu____11608 psteps in
        let uu____11609 =
          let uu____11610 = FStar_Options.debug_any () in
          if uu____11610
          then
            let uu____11611 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "Norm") in
            let uu____11612 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormTop") in
            let uu____11613 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "NormCfg") in
            let uu____11614 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "Primops") in
            let uu____11615 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "Unfolding") in
            let uu____11616 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "380") in
            let uu____11617 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "WPE") in
            let uu____11618 =
              FStar_TypeChecker_Env.debug e
                (FStar_Options.Other "NormDelayed") in
            let uu____11619 =
              FStar_TypeChecker_Env.debug e
                (FStar_Options.Other "print_normalized_terms") in
            let uu____11620 =
              FStar_TypeChecker_Env.debug e (FStar_Options.Other "NBE") in
            {
              gen = uu____11611;
              top = uu____11612;
              cfg = uu____11613;
              primop = uu____11614;
              unfolding = uu____11615;
              b380 = uu____11616;
              wpe = uu____11617;
              norm_delayed = uu____11618;
              print_normalized = uu____11619;
              debug_nbe = uu____11620
            }
          else no_debug_switches in
        let uu____11622 =
          (Prims.op_Negation steps.pure_subterms_within_computations) ||
            (FStar_Options.normalize_pure_terms_for_extraction ()) in
        {
          steps;
          tcenv = e;
          debug = uu____11609;
          delta_level = d1;
          primitive_steps = psteps1;
          strong = false;
          memoize_lazy = true;
          normalize_pure_lets = uu____11622;
          reifying = false
        }
let (config :
  FStar_TypeChecker_Env.step Prims.list -> FStar_TypeChecker_Env.env -> cfg)
  = fun s -> fun e -> config' [] s e
let (should_reduce_local_let :
  cfg -> FStar_Syntax_Syntax.letbinding -> Prims.bool) =
  fun cfg1 ->
    fun lb ->
      if (cfg1.steps).do_not_unfold_pure_lets
      then false
      else
        (let uu____11648 =
           (cfg1.steps).pure_subterms_within_computations &&
             (FStar_Syntax_Util.has_attribute lb.FStar_Syntax_Syntax.lbattrs
                FStar_Parser_Const.inline_let_attr) in
         if uu____11648
         then true
         else
           (let n =
              FStar_TypeChecker_Env.norm_eff_name cfg1.tcenv
                lb.FStar_Syntax_Syntax.lbeff in
            let uu____11651 =
              (FStar_Syntax_Util.is_pure_effect n) &&
                (cfg1.normalize_pure_lets ||
                   (FStar_Syntax_Util.has_attribute
                      lb.FStar_Syntax_Syntax.lbattrs
                      FStar_Parser_Const.inline_let_attr)) in
            if uu____11651
            then true
            else
              (FStar_Syntax_Util.is_ghost_effect n) &&
                (Prims.op_Negation
                   (cfg1.steps).pure_subterms_within_computations)))