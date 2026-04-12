([pen15-defeasibly-dot] of derived-attribute-rule
   (pos-name pen15-defeasibly-dot-gen362)
   (depends-on declare max_imprisonment_competition_outcome_arrangement_3 competition_outcome_arrangement_lv3 max_imprisonment_competition_outcome_arrangement_3)
   (implies max_imprisonment_competition_outcome_arrangement_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen15] ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ( positive 1 ) ( positive-derivator pen15 $? ) ) ( test ( eq ( class ?gen324 ) max_imprisonment_competition_outcome_arrangement_3 ) ) ( not ( and ?gen331 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen330 & : ( >= ?gen330 1 ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( negative ~ 2 ) ( positive-overruled $?gen326 & : ( not ( member$ pen15 $?gen326 ) ) ) ) ) ) => ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( positive 0 ) )"))

([pen15-defeasibly] of derived-attribute-rule
   (pos-name pen15-defeasibly-gen364)
   (depends-on declare competition_outcome_arrangement_lv3 max_imprisonment_competition_outcome_arrangement_3)
   (implies max_imprisonment_competition_outcome_arrangement_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen15] ) ) ) ?gen331 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen330 & : ( >= ?gen330 1 ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen326 & : ( not ( member$ pen15 $?gen326 ) ) ) ) ( test ( eq ( class ?gen324 ) max_imprisonment_competition_outcome_arrangement_3 ) ) => ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( positive 1 ) ( positive-derivator pen15 ?gen331 ) )"))

([pen15-overruled-dot] of derived-attribute-rule
   (pos-name pen15-overruled-dot-gen366)
   (depends-on declare max_imprisonment_competition_outcome_arrangement_3 competition_outcome_arrangement_lv3 max_imprisonment_competition_outcome_arrangement_3)
   (implies max_imprisonment_competition_outcome_arrangement_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen15] ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ( negative-support $?gen327 ) ( negative-overruled $?gen328 & : ( subseq-pos ( create$ pen15-overruled $?gen327 $$$ $?gen328 ) ) ) ) ( test ( eq ( class ?gen324 ) max_imprisonment_competition_outcome_arrangement_3 ) ) ( not ( and ?gen331 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen330 & : ( >= ?gen330 1 ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( positive-defeated $?gen326 & : ( not ( member$ pen15 $?gen326 ) ) ) ) ) ) => ( calc ( bind $?gen329 ( delete-member$ $?gen328 ( create$ pen15-overruled $?gen327 ) ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( negative-overruled $?gen329 ) )"))

([pen15-overruled] of derived-attribute-rule
   (pos-name pen15-overruled-gen368)
   (depends-on declare competition_outcome_arrangement_lv3 max_imprisonment_competition_outcome_arrangement_3)
   (implies max_imprisonment_competition_outcome_arrangement_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen15] ) ) ) ?gen331 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen330 & : ( >= ?gen330 1 ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ( negative-support $?gen327 ) ( negative-overruled $?gen328 & : ( not ( subseq-pos ( create$ pen15-overruled $?gen327 $$$ $?gen328 ) ) ) ) ( positive-defeated $?gen326 & : ( not ( member$ pen15 $?gen326 ) ) ) ) ( test ( eq ( class ?gen324 ) max_imprisonment_competition_outcome_arrangement_3 ) ) => ( calc ( bind $?gen329 ( create$ pen15-overruled $?gen327 $?gen328 ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( negative-overruled $?gen329 ) )"))

([pen15-support] of derived-attribute-rule
   (pos-name pen15-support-gen370)
   (depends-on declare competition_outcome_arrangement_lv3 max_imprisonment_competition_outcome_arrangement_3)
   (implies max_imprisonment_competition_outcome_arrangement_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen15] ) ) ) ?gen323 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ( positive-support $?gen326 & : ( not ( subseq-pos ( create$ pen15 ?gen323 $$$ $?gen326 ) ) ) ) ) ( test ( eq ( class ?gen324 ) max_imprisonment_competition_outcome_arrangement_3 ) ) => ( calc ( bind $?gen329 ( create$ pen15 ?gen323 $?gen326 ) ) ) ?gen324 <- ( max_imprisonment_competition_outcome_arrangement_3 ( positive-support $?gen329 ) )"))

([pen14-defeasibly-dot] of derived-attribute-rule
   (pos-name pen14-defeasibly-dot-gen372)
   (depends-on declare min_imprisonment_competition_outcome_arrangement_2 competition_outcome_arrangement_lv3 min_imprisonment_competition_outcome_arrangement_2)
   (implies min_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen14] ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ( positive 1 ) ( positive-derivator pen14 $? ) ) ( test ( eq ( class ?gen315 ) min_imprisonment_competition_outcome_arrangement_2 ) ) ( not ( and ?gen322 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen321 & : ( >= ?gen321 1 ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( negative ~ 2 ) ( positive-overruled $?gen317 & : ( not ( member$ pen14 $?gen317 ) ) ) ) ) ) => ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( positive 0 ) )"))

([pen14-defeasibly] of derived-attribute-rule
   (pos-name pen14-defeasibly-gen374)
   (depends-on declare competition_outcome_arrangement_lv3 min_imprisonment_competition_outcome_arrangement_2)
   (implies min_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen14] ) ) ) ?gen322 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen321 & : ( >= ?gen321 1 ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen317 & : ( not ( member$ pen14 $?gen317 ) ) ) ) ( test ( eq ( class ?gen315 ) min_imprisonment_competition_outcome_arrangement_2 ) ) => ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( positive 1 ) ( positive-derivator pen14 ?gen322 ) )"))

([pen14-overruled-dot] of derived-attribute-rule
   (pos-name pen14-overruled-dot-gen376)
   (depends-on declare min_imprisonment_competition_outcome_arrangement_2 competition_outcome_arrangement_lv3 min_imprisonment_competition_outcome_arrangement_2)
   (implies min_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen14] ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ( negative-support $?gen318 ) ( negative-overruled $?gen319 & : ( subseq-pos ( create$ pen14-overruled $?gen318 $$$ $?gen319 ) ) ) ) ( test ( eq ( class ?gen315 ) min_imprisonment_competition_outcome_arrangement_2 ) ) ( not ( and ?gen322 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen321 & : ( >= ?gen321 1 ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( positive-defeated $?gen317 & : ( not ( member$ pen14 $?gen317 ) ) ) ) ) ) => ( calc ( bind $?gen320 ( delete-member$ $?gen319 ( create$ pen14-overruled $?gen318 ) ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( negative-overruled $?gen320 ) )"))

([pen14-overruled] of derived-attribute-rule
   (pos-name pen14-overruled-gen378)
   (depends-on declare competition_outcome_arrangement_lv3 min_imprisonment_competition_outcome_arrangement_2)
   (implies min_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen14] ) ) ) ?gen322 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen321 & : ( >= ?gen321 1 ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ( negative-support $?gen318 ) ( negative-overruled $?gen319 & : ( not ( subseq-pos ( create$ pen14-overruled $?gen318 $$$ $?gen319 ) ) ) ) ( positive-defeated $?gen317 & : ( not ( member$ pen14 $?gen317 ) ) ) ) ( test ( eq ( class ?gen315 ) min_imprisonment_competition_outcome_arrangement_2 ) ) => ( calc ( bind $?gen320 ( create$ pen14-overruled $?gen318 $?gen319 ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( negative-overruled $?gen320 ) )"))

([pen14-support] of derived-attribute-rule
   (pos-name pen14-support-gen380)
   (depends-on declare competition_outcome_arrangement_lv3 min_imprisonment_competition_outcome_arrangement_2)
   (implies min_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen14] ) ) ) ?gen314 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ( positive-support $?gen317 & : ( not ( subseq-pos ( create$ pen14 ?gen314 $$$ $?gen317 ) ) ) ) ) ( test ( eq ( class ?gen315 ) min_imprisonment_competition_outcome_arrangement_2 ) ) => ( calc ( bind $?gen320 ( create$ pen14 ?gen314 $?gen317 ) ) ) ?gen315 <- ( min_imprisonment_competition_outcome_arrangement_2 ( positive-support $?gen320 ) )"))

([pen13-defeasibly-dot] of derived-attribute-rule
   (pos-name pen13-defeasibly-dot-gen382)
   (depends-on declare max_imprisonment_competition_outcome_arrangement_2 competition_outcome_arrangement_lv2 max_imprisonment_competition_outcome_arrangement_2)
   (implies max_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen13] ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ( positive 1 ) ( positive-derivator pen13 $? ) ) ( test ( eq ( class ?gen306 ) max_imprisonment_competition_outcome_arrangement_2 ) ) ( not ( and ?gen313 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen312 & : ( >= ?gen312 1 ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( negative ~ 2 ) ( positive-overruled $?gen308 & : ( not ( member$ pen13 $?gen308 ) ) ) ) ) ) => ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( positive 0 ) )"))

([pen13-defeasibly] of derived-attribute-rule
   (pos-name pen13-defeasibly-gen384)
   (depends-on declare competition_outcome_arrangement_lv2 max_imprisonment_competition_outcome_arrangement_2)
   (implies max_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen13] ) ) ) ?gen313 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen312 & : ( >= ?gen312 1 ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen308 & : ( not ( member$ pen13 $?gen308 ) ) ) ) ( test ( eq ( class ?gen306 ) max_imprisonment_competition_outcome_arrangement_2 ) ) => ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( positive 1 ) ( positive-derivator pen13 ?gen313 ) )"))

([pen13-overruled-dot] of derived-attribute-rule
   (pos-name pen13-overruled-dot-gen386)
   (depends-on declare max_imprisonment_competition_outcome_arrangement_2 competition_outcome_arrangement_lv2 max_imprisonment_competition_outcome_arrangement_2)
   (implies max_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen13] ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ( negative-support $?gen309 ) ( negative-overruled $?gen310 & : ( subseq-pos ( create$ pen13-overruled $?gen309 $$$ $?gen310 ) ) ) ) ( test ( eq ( class ?gen306 ) max_imprisonment_competition_outcome_arrangement_2 ) ) ( not ( and ?gen313 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen312 & : ( >= ?gen312 1 ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( positive-defeated $?gen308 & : ( not ( member$ pen13 $?gen308 ) ) ) ) ) ) => ( calc ( bind $?gen311 ( delete-member$ $?gen310 ( create$ pen13-overruled $?gen309 ) ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( negative-overruled $?gen311 ) )"))

([pen13-overruled] of derived-attribute-rule
   (pos-name pen13-overruled-gen388)
   (depends-on declare competition_outcome_arrangement_lv2 max_imprisonment_competition_outcome_arrangement_2)
   (implies max_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen13] ) ) ) ?gen313 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen312 & : ( >= ?gen312 1 ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ( negative-support $?gen309 ) ( negative-overruled $?gen310 & : ( not ( subseq-pos ( create$ pen13-overruled $?gen309 $$$ $?gen310 ) ) ) ) ( positive-defeated $?gen308 & : ( not ( member$ pen13 $?gen308 ) ) ) ) ( test ( eq ( class ?gen306 ) max_imprisonment_competition_outcome_arrangement_2 ) ) => ( calc ( bind $?gen311 ( create$ pen13-overruled $?gen309 $?gen310 ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( negative-overruled $?gen311 ) )"))

([pen13-support] of derived-attribute-rule
   (pos-name pen13-support-gen390)
   (depends-on declare competition_outcome_arrangement_lv2 max_imprisonment_competition_outcome_arrangement_2)
   (implies max_imprisonment_competition_outcome_arrangement_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen13] ) ) ) ?gen305 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ( positive-support $?gen308 & : ( not ( subseq-pos ( create$ pen13 ?gen305 $$$ $?gen308 ) ) ) ) ) ( test ( eq ( class ?gen306 ) max_imprisonment_competition_outcome_arrangement_2 ) ) => ( calc ( bind $?gen311 ( create$ pen13 ?gen305 $?gen308 ) ) ) ?gen306 <- ( max_imprisonment_competition_outcome_arrangement_2 ( positive-support $?gen311 ) )"))

([pen12-defeasibly-dot] of derived-attribute-rule
   (pos-name pen12-defeasibly-dot-gen392)
   (depends-on declare min_imprisonment_competition_outcome_arrangement_1 competition_outcome_arrangement_lv2 min_imprisonment_competition_outcome_arrangement_1)
   (implies min_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen12] ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ( positive 1 ) ( positive-derivator pen12 $? ) ) ( test ( eq ( class ?gen297 ) min_imprisonment_competition_outcome_arrangement_1 ) ) ( not ( and ?gen304 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen303 & : ( >= ?gen303 1 ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( negative ~ 2 ) ( positive-overruled $?gen299 & : ( not ( member$ pen12 $?gen299 ) ) ) ) ) ) => ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( positive 0 ) )"))

([pen12-defeasibly] of derived-attribute-rule
   (pos-name pen12-defeasibly-gen394)
   (depends-on declare competition_outcome_arrangement_lv2 min_imprisonment_competition_outcome_arrangement_1)
   (implies min_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen12] ) ) ) ?gen304 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen303 & : ( >= ?gen303 1 ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen299 & : ( not ( member$ pen12 $?gen299 ) ) ) ) ( test ( eq ( class ?gen297 ) min_imprisonment_competition_outcome_arrangement_1 ) ) => ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( positive 1 ) ( positive-derivator pen12 ?gen304 ) )"))

([pen12-overruled-dot] of derived-attribute-rule
   (pos-name pen12-overruled-dot-gen396)
   (depends-on declare min_imprisonment_competition_outcome_arrangement_1 competition_outcome_arrangement_lv2 min_imprisonment_competition_outcome_arrangement_1)
   (implies min_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen12] ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ( negative-support $?gen300 ) ( negative-overruled $?gen301 & : ( subseq-pos ( create$ pen12-overruled $?gen300 $$$ $?gen301 ) ) ) ) ( test ( eq ( class ?gen297 ) min_imprisonment_competition_outcome_arrangement_1 ) ) ( not ( and ?gen304 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen303 & : ( >= ?gen303 1 ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( positive-defeated $?gen299 & : ( not ( member$ pen12 $?gen299 ) ) ) ) ) ) => ( calc ( bind $?gen302 ( delete-member$ $?gen301 ( create$ pen12-overruled $?gen300 ) ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( negative-overruled $?gen302 ) )"))

([pen12-overruled] of derived-attribute-rule
   (pos-name pen12-overruled-gen398)
   (depends-on declare competition_outcome_arrangement_lv2 min_imprisonment_competition_outcome_arrangement_1)
   (implies min_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen12] ) ) ) ?gen304 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen303 & : ( >= ?gen303 1 ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ( negative-support $?gen300 ) ( negative-overruled $?gen301 & : ( not ( subseq-pos ( create$ pen12-overruled $?gen300 $$$ $?gen301 ) ) ) ) ( positive-defeated $?gen299 & : ( not ( member$ pen12 $?gen299 ) ) ) ) ( test ( eq ( class ?gen297 ) min_imprisonment_competition_outcome_arrangement_1 ) ) => ( calc ( bind $?gen302 ( create$ pen12-overruled $?gen300 $?gen301 ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( negative-overruled $?gen302 ) )"))

([pen12-support] of derived-attribute-rule
   (pos-name pen12-support-gen400)
   (depends-on declare competition_outcome_arrangement_lv2 min_imprisonment_competition_outcome_arrangement_1)
   (implies min_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen12] ) ) ) ?gen296 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ( positive-support $?gen299 & : ( not ( subseq-pos ( create$ pen12 ?gen296 $$$ $?gen299 ) ) ) ) ) ( test ( eq ( class ?gen297 ) min_imprisonment_competition_outcome_arrangement_1 ) ) => ( calc ( bind $?gen302 ( create$ pen12 ?gen296 $?gen299 ) ) ) ?gen297 <- ( min_imprisonment_competition_outcome_arrangement_1 ( positive-support $?gen302 ) )"))

([pen11-defeasibly-dot] of derived-attribute-rule
   (pos-name pen11-defeasibly-dot-gen402)
   (depends-on declare max_imprisonment_competition_outcome_arrangement_1 competition_outcome_arrangement_lv1 max_imprisonment_competition_outcome_arrangement_1)
   (implies max_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen11] ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ( positive 1 ) ( positive-derivator pen11 $? ) ) ( test ( eq ( class ?gen288 ) max_imprisonment_competition_outcome_arrangement_1 ) ) ( not ( and ?gen295 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive ?gen294 & : ( >= ?gen294 1 ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( negative ~ 2 ) ( positive-overruled $?gen290 & : ( not ( member$ pen11 $?gen290 ) ) ) ) ) ) => ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( positive 0 ) )"))

([pen11-defeasibly] of derived-attribute-rule
   (pos-name pen11-defeasibly-gen404)
   (depends-on declare competition_outcome_arrangement_lv1 max_imprisonment_competition_outcome_arrangement_1)
   (implies max_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen11] ) ) ) ?gen295 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive ?gen294 & : ( >= ?gen294 1 ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen290 & : ( not ( member$ pen11 $?gen290 ) ) ) ) ( test ( eq ( class ?gen288 ) max_imprisonment_competition_outcome_arrangement_1 ) ) => ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( positive 1 ) ( positive-derivator pen11 ?gen295 ) )"))

([pen11-overruled-dot] of derived-attribute-rule
   (pos-name pen11-overruled-dot-gen406)
   (depends-on declare max_imprisonment_competition_outcome_arrangement_1 competition_outcome_arrangement_lv1 max_imprisonment_competition_outcome_arrangement_1)
   (implies max_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen11] ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ( negative-support $?gen291 ) ( negative-overruled $?gen292 & : ( subseq-pos ( create$ pen11-overruled $?gen291 $$$ $?gen292 ) ) ) ) ( test ( eq ( class ?gen288 ) max_imprisonment_competition_outcome_arrangement_1 ) ) ( not ( and ?gen295 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive ?gen294 & : ( >= ?gen294 1 ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( positive-defeated $?gen290 & : ( not ( member$ pen11 $?gen290 ) ) ) ) ) ) => ( calc ( bind $?gen293 ( delete-member$ $?gen292 ( create$ pen11-overruled $?gen291 ) ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( negative-overruled $?gen293 ) )"))

([pen11-overruled] of derived-attribute-rule
   (pos-name pen11-overruled-gen408)
   (depends-on declare competition_outcome_arrangement_lv1 max_imprisonment_competition_outcome_arrangement_1)
   (implies max_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen11] ) ) ) ?gen295 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive ?gen294 & : ( >= ?gen294 1 ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ( negative-support $?gen291 ) ( negative-overruled $?gen292 & : ( not ( subseq-pos ( create$ pen11-overruled $?gen291 $$$ $?gen292 ) ) ) ) ( positive-defeated $?gen290 & : ( not ( member$ pen11 $?gen290 ) ) ) ) ( test ( eq ( class ?gen288 ) max_imprisonment_competition_outcome_arrangement_1 ) ) => ( calc ( bind $?gen293 ( create$ pen11-overruled $?gen291 $?gen292 ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( negative-overruled $?gen293 ) )"))

([pen11-support] of derived-attribute-rule
   (pos-name pen11-support-gen410)
   (depends-on declare competition_outcome_arrangement_lv1 max_imprisonment_competition_outcome_arrangement_1)
   (implies max_imprisonment_competition_outcome_arrangement_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen11] ) ) ) ?gen287 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ( positive-support $?gen290 & : ( not ( subseq-pos ( create$ pen11 ?gen287 $$$ $?gen290 ) ) ) ) ) ( test ( eq ( class ?gen288 ) max_imprisonment_competition_outcome_arrangement_1 ) ) => ( calc ( bind $?gen293 ( create$ pen11 ?gen287 $?gen290 ) ) ) ?gen288 <- ( max_imprisonment_competition_outcome_arrangement_1 ( positive-support $?gen293 ) )"))

([pen10-defeasibly-dot] of derived-attribute-rule
   (pos-name pen10-defeasibly-dot-gen412)
   (depends-on declare max_imprisonment_robbery_6 robbery_lv6 max_imprisonment_robbery_6)
   (implies max_imprisonment_robbery_6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen10] ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( value 3 ) ( positive 1 ) ( positive-derivator pen10 $? ) ) ( test ( eq ( class ?gen279 ) max_imprisonment_robbery_6 ) ) ( not ( and ?gen286 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen285 & : ( >= ?gen285 1 ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( negative ~ 2 ) ( positive-overruled $?gen281 & : ( not ( member$ pen10 $?gen281 ) ) ) ) ) ) => ?gen279 <- ( max_imprisonment_robbery_6 ( positive 0 ) )"))

([pen10-defeasibly] of derived-attribute-rule
   (pos-name pen10-defeasibly-gen414)
   (depends-on declare robbery_lv6 max_imprisonment_robbery_6)
   (implies max_imprisonment_robbery_6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen10] ) ) ) ?gen286 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen285 & : ( >= ?gen285 1 ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( value 3 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen281 & : ( not ( member$ pen10 $?gen281 ) ) ) ) ( test ( eq ( class ?gen279 ) max_imprisonment_robbery_6 ) ) => ?gen279 <- ( max_imprisonment_robbery_6 ( positive 1 ) ( positive-derivator pen10 ?gen286 ) )"))

([pen10-overruled-dot] of derived-attribute-rule
   (pos-name pen10-overruled-dot-gen416)
   (depends-on declare max_imprisonment_robbery_6 robbery_lv6 max_imprisonment_robbery_6)
   (implies max_imprisonment_robbery_6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen10] ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( value 3 ) ( negative-support $?gen282 ) ( negative-overruled $?gen283 & : ( subseq-pos ( create$ pen10-overruled $?gen282 $$$ $?gen283 ) ) ) ) ( test ( eq ( class ?gen279 ) max_imprisonment_robbery_6 ) ) ( not ( and ?gen286 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen285 & : ( >= ?gen285 1 ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( positive-defeated $?gen281 & : ( not ( member$ pen10 $?gen281 ) ) ) ) ) ) => ( calc ( bind $?gen284 ( delete-member$ $?gen283 ( create$ pen10-overruled $?gen282 ) ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( negative-overruled $?gen284 ) )"))

([pen10-overruled] of derived-attribute-rule
   (pos-name pen10-overruled-gen418)
   (depends-on declare robbery_lv6 max_imprisonment_robbery_6)
   (implies max_imprisonment_robbery_6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen10] ) ) ) ?gen286 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen285 & : ( >= ?gen285 1 ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( value 3 ) ( negative-support $?gen282 ) ( negative-overruled $?gen283 & : ( not ( subseq-pos ( create$ pen10-overruled $?gen282 $$$ $?gen283 ) ) ) ) ( positive-defeated $?gen281 & : ( not ( member$ pen10 $?gen281 ) ) ) ) ( test ( eq ( class ?gen279 ) max_imprisonment_robbery_6 ) ) => ( calc ( bind $?gen284 ( create$ pen10-overruled $?gen282 $?gen283 ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( negative-overruled $?gen284 ) )"))

([pen10-support] of derived-attribute-rule
   (pos-name pen10-support-gen420)
   (depends-on declare robbery_lv6 max_imprisonment_robbery_6)
   (implies max_imprisonment_robbery_6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen10] ) ) ) ?gen278 <- ( robbery_lv6 ( defendant ?Defendant ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( value 3 ) ( positive-support $?gen281 & : ( not ( subseq-pos ( create$ pen10 ?gen278 $$$ $?gen281 ) ) ) ) ) ( test ( eq ( class ?gen279 ) max_imprisonment_robbery_6 ) ) => ( calc ( bind $?gen284 ( create$ pen10 ?gen278 $?gen281 ) ) ) ?gen279 <- ( max_imprisonment_robbery_6 ( positive-support $?gen284 ) )"))

([pen9-defeasibly-dot] of derived-attribute-rule
   (pos-name pen9-defeasibly-dot-gen422)
   (depends-on declare max_imprisonment_robbery_5 robbery_lv5 max_imprisonment_robbery_5)
   (implies max_imprisonment_robbery_5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen9] ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( value Forever ) ( positive 1 ) ( positive-derivator pen9 $? ) ) ( test ( eq ( class ?gen270 ) max_imprisonment_robbery_5 ) ) ( not ( and ?gen277 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen276 & : ( >= ?gen276 1 ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( negative ~ 2 ) ( positive-overruled $?gen272 & : ( not ( member$ pen9 $?gen272 ) ) ) ) ) ) => ?gen270 <- ( max_imprisonment_robbery_5 ( positive 0 ) )"))

([pen9-defeasibly] of derived-attribute-rule
   (pos-name pen9-defeasibly-gen424)
   (depends-on declare robbery_lv5 max_imprisonment_robbery_5)
   (implies max_imprisonment_robbery_5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen9] ) ) ) ?gen277 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen276 & : ( >= ?gen276 1 ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( value Forever ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen272 & : ( not ( member$ pen9 $?gen272 ) ) ) ) ( test ( eq ( class ?gen270 ) max_imprisonment_robbery_5 ) ) => ?gen270 <- ( max_imprisonment_robbery_5 ( positive 1 ) ( positive-derivator pen9 ?gen277 ) )"))

([pen9-overruled-dot] of derived-attribute-rule
   (pos-name pen9-overruled-dot-gen426)
   (depends-on declare max_imprisonment_robbery_5 robbery_lv5 max_imprisonment_robbery_5)
   (implies max_imprisonment_robbery_5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen9] ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( value Forever ) ( negative-support $?gen273 ) ( negative-overruled $?gen274 & : ( subseq-pos ( create$ pen9-overruled $?gen273 $$$ $?gen274 ) ) ) ) ( test ( eq ( class ?gen270 ) max_imprisonment_robbery_5 ) ) ( not ( and ?gen277 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen276 & : ( >= ?gen276 1 ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( positive-defeated $?gen272 & : ( not ( member$ pen9 $?gen272 ) ) ) ) ) ) => ( calc ( bind $?gen275 ( delete-member$ $?gen274 ( create$ pen9-overruled $?gen273 ) ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( negative-overruled $?gen275 ) )"))

([pen9-overruled] of derived-attribute-rule
   (pos-name pen9-overruled-gen428)
   (depends-on declare robbery_lv5 max_imprisonment_robbery_5)
   (implies max_imprisonment_robbery_5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen9] ) ) ) ?gen277 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen276 & : ( >= ?gen276 1 ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( value Forever ) ( negative-support $?gen273 ) ( negative-overruled $?gen274 & : ( not ( subseq-pos ( create$ pen9-overruled $?gen273 $$$ $?gen274 ) ) ) ) ( positive-defeated $?gen272 & : ( not ( member$ pen9 $?gen272 ) ) ) ) ( test ( eq ( class ?gen270 ) max_imprisonment_robbery_5 ) ) => ( calc ( bind $?gen275 ( create$ pen9-overruled $?gen273 $?gen274 ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( negative-overruled $?gen275 ) )"))

([pen9-support] of derived-attribute-rule
   (pos-name pen9-support-gen430)
   (depends-on declare robbery_lv5 max_imprisonment_robbery_5)
   (implies max_imprisonment_robbery_5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen9] ) ) ) ?gen269 <- ( robbery_lv5 ( defendant ?Defendant ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( value Forever ) ( positive-support $?gen272 & : ( not ( subseq-pos ( create$ pen9 ?gen269 $$$ $?gen272 ) ) ) ) ) ( test ( eq ( class ?gen270 ) max_imprisonment_robbery_5 ) ) => ( calc ( bind $?gen275 ( create$ pen9 ?gen269 $?gen272 ) ) ) ?gen270 <- ( max_imprisonment_robbery_5 ( positive-support $?gen275 ) )"))

([pen8-defeasibly-dot] of derived-attribute-rule
   (pos-name pen8-defeasibly-dot-gen432)
   (depends-on declare min_imprisonment_robbery_4 robbery_lv5 min_imprisonment_robbery_4)
   (implies min_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen8] ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( value 10 ) ( positive 1 ) ( positive-derivator pen8 $? ) ) ( test ( eq ( class ?gen261 ) min_imprisonment_robbery_4 ) ) ( not ( and ?gen268 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen267 & : ( >= ?gen267 1 ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( negative ~ 2 ) ( positive-overruled $?gen263 & : ( not ( member$ pen8 $?gen263 ) ) ) ) ) ) => ?gen261 <- ( min_imprisonment_robbery_4 ( positive 0 ) )"))

([pen8-defeasibly] of derived-attribute-rule
   (pos-name pen8-defeasibly-gen434)
   (depends-on declare robbery_lv5 min_imprisonment_robbery_4)
   (implies min_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen8] ) ) ) ?gen268 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen267 & : ( >= ?gen267 1 ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( value 10 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen263 & : ( not ( member$ pen8 $?gen263 ) ) ) ) ( test ( eq ( class ?gen261 ) min_imprisonment_robbery_4 ) ) => ?gen261 <- ( min_imprisonment_robbery_4 ( positive 1 ) ( positive-derivator pen8 ?gen268 ) )"))

([pen8-overruled-dot] of derived-attribute-rule
   (pos-name pen8-overruled-dot-gen436)
   (depends-on declare min_imprisonment_robbery_4 robbery_lv5 min_imprisonment_robbery_4)
   (implies min_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen8] ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( value 10 ) ( negative-support $?gen264 ) ( negative-overruled $?gen265 & : ( subseq-pos ( create$ pen8-overruled $?gen264 $$$ $?gen265 ) ) ) ) ( test ( eq ( class ?gen261 ) min_imprisonment_robbery_4 ) ) ( not ( and ?gen268 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen267 & : ( >= ?gen267 1 ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( positive-defeated $?gen263 & : ( not ( member$ pen8 $?gen263 ) ) ) ) ) ) => ( calc ( bind $?gen266 ( delete-member$ $?gen265 ( create$ pen8-overruled $?gen264 ) ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( negative-overruled $?gen266 ) )"))

([pen8-overruled] of derived-attribute-rule
   (pos-name pen8-overruled-gen438)
   (depends-on declare robbery_lv5 min_imprisonment_robbery_4)
   (implies min_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen8] ) ) ) ?gen268 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive ?gen267 & : ( >= ?gen267 1 ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( value 10 ) ( negative-support $?gen264 ) ( negative-overruled $?gen265 & : ( not ( subseq-pos ( create$ pen8-overruled $?gen264 $$$ $?gen265 ) ) ) ) ( positive-defeated $?gen263 & : ( not ( member$ pen8 $?gen263 ) ) ) ) ( test ( eq ( class ?gen261 ) min_imprisonment_robbery_4 ) ) => ( calc ( bind $?gen266 ( create$ pen8-overruled $?gen264 $?gen265 ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( negative-overruled $?gen266 ) )"))

([pen8-support] of derived-attribute-rule
   (pos-name pen8-support-gen440)
   (depends-on declare robbery_lv5 min_imprisonment_robbery_4)
   (implies min_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen8] ) ) ) ?gen260 <- ( robbery_lv5 ( defendant ?Defendant ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( value 10 ) ( positive-support $?gen263 & : ( not ( subseq-pos ( create$ pen8 ?gen260 $$$ $?gen263 ) ) ) ) ) ( test ( eq ( class ?gen261 ) min_imprisonment_robbery_4 ) ) => ( calc ( bind $?gen266 ( create$ pen8 ?gen260 $?gen263 ) ) ) ?gen261 <- ( min_imprisonment_robbery_4 ( positive-support $?gen266 ) )"))

([pen7-defeasibly-dot] of derived-attribute-rule
   (pos-name pen7-defeasibly-dot-gen442)
   (depends-on declare max_imprisonment_robbery_4 robbery_lv4 max_imprisonment_robbery_4)
   (implies max_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen7] ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( value 15 ) ( positive 1 ) ( positive-derivator pen7 $? ) ) ( test ( eq ( class ?gen252 ) max_imprisonment_robbery_4 ) ) ( not ( and ?gen259 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen258 & : ( >= ?gen258 1 ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( negative ~ 2 ) ( positive-overruled $?gen254 & : ( not ( member$ pen7 $?gen254 ) ) ) ) ) ) => ?gen252 <- ( max_imprisonment_robbery_4 ( positive 0 ) )"))

([pen7-defeasibly] of derived-attribute-rule
   (pos-name pen7-defeasibly-gen444)
   (depends-on declare robbery_lv4 max_imprisonment_robbery_4)
   (implies max_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen7] ) ) ) ?gen259 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen258 & : ( >= ?gen258 1 ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( value 15 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen254 & : ( not ( member$ pen7 $?gen254 ) ) ) ) ( test ( eq ( class ?gen252 ) max_imprisonment_robbery_4 ) ) => ?gen252 <- ( max_imprisonment_robbery_4 ( positive 1 ) ( positive-derivator pen7 ?gen259 ) )"))

([pen7-overruled-dot] of derived-attribute-rule
   (pos-name pen7-overruled-dot-gen446)
   (depends-on declare max_imprisonment_robbery_4 robbery_lv4 max_imprisonment_robbery_4)
   (implies max_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen7] ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( value 15 ) ( negative-support $?gen255 ) ( negative-overruled $?gen256 & : ( subseq-pos ( create$ pen7-overruled $?gen255 $$$ $?gen256 ) ) ) ) ( test ( eq ( class ?gen252 ) max_imprisonment_robbery_4 ) ) ( not ( and ?gen259 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen258 & : ( >= ?gen258 1 ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( positive-defeated $?gen254 & : ( not ( member$ pen7 $?gen254 ) ) ) ) ) ) => ( calc ( bind $?gen257 ( delete-member$ $?gen256 ( create$ pen7-overruled $?gen255 ) ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( negative-overruled $?gen257 ) )"))

([pen7-overruled] of derived-attribute-rule
   (pos-name pen7-overruled-gen448)
   (depends-on declare robbery_lv4 max_imprisonment_robbery_4)
   (implies max_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen7] ) ) ) ?gen259 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen258 & : ( >= ?gen258 1 ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( value 15 ) ( negative-support $?gen255 ) ( negative-overruled $?gen256 & : ( not ( subseq-pos ( create$ pen7-overruled $?gen255 $$$ $?gen256 ) ) ) ) ( positive-defeated $?gen254 & : ( not ( member$ pen7 $?gen254 ) ) ) ) ( test ( eq ( class ?gen252 ) max_imprisonment_robbery_4 ) ) => ( calc ( bind $?gen257 ( create$ pen7-overruled $?gen255 $?gen256 ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( negative-overruled $?gen257 ) )"))

([pen7-support] of derived-attribute-rule
   (pos-name pen7-support-gen450)
   (depends-on declare robbery_lv4 max_imprisonment_robbery_4)
   (implies max_imprisonment_robbery_4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen7] ) ) ) ?gen251 <- ( robbery_lv4 ( defendant ?Defendant ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( value 15 ) ( positive-support $?gen254 & : ( not ( subseq-pos ( create$ pen7 ?gen251 $$$ $?gen254 ) ) ) ) ) ( test ( eq ( class ?gen252 ) max_imprisonment_robbery_4 ) ) => ( calc ( bind $?gen257 ( create$ pen7 ?gen251 $?gen254 ) ) ) ?gen252 <- ( max_imprisonment_robbery_4 ( positive-support $?gen257 ) )"))

([pen6-defeasibly-dot] of derived-attribute-rule
   (pos-name pen6-defeasibly-dot-gen452)
   (depends-on declare min_imprisonment_robbery_3 robbery_lv4 min_imprisonment_robbery_3)
   (implies min_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen6] ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( value 3 ) ( positive 1 ) ( positive-derivator pen6 $? ) ) ( test ( eq ( class ?gen243 ) min_imprisonment_robbery_3 ) ) ( not ( and ?gen250 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen249 & : ( >= ?gen249 1 ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( negative ~ 2 ) ( positive-overruled $?gen245 & : ( not ( member$ pen6 $?gen245 ) ) ) ) ) ) => ?gen243 <- ( min_imprisonment_robbery_3 ( positive 0 ) )"))

([pen6-defeasibly] of derived-attribute-rule
   (pos-name pen6-defeasibly-gen454)
   (depends-on declare robbery_lv4 min_imprisonment_robbery_3)
   (implies min_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen6] ) ) ) ?gen250 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen249 & : ( >= ?gen249 1 ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( value 3 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen245 & : ( not ( member$ pen6 $?gen245 ) ) ) ) ( test ( eq ( class ?gen243 ) min_imprisonment_robbery_3 ) ) => ?gen243 <- ( min_imprisonment_robbery_3 ( positive 1 ) ( positive-derivator pen6 ?gen250 ) )"))

([pen6-overruled-dot] of derived-attribute-rule
   (pos-name pen6-overruled-dot-gen456)
   (depends-on declare min_imprisonment_robbery_3 robbery_lv4 min_imprisonment_robbery_3)
   (implies min_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen6] ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( value 3 ) ( negative-support $?gen246 ) ( negative-overruled $?gen247 & : ( subseq-pos ( create$ pen6-overruled $?gen246 $$$ $?gen247 ) ) ) ) ( test ( eq ( class ?gen243 ) min_imprisonment_robbery_3 ) ) ( not ( and ?gen250 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen249 & : ( >= ?gen249 1 ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( positive-defeated $?gen245 & : ( not ( member$ pen6 $?gen245 ) ) ) ) ) ) => ( calc ( bind $?gen248 ( delete-member$ $?gen247 ( create$ pen6-overruled $?gen246 ) ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( negative-overruled $?gen248 ) )"))

([pen6-overruled] of derived-attribute-rule
   (pos-name pen6-overruled-gen458)
   (depends-on declare robbery_lv4 min_imprisonment_robbery_3)
   (implies min_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen6] ) ) ) ?gen250 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive ?gen249 & : ( >= ?gen249 1 ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( value 3 ) ( negative-support $?gen246 ) ( negative-overruled $?gen247 & : ( not ( subseq-pos ( create$ pen6-overruled $?gen246 $$$ $?gen247 ) ) ) ) ( positive-defeated $?gen245 & : ( not ( member$ pen6 $?gen245 ) ) ) ) ( test ( eq ( class ?gen243 ) min_imprisonment_robbery_3 ) ) => ( calc ( bind $?gen248 ( create$ pen6-overruled $?gen246 $?gen247 ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( negative-overruled $?gen248 ) )"))

([pen6-support] of derived-attribute-rule
   (pos-name pen6-support-gen460)
   (depends-on declare robbery_lv4 min_imprisonment_robbery_3)
   (implies min_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen6] ) ) ) ?gen242 <- ( robbery_lv4 ( defendant ?Defendant ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( value 3 ) ( positive-support $?gen245 & : ( not ( subseq-pos ( create$ pen6 ?gen242 $$$ $?gen245 ) ) ) ) ) ( test ( eq ( class ?gen243 ) min_imprisonment_robbery_3 ) ) => ( calc ( bind $?gen248 ( create$ pen6 ?gen242 $?gen245 ) ) ) ?gen243 <- ( min_imprisonment_robbery_3 ( positive-support $?gen248 ) )"))

([pen5-defeasibly-dot] of derived-attribute-rule
   (pos-name pen5-defeasibly-dot-gen462)
   (depends-on declare max_imprisonment_robbery_3 robbery_lv3 max_imprisonment_robbery_3)
   (implies max_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen5] ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( value 12 ) ( positive 1 ) ( positive-derivator pen5 $? ) ) ( test ( eq ( class ?gen234 ) max_imprisonment_robbery_3 ) ) ( not ( and ?gen241 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen240 & : ( >= ?gen240 1 ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( negative ~ 2 ) ( positive-overruled $?gen236 & : ( not ( member$ pen5 $?gen236 ) ) ) ) ) ) => ?gen234 <- ( max_imprisonment_robbery_3 ( positive 0 ) )"))

([pen5-defeasibly] of derived-attribute-rule
   (pos-name pen5-defeasibly-gen464)
   (depends-on declare robbery_lv3 max_imprisonment_robbery_3)
   (implies max_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen5] ) ) ) ?gen241 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen240 & : ( >= ?gen240 1 ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( value 12 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen236 & : ( not ( member$ pen5 $?gen236 ) ) ) ) ( test ( eq ( class ?gen234 ) max_imprisonment_robbery_3 ) ) => ?gen234 <- ( max_imprisonment_robbery_3 ( positive 1 ) ( positive-derivator pen5 ?gen241 ) )"))

([pen5-overruled-dot] of derived-attribute-rule
   (pos-name pen5-overruled-dot-gen466)
   (depends-on declare max_imprisonment_robbery_3 robbery_lv3 max_imprisonment_robbery_3)
   (implies max_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen5] ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( value 12 ) ( negative-support $?gen237 ) ( negative-overruled $?gen238 & : ( subseq-pos ( create$ pen5-overruled $?gen237 $$$ $?gen238 ) ) ) ) ( test ( eq ( class ?gen234 ) max_imprisonment_robbery_3 ) ) ( not ( and ?gen241 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen240 & : ( >= ?gen240 1 ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( positive-defeated $?gen236 & : ( not ( member$ pen5 $?gen236 ) ) ) ) ) ) => ( calc ( bind $?gen239 ( delete-member$ $?gen238 ( create$ pen5-overruled $?gen237 ) ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( negative-overruled $?gen239 ) )"))

([pen5-overruled] of derived-attribute-rule
   (pos-name pen5-overruled-gen468)
   (depends-on declare robbery_lv3 max_imprisonment_robbery_3)
   (implies max_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen5] ) ) ) ?gen241 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen240 & : ( >= ?gen240 1 ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( value 12 ) ( negative-support $?gen237 ) ( negative-overruled $?gen238 & : ( not ( subseq-pos ( create$ pen5-overruled $?gen237 $$$ $?gen238 ) ) ) ) ( positive-defeated $?gen236 & : ( not ( member$ pen5 $?gen236 ) ) ) ) ( test ( eq ( class ?gen234 ) max_imprisonment_robbery_3 ) ) => ( calc ( bind $?gen239 ( create$ pen5-overruled $?gen237 $?gen238 ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( negative-overruled $?gen239 ) )"))

([pen5-support] of derived-attribute-rule
   (pos-name pen5-support-gen470)
   (depends-on declare robbery_lv3 max_imprisonment_robbery_3)
   (implies max_imprisonment_robbery_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen5] ) ) ) ?gen233 <- ( robbery_lv3 ( defendant ?Defendant ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( value 12 ) ( positive-support $?gen236 & : ( not ( subseq-pos ( create$ pen5 ?gen233 $$$ $?gen236 ) ) ) ) ) ( test ( eq ( class ?gen234 ) max_imprisonment_robbery_3 ) ) => ( calc ( bind $?gen239 ( create$ pen5 ?gen233 $?gen236 ) ) ) ?gen234 <- ( max_imprisonment_robbery_3 ( positive-support $?gen239 ) )"))

([pen4-defeasibly-dot] of derived-attribute-rule
   (pos-name pen4-defeasibly-dot-gen472)
   (depends-on declare max_imprisonment_robbery_2 robbery_lv2 max_imprisonment_robbery_2)
   (implies max_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen4] ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( value 10 ) ( positive 1 ) ( positive-derivator pen4 $? ) ) ( test ( eq ( class ?gen225 ) max_imprisonment_robbery_2 ) ) ( not ( and ?gen232 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen231 & : ( >= ?gen231 1 ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( negative ~ 2 ) ( positive-overruled $?gen227 & : ( not ( member$ pen4 $?gen227 ) ) ) ) ) ) => ?gen225 <- ( max_imprisonment_robbery_2 ( positive 0 ) )"))

([pen4-defeasibly] of derived-attribute-rule
   (pos-name pen4-defeasibly-gen474)
   (depends-on declare robbery_lv2 max_imprisonment_robbery_2)
   (implies max_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen4] ) ) ) ?gen232 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen231 & : ( >= ?gen231 1 ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( value 10 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen227 & : ( not ( member$ pen4 $?gen227 ) ) ) ) ( test ( eq ( class ?gen225 ) max_imprisonment_robbery_2 ) ) => ?gen225 <- ( max_imprisonment_robbery_2 ( positive 1 ) ( positive-derivator pen4 ?gen232 ) )"))

([pen4-overruled-dot] of derived-attribute-rule
   (pos-name pen4-overruled-dot-gen476)
   (depends-on declare max_imprisonment_robbery_2 robbery_lv2 max_imprisonment_robbery_2)
   (implies max_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen4] ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( value 10 ) ( negative-support $?gen228 ) ( negative-overruled $?gen229 & : ( subseq-pos ( create$ pen4-overruled $?gen228 $$$ $?gen229 ) ) ) ) ( test ( eq ( class ?gen225 ) max_imprisonment_robbery_2 ) ) ( not ( and ?gen232 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen231 & : ( >= ?gen231 1 ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( positive-defeated $?gen227 & : ( not ( member$ pen4 $?gen227 ) ) ) ) ) ) => ( calc ( bind $?gen230 ( delete-member$ $?gen229 ( create$ pen4-overruled $?gen228 ) ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( negative-overruled $?gen230 ) )"))

([pen4-overruled] of derived-attribute-rule
   (pos-name pen4-overruled-gen478)
   (depends-on declare robbery_lv2 max_imprisonment_robbery_2)
   (implies max_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen4] ) ) ) ?gen232 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen231 & : ( >= ?gen231 1 ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( value 10 ) ( negative-support $?gen228 ) ( negative-overruled $?gen229 & : ( not ( subseq-pos ( create$ pen4-overruled $?gen228 $$$ $?gen229 ) ) ) ) ( positive-defeated $?gen227 & : ( not ( member$ pen4 $?gen227 ) ) ) ) ( test ( eq ( class ?gen225 ) max_imprisonment_robbery_2 ) ) => ( calc ( bind $?gen230 ( create$ pen4-overruled $?gen228 $?gen229 ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( negative-overruled $?gen230 ) )"))

([pen4-support] of derived-attribute-rule
   (pos-name pen4-support-gen480)
   (depends-on declare robbery_lv2 max_imprisonment_robbery_2)
   (implies max_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen4] ) ) ) ?gen224 <- ( robbery_lv2 ( defendant ?Defendant ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( value 10 ) ( positive-support $?gen227 & : ( not ( subseq-pos ( create$ pen4 ?gen224 $$$ $?gen227 ) ) ) ) ) ( test ( eq ( class ?gen225 ) max_imprisonment_robbery_2 ) ) => ( calc ( bind $?gen230 ( create$ pen4 ?gen224 $?gen227 ) ) ) ?gen225 <- ( max_imprisonment_robbery_2 ( positive-support $?gen230 ) )"))

([pen3-defeasibly-dot] of derived-attribute-rule
   (pos-name pen3-defeasibly-dot-gen482)
   (depends-on declare min_imprisonment_robbery_2 robbery_min_imprisonment_lv2_3 min_imprisonment_robbery_2)
   (implies min_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen3] ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( value 2 ) ( positive 1 ) ( positive-derivator pen3 $? ) ) ( test ( eq ( class ?gen216 ) min_imprisonment_robbery_2 ) ) ( not ( and ?gen223 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive ?gen222 & : ( >= ?gen222 1 ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( negative ~ 2 ) ( positive-overruled $?gen218 & : ( not ( member$ pen3 $?gen218 ) ) ) ) ) ) => ?gen216 <- ( min_imprisonment_robbery_2 ( positive 0 ) )"))

([pen3-defeasibly] of derived-attribute-rule
   (pos-name pen3-defeasibly-gen484)
   (depends-on declare robbery_min_imprisonment_lv2_3 min_imprisonment_robbery_2)
   (implies min_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen3] ) ) ) ?gen223 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive ?gen222 & : ( >= ?gen222 1 ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( value 2 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen218 & : ( not ( member$ pen3 $?gen218 ) ) ) ) ( test ( eq ( class ?gen216 ) min_imprisonment_robbery_2 ) ) => ?gen216 <- ( min_imprisonment_robbery_2 ( positive 1 ) ( positive-derivator pen3 ?gen223 ) )"))

([pen3-overruled-dot] of derived-attribute-rule
   (pos-name pen3-overruled-dot-gen486)
   (depends-on declare min_imprisonment_robbery_2 robbery_min_imprisonment_lv2_3 min_imprisonment_robbery_2)
   (implies min_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen3] ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( value 2 ) ( negative-support $?gen219 ) ( negative-overruled $?gen220 & : ( subseq-pos ( create$ pen3-overruled $?gen219 $$$ $?gen220 ) ) ) ) ( test ( eq ( class ?gen216 ) min_imprisonment_robbery_2 ) ) ( not ( and ?gen223 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive ?gen222 & : ( >= ?gen222 1 ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( positive-defeated $?gen218 & : ( not ( member$ pen3 $?gen218 ) ) ) ) ) ) => ( calc ( bind $?gen221 ( delete-member$ $?gen220 ( create$ pen3-overruled $?gen219 ) ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( negative-overruled $?gen221 ) )"))

([pen3-overruled] of derived-attribute-rule
   (pos-name pen3-overruled-gen488)
   (depends-on declare robbery_min_imprisonment_lv2_3 min_imprisonment_robbery_2)
   (implies min_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen3] ) ) ) ?gen223 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive ?gen222 & : ( >= ?gen222 1 ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( value 2 ) ( negative-support $?gen219 ) ( negative-overruled $?gen220 & : ( not ( subseq-pos ( create$ pen3-overruled $?gen219 $$$ $?gen220 ) ) ) ) ( positive-defeated $?gen218 & : ( not ( member$ pen3 $?gen218 ) ) ) ) ( test ( eq ( class ?gen216 ) min_imprisonment_robbery_2 ) ) => ( calc ( bind $?gen221 ( create$ pen3-overruled $?gen219 $?gen220 ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( negative-overruled $?gen221 ) )"))

([pen3-support] of derived-attribute-rule
   (pos-name pen3-support-gen490)
   (depends-on declare robbery_min_imprisonment_lv2_3 min_imprisonment_robbery_2)
   (implies min_imprisonment_robbery_2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen3] ) ) ) ?gen215 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( value 2 ) ( positive-support $?gen218 & : ( not ( subseq-pos ( create$ pen3 ?gen215 $$$ $?gen218 ) ) ) ) ) ( test ( eq ( class ?gen216 ) min_imprisonment_robbery_2 ) ) => ( calc ( bind $?gen221 ( create$ pen3 ?gen215 $?gen218 ) ) ) ?gen216 <- ( min_imprisonment_robbery_2 ( positive-support $?gen221 ) )"))

([pen2-defeasibly-dot] of derived-attribute-rule
   (pos-name pen2-defeasibly-dot-gen492)
   (depends-on declare max_imprisonment_robbery_1 robbery_lv1 max_imprisonment_robbery_1)
   (implies max_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen2] ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( value 8 ) ( positive 1 ) ( positive-derivator pen2 $? ) ) ( test ( eq ( class ?gen207 ) max_imprisonment_robbery_1 ) ) ( not ( and ?gen214 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen213 & : ( >= ?gen213 1 ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( negative ~ 2 ) ( positive-overruled $?gen209 & : ( not ( member$ pen2 $?gen209 ) ) ) ) ) ) => ?gen207 <- ( max_imprisonment_robbery_1 ( positive 0 ) )"))

([pen2-defeasibly] of derived-attribute-rule
   (pos-name pen2-defeasibly-gen494)
   (depends-on declare robbery_lv1 max_imprisonment_robbery_1)
   (implies max_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen2] ) ) ) ?gen214 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen213 & : ( >= ?gen213 1 ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( value 8 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen209 & : ( not ( member$ pen2 $?gen209 ) ) ) ) ( test ( eq ( class ?gen207 ) max_imprisonment_robbery_1 ) ) => ?gen207 <- ( max_imprisonment_robbery_1 ( positive 1 ) ( positive-derivator pen2 ?gen214 ) )"))

([pen2-overruled-dot] of derived-attribute-rule
   (pos-name pen2-overruled-dot-gen496)
   (depends-on declare max_imprisonment_robbery_1 robbery_lv1 max_imprisonment_robbery_1)
   (implies max_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen2] ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( value 8 ) ( negative-support $?gen210 ) ( negative-overruled $?gen211 & : ( subseq-pos ( create$ pen2-overruled $?gen210 $$$ $?gen211 ) ) ) ) ( test ( eq ( class ?gen207 ) max_imprisonment_robbery_1 ) ) ( not ( and ?gen214 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen213 & : ( >= ?gen213 1 ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( positive-defeated $?gen209 & : ( not ( member$ pen2 $?gen209 ) ) ) ) ) ) => ( calc ( bind $?gen212 ( delete-member$ $?gen211 ( create$ pen2-overruled $?gen210 ) ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( negative-overruled $?gen212 ) )"))

([pen2-overruled] of derived-attribute-rule
   (pos-name pen2-overruled-gen498)
   (depends-on declare robbery_lv1 max_imprisonment_robbery_1)
   (implies max_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen2] ) ) ) ?gen214 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen213 & : ( >= ?gen213 1 ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( value 8 ) ( negative-support $?gen210 ) ( negative-overruled $?gen211 & : ( not ( subseq-pos ( create$ pen2-overruled $?gen210 $$$ $?gen211 ) ) ) ) ( positive-defeated $?gen209 & : ( not ( member$ pen2 $?gen209 ) ) ) ) ( test ( eq ( class ?gen207 ) max_imprisonment_robbery_1 ) ) => ( calc ( bind $?gen212 ( create$ pen2-overruled $?gen210 $?gen211 ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( negative-overruled $?gen212 ) )"))

([pen2-support] of derived-attribute-rule
   (pos-name pen2-support-gen500)
   (depends-on declare robbery_lv1 max_imprisonment_robbery_1)
   (implies max_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen2] ) ) ) ?gen206 <- ( robbery_lv1 ( defendant ?Defendant ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( value 8 ) ( positive-support $?gen209 & : ( not ( subseq-pos ( create$ pen2 ?gen206 $$$ $?gen209 ) ) ) ) ) ( test ( eq ( class ?gen207 ) max_imprisonment_robbery_1 ) ) => ( calc ( bind $?gen212 ( create$ pen2 ?gen206 $?gen209 ) ) ) ?gen207 <- ( max_imprisonment_robbery_1 ( positive-support $?gen212 ) )"))

([pen1-defeasibly-dot] of derived-attribute-rule
   (pos-name pen1-defeasibly-dot-gen502)
   (depends-on declare min_imprisonment_robbery_1 robbery_lv1 min_imprisonment_robbery_1)
   (implies min_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [pen1] ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( value 1 ) ( positive 1 ) ( positive-derivator pen1 $? ) ) ( test ( eq ( class ?gen198 ) min_imprisonment_robbery_1 ) ) ( not ( and ?gen205 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen204 & : ( >= ?gen204 1 ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( negative ~ 2 ) ( positive-overruled $?gen200 & : ( not ( member$ pen1 $?gen200 ) ) ) ) ) ) => ?gen198 <- ( min_imprisonment_robbery_1 ( positive 0 ) )"))

([pen1-defeasibly] of derived-attribute-rule
   (pos-name pen1-defeasibly-gen504)
   (depends-on declare robbery_lv1 min_imprisonment_robbery_1)
   (implies min_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [pen1] ) ) ) ?gen205 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen204 & : ( >= ?gen204 1 ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( value 1 ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen200 & : ( not ( member$ pen1 $?gen200 ) ) ) ) ( test ( eq ( class ?gen198 ) min_imprisonment_robbery_1 ) ) => ?gen198 <- ( min_imprisonment_robbery_1 ( positive 1 ) ( positive-derivator pen1 ?gen205 ) )"))

([pen1-overruled-dot] of derived-attribute-rule
   (pos-name pen1-overruled-dot-gen506)
   (depends-on declare min_imprisonment_robbery_1 robbery_lv1 min_imprisonment_robbery_1)
   (implies min_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [pen1] ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( value 1 ) ( negative-support $?gen201 ) ( negative-overruled $?gen202 & : ( subseq-pos ( create$ pen1-overruled $?gen201 $$$ $?gen202 ) ) ) ) ( test ( eq ( class ?gen198 ) min_imprisonment_robbery_1 ) ) ( not ( and ?gen205 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen204 & : ( >= ?gen204 1 ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( positive-defeated $?gen200 & : ( not ( member$ pen1 $?gen200 ) ) ) ) ) ) => ( calc ( bind $?gen203 ( delete-member$ $?gen202 ( create$ pen1-overruled $?gen201 ) ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( negative-overruled $?gen203 ) )"))

([pen1-overruled] of derived-attribute-rule
   (pos-name pen1-overruled-gen508)
   (depends-on declare robbery_lv1 min_imprisonment_robbery_1)
   (implies min_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [pen1] ) ) ) ?gen205 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive ?gen204 & : ( >= ?gen204 1 ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( value 1 ) ( negative-support $?gen201 ) ( negative-overruled $?gen202 & : ( not ( subseq-pos ( create$ pen1-overruled $?gen201 $$$ $?gen202 ) ) ) ) ( positive-defeated $?gen200 & : ( not ( member$ pen1 $?gen200 ) ) ) ) ( test ( eq ( class ?gen198 ) min_imprisonment_robbery_1 ) ) => ( calc ( bind $?gen203 ( create$ pen1-overruled $?gen201 $?gen202 ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( negative-overruled $?gen203 ) )"))

([pen1-support] of derived-attribute-rule
   (pos-name pen1-support-gen510)
   (depends-on declare robbery_lv1 min_imprisonment_robbery_1)
   (implies min_imprisonment_robbery_1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [pen1] ) ) ) ?gen197 <- ( robbery_lv1 ( defendant ?Defendant ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( value 1 ) ( positive-support $?gen200 & : ( not ( subseq-pos ( create$ pen1 ?gen197 $$$ $?gen200 ) ) ) ) ) ( test ( eq ( class ?gen198 ) min_imprisonment_robbery_1 ) ) => ( calc ( bind $?gen203 ( create$ pen1 ?gen197 $?gen200 ) ) ) ?gen198 <- ( min_imprisonment_robbery_1 ( positive-support $?gen203 ) )"))

([rule15-defeasibly-dot] of derived-attribute-rule
   (pos-name rule15-defeasibly-dot-gen512)
   (depends-on declare competition_outcome_arrangement_lv1 competition_outcome_arrangement_lv3 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule15] ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative 1 ) ( negative-derivator rule15 $? ) ) ( test ( eq ( class ?gen189 ) competition_outcome_arrangement_lv1 ) ) ( not ( and ?gen196 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen195 & : ( >= ?gen195 1 ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( positive ~ 2 ) ( negative-overruled $?gen191 & : ( not ( member$ rule15 $?gen191 ) ) ) ) ) ) => ?gen189 <- ( competition_outcome_arrangement_lv1 ( negative 0 ) )"))

([rule15-defeasibly] of derived-attribute-rule
   (pos-name rule15-defeasibly-gen514)
   (depends-on declare competition_outcome_arrangement_lv3 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule15] ) ) ) ?gen196 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen195 & : ( >= ?gen195 1 ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative 0 ) ( positive ~ 2 ) ( negative-overruled $?gen191 & : ( not ( member$ rule15 $?gen191 ) ) ) ) ( test ( eq ( class ?gen189 ) competition_outcome_arrangement_lv1 ) ) => ?gen189 <- ( competition_outcome_arrangement_lv1 ( negative 1 ) ( negative-derivator rule15 ?gen196 ) )"))

([rule15-overruled-dot] of derived-attribute-rule
   (pos-name rule15-overruled-dot-gen516)
   (depends-on declare competition_outcome_arrangement_lv1 competition_outcome_arrangement_lv3 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule15] ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive-support $?gen192 ) ( positive-overruled $?gen193 & : ( subseq-pos ( create$ rule15-overruled $?gen192 $$$ $?gen193 ) ) ) ) ( test ( eq ( class ?gen189 ) competition_outcome_arrangement_lv1 ) ) ( not ( and ?gen196 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen195 & : ( >= ?gen195 1 ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( negative-defeated $?gen191 & : ( not ( member$ rule15 $?gen191 ) ) ) ) ) ) => ( calc ( bind $?gen194 ( delete-member$ $?gen193 ( create$ rule15-overruled $?gen192 ) ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( positive-overruled $?gen194 ) )"))

([rule15-overruled] of derived-attribute-rule
   (pos-name rule15-overruled-gen518)
   (depends-on declare competition_outcome_arrangement_lv3 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule15] ) ) ) ?gen196 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive ?gen195 & : ( >= ?gen195 1 ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive-support $?gen192 ) ( positive-overruled $?gen193 & : ( not ( subseq-pos ( create$ rule15-overruled $?gen192 $$$ $?gen193 ) ) ) ) ( negative-defeated $?gen191 & : ( not ( member$ rule15 $?gen191 ) ) ) ) ( test ( eq ( class ?gen189 ) competition_outcome_arrangement_lv1 ) ) => ( calc ( bind $?gen194 ( create$ rule15-overruled $?gen192 $?gen193 ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( positive-overruled $?gen194 ) )"))

([rule15-support] of derived-attribute-rule
   (pos-name rule15-support-gen520)
   (depends-on declare competition_outcome_arrangement_lv3 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule15] ) ) ) ?gen188 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative-support $?gen191 & : ( not ( subseq-pos ( create$ rule15 ?gen188 $$$ $?gen191 ) ) ) ) ) ( test ( eq ( class ?gen189 ) competition_outcome_arrangement_lv1 ) ) => ( calc ( bind $?gen194 ( create$ rule15 ?gen188 $?gen191 ) ) ) ?gen189 <- ( competition_outcome_arrangement_lv1 ( negative-support $?gen194 ) )"))

([rule14-defeasibly-dot] of derived-attribute-rule
   (pos-name rule14-defeasibly-dot-gen522)
   (depends-on declare competition_outcome_arrangement_lv1 competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule14] ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative 1 ) ( negative-derivator rule14 $? ) ) ( test ( eq ( class ?gen180 ) competition_outcome_arrangement_lv1 ) ) ( not ( and ?gen187 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen186 & : ( >= ?gen186 1 ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( positive ~ 2 ) ( negative-overruled $?gen182 & : ( not ( member$ rule14 $?gen182 ) ) ) ) ) ) => ?gen180 <- ( competition_outcome_arrangement_lv1 ( negative 0 ) )"))

([rule14-defeasibly] of derived-attribute-rule
   (pos-name rule14-defeasibly-gen524)
   (depends-on declare competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule14] ) ) ) ?gen187 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen186 & : ( >= ?gen186 1 ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative 0 ) ( positive ~ 2 ) ( negative-overruled $?gen182 & : ( not ( member$ rule14 $?gen182 ) ) ) ) ( test ( eq ( class ?gen180 ) competition_outcome_arrangement_lv1 ) ) => ?gen180 <- ( competition_outcome_arrangement_lv1 ( negative 1 ) ( negative-derivator rule14 ?gen187 ) )"))

([rule14-overruled-dot] of derived-attribute-rule
   (pos-name rule14-overruled-dot-gen526)
   (depends-on declare competition_outcome_arrangement_lv1 competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule14] ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive-support $?gen183 ) ( positive-overruled $?gen184 & : ( subseq-pos ( create$ rule14-overruled $?gen183 $$$ $?gen184 ) ) ) ) ( test ( eq ( class ?gen180 ) competition_outcome_arrangement_lv1 ) ) ( not ( and ?gen187 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen186 & : ( >= ?gen186 1 ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( negative-defeated $?gen182 & : ( not ( member$ rule14 $?gen182 ) ) ) ) ) ) => ( calc ( bind $?gen185 ( delete-member$ $?gen184 ( create$ rule14-overruled $?gen183 ) ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( positive-overruled $?gen185 ) )"))

([rule14-overruled] of derived-attribute-rule
   (pos-name rule14-overruled-gen528)
   (depends-on declare competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule14] ) ) ) ?gen187 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive ?gen186 & : ( >= ?gen186 1 ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive-support $?gen183 ) ( positive-overruled $?gen184 & : ( not ( subseq-pos ( create$ rule14-overruled $?gen183 $$$ $?gen184 ) ) ) ) ( negative-defeated $?gen182 & : ( not ( member$ rule14 $?gen182 ) ) ) ) ( test ( eq ( class ?gen180 ) competition_outcome_arrangement_lv1 ) ) => ( calc ( bind $?gen185 ( create$ rule14-overruled $?gen183 $?gen184 ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( positive-overruled $?gen185 ) )"))

([rule14-support] of derived-attribute-rule
   (pos-name rule14-support-gen530)
   (depends-on declare competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule14] ) ) ) ?gen179 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative-support $?gen182 & : ( not ( subseq-pos ( create$ rule14 ?gen179 $$$ $?gen182 ) ) ) ) ) ( test ( eq ( class ?gen180 ) competition_outcome_arrangement_lv1 ) ) => ( calc ( bind $?gen185 ( create$ rule14 ?gen179 $?gen182 ) ) ) ?gen180 <- ( competition_outcome_arrangement_lv1 ( negative-support $?gen185 ) )"))

([rule13-defeasibly-dot] of derived-attribute-rule
   (pos-name rule13-defeasibly-dot-gen532)
   (depends-on declare competition_outcome_arrangement_lv3 lc:case lc:case competition_outcome_arrangement_lv3)
   (implies competition_outcome_arrangement_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule13] ) ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule13 $? ) ) ( test ( eq ( class ?gen169 ) competition_outcome_arrangement_lv3 ) ) ( not ( and ?gen176 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen175 & : ( >= ?gen175 1 ) ) ) ?gen178 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen177 & : ( >= ?gen177 1 ) ) ) ( test ( > ?Money 40000 ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( negative ~ 2 ) ( positive-overruled $?gen171 & : ( not ( member$ rule13 $?gen171 ) ) ) ) ) ) => ?gen169 <- ( competition_outcome_arrangement_lv3 ( positive 0 ) )"))

([rule13-defeasibly] of derived-attribute-rule
   (pos-name rule13-defeasibly-gen534)
   (depends-on declare lc:case lc:case competition_outcome_arrangement_lv3)
   (implies competition_outcome_arrangement_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule13] ) ) ) ?gen176 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen175 & : ( >= ?gen175 1 ) ) ) ?gen178 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen177 & : ( >= ?gen177 1 ) ) ) ( test ( > ?Money 40000 ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen171 & : ( not ( member$ rule13 $?gen171 ) ) ) ) ( test ( eq ( class ?gen169 ) competition_outcome_arrangement_lv3 ) ) => ?gen169 <- ( competition_outcome_arrangement_lv3 ( positive 1 ) ( positive-derivator rule13 ?gen176 ?gen178 ) )"))

([rule13-overruled-dot] of derived-attribute-rule
   (pos-name rule13-overruled-dot-gen536)
   (depends-on declare competition_outcome_arrangement_lv3 lc:case lc:case competition_outcome_arrangement_lv3)
   (implies competition_outcome_arrangement_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule13] ) ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( negative-support $?gen172 ) ( negative-overruled $?gen173 & : ( subseq-pos ( create$ rule13-overruled $?gen172 $$$ $?gen173 ) ) ) ) ( test ( eq ( class ?gen169 ) competition_outcome_arrangement_lv3 ) ) ( not ( and ?gen176 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen175 & : ( >= ?gen175 1 ) ) ) ?gen178 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen177 & : ( >= ?gen177 1 ) ) ) ( test ( > ?Money 40000 ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( positive-defeated $?gen171 & : ( not ( member$ rule13 $?gen171 ) ) ) ) ) ) => ( calc ( bind $?gen174 ( delete-member$ $?gen173 ( create$ rule13-overruled $?gen172 ) ) ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( negative-overruled $?gen174 ) )"))

([rule13-overruled] of derived-attribute-rule
   (pos-name rule13-overruled-gen538)
   (depends-on declare lc:case lc:case competition_outcome_arrangement_lv3)
   (implies competition_outcome_arrangement_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule13] ) ) ) ?gen176 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen175 & : ( >= ?gen175 1 ) ) ) ?gen178 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen177 & : ( >= ?gen177 1 ) ) ) ( test ( > ?Money 40000 ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( negative-support $?gen172 ) ( negative-overruled $?gen173 & : ( not ( subseq-pos ( create$ rule13-overruled $?gen172 $$$ $?gen173 ) ) ) ) ( positive-defeated $?gen171 & : ( not ( member$ rule13 $?gen171 ) ) ) ) ( test ( eq ( class ?gen169 ) competition_outcome_arrangement_lv3 ) ) => ( calc ( bind $?gen174 ( create$ rule13-overruled $?gen172 $?gen173 ) ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( negative-overruled $?gen174 ) )"))

([rule13-support] of derived-attribute-rule
   (pos-name rule13-support-gen540)
   (depends-on declare lc:case lc:case competition_outcome_arrangement_lv3)
   (implies competition_outcome_arrangement_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule13] ) ) ) ?gen166 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen167 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( test ( > ?Money 40000 ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ( positive-support $?gen171 & : ( not ( subseq-pos ( create$ rule13 ?gen166 ?gen167 $$$ $?gen171 ) ) ) ) ) ( test ( eq ( class ?gen169 ) competition_outcome_arrangement_lv3 ) ) => ( calc ( bind $?gen174 ( create$ rule13 ?gen166 ?gen167 $?gen171 ) ) ) ?gen169 <- ( competition_outcome_arrangement_lv3 ( positive-support $?gen174 ) )"))

([rule12-defeasibly-dot] of derived-attribute-rule
   (pos-name rule12-defeasibly-dot-gen542)
   (depends-on declare competition_outcome_arrangement_lv2 lc:case lc:case competition_outcome_arrangement_lv2)
   (implies competition_outcome_arrangement_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule12] ) ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule12 $? ) ) ( test ( eq ( class ?gen156 ) competition_outcome_arrangement_lv2 ) ) ( not ( and ?gen163 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen162 & : ( >= ?gen162 1 ) ) ) ?gen165 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen164 & : ( >= ?gen164 1 ) ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( negative ~ 2 ) ( positive-overruled $?gen158 & : ( not ( member$ rule12 $?gen158 ) ) ) ) ) ) => ?gen156 <- ( competition_outcome_arrangement_lv2 ( positive 0 ) )"))

([rule12-defeasibly] of derived-attribute-rule
   (pos-name rule12-defeasibly-gen544)
   (depends-on declare lc:case lc:case competition_outcome_arrangement_lv2)
   (implies competition_outcome_arrangement_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule12] ) ) ) ?gen163 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen162 & : ( >= ?gen162 1 ) ) ) ?gen165 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen164 & : ( >= ?gen164 1 ) ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen158 & : ( not ( member$ rule12 $?gen158 ) ) ) ) ( test ( eq ( class ?gen156 ) competition_outcome_arrangement_lv2 ) ) => ?gen156 <- ( competition_outcome_arrangement_lv2 ( positive 1 ) ( positive-derivator rule12 ?gen163 ?gen165 ) )"))

([rule12-overruled-dot] of derived-attribute-rule
   (pos-name rule12-overruled-dot-gen546)
   (depends-on declare competition_outcome_arrangement_lv2 lc:case lc:case competition_outcome_arrangement_lv2)
   (implies competition_outcome_arrangement_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule12] ) ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( negative-support $?gen159 ) ( negative-overruled $?gen160 & : ( subseq-pos ( create$ rule12-overruled $?gen159 $$$ $?gen160 ) ) ) ) ( test ( eq ( class ?gen156 ) competition_outcome_arrangement_lv2 ) ) ( not ( and ?gen163 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen162 & : ( >= ?gen162 1 ) ) ) ?gen165 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen164 & : ( >= ?gen164 1 ) ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( positive-defeated $?gen158 & : ( not ( member$ rule12 $?gen158 ) ) ) ) ) ) => ( calc ( bind $?gen161 ( delete-member$ $?gen160 ( create$ rule12-overruled $?gen159 ) ) ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( negative-overruled $?gen161 ) )"))

([rule12-overruled] of derived-attribute-rule
   (pos-name rule12-overruled-gen548)
   (depends-on declare lc:case lc:case competition_outcome_arrangement_lv2)
   (implies competition_outcome_arrangement_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule12] ) ) ) ?gen163 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen162 & : ( >= ?gen162 1 ) ) ) ?gen165 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen164 & : ( >= ?gen164 1 ) ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( negative-support $?gen159 ) ( negative-overruled $?gen160 & : ( not ( subseq-pos ( create$ rule12-overruled $?gen159 $$$ $?gen160 ) ) ) ) ( positive-defeated $?gen158 & : ( not ( member$ rule12 $?gen158 ) ) ) ) ( test ( eq ( class ?gen156 ) competition_outcome_arrangement_lv2 ) ) => ( calc ( bind $?gen161 ( create$ rule12-overruled $?gen159 $?gen160 ) ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( negative-overruled $?gen161 ) )"))

([rule12-support] of derived-attribute-rule
   (pos-name rule12-support-gen550)
   (depends-on declare lc:case lc:case competition_outcome_arrangement_lv2)
   (implies competition_outcome_arrangement_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule12] ) ) ) ?gen152 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen153 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ( positive-support $?gen158 & : ( not ( subseq-pos ( create$ rule12 ?gen152 ?gen153 $$$ $?gen158 ) ) ) ) ) ( test ( eq ( class ?gen156 ) competition_outcome_arrangement_lv2 ) ) => ( calc ( bind $?gen161 ( create$ rule12 ?gen152 ?gen153 $?gen158 ) ) ) ?gen156 <- ( competition_outcome_arrangement_lv2 ( positive-support $?gen161 ) )"))

([rule11-defeasibly-dot] of derived-attribute-rule
   (pos-name rule11-defeasibly-dot-gen552)
   (depends-on declare competition_outcome_arrangement_lv1 lc:case competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule11] ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule11 $? ) ) ( test ( eq ( class ?gen144 ) competition_outcome_arrangement_lv1 ) ) ( not ( and ?gen151 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen150 & : ( >= ?gen150 1 ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( negative ~ 2 ) ( positive-overruled $?gen146 & : ( not ( member$ rule11 $?gen146 ) ) ) ) ) ) => ?gen144 <- ( competition_outcome_arrangement_lv1 ( positive 0 ) )"))

([rule11-defeasibly] of derived-attribute-rule
   (pos-name rule11-defeasibly-gen554)
   (depends-on declare lc:case competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule11] ) ) ) ?gen151 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen150 & : ( >= ?gen150 1 ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen146 & : ( not ( member$ rule11 $?gen146 ) ) ) ) ( test ( eq ( class ?gen144 ) competition_outcome_arrangement_lv1 ) ) => ?gen144 <- ( competition_outcome_arrangement_lv1 ( positive 1 ) ( positive-derivator rule11 ?gen151 ) )"))

([rule11-overruled-dot] of derived-attribute-rule
   (pos-name rule11-overruled-dot-gen556)
   (depends-on declare competition_outcome_arrangement_lv1 lc:case competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule11] ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative-support $?gen147 ) ( negative-overruled $?gen148 & : ( subseq-pos ( create$ rule11-overruled $?gen147 $$$ $?gen148 ) ) ) ) ( test ( eq ( class ?gen144 ) competition_outcome_arrangement_lv1 ) ) ( not ( and ?gen151 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen150 & : ( >= ?gen150 1 ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( positive-defeated $?gen146 & : ( not ( member$ rule11 $?gen146 ) ) ) ) ) ) => ( calc ( bind $?gen149 ( delete-member$ $?gen148 ( create$ rule11-overruled $?gen147 ) ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( negative-overruled $?gen149 ) )"))

([rule11-overruled] of derived-attribute-rule
   (pos-name rule11-overruled-gen558)
   (depends-on declare lc:case competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule11] ) ) ) ?gen151 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ( positive ?gen150 & : ( >= ?gen150 1 ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( negative-support $?gen147 ) ( negative-overruled $?gen148 & : ( not ( subseq-pos ( create$ rule11-overruled $?gen147 $$$ $?gen148 ) ) ) ) ( positive-defeated $?gen146 & : ( not ( member$ rule11 $?gen146 ) ) ) ) ( test ( eq ( class ?gen144 ) competition_outcome_arrangement_lv1 ) ) => ( calc ( bind $?gen149 ( create$ rule11-overruled $?gen147 $?gen148 ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( negative-overruled $?gen149 ) )"))

([rule11-support] of derived-attribute-rule
   (pos-name rule11-support-gen560)
   (depends-on declare lc:case competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule11] ) ) ) ?gen143 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ( positive-support $?gen146 & : ( not ( subseq-pos ( create$ rule11 ?gen143 $$$ $?gen146 ) ) ) ) ) ( test ( eq ( class ?gen144 ) competition_outcome_arrangement_lv1 ) ) => ( calc ( bind $?gen149 ( create$ rule11 ?gen143 $?gen146 ) ) ) ?gen144 <- ( competition_outcome_arrangement_lv1 ( positive-support $?gen149 ) )"))

([rule10-defeasibly-dot] of derived-attribute-rule
   (pos-name rule10-defeasibly-dot-gen562)
   (depends-on declare robbery_lv1 robbery_lv6 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule10] ) ) ) ?gen135 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative 1 ) ( negative-derivator rule10 $? ) ) ( test ( eq ( class ?gen135 ) robbery_lv1 ) ) ( not ( and ?gen142 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen141 & : ( >= ?gen141 1 ) ) ) ?gen135 <- ( robbery_lv1 ( positive ~ 2 ) ( negative-overruled $?gen137 & : ( not ( member$ rule10 $?gen137 ) ) ) ) ) ) => ?gen135 <- ( robbery_lv1 ( negative 0 ) )"))

([rule10-defeasibly] of derived-attribute-rule
   (pos-name rule10-defeasibly-gen564)
   (depends-on declare robbery_lv6 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule10] ) ) ) ?gen142 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen141 & : ( >= ?gen141 1 ) ) ) ?gen135 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative 0 ) ( positive ~ 2 ) ( negative-overruled $?gen137 & : ( not ( member$ rule10 $?gen137 ) ) ) ) ( test ( eq ( class ?gen135 ) robbery_lv1 ) ) => ?gen135 <- ( robbery_lv1 ( negative 1 ) ( negative-derivator rule10 ?gen142 ) )"))

([rule10-overruled-dot] of derived-attribute-rule
   (pos-name rule10-overruled-dot-gen566)
   (depends-on declare robbery_lv1 robbery_lv6 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule10] ) ) ) ?gen135 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen138 ) ( positive-overruled $?gen139 & : ( subseq-pos ( create$ rule10-overruled $?gen138 $$$ $?gen139 ) ) ) ) ( test ( eq ( class ?gen135 ) robbery_lv1 ) ) ( not ( and ?gen142 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen141 & : ( >= ?gen141 1 ) ) ) ?gen135 <- ( robbery_lv1 ( negative-defeated $?gen137 & : ( not ( member$ rule10 $?gen137 ) ) ) ) ) ) => ( calc ( bind $?gen140 ( delete-member$ $?gen139 ( create$ rule10-overruled $?gen138 ) ) ) ) ?gen135 <- ( robbery_lv1 ( positive-overruled $?gen140 ) )"))

([rule10-overruled] of derived-attribute-rule
   (pos-name rule10-overruled-gen568)
   (depends-on declare robbery_lv6 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule10] ) ) ) ?gen142 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive ?gen141 & : ( >= ?gen141 1 ) ) ) ?gen135 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen138 ) ( positive-overruled $?gen139 & : ( not ( subseq-pos ( create$ rule10-overruled $?gen138 $$$ $?gen139 ) ) ) ) ( negative-defeated $?gen137 & : ( not ( member$ rule10 $?gen137 ) ) ) ) ( test ( eq ( class ?gen135 ) robbery_lv1 ) ) => ( calc ( bind $?gen140 ( create$ rule10-overruled $?gen138 $?gen139 ) ) ) ?gen135 <- ( robbery_lv1 ( positive-overruled $?gen140 ) )"))

([rule10-support] of derived-attribute-rule
   (pos-name rule10-support-gen570)
   (depends-on declare robbery_lv6 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule10] ) ) ) ?gen134 <- ( robbery_lv6 ( defendant ?Defendant ) ) ?gen135 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative-support $?gen137 & : ( not ( subseq-pos ( create$ rule10 ?gen134 $$$ $?gen137 ) ) ) ) ) ( test ( eq ( class ?gen135 ) robbery_lv1 ) ) => ( calc ( bind $?gen140 ( create$ rule10 ?gen134 $?gen137 ) ) ) ?gen135 <- ( robbery_lv1 ( negative-support $?gen140 ) )"))

([rule9-defeasibly-dot] of derived-attribute-rule
   (pos-name rule9-defeasibly-dot-gen572)
   (depends-on declare robbery_lv6 lc:case lc:case lc:case robbery_lv6)
   (implies robbery_lv6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule9] ) ) ) ?gen122 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule9 $? ) ) ( test ( eq ( class ?gen122 ) robbery_lv6 ) ) ( not ( and ?gen129 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen128 & : ( >= ?gen128 1 ) ) ) ?gen131 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen130 & : ( >= ?gen130 1 ) ) ) ?gen133 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen132 & : ( >= ?gen132 1 ) ) ) ( test ( < ?Money 150 ) ) ?gen122 <- ( robbery_lv6 ( negative ~ 2 ) ( positive-overruled $?gen124 & : ( not ( member$ rule9 $?gen124 ) ) ) ) ) ) => ?gen122 <- ( robbery_lv6 ( positive 0 ) )"))

([rule9-defeasibly] of derived-attribute-rule
   (pos-name rule9-defeasibly-gen574)
   (depends-on declare lc:case lc:case lc:case robbery_lv6)
   (implies robbery_lv6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule9] ) ) ) ?gen129 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen128 & : ( >= ?gen128 1 ) ) ) ?gen131 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen130 & : ( >= ?gen130 1 ) ) ) ?gen133 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen132 & : ( >= ?gen132 1 ) ) ) ( test ( < ?Money 150 ) ) ?gen122 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen124 & : ( not ( member$ rule9 $?gen124 ) ) ) ) ( test ( eq ( class ?gen122 ) robbery_lv6 ) ) => ?gen122 <- ( robbery_lv6 ( positive 1 ) ( positive-derivator rule9 ?gen129 ?gen131 ?gen133 ) )"))

([rule9-overruled-dot] of derived-attribute-rule
   (pos-name rule9-overruled-dot-gen576)
   (depends-on declare robbery_lv6 lc:case lc:case lc:case robbery_lv6)
   (implies robbery_lv6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule9] ) ) ) ?gen122 <- ( robbery_lv6 ( defendant ?Defendant ) ( negative-support $?gen125 ) ( negative-overruled $?gen126 & : ( subseq-pos ( create$ rule9-overruled $?gen125 $$$ $?gen126 ) ) ) ) ( test ( eq ( class ?gen122 ) robbery_lv6 ) ) ( not ( and ?gen129 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen128 & : ( >= ?gen128 1 ) ) ) ?gen131 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen130 & : ( >= ?gen130 1 ) ) ) ?gen133 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen132 & : ( >= ?gen132 1 ) ) ) ( test ( < ?Money 150 ) ) ?gen122 <- ( robbery_lv6 ( positive-defeated $?gen124 & : ( not ( member$ rule9 $?gen124 ) ) ) ) ) ) => ( calc ( bind $?gen127 ( delete-member$ $?gen126 ( create$ rule9-overruled $?gen125 ) ) ) ) ?gen122 <- ( robbery_lv6 ( negative-overruled $?gen127 ) )"))

([rule9-overruled] of derived-attribute-rule
   (pos-name rule9-overruled-gen578)
   (depends-on declare lc:case lc:case lc:case robbery_lv6)
   (implies robbery_lv6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule9] ) ) ) ?gen129 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen128 & : ( >= ?gen128 1 ) ) ) ?gen131 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen130 & : ( >= ?gen130 1 ) ) ) ?gen133 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen132 & : ( >= ?gen132 1 ) ) ) ( test ( < ?Money 150 ) ) ?gen122 <- ( robbery_lv6 ( defendant ?Defendant ) ( negative-support $?gen125 ) ( negative-overruled $?gen126 & : ( not ( subseq-pos ( create$ rule9-overruled $?gen125 $$$ $?gen126 ) ) ) ) ( positive-defeated $?gen124 & : ( not ( member$ rule9 $?gen124 ) ) ) ) ( test ( eq ( class ?gen122 ) robbery_lv6 ) ) => ( calc ( bind $?gen127 ( create$ rule9-overruled $?gen125 $?gen126 ) ) ) ?gen122 <- ( robbery_lv6 ( negative-overruled $?gen127 ) )"))

([rule9-support] of derived-attribute-rule
   (pos-name rule9-support-gen580)
   (depends-on declare lc:case lc:case lc:case robbery_lv6)
   (implies robbery_lv6)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule9] ) ) ) ?gen118 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen119 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen120 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( test ( < ?Money 150 ) ) ?gen122 <- ( robbery_lv6 ( defendant ?Defendant ) ( positive-support $?gen124 & : ( not ( subseq-pos ( create$ rule9 ?gen118 ?gen119 ?gen120 $$$ $?gen124 ) ) ) ) ) ( test ( eq ( class ?gen122 ) robbery_lv6 ) ) => ( calc ( bind $?gen127 ( create$ rule9 ?gen118 ?gen119 ?gen120 $?gen124 ) ) ) ?gen122 <- ( robbery_lv6 ( positive-support $?gen127 ) )"))

([rule8-defeasibly-dot] of derived-attribute-rule
   (pos-name rule8-defeasibly-dot-gen582)
   (depends-on declare robbery_lv5 lc:case lc:case robbery_lv5)
   (implies robbery_lv5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule8] ) ) ) ?gen108 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule8 $? ) ) ( test ( eq ( class ?gen108 ) robbery_lv5 ) ) ( not ( and ?gen115 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen114 & : ( >= ?gen114 1 ) ) ) ?gen117 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ( positive ?gen116 & : ( >= ?gen116 1 ) ) ) ?gen108 <- ( robbery_lv5 ( negative ~ 2 ) ( positive-overruled $?gen110 & : ( not ( member$ rule8 $?gen110 ) ) ) ) ) ) => ?gen108 <- ( robbery_lv5 ( positive 0 ) )"))

([rule8-defeasibly] of derived-attribute-rule
   (pos-name rule8-defeasibly-gen584)
   (depends-on declare lc:case lc:case robbery_lv5)
   (implies robbery_lv5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule8] ) ) ) ?gen115 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen114 & : ( >= ?gen114 1 ) ) ) ?gen117 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ( positive ?gen116 & : ( >= ?gen116 1 ) ) ) ?gen108 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen110 & : ( not ( member$ rule8 $?gen110 ) ) ) ) ( test ( eq ( class ?gen108 ) robbery_lv5 ) ) => ?gen108 <- ( robbery_lv5 ( positive 1 ) ( positive-derivator rule8 ?gen115 ?gen117 ) )"))

([rule8-overruled-dot] of derived-attribute-rule
   (pos-name rule8-overruled-dot-gen586)
   (depends-on declare robbery_lv5 lc:case lc:case robbery_lv5)
   (implies robbery_lv5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule8] ) ) ) ?gen108 <- ( robbery_lv5 ( defendant ?Defendant ) ( negative-support $?gen111 ) ( negative-overruled $?gen112 & : ( subseq-pos ( create$ rule8-overruled $?gen111 $$$ $?gen112 ) ) ) ) ( test ( eq ( class ?gen108 ) robbery_lv5 ) ) ( not ( and ?gen115 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen114 & : ( >= ?gen114 1 ) ) ) ?gen117 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ( positive ?gen116 & : ( >= ?gen116 1 ) ) ) ?gen108 <- ( robbery_lv5 ( positive-defeated $?gen110 & : ( not ( member$ rule8 $?gen110 ) ) ) ) ) ) => ( calc ( bind $?gen113 ( delete-member$ $?gen112 ( create$ rule8-overruled $?gen111 ) ) ) ) ?gen108 <- ( robbery_lv5 ( negative-overruled $?gen113 ) )"))

([rule8-overruled] of derived-attribute-rule
   (pos-name rule8-overruled-gen588)
   (depends-on declare lc:case lc:case robbery_lv5)
   (implies robbery_lv5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule8] ) ) ) ?gen115 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen114 & : ( >= ?gen114 1 ) ) ) ?gen117 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ( positive ?gen116 & : ( >= ?gen116 1 ) ) ) ?gen108 <- ( robbery_lv5 ( defendant ?Defendant ) ( negative-support $?gen111 ) ( negative-overruled $?gen112 & : ( not ( subseq-pos ( create$ rule8-overruled $?gen111 $$$ $?gen112 ) ) ) ) ( positive-defeated $?gen110 & : ( not ( member$ rule8 $?gen110 ) ) ) ) ( test ( eq ( class ?gen108 ) robbery_lv5 ) ) => ( calc ( bind $?gen113 ( create$ rule8-overruled $?gen111 $?gen112 ) ) ) ?gen108 <- ( robbery_lv5 ( negative-overruled $?gen113 ) )"))

([rule8-support] of derived-attribute-rule
   (pos-name rule8-support-gen590)
   (depends-on declare lc:case lc:case robbery_lv5)
   (implies robbery_lv5)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule8] ) ) ) ?gen106 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen107 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ) ?gen108 <- ( robbery_lv5 ( defendant ?Defendant ) ( positive-support $?gen110 & : ( not ( subseq-pos ( create$ rule8 ?gen106 ?gen107 $$$ $?gen110 ) ) ) ) ) ( test ( eq ( class ?gen108 ) robbery_lv5 ) ) => ( calc ( bind $?gen113 ( create$ rule8 ?gen106 ?gen107 $?gen110 ) ) ) ?gen108 <- ( robbery_lv5 ( positive-support $?gen113 ) )"))

([rule7-defeasibly-dot] of derived-attribute-rule
   (pos-name rule7-defeasibly-dot-gen592)
   (depends-on declare robbery_lv4 lc:case lc:case robbery_lv4)
   (implies robbery_lv4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule7] ) ) ) ?gen96 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule7 $? ) ) ( test ( eq ( class ?gen96 ) robbery_lv4 ) ) ( not ( and ?gen103 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen102 & : ( >= ?gen102 1 ) ) ) ?gen105 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ( positive ?gen104 & : ( >= ?gen104 1 ) ) ) ?gen96 <- ( robbery_lv4 ( negative ~ 2 ) ( positive-overruled $?gen98 & : ( not ( member$ rule7 $?gen98 ) ) ) ) ) ) => ?gen96 <- ( robbery_lv4 ( positive 0 ) )"))

([rule7-defeasibly] of derived-attribute-rule
   (pos-name rule7-defeasibly-gen594)
   (depends-on declare lc:case lc:case robbery_lv4)
   (implies robbery_lv4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule7] ) ) ) ?gen103 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen102 & : ( >= ?gen102 1 ) ) ) ?gen105 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ( positive ?gen104 & : ( >= ?gen104 1 ) ) ) ?gen96 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen98 & : ( not ( member$ rule7 $?gen98 ) ) ) ) ( test ( eq ( class ?gen96 ) robbery_lv4 ) ) => ?gen96 <- ( robbery_lv4 ( positive 1 ) ( positive-derivator rule7 ?gen103 ?gen105 ) )"))

([rule7-overruled-dot] of derived-attribute-rule
   (pos-name rule7-overruled-dot-gen596)
   (depends-on declare robbery_lv4 lc:case lc:case robbery_lv4)
   (implies robbery_lv4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule7] ) ) ) ?gen96 <- ( robbery_lv4 ( defendant ?Defendant ) ( negative-support $?gen99 ) ( negative-overruled $?gen100 & : ( subseq-pos ( create$ rule7-overruled $?gen99 $$$ $?gen100 ) ) ) ) ( test ( eq ( class ?gen96 ) robbery_lv4 ) ) ( not ( and ?gen103 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen102 & : ( >= ?gen102 1 ) ) ) ?gen105 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ( positive ?gen104 & : ( >= ?gen104 1 ) ) ) ?gen96 <- ( robbery_lv4 ( positive-defeated $?gen98 & : ( not ( member$ rule7 $?gen98 ) ) ) ) ) ) => ( calc ( bind $?gen101 ( delete-member$ $?gen100 ( create$ rule7-overruled $?gen99 ) ) ) ) ?gen96 <- ( robbery_lv4 ( negative-overruled $?gen101 ) )"))

([rule7-overruled] of derived-attribute-rule
   (pos-name rule7-overruled-gen598)
   (depends-on declare lc:case lc:case robbery_lv4)
   (implies robbery_lv4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule7] ) ) ) ?gen103 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen102 & : ( >= ?gen102 1 ) ) ) ?gen105 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ( positive ?gen104 & : ( >= ?gen104 1 ) ) ) ?gen96 <- ( robbery_lv4 ( defendant ?Defendant ) ( negative-support $?gen99 ) ( negative-overruled $?gen100 & : ( not ( subseq-pos ( create$ rule7-overruled $?gen99 $$$ $?gen100 ) ) ) ) ( positive-defeated $?gen98 & : ( not ( member$ rule7 $?gen98 ) ) ) ) ( test ( eq ( class ?gen96 ) robbery_lv4 ) ) => ( calc ( bind $?gen101 ( create$ rule7-overruled $?gen99 $?gen100 ) ) ) ?gen96 <- ( robbery_lv4 ( negative-overruled $?gen101 ) )"))

([rule7-support] of derived-attribute-rule
   (pos-name rule7-support-gen600)
   (depends-on declare lc:case lc:case robbery_lv4)
   (implies robbery_lv4)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule7] ) ) ) ?gen94 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen95 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ) ?gen96 <- ( robbery_lv4 ( defendant ?Defendant ) ( positive-support $?gen98 & : ( not ( subseq-pos ( create$ rule7 ?gen94 ?gen95 $$$ $?gen98 ) ) ) ) ) ( test ( eq ( class ?gen96 ) robbery_lv4 ) ) => ( calc ( bind $?gen101 ( create$ rule7 ?gen94 ?gen95 $?gen98 ) ) ) ?gen96 <- ( robbery_lv4 ( positive-support $?gen101 ) )"))

([rule6-defeasibly-dot] of derived-attribute-rule
   (pos-name rule6-defeasibly-dot-gen602)
   (depends-on declare robbery_lv1 robbery_lv3 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule6] ) ) ) ?gen86 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative 1 ) ( negative-derivator rule6 $? ) ) ( test ( eq ( class ?gen86 ) robbery_lv1 ) ) ( not ( and ?gen93 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen92 & : ( >= ?gen92 1 ) ) ) ?gen86 <- ( robbery_lv1 ( positive ~ 2 ) ( negative-overruled $?gen88 & : ( not ( member$ rule6 $?gen88 ) ) ) ) ) ) => ?gen86 <- ( robbery_lv1 ( negative 0 ) )"))

([rule6-defeasibly] of derived-attribute-rule
   (pos-name rule6-defeasibly-gen604)
   (depends-on declare robbery_lv3 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule6] ) ) ) ?gen93 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen92 & : ( >= ?gen92 1 ) ) ) ?gen86 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative 0 ) ( positive ~ 2 ) ( negative-overruled $?gen88 & : ( not ( member$ rule6 $?gen88 ) ) ) ) ( test ( eq ( class ?gen86 ) robbery_lv1 ) ) => ?gen86 <- ( robbery_lv1 ( negative 1 ) ( negative-derivator rule6 ?gen93 ) )"))

([rule6-overruled-dot] of derived-attribute-rule
   (pos-name rule6-overruled-dot-gen606)
   (depends-on declare robbery_lv1 robbery_lv3 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule6] ) ) ) ?gen86 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen89 ) ( positive-overruled $?gen90 & : ( subseq-pos ( create$ rule6-overruled $?gen89 $$$ $?gen90 ) ) ) ) ( test ( eq ( class ?gen86 ) robbery_lv1 ) ) ( not ( and ?gen93 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen92 & : ( >= ?gen92 1 ) ) ) ?gen86 <- ( robbery_lv1 ( negative-defeated $?gen88 & : ( not ( member$ rule6 $?gen88 ) ) ) ) ) ) => ( calc ( bind $?gen91 ( delete-member$ $?gen90 ( create$ rule6-overruled $?gen89 ) ) ) ) ?gen86 <- ( robbery_lv1 ( positive-overruled $?gen91 ) )"))

([rule6-overruled] of derived-attribute-rule
   (pos-name rule6-overruled-gen608)
   (depends-on declare robbery_lv3 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule6] ) ) ) ?gen93 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive ?gen92 & : ( >= ?gen92 1 ) ) ) ?gen86 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen89 ) ( positive-overruled $?gen90 & : ( not ( subseq-pos ( create$ rule6-overruled $?gen89 $$$ $?gen90 ) ) ) ) ( negative-defeated $?gen88 & : ( not ( member$ rule6 $?gen88 ) ) ) ) ( test ( eq ( class ?gen86 ) robbery_lv1 ) ) => ( calc ( bind $?gen91 ( create$ rule6-overruled $?gen89 $?gen90 ) ) ) ?gen86 <- ( robbery_lv1 ( positive-overruled $?gen91 ) )"))

([rule6-support] of derived-attribute-rule
   (pos-name rule6-support-gen610)
   (depends-on declare robbery_lv3 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule6] ) ) ) ?gen85 <- ( robbery_lv3 ( defendant ?Defendant ) ) ?gen86 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative-support $?gen88 & : ( not ( subseq-pos ( create$ rule6 ?gen85 $$$ $?gen88 ) ) ) ) ) ( test ( eq ( class ?gen86 ) robbery_lv1 ) ) => ( calc ( bind $?gen91 ( create$ rule6 ?gen85 $?gen88 ) ) ) ?gen86 <- ( robbery_lv1 ( negative-support $?gen91 ) )"))

([rule5-defeasibly-dot] of derived-attribute-rule
   (pos-name rule5-defeasibly-dot-gen612)
   (depends-on declare robbery_lv1 robbery_lv2 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule5] ) ) ) ?gen77 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative 1 ) ( negative-derivator rule5 $? ) ) ( test ( eq ( class ?gen77 ) robbery_lv1 ) ) ( not ( and ?gen84 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen83 & : ( >= ?gen83 1 ) ) ) ?gen77 <- ( robbery_lv1 ( positive ~ 2 ) ( negative-overruled $?gen79 & : ( not ( member$ rule5 $?gen79 ) ) ) ) ) ) => ?gen77 <- ( robbery_lv1 ( negative 0 ) )"))

([rule5-defeasibly] of derived-attribute-rule
   (pos-name rule5-defeasibly-gen614)
   (depends-on declare robbery_lv2 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule5] ) ) ) ?gen84 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen83 & : ( >= ?gen83 1 ) ) ) ?gen77 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative 0 ) ( positive ~ 2 ) ( negative-overruled $?gen79 & : ( not ( member$ rule5 $?gen79 ) ) ) ) ( test ( eq ( class ?gen77 ) robbery_lv1 ) ) => ?gen77 <- ( robbery_lv1 ( negative 1 ) ( negative-derivator rule5 ?gen84 ) )"))

([rule5-overruled-dot] of derived-attribute-rule
   (pos-name rule5-overruled-dot-gen616)
   (depends-on declare robbery_lv1 robbery_lv2 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule5] ) ) ) ?gen77 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen80 ) ( positive-overruled $?gen81 & : ( subseq-pos ( create$ rule5-overruled $?gen80 $$$ $?gen81 ) ) ) ) ( test ( eq ( class ?gen77 ) robbery_lv1 ) ) ( not ( and ?gen84 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen83 & : ( >= ?gen83 1 ) ) ) ?gen77 <- ( robbery_lv1 ( negative-defeated $?gen79 & : ( not ( member$ rule5 $?gen79 ) ) ) ) ) ) => ( calc ( bind $?gen82 ( delete-member$ $?gen81 ( create$ rule5-overruled $?gen80 ) ) ) ) ?gen77 <- ( robbery_lv1 ( positive-overruled $?gen82 ) )"))

([rule5-overruled] of derived-attribute-rule
   (pos-name rule5-overruled-gen618)
   (depends-on declare robbery_lv2 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule5] ) ) ) ?gen84 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive ?gen83 & : ( >= ?gen83 1 ) ) ) ?gen77 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen80 ) ( positive-overruled $?gen81 & : ( not ( subseq-pos ( create$ rule5-overruled $?gen80 $$$ $?gen81 ) ) ) ) ( negative-defeated $?gen79 & : ( not ( member$ rule5 $?gen79 ) ) ) ) ( test ( eq ( class ?gen77 ) robbery_lv1 ) ) => ( calc ( bind $?gen82 ( create$ rule5-overruled $?gen80 $?gen81 ) ) ) ?gen77 <- ( robbery_lv1 ( positive-overruled $?gen82 ) )"))

([rule5-support] of derived-attribute-rule
   (pos-name rule5-support-gen620)
   (depends-on declare robbery_lv2 robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule5] ) ) ) ?gen76 <- ( robbery_lv2 ( defendant ?Defendant ) ) ?gen77 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative-support $?gen79 & : ( not ( subseq-pos ( create$ rule5 ?gen76 $$$ $?gen79 ) ) ) ) ) ( test ( eq ( class ?gen77 ) robbery_lv1 ) ) => ( calc ( bind $?gen82 ( create$ rule5 ?gen76 $?gen79 ) ) ) ?gen77 <- ( robbery_lv1 ( negative-support $?gen82 ) )"))

([rule4-defeasibly-dot] of derived-attribute-rule
   (pos-name rule4-defeasibly-dot-gen622)
   (depends-on declare robbery_lv3 lc:case lc:case lc:case robbery_lv3)
   (implies robbery_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule4] ) ) ) ?gen64 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule4 $? ) ) ( test ( eq ( class ?gen64 ) robbery_lv3 ) ) ( not ( and ?gen71 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen70 & : ( >= ?gen70 1 ) ) ) ?gen73 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen72 & : ( >= ?gen72 1 ) ) ) ( test ( > ?Money 30000 ) ) ?gen75 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen74 & : ( >= ?gen74 1 ) ) ) ?gen64 <- ( robbery_lv3 ( negative ~ 2 ) ( positive-overruled $?gen66 & : ( not ( member$ rule4 $?gen66 ) ) ) ) ) ) => ?gen64 <- ( robbery_lv3 ( positive 0 ) )"))

([rule4-defeasibly] of derived-attribute-rule
   (pos-name rule4-defeasibly-gen624)
   (depends-on declare lc:case lc:case lc:case robbery_lv3)
   (implies robbery_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule4] ) ) ) ?gen71 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen70 & : ( >= ?gen70 1 ) ) ) ?gen73 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen72 & : ( >= ?gen72 1 ) ) ) ( test ( > ?Money 30000 ) ) ?gen75 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen74 & : ( >= ?gen74 1 ) ) ) ?gen64 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen66 & : ( not ( member$ rule4 $?gen66 ) ) ) ) ( test ( eq ( class ?gen64 ) robbery_lv3 ) ) => ?gen64 <- ( robbery_lv3 ( positive 1 ) ( positive-derivator rule4 ?gen71 ?gen73 ?gen75 ) )"))

([rule4-overruled-dot] of derived-attribute-rule
   (pos-name rule4-overruled-dot-gen626)
   (depends-on declare robbery_lv3 lc:case lc:case lc:case robbery_lv3)
   (implies robbery_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule4] ) ) ) ?gen64 <- ( robbery_lv3 ( defendant ?Defendant ) ( negative-support $?gen67 ) ( negative-overruled $?gen68 & : ( subseq-pos ( create$ rule4-overruled $?gen67 $$$ $?gen68 ) ) ) ) ( test ( eq ( class ?gen64 ) robbery_lv3 ) ) ( not ( and ?gen71 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen70 & : ( >= ?gen70 1 ) ) ) ?gen73 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen72 & : ( >= ?gen72 1 ) ) ) ( test ( > ?Money 30000 ) ) ?gen75 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen74 & : ( >= ?gen74 1 ) ) ) ?gen64 <- ( robbery_lv3 ( positive-defeated $?gen66 & : ( not ( member$ rule4 $?gen66 ) ) ) ) ) ) => ( calc ( bind $?gen69 ( delete-member$ $?gen68 ( create$ rule4-overruled $?gen67 ) ) ) ) ?gen64 <- ( robbery_lv3 ( negative-overruled $?gen69 ) )"))

([rule4-overruled] of derived-attribute-rule
   (pos-name rule4-overruled-gen628)
   (depends-on declare lc:case lc:case lc:case robbery_lv3)
   (implies robbery_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule4] ) ) ) ?gen71 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen70 & : ( >= ?gen70 1 ) ) ) ?gen73 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen72 & : ( >= ?gen72 1 ) ) ) ( test ( > ?Money 30000 ) ) ?gen75 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen74 & : ( >= ?gen74 1 ) ) ) ?gen64 <- ( robbery_lv3 ( defendant ?Defendant ) ( negative-support $?gen67 ) ( negative-overruled $?gen68 & : ( not ( subseq-pos ( create$ rule4-overruled $?gen67 $$$ $?gen68 ) ) ) ) ( positive-defeated $?gen66 & : ( not ( member$ rule4 $?gen66 ) ) ) ) ( test ( eq ( class ?gen64 ) robbery_lv3 ) ) => ( calc ( bind $?gen69 ( create$ rule4-overruled $?gen67 $?gen68 ) ) ) ?gen64 <- ( robbery_lv3 ( negative-overruled $?gen69 ) )"))

([rule4-support] of derived-attribute-rule
   (pos-name rule4-support-gen630)
   (depends-on declare lc:case lc:case lc:case robbery_lv3)
   (implies robbery_lv3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule4] ) ) ) ?gen60 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen61 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 30000 ) ) ?gen63 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ?gen64 <- ( robbery_lv3 ( defendant ?Defendant ) ( positive-support $?gen66 & : ( not ( subseq-pos ( create$ rule4 ?gen60 ?gen61 ?gen63 $$$ $?gen66 ) ) ) ) ) ( test ( eq ( class ?gen64 ) robbery_lv3 ) ) => ( calc ( bind $?gen69 ( create$ rule4 ?gen60 ?gen61 ?gen63 $?gen66 ) ) ) ?gen64 <- ( robbery_lv3 ( positive-support $?gen69 ) )"))

([rule3-defeasibly-dot] of derived-attribute-rule
   (pos-name rule3-defeasibly-dot-gen632)
   (depends-on declare robbery_lv2 lc:case lc:case lc:case robbery_lv2)
   (implies robbery_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule3] ) ) ) ?gen48 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule3 $? ) ) ( test ( eq ( class ?gen48 ) robbery_lv2 ) ) ( not ( and ?gen55 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen54 & : ( >= ?gen54 1 ) ) ) ?gen57 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen56 & : ( >= ?gen56 1 ) ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ?gen59 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen58 & : ( >= ?gen58 1 ) ) ) ?gen48 <- ( robbery_lv2 ( negative ~ 2 ) ( positive-overruled $?gen50 & : ( not ( member$ rule3 $?gen50 ) ) ) ) ) ) => ?gen48 <- ( robbery_lv2 ( positive 0 ) )"))

([rule3-defeasibly] of derived-attribute-rule
   (pos-name rule3-defeasibly-gen634)
   (depends-on declare lc:case lc:case lc:case robbery_lv2)
   (implies robbery_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule3] ) ) ) ?gen55 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen54 & : ( >= ?gen54 1 ) ) ) ?gen57 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen56 & : ( >= ?gen56 1 ) ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ?gen59 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen58 & : ( >= ?gen58 1 ) ) ) ?gen48 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen50 & : ( not ( member$ rule3 $?gen50 ) ) ) ) ( test ( eq ( class ?gen48 ) robbery_lv2 ) ) => ?gen48 <- ( robbery_lv2 ( positive 1 ) ( positive-derivator rule3 ?gen55 ?gen57 ?gen59 ) )"))

([rule3-overruled-dot] of derived-attribute-rule
   (pos-name rule3-overruled-dot-gen636)
   (depends-on declare robbery_lv2 lc:case lc:case lc:case robbery_lv2)
   (implies robbery_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule3] ) ) ) ?gen48 <- ( robbery_lv2 ( defendant ?Defendant ) ( negative-support $?gen51 ) ( negative-overruled $?gen52 & : ( subseq-pos ( create$ rule3-overruled $?gen51 $$$ $?gen52 ) ) ) ) ( test ( eq ( class ?gen48 ) robbery_lv2 ) ) ( not ( and ?gen55 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen54 & : ( >= ?gen54 1 ) ) ) ?gen57 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen56 & : ( >= ?gen56 1 ) ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ?gen59 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen58 & : ( >= ?gen58 1 ) ) ) ?gen48 <- ( robbery_lv2 ( positive-defeated $?gen50 & : ( not ( member$ rule3 $?gen50 ) ) ) ) ) ) => ( calc ( bind $?gen53 ( delete-member$ $?gen52 ( create$ rule3-overruled $?gen51 ) ) ) ) ?gen48 <- ( robbery_lv2 ( negative-overruled $?gen53 ) )"))

([rule3-overruled] of derived-attribute-rule
   (pos-name rule3-overruled-gen638)
   (depends-on declare lc:case lc:case lc:case robbery_lv2)
   (implies robbery_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule3] ) ) ) ?gen55 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen54 & : ( >= ?gen54 1 ) ) ) ?gen57 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen56 & : ( >= ?gen56 1 ) ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ?gen59 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen58 & : ( >= ?gen58 1 ) ) ) ?gen48 <- ( robbery_lv2 ( defendant ?Defendant ) ( negative-support $?gen51 ) ( negative-overruled $?gen52 & : ( not ( subseq-pos ( create$ rule3-overruled $?gen51 $$$ $?gen52 ) ) ) ) ( positive-defeated $?gen50 & : ( not ( member$ rule3 $?gen50 ) ) ) ) ( test ( eq ( class ?gen48 ) robbery_lv2 ) ) => ( calc ( bind $?gen53 ( create$ rule3-overruled $?gen51 $?gen52 ) ) ) ?gen48 <- ( robbery_lv2 ( negative-overruled $?gen53 ) )"))

([rule3-support] of derived-attribute-rule
   (pos-name rule3-support-gen640)
   (depends-on declare lc:case lc:case lc:case robbery_lv2)
   (implies robbery_lv2)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule3] ) ) ) ?gen43 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen44 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ?gen47 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ?gen48 <- ( robbery_lv2 ( defendant ?Defendant ) ( positive-support $?gen50 & : ( not ( subseq-pos ( create$ rule3 ?gen43 ?gen44 ?gen47 $$$ $?gen50 ) ) ) ) ) ( test ( eq ( class ?gen48 ) robbery_lv2 ) ) => ( calc ( bind $?gen53 ( create$ rule3 ?gen43 ?gen44 ?gen47 $?gen50 ) ) ) ?gen48 <- ( robbery_lv2 ( positive-support $?gen53 ) )"))

([rule2-defeasibly-dot] of derived-attribute-rule
   (pos-name rule2-defeasibly-dot-gen642)
   (depends-on declare robbery_min_imprisonment_lv2_3 lc:case lc:case lc:case robbery_min_imprisonment_lv2_3)
   (implies robbery_min_imprisonment_lv2_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule2] ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule2 $? ) ) ( test ( eq ( class ?gen31 ) robbery_min_imprisonment_lv2_3 ) ) ( not ( and ?gen38 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen37 & : ( >= ?gen37 1 ) ) ) ?gen40 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen39 & : ( >= ?gen39 1 ) ) ) ( test ( > ?Money 3000 ) ) ?gen42 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen41 & : ( >= ?gen41 1 ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( negative ~ 2 ) ( positive-overruled $?gen33 & : ( not ( member$ rule2 $?gen33 ) ) ) ) ) ) => ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( positive 0 ) )"))

([rule2-defeasibly] of derived-attribute-rule
   (pos-name rule2-defeasibly-gen644)
   (depends-on declare lc:case lc:case lc:case robbery_min_imprisonment_lv2_3)
   (implies robbery_min_imprisonment_lv2_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule2] ) ) ) ?gen38 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen37 & : ( >= ?gen37 1 ) ) ) ?gen40 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen39 & : ( >= ?gen39 1 ) ) ) ( test ( > ?Money 3000 ) ) ?gen42 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen41 & : ( >= ?gen41 1 ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen33 & : ( not ( member$ rule2 $?gen33 ) ) ) ) ( test ( eq ( class ?gen31 ) robbery_min_imprisonment_lv2_3 ) ) => ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( positive 1 ) ( positive-derivator rule2 ?gen38 ?gen40 ?gen42 ) )"))

([rule2-overruled-dot] of derived-attribute-rule
   (pos-name rule2-overruled-dot-gen646)
   (depends-on declare robbery_min_imprisonment_lv2_3 lc:case lc:case lc:case robbery_min_imprisonment_lv2_3)
   (implies robbery_min_imprisonment_lv2_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule2] ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( negative-support $?gen34 ) ( negative-overruled $?gen35 & : ( subseq-pos ( create$ rule2-overruled $?gen34 $$$ $?gen35 ) ) ) ) ( test ( eq ( class ?gen31 ) robbery_min_imprisonment_lv2_3 ) ) ( not ( and ?gen38 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen37 & : ( >= ?gen37 1 ) ) ) ?gen40 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen39 & : ( >= ?gen39 1 ) ) ) ( test ( > ?Money 3000 ) ) ?gen42 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen41 & : ( >= ?gen41 1 ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( positive-defeated $?gen33 & : ( not ( member$ rule2 $?gen33 ) ) ) ) ) ) => ( calc ( bind $?gen36 ( delete-member$ $?gen35 ( create$ rule2-overruled $?gen34 ) ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( negative-overruled $?gen36 ) )"))

([rule2-overruled] of derived-attribute-rule
   (pos-name rule2-overruled-gen648)
   (depends-on declare lc:case lc:case lc:case robbery_min_imprisonment_lv2_3)
   (implies robbery_min_imprisonment_lv2_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule2] ) ) ) ?gen38 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ( positive ?gen37 & : ( >= ?gen37 1 ) ) ) ?gen40 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen39 & : ( >= ?gen39 1 ) ) ) ( test ( > ?Money 3000 ) ) ?gen42 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen41 & : ( >= ?gen41 1 ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( negative-support $?gen34 ) ( negative-overruled $?gen35 & : ( not ( subseq-pos ( create$ rule2-overruled $?gen34 $$$ $?gen35 ) ) ) ) ( positive-defeated $?gen33 & : ( not ( member$ rule2 $?gen33 ) ) ) ) ( test ( eq ( class ?gen31 ) robbery_min_imprisonment_lv2_3 ) ) => ( calc ( bind $?gen36 ( create$ rule2-overruled $?gen34 $?gen35 ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( negative-overruled $?gen36 ) )"))

([rule2-support] of derived-attribute-rule
   (pos-name rule2-support-gen650)
   (depends-on declare lc:case lc:case lc:case robbery_min_imprisonment_lv2_3)
   (implies robbery_min_imprisonment_lv2_3)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule2] ) ) ) ?gen27 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen28 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 3000 ) ) ?gen30 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ( positive-support $?gen33 & : ( not ( subseq-pos ( create$ rule2 ?gen27 ?gen28 ?gen30 $$$ $?gen33 ) ) ) ) ) ( test ( eq ( class ?gen31 ) robbery_min_imprisonment_lv2_3 ) ) => ( calc ( bind $?gen36 ( create$ rule2 ?gen27 ?gen28 ?gen30 $?gen33 ) ) ) ?gen31 <- ( robbery_min_imprisonment_lv2_3 ( positive-support $?gen36 ) )"))

([rule1-defeasibly-dot] of derived-attribute-rule
   (pos-name rule1-defeasibly-dot-gen652)
   (depends-on declare robbery_lv1 lc:case lc:case robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -1 [rule1] ) ) ) ?gen17 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive 1 ) ( positive-derivator rule1 $? ) ) ( test ( eq ( class ?gen17 ) robbery_lv1 ) ) ( not ( and ?gen24 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen23 & : ( >= ?gen23 1 ) ) ) ?gen26 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen25 & : ( >= ?gen25 1 ) ) ) ?gen17 <- ( robbery_lv1 ( negative ~ 2 ) ( positive-overruled $?gen19 & : ( not ( member$ rule1 $?gen19 ) ) ) ) ) ) => ?gen17 <- ( robbery_lv1 ( positive 0 ) )"))

([rule1-defeasibly] of derived-attribute-rule
   (pos-name rule1-defeasibly-gen654)
   (depends-on declare lc:case lc:case robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 1 [rule1] ) ) ) ?gen24 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen23 & : ( >= ?gen23 1 ) ) ) ?gen26 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen25 & : ( >= ?gen25 1 ) ) ) ?gen17 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive 0 ) ( negative ~ 2 ) ( positive-overruled $?gen19 & : ( not ( member$ rule1 $?gen19 ) ) ) ) ( test ( eq ( class ?gen17 ) robbery_lv1 ) ) => ?gen17 <- ( robbery_lv1 ( positive 1 ) ( positive-derivator rule1 ?gen24 ?gen26 ) )"))

([rule1-overruled-dot] of derived-attribute-rule
   (pos-name rule1-overruled-dot-gen656)
   (depends-on declare robbery_lv1 lc:case lc:case robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority -2 [rule1] ) ) ) ?gen17 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative-support $?gen20 ) ( negative-overruled $?gen21 & : ( subseq-pos ( create$ rule1-overruled $?gen20 $$$ $?gen21 ) ) ) ) ( test ( eq ( class ?gen17 ) robbery_lv1 ) ) ( not ( and ?gen24 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen23 & : ( >= ?gen23 1 ) ) ) ?gen26 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen25 & : ( >= ?gen25 1 ) ) ) ?gen17 <- ( robbery_lv1 ( positive-defeated $?gen19 & : ( not ( member$ rule1 $?gen19 ) ) ) ) ) ) => ( calc ( bind $?gen22 ( delete-member$ $?gen21 ( create$ rule1-overruled $?gen20 ) ) ) ) ?gen17 <- ( robbery_lv1 ( negative-overruled $?gen22 ) )"))

([rule1-overruled] of derived-attribute-rule
   (pos-name rule1-overruled-gen658)
   (depends-on declare lc:case lc:case robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 2 [rule1] ) ) ) ?gen24 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ( positive ?gen23 & : ( >= ?gen23 1 ) ) ) ?gen26 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ( positive ?gen25 & : ( >= ?gen25 1 ) ) ) ?gen17 <- ( robbery_lv1 ( defendant ?Defendant ) ( negative-support $?gen20 ) ( negative-overruled $?gen21 & : ( not ( subseq-pos ( create$ rule1-overruled $?gen20 $$$ $?gen21 ) ) ) ) ( positive-defeated $?gen19 & : ( not ( member$ rule1 $?gen19 ) ) ) ) ( test ( eq ( class ?gen17 ) robbery_lv1 ) ) => ( calc ( bind $?gen22 ( create$ rule1-overruled $?gen20 $?gen21 ) ) ) ?gen17 <- ( robbery_lv1 ( negative-overruled $?gen22 ) )"))

([rule1-support] of derived-attribute-rule
   (pos-name rule1-support-gen660)
   (depends-on declare lc:case lc:case robbery_lv1)
   (implies robbery_lv1)
   (del-name nil)
   (derived-attribute-rule "( declare ( priority ( calc-defeasible-priority 5 [rule1] ) ) ) ?gen15 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen16 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ?gen17 <- ( robbery_lv1 ( defendant ?Defendant ) ( positive-support $?gen19 & : ( not ( subseq-pos ( create$ rule1 ?gen15 ?gen16 $$$ $?gen19 ) ) ) ) ) ( test ( eq ( class ?gen17 ) robbery_lv1 ) ) => ( calc ( bind $?gen22 ( create$ rule1 ?gen15 ?gen16 $?gen19 ) ) ) ?gen17 <- ( robbery_lv1 ( positive-support $?gen22 ) )"))

([pen15-deductive] of ntm-deductive-rule
   (pos-name pen15-deductive-gen361)
   (depends-on competition_outcome_arrangement_lv3 max_imprisonment_competition_outcome_arrangement_3)
   (implies max_imprisonment_competition_outcome_arrangement_3)
   (deductive-rule "?gen323 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ( not ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ) ) => ( max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) )")
   (production-rule "( defrule pen15-deductive-gen361 ( declare ( salience ( calc-salience max_imprisonment_competition_outcome_arrangement_3 ) ) ) ( run-deductive-rules ) ( object ( name ?gen323 ) ( is-a competition_outcome_arrangement_lv3 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_competition_outcome_arrangement_3 ) ( value 10 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_competition_outcome_arrangement_3 10 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_competition_outcome_arrangement_3 10 ) ) ) ( make-instance ?oid of max_imprisonment_competition_outcome_arrangement_3 ( value 10 ) ) )")
   (derived-class max_imprisonment_competition_outcome_arrangement_3))

([pen14-deductive] of ntm-deductive-rule
   (pos-name pen14-deductive-gen360)
   (depends-on competition_outcome_arrangement_lv3 min_imprisonment_competition_outcome_arrangement_2)
   (implies min_imprisonment_competition_outcome_arrangement_2)
   (deductive-rule "?gen314 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ( not ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ) ) => ( min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) )")
   (production-rule "( defrule pen14-deductive-gen360 ( declare ( salience ( calc-salience min_imprisonment_competition_outcome_arrangement_2 ) ) ) ( run-deductive-rules ) ( object ( name ?gen314 ) ( is-a competition_outcome_arrangement_lv3 ) ( defendant ?Defendant ) ) ( not ( object ( is-a min_imprisonment_competition_outcome_arrangement_2 ) ( value 1 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat min_imprisonment_competition_outcome_arrangement_2 1 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat min_imprisonment_competition_outcome_arrangement_2 1 ) ) ) ( make-instance ?oid of min_imprisonment_competition_outcome_arrangement_2 ( value 1 ) ) )")
   (derived-class min_imprisonment_competition_outcome_arrangement_2))

([pen13-deductive] of ntm-deductive-rule
   (pos-name pen13-deductive-gen359)
   (depends-on competition_outcome_arrangement_lv2 max_imprisonment_competition_outcome_arrangement_2)
   (implies max_imprisonment_competition_outcome_arrangement_2)
   (deductive-rule "?gen305 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ( not ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ) ) => ( max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) )")
   (production-rule "( defrule pen13-deductive-gen359 ( declare ( salience ( calc-salience max_imprisonment_competition_outcome_arrangement_2 ) ) ) ( run-deductive-rules ) ( object ( name ?gen305 ) ( is-a competition_outcome_arrangement_lv2 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_competition_outcome_arrangement_2 ) ( value 5 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_competition_outcome_arrangement_2 5 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_competition_outcome_arrangement_2 5 ) ) ) ( make-instance ?oid of max_imprisonment_competition_outcome_arrangement_2 ( value 5 ) ) )")
   (derived-class max_imprisonment_competition_outcome_arrangement_2))

([pen12-deductive] of ntm-deductive-rule
   (pos-name pen12-deductive-gen358)
   (depends-on competition_outcome_arrangement_lv2 min_imprisonment_competition_outcome_arrangement_1)
   (implies min_imprisonment_competition_outcome_arrangement_1)
   (deductive-rule "?gen296 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ( not ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ) ) => ( min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) )")
   (production-rule "( defrule pen12-deductive-gen358 ( declare ( salience ( calc-salience min_imprisonment_competition_outcome_arrangement_1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen296 ) ( is-a competition_outcome_arrangement_lv2 ) ( defendant ?Defendant ) ) ( not ( object ( is-a min_imprisonment_competition_outcome_arrangement_1 ) ( value 6 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat min_imprisonment_competition_outcome_arrangement_1 6 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat min_imprisonment_competition_outcome_arrangement_1 6 ) ) ) ( make-instance ?oid of min_imprisonment_competition_outcome_arrangement_1 ( value 6 ) ) )")
   (derived-class min_imprisonment_competition_outcome_arrangement_1))

([pen11-deductive] of ntm-deductive-rule
   (pos-name pen11-deductive-gen357)
   (depends-on competition_outcome_arrangement_lv1 max_imprisonment_competition_outcome_arrangement_1)
   (implies max_imprisonment_competition_outcome_arrangement_1)
   (deductive-rule "?gen287 <- ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) ( not ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ) ) => ( max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) )")
   (production-rule "( defrule pen11-deductive-gen357 ( declare ( salience ( calc-salience max_imprisonment_competition_outcome_arrangement_1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen287 ) ( is-a competition_outcome_arrangement_lv1 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_competition_outcome_arrangement_1 ) ( value 3 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_competition_outcome_arrangement_1 3 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_competition_outcome_arrangement_1 3 ) ) ) ( make-instance ?oid of max_imprisonment_competition_outcome_arrangement_1 ( value 3 ) ) )")
   (derived-class max_imprisonment_competition_outcome_arrangement_1))

([pen10-deductive] of ntm-deductive-rule
   (pos-name pen10-deductive-gen356)
   (depends-on robbery_lv6 max_imprisonment_robbery_6)
   (implies max_imprisonment_robbery_6)
   (deductive-rule "?gen278 <- ( robbery_lv6 ( defendant ?Defendant ) ) ( not ( max_imprisonment_robbery_6 ( value 3 ) ) ) => ( max_imprisonment_robbery_6 ( value 3 ) )")
   (production-rule "( defrule pen10-deductive-gen356 ( declare ( salience ( calc-salience max_imprisonment_robbery_6 ) ) ) ( run-deductive-rules ) ( object ( name ?gen278 ) ( is-a robbery_lv6 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_robbery_6 ) ( value 3 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_6 3 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_6 3 ) ) ) ( make-instance ?oid of max_imprisonment_robbery_6 ( value 3 ) ) )")
   (derived-class max_imprisonment_robbery_6))

([pen9-deductive] of ntm-deductive-rule
   (pos-name pen9-deductive-gen355)
   (depends-on robbery_lv5 max_imprisonment_robbery_5)
   (implies max_imprisonment_robbery_5)
   (deductive-rule "?gen269 <- ( robbery_lv5 ( defendant ?Defendant ) ) ( not ( max_imprisonment_robbery_5 ( value Forever ) ) ) => ( max_imprisonment_robbery_5 ( value Forever ) )")
   (production-rule "( defrule pen9-deductive-gen355 ( declare ( salience ( calc-salience max_imprisonment_robbery_5 ) ) ) ( run-deductive-rules ) ( object ( name ?gen269 ) ( is-a robbery_lv5 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_robbery_5 ) ( value Forever ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_5 Forever ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_5 Forever ) ) ) ( make-instance ?oid of max_imprisonment_robbery_5 ( value Forever ) ) )")
   (derived-class max_imprisonment_robbery_5))

([pen8-deductive] of ntm-deductive-rule
   (pos-name pen8-deductive-gen354)
   (depends-on robbery_lv5 min_imprisonment_robbery_4)
   (implies min_imprisonment_robbery_4)
   (deductive-rule "?gen260 <- ( robbery_lv5 ( defendant ?Defendant ) ) ( not ( min_imprisonment_robbery_4 ( value 10 ) ) ) => ( min_imprisonment_robbery_4 ( value 10 ) )")
   (production-rule "( defrule pen8-deductive-gen354 ( declare ( salience ( calc-salience min_imprisonment_robbery_4 ) ) ) ( run-deductive-rules ) ( object ( name ?gen260 ) ( is-a robbery_lv5 ) ( defendant ?Defendant ) ) ( not ( object ( is-a min_imprisonment_robbery_4 ) ( value 10 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_4 10 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_4 10 ) ) ) ( make-instance ?oid of min_imprisonment_robbery_4 ( value 10 ) ) )")
   (derived-class min_imprisonment_robbery_4))

([pen7-deductive] of ntm-deductive-rule
   (pos-name pen7-deductive-gen353)
   (depends-on robbery_lv4 max_imprisonment_robbery_4)
   (implies max_imprisonment_robbery_4)
   (deductive-rule "?gen251 <- ( robbery_lv4 ( defendant ?Defendant ) ) ( not ( max_imprisonment_robbery_4 ( value 15 ) ) ) => ( max_imprisonment_robbery_4 ( value 15 ) )")
   (production-rule "( defrule pen7-deductive-gen353 ( declare ( salience ( calc-salience max_imprisonment_robbery_4 ) ) ) ( run-deductive-rules ) ( object ( name ?gen251 ) ( is-a robbery_lv4 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_robbery_4 ) ( value 15 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_4 15 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_4 15 ) ) ) ( make-instance ?oid of max_imprisonment_robbery_4 ( value 15 ) ) )")
   (derived-class max_imprisonment_robbery_4))

([pen6-deductive] of ntm-deductive-rule
   (pos-name pen6-deductive-gen352)
   (depends-on robbery_lv4 min_imprisonment_robbery_3)
   (implies min_imprisonment_robbery_3)
   (deductive-rule "?gen242 <- ( robbery_lv4 ( defendant ?Defendant ) ) ( not ( min_imprisonment_robbery_3 ( value 3 ) ) ) => ( min_imprisonment_robbery_3 ( value 3 ) )")
   (production-rule "( defrule pen6-deductive-gen352 ( declare ( salience ( calc-salience min_imprisonment_robbery_3 ) ) ) ( run-deductive-rules ) ( object ( name ?gen242 ) ( is-a robbery_lv4 ) ( defendant ?Defendant ) ) ( not ( object ( is-a min_imprisonment_robbery_3 ) ( value 3 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_3 3 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_3 3 ) ) ) ( make-instance ?oid of min_imprisonment_robbery_3 ( value 3 ) ) )")
   (derived-class min_imprisonment_robbery_3))

([pen5-deductive] of ntm-deductive-rule
   (pos-name pen5-deductive-gen351)
   (depends-on robbery_lv3 max_imprisonment_robbery_3)
   (implies max_imprisonment_robbery_3)
   (deductive-rule "?gen233 <- ( robbery_lv3 ( defendant ?Defendant ) ) ( not ( max_imprisonment_robbery_3 ( value 12 ) ) ) => ( max_imprisonment_robbery_3 ( value 12 ) )")
   (production-rule "( defrule pen5-deductive-gen351 ( declare ( salience ( calc-salience max_imprisonment_robbery_3 ) ) ) ( run-deductive-rules ) ( object ( name ?gen233 ) ( is-a robbery_lv3 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_robbery_3 ) ( value 12 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_3 12 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_3 12 ) ) ) ( make-instance ?oid of max_imprisonment_robbery_3 ( value 12 ) ) )")
   (derived-class max_imprisonment_robbery_3))

([pen4-deductive] of ntm-deductive-rule
   (pos-name pen4-deductive-gen350)
   (depends-on robbery_lv2 max_imprisonment_robbery_2)
   (implies max_imprisonment_robbery_2)
   (deductive-rule "?gen224 <- ( robbery_lv2 ( defendant ?Defendant ) ) ( not ( max_imprisonment_robbery_2 ( value 10 ) ) ) => ( max_imprisonment_robbery_2 ( value 10 ) )")
   (production-rule "( defrule pen4-deductive-gen350 ( declare ( salience ( calc-salience max_imprisonment_robbery_2 ) ) ) ( run-deductive-rules ) ( object ( name ?gen224 ) ( is-a robbery_lv2 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_robbery_2 ) ( value 10 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_2 10 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_2 10 ) ) ) ( make-instance ?oid of max_imprisonment_robbery_2 ( value 10 ) ) )")
   (derived-class max_imprisonment_robbery_2))

([pen3-deductive] of ntm-deductive-rule
   (pos-name pen3-deductive-gen349)
   (depends-on robbery_min_imprisonment_lv2_3 min_imprisonment_robbery_2)
   (implies min_imprisonment_robbery_2)
   (deductive-rule "?gen215 <- ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ) ( not ( min_imprisonment_robbery_2 ( value 2 ) ) ) => ( min_imprisonment_robbery_2 ( value 2 ) )")
   (production-rule "( defrule pen3-deductive-gen349 ( declare ( salience ( calc-salience min_imprisonment_robbery_2 ) ) ) ( run-deductive-rules ) ( object ( name ?gen215 ) ( is-a robbery_min_imprisonment_lv2_3 ) ( defendant ?Defendant ) ) ( not ( object ( is-a min_imprisonment_robbery_2 ) ( value 2 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_2 2 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_2 2 ) ) ) ( make-instance ?oid of min_imprisonment_robbery_2 ( value 2 ) ) )")
   (derived-class min_imprisonment_robbery_2))

([pen2-deductive] of ntm-deductive-rule
   (pos-name pen2-deductive-gen348)
   (depends-on robbery_lv1 max_imprisonment_robbery_1)
   (implies max_imprisonment_robbery_1)
   (deductive-rule "?gen206 <- ( robbery_lv1 ( defendant ?Defendant ) ) ( not ( max_imprisonment_robbery_1 ( value 8 ) ) ) => ( max_imprisonment_robbery_1 ( value 8 ) )")
   (production-rule "( defrule pen2-deductive-gen348 ( declare ( salience ( calc-salience max_imprisonment_robbery_1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen206 ) ( is-a robbery_lv1 ) ( defendant ?Defendant ) ) ( not ( object ( is-a max_imprisonment_robbery_1 ) ( value 8 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_1 8 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat max_imprisonment_robbery_1 8 ) ) ) ( make-instance ?oid of max_imprisonment_robbery_1 ( value 8 ) ) )")
   (derived-class max_imprisonment_robbery_1))

([pen1-deductive] of ntm-deductive-rule
   (pos-name pen1-deductive-gen347)
   (depends-on robbery_lv1 min_imprisonment_robbery_1)
   (implies min_imprisonment_robbery_1)
   (deductive-rule "?gen197 <- ( robbery_lv1 ( defendant ?Defendant ) ) ( not ( min_imprisonment_robbery_1 ( value 1 ) ) ) => ( min_imprisonment_robbery_1 ( value 1 ) )")
   (production-rule "( defrule pen1-deductive-gen347 ( declare ( salience ( calc-salience min_imprisonment_robbery_1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen197 ) ( is-a robbery_lv1 ) ( defendant ?Defendant ) ) ( not ( object ( is-a min_imprisonment_robbery_1 ) ( value 1 ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_1 1 ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat min_imprisonment_robbery_1 1 ) ) ) ( make-instance ?oid of min_imprisonment_robbery_1 ( value 1 ) ) )")
   (derived-class min_imprisonment_robbery_1))

([rule15-deductive] of ntm-deductive-rule
   (pos-name rule15-deductive-gen346)
   (depends-on competition_outcome_arrangement_lv3 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (deductive-rule "?gen188 <- ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ( not ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) ) => ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule15-deductive-gen346 ( declare ( salience ( calc-salience competition_outcome_arrangement_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen188 ) ( is-a competition_outcome_arrangement_lv3 ) ( defendant ?Defendant ) ) ( not ( object ( is-a competition_outcome_arrangement_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv1 ?Defendant ) ) ) ( make-instance ?oid of competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) )")
   (derived-class competition_outcome_arrangement_lv1))

([rule14-deductive] of ntm-deductive-rule
   (pos-name rule14-deductive-gen345)
   (depends-on competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (deductive-rule "?gen179 <- ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ( not ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) ) => ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule14-deductive-gen345 ( declare ( salience ( calc-salience competition_outcome_arrangement_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen179 ) ( is-a competition_outcome_arrangement_lv2 ) ( defendant ?Defendant ) ) ( not ( object ( is-a competition_outcome_arrangement_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv1 ?Defendant ) ) ) ( make-instance ?oid of competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) )")
   (derived-class competition_outcome_arrangement_lv1))

([rule13-deductive] of ntm-deductive-rule
   (pos-name rule13-deductive-gen344)
   (depends-on lc:case lc:case competition_outcome_arrangement_lv3)
   (implies competition_outcome_arrangement_lv3)
   (deductive-rule "?gen166 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen167 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( test ( > ?Money 40000 ) ) ( not ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) ) => ( competition_outcome_arrangement_lv3 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule13-deductive-gen344 ( declare ( salience ( calc-salience competition_outcome_arrangement_lv3 ) ) ) ( run-deductive-rules ) ( object ( name ?gen166 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ( object ( name ?gen167 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( test ( > ?Money 40000 ) ) ( not ( object ( is-a competition_outcome_arrangement_lv3 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv3 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv3 ?Defendant ) ) ) ( make-instance ?oid of competition_outcome_arrangement_lv3 ( defendant ?Defendant ) ) )")
   (derived-class competition_outcome_arrangement_lv3))

([rule12-deductive] of ntm-deductive-rule
   (pos-name rule12-deductive-gen343)
   (depends-on lc:case lc:case competition_outcome_arrangement_lv2)
   (implies competition_outcome_arrangement_lv2)
   (deductive-rule "?gen152 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen153 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ( not ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) ) => ( competition_outcome_arrangement_lv2 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule12-deductive-gen343 ( declare ( salience ( calc-salience competition_outcome_arrangement_lv2 ) ) ) ( run-deductive-rules ) ( object ( name ?gen152 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ( object ( name ?gen153 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( test ( > ?Money 10000 ) ) ( test ( <= ?Money 40000 ) ) ( not ( object ( is-a competition_outcome_arrangement_lv2 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv2 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv2 ?Defendant ) ) ) ( make-instance ?oid of competition_outcome_arrangement_lv2 ( defendant ?Defendant ) ) )")
   (derived-class competition_outcome_arrangement_lv2))

([rule11-deductive] of ntm-deductive-rule
   (pos-name rule11-deductive-gen342)
   (depends-on lc:case competition_outcome_arrangement_lv1)
   (implies competition_outcome_arrangement_lv1)
   (deductive-rule "?gen143 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( not ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) ) => ( competition_outcome_arrangement_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule11-deductive-gen342 ( declare ( salience ( calc-salience competition_outcome_arrangement_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen143 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"competition_outcome_arrangement\" ) ) ( not ( object ( is-a competition_outcome_arrangement_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat competition_outcome_arrangement_lv1 ?Defendant ) ) ) ( make-instance ?oid of competition_outcome_arrangement_lv1 ( defendant ?Defendant ) ) )")
   (derived-class competition_outcome_arrangement_lv1))

([rule10-deductive] of ntm-deductive-rule
   (pos-name rule10-deductive-gen341)
   (depends-on robbery_lv6 robbery_lv1)
   (implies robbery_lv1)
   (deductive-rule "?gen134 <- ( robbery_lv6 ( defendant ?Defendant ) ) ( not ( robbery_lv1 ( defendant ?Defendant ) ) ) => ( robbery_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule10-deductive-gen341 ( declare ( salience ( calc-salience robbery_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen134 ) ( is-a robbery_lv6 ) ( defendant ?Defendant ) ) ( not ( object ( is-a robbery_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv1 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv1))

([rule9-deductive] of ntm-deductive-rule
   (pos-name rule9-deductive-gen340)
   (depends-on lc:case lc:case lc:case robbery_lv6)
   (implies robbery_lv6)
   (deductive-rule "?gen118 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen119 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen120 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( test ( < ?Money 150 ) ) ( not ( robbery_lv6 ( defendant ?Defendant ) ) ) => ( robbery_lv6 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule9-deductive-gen340 ( declare ( salience ( calc-salience robbery_lv6 ) ) ) ( run-deductive-rules ) ( object ( name ?gen118 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ( object ( name ?gen119 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( object ( name ?gen120 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( test ( < ?Money 150 ) ) ( not ( object ( is-a robbery_lv6 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv6 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv6 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv6 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv6))

([rule8-deductive] of ntm-deductive-rule
   (pos-name rule8-deductive-gen339)
   (depends-on lc:case lc:case robbery_lv5)
   (implies robbery_lv5)
   (deductive-rule "?gen106 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen107 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ) ( not ( robbery_lv5 ( defendant ?Defendant ) ) ) => ( robbery_lv5 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule8-deductive-gen339 ( declare ( salience ( calc-salience robbery_lv5 ) ) ) ( run-deductive-rules ) ( object ( name ?gen106 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( object ( name ?gen107 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"deprived_of_life\" ) ) ( not ( object ( is-a robbery_lv5 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv5 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv5 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv5 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv5))

([rule7-deductive] of ntm-deductive-rule
   (pos-name rule7-deductive-gen338)
   (depends-on lc:case lc:case robbery_lv4)
   (implies robbery_lv4)
   (deductive-rule "?gen94 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen95 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ) ( not ( robbery_lv4 ( defendant ?Defendant ) ) ) => ( robbery_lv4 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule7-deductive-gen338 ( declare ( salience ( calc-salience robbery_lv4 ) ) ) ( run-deductive-rules ) ( object ( name ?gen94 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( object ( name ?gen95 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"group_or_seriously_injured\" ) ) ( not ( object ( is-a robbery_lv4 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv4 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv4 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv4 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv4))

([rule6-deductive] of ntm-deductive-rule
   (pos-name rule6-deductive-gen337)
   (depends-on robbery_lv3 robbery_lv1)
   (implies robbery_lv1)
   (deductive-rule "?gen85 <- ( robbery_lv3 ( defendant ?Defendant ) ) ( not ( robbery_lv1 ( defendant ?Defendant ) ) ) => ( robbery_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule6-deductive-gen337 ( declare ( salience ( calc-salience robbery_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen85 ) ( is-a robbery_lv3 ) ( defendant ?Defendant ) ) ( not ( object ( is-a robbery_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv1 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv1))

([rule5-deductive] of ntm-deductive-rule
   (pos-name rule5-deductive-gen336)
   (depends-on robbery_lv2 robbery_lv1)
   (implies robbery_lv1)
   (deductive-rule "?gen76 <- ( robbery_lv2 ( defendant ?Defendant ) ) ( not ( robbery_lv1 ( defendant ?Defendant ) ) ) => ( robbery_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule5-deductive-gen336 ( declare ( salience ( calc-salience robbery_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen76 ) ( is-a robbery_lv2 ) ( defendant ?Defendant ) ) ( not ( object ( is-a robbery_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv1 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv1))

([rule4-deductive] of ntm-deductive-rule
   (pos-name rule4-deductive-gen335)
   (depends-on lc:case lc:case lc:case robbery_lv3)
   (implies robbery_lv3)
   (deductive-rule "?gen60 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen61 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 30000 ) ) ?gen63 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( robbery_lv3 ( defendant ?Defendant ) ) ) => ( robbery_lv3 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule4-deductive-gen335 ( declare ( salience ( calc-salience robbery_lv3 ) ) ) ( run-deductive-rules ) ( object ( name ?gen60 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ( object ( name ?gen61 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 30000 ) ) ( object ( name ?gen63 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( object ( is-a robbery_lv3 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv3 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv3 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv3 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv3))

([rule3-deductive] of ntm-deductive-rule
   (pos-name rule3-deductive-gen334)
   (depends-on lc:case lc:case lc:case robbery_lv2)
   (implies robbery_lv2)
   (deductive-rule "?gen43 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen44 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ?gen47 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( robbery_lv2 ( defendant ?Defendant ) ) ) => ( robbery_lv2 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule3-deductive-gen334 ( declare ( salience ( calc-salience robbery_lv2 ) ) ) ( run-deductive-rules ) ( object ( name ?gen43 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ( object ( name ?gen44 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 3000 ) ) ( test ( <= ?Money 30000 ) ) ( object ( name ?gen47 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( object ( is-a robbery_lv2 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv2 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv2 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv2 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv2))

([rule2-deductive] of ntm-deductive-rule
   (pos-name rule2-deductive-gen333)
   (depends-on lc:case lc:case lc:case robbery_min_imprisonment_lv2_3)
   (implies robbery_min_imprisonment_lv2_3)
   (deductive-rule "?gen27 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ?gen28 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 3000 ) ) ?gen30 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ) ) => ( robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule2-deductive-gen333 ( declare ( salience ( calc-salience robbery_min_imprisonment_lv2_3 ) ) ) ( run-deductive-rules ) ( object ( name ?gen27 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:money ?Money ) ) ( object ( name ?gen28 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( test ( > ?Money 3000 ) ) ( object ( name ?gen30 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( object ( is-a robbery_min_imprisonment_lv2_3 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_min_imprisonment_lv2_3 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_min_imprisonment_lv2_3 ?Defendant ) ) ) ( make-instance ?oid of robbery_min_imprisonment_lv2_3 ( defendant ?Defendant ) ) )")
   (derived-class robbery_min_imprisonment_lv2_3))

([rule1-deductive] of ntm-deductive-rule
   (pos-name rule1-deductive-gen332)
   (depends-on lc:case lc:case robbery_lv1)
   (implies robbery_lv1)
   (deductive-rule "?gen15 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ?gen16 <- ( lc:case ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( robbery_lv1 ( defendant ?Defendant ) ) ) => ( robbery_lv1 ( defendant ?Defendant ) )")
   (production-rule "( defrule rule1-deductive-gen332 ( declare ( salience ( calc-salience robbery_lv1 ) ) ) ( run-deductive-rules ) ( object ( name ?gen15 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_type \"robbery\" ) ) ( object ( name ?gen16 ) ( is-a lc:case ) ( lc:defendant ?Defendant ) ( lc:steal_way \"standard\" ) ) ( not ( object ( is-a robbery_lv1 ) ( defendant ?Defendant ) ) ) ( test ( not ( instance-existp ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ) ) => ( bind ?oid ( symbol-to-instance-name ( sym-cat robbery_lv1 ?Defendant ) ) ) ( make-instance ?oid of robbery_lv1 ( defendant ?Defendant ) ) )")
   (derived-class robbery_lv1))

