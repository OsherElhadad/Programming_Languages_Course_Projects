type bool_expr =
	| Var of string
	| Not of bool_expr
	| And of bool_expr * bool_expr
	| Or of bool_expr * bool_expr;;

let rec calc_two (a1, a2) (b1, b2) expr =
	match expr with
	| Var v -> if a1 = v then a2 else b2
	| Not (e) -> not (calc_two (a1, a2) (b1, b2) e)
	| And (left, right) -> (calc_two (a1, a2) (b1, b2) left) && (calc_two (a1, a2) (b1, b2) right)
	| Or (left, right) -> (calc_two (a1, a2) (b1, b2) left) || (calc_two (a1, a2) (b1, b2) right);;

let table_two a b expr =
	[(true, true, calc_two (a, true) (b, true) expr); (true, false, calc_two (a, true) (b, false) expr); (false, true, calc_two (a, false) (b, true) expr); (false, false, calc_two (a, false) (b, false) expr)];;