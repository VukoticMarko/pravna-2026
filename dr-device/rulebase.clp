(import-rdf "facts.rdf")
		(export-rdf export.rdf  max_imprisonment_robbery_1 max_imprisonment_robbery_2 max_imprisonment_robbery_3 max_imprisonment_robbery_4 max_imprisonment_robbery_5 max_imprisonment_robbery_6 min_imprisonment_robbery_1 min_imprisonment_robbery_2 min_imprisonment_robbery_3 min_imprisonment_robbery_4 robbery_min_imprisonment_lv2_3 robbery_lv1 robbery_lv2 robbery_lv3 robbery_lv4 robbery_lv5 robbery_lv6 max_imprisonment_competition_outcome_arrangement_1 max_imprisonment_competition_outcome_arrangement_2 max_imprisonment_competition_outcome_arrangement_3 min_imprisonment_competition_outcome_arrangement_1 min_imprisonment_competition_outcome_arrangement_2 competition_outcome_arrangement_lv1 competition_outcome_arrangement_lv2 competition_outcome_arrangement_lv3)
		(export-proof proof.ruleml)
		
(defeasiblerule rule1
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "standard")
	) 
  => 
	 
	(robbery_lv1 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule2
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:money ?Money)
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	) 
		(test 
		(>  ?Money 3000
		)
	)
	 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "standard")
	) 
  => 
	 
	(robbery_min_imprisonment_lv2_3 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule3
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:money ?Money)
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	) 
		(test 
		(>  ?Money 3000
		)
	)
	
		(test 
		(<=  ?Money 30000
		)
	)
	 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "standard")
	) 
  => 
	 
	(robbery_lv2 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule4
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:money ?Money)
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	) 
		(test 
		(>  ?Money 30000
		)
	)
	 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "standard")
	) 
  => 
	 
	(robbery_lv3 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule5
		 
	(robbery_lv2 
		(
		 defendant ?Defendant)
	) 
  => 
	
		(not  
	(robbery_lv1 
		(
		 defendant ?Defendant)
	) )
	
) 
	
(defeasiblerule rule6
		 
	(robbery_lv3 
		(
		 defendant ?Defendant)
	) 
  => 
	
		(not  
	(robbery_lv1 
		(
		 defendant ?Defendant)
	) )
	
) 
	
(defeasiblerule rule7
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "group_or_seriously_injured")
	) 
  => 
	 
	(robbery_lv4 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule8
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "deprived_of_life")
	) 
  => 
	 
	(robbery_lv5 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule9
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:money ?Money)
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "robbery")
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_way "standard")
	) 
		(test 
		(<  ?Money 150
		)
	)
	
  => 
	 
	(robbery_lv6 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule10
		 
	(robbery_lv6 
		(
		 defendant ?Defendant)
	) 
  => 
	
		(not  
	(robbery_lv1 
		(
		 defendant ?Defendant)
	) )
	
) 
	
(defeasiblerule rule11
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "competition_outcome_arrangement")
	) 
  => 
	 
	(competition_outcome_arrangement_lv1 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule12
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:money ?Money)
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "competition_outcome_arrangement")
	) 
		(test 
		(>  ?Money 10000
		)
	)
	
		(test 
		(<=  ?Money 40000
		)
	)
	
  => 
	 
	(competition_outcome_arrangement_lv2 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule13
		 
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:money ?Money)
	)  
	(lc:case 
		(
		 lc:defendant ?Defendant)
	
		(
		 lc:steal_type "competition_outcome_arrangement")
	) 
		(test 
		(>  ?Money 40000
		)
	)
	
  => 
	 
	(competition_outcome_arrangement_lv3 
		(
		 defendant ?Defendant)
	) 
) 
	
(defeasiblerule rule14
		 
	(competition_outcome_arrangement_lv2 
		(
		 defendant ?Defendant)
	) 
  => 
	
		(not  
	(competition_outcome_arrangement_lv1 
		(
		 defendant ?Defendant)
	) )
	
) 
	
(defeasiblerule rule15
		 
	(competition_outcome_arrangement_lv3 
		(
		 defendant ?Defendant)
	) 
  => 
	
		(not  
	(competition_outcome_arrangement_lv1 
		(
		 defendant ?Defendant)
	) )
	
) 
	
(defeasiblerule pen1
		 
	(robbery_lv1 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(min_imprisonment_robbery_1 
		(
		 value 1)
	) 
) 
	
(defeasiblerule pen2
		 
	(robbery_lv1 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_robbery_1 
		(
		 value 8)
	) 
) 
	
(defeasiblerule pen3
		 
	(robbery_min_imprisonment_lv2_3 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(min_imprisonment_robbery_2 
		(
		 value 2)
	) 
) 
	
(defeasiblerule pen4
		 
	(robbery_lv2 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_robbery_2 
		(
		 value 10)
	) 
) 
	
(defeasiblerule pen5
		 
	(robbery_lv3 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_robbery_3 
		(
		 value 12)
	) 
) 
	
(defeasiblerule pen6
		 
	(robbery_lv4 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(min_imprisonment_robbery_3 
		(
		 value 3)
	) 
) 
	
(defeasiblerule pen7
		 
	(robbery_lv4 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_robbery_4 
		(
		 value 15)
	) 
) 
	
(defeasiblerule pen8
		 
	(robbery_lv5 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(min_imprisonment_robbery_4 
		(
		 value 10)
	) 
) 
	
(defeasiblerule pen9
		 
	(robbery_lv5 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_robbery_5 
		(
		 value Forever)
	) 
) 
	
(defeasiblerule pen10
		 
	(robbery_lv6 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_robbery_6 
		(
		 value 3)
	) 
) 
	
(defeasiblerule pen11
		 
	(competition_outcome_arrangement_lv1 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_competition_outcome_arrangement_1 
		(
		 value 3)
	) 
) 
	
(defeasiblerule pen12
		 
	(competition_outcome_arrangement_lv2 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(min_imprisonment_competition_outcome_arrangement_1 
		(
		 value 6)
	) 
) 
	
(defeasiblerule pen13
		 
	(competition_outcome_arrangement_lv2 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_competition_outcome_arrangement_2 
		(
		 value 5)
	) 
) 
	
(defeasiblerule pen14
		 
	(competition_outcome_arrangement_lv3 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(min_imprisonment_competition_outcome_arrangement_2 
		(
		 value 1)
	) 
) 
	
(defeasiblerule pen15
		 
	(competition_outcome_arrangement_lv3 
		(
		 defendant ?Defendant)
	) 
  => 
	 
	(max_imprisonment_competition_outcome_arrangement_3 
		(
		 value 10)
	) 
) 
	