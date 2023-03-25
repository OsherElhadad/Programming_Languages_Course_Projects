type bool_expr =
	| Var of string
	| Not of bool_expr
	| And of bool_expr * bool_expr
	| Or of bool_expr * bool_expr;;
	
let rec add_to_all_tuples t l =
	match l with
	| first::rest -> (t::first)::(add_to_all_tuples t rest)
	| _ -> [];;
	
let rec assigns l =
	match l with
	| first::rest -> (add_to_all_tuples (first, true) (assigns rest))@ (add_to_all_tuples (first, false) (assigns rest))
	| _ -> [[]];;

let rec get_val l v =
	match l with
	| (a, b)::rest -> if v = a then b else get_val rest v;;

let rec calc l expr =
	match expr with
	| Var v -> get_val l v
	| Not (e) -> not (calc l e)
	| And (left, right) -> (calc l left) && (calc l right)
	| Or (left, right) -> (calc l left) || (calc l right);;

let rec get_all_assigns_and_vals l expr =
	match l with
	| first::rest -> (first, calc first expr)::(get_all_assigns_and_vals rest expr)
	| _ -> [];;

let table l expr = get_all_assigns_and_vals (assigns l) expr;;