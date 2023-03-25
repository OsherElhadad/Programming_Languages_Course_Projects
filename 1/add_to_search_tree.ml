type 'a binary_tree =
	| Empty
	| Node of 'a * 'a binary_tree * 'a binary_tree;;
	
let rec add_to_search_tree tree num = 
	match tree with
	| Empty -> Node (num, Empty, Empty)
	| Node (old_num, left, right) -> if old_num > num then Node (old_num, add_to_search_tree left num, right) else Node (old_num, left, add_to_search_tree right num);;