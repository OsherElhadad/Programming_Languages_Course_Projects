(* This is an OCaml editor.
   Enter your program here and send it to the toplevel using the "Eval code"
   button or [Ctrl-e]. *)

let rec insert_at element index list = match index, list with 
  | 0, _ -> element :: list
  | _, h::t -> h :: insert_at element (index-1) t;;

let rec insert_none_at index list = insert_at "None" index list;;

type 'a binary_tree = 
  | Empty
  | Node of 'a * 'a binary_tree * 'a binary_tree;;

let rec add_to_search_tree tree num = match tree with 
  | Empty -> Node(num, Empty, Empty)
  | Node(value, left, right) -> 
      if num > value then Node(value, left, add_to_search_tree right num)
      else Node(value, add_to_search_tree left num, right);; 

type bool_expr =
  | Var of string
  | Not of bool_expr
  | And of bool_expr * bool_expr
  | Or of bool_expr * bool_expr;;


let rec eval_bool_expr a_assign b_assign exp = match exp with
  | Var(x) -> if(x = "a") then a_assign else b_assign
  | Not(e) -> if(eval_bool_expr a_assign b_assign e) then false else true
  | And(e1, e2) -> 
      let e1_val = eval_bool_expr a_assign b_assign e1 in
      let e2_val = eval_bool_expr a_assign b_assign e2 in
      if(e1_val && e2_val) then true else false 
  | Or(e1, e2) -> 
      let e1_val = eval_bool_expr a_assign b_assign e1 in
      let e2_val = eval_bool_expr a_assign b_assign e2 in
      if(e1_val || e2_val) then true else false;;

let rec table_two var1 var2 exp = 
  [
    (true,true, (eval_bool_expr true true exp)),
    (true,false, (eval_bool_expr true false exp)),
    (false,true, (eval_bool_expr false true exp)),
    (false,false, (eval_bool_expr false false exp))
  ];;

let rec get_variable_val assigns v = match assigns with 
  | (variable, value)::t -> if(variable = v) then value else get_variable_val t v;;

let rec eval_bool_expr_with_list assigns exp = match exp with
  | Var(v) -> get_variable_val assigns v
  | Not(e) -> not(eval_bool_expr_with_list assigns e)
  | And(e1, e2) ->(eval_bool_expr_with_list assigns e1) && (eval_bool_expr_with_list assigns e2)
  | Or(e1, e2) ->(eval_bool_expr_with_list assigns e1) || (eval_bool_expr_with_list assigns e2)
  

let rec add_to_all_assigns l tup = match l with
  | [] -> tup :: [] 
  | h::t -> (tup :: h) @ (add_to_all_assigns t tup);;

let rec get_assigns vars = match vars with
  | h::t -> let assigns =  (get_assigns t) in
      (add_to_all_assigns assigns (h, true)) @ (add_to_all_assigns assigns (h, false))
  | _ -> [[]];;


let rec table vars exp = let assigns = get_assigns vars in
  match assigns with
  | h::t -> (h, eval_bool_expr_with_list assigns exp)::(get_assigns_with_sols t exp)
  | _ -> [];;



let sol = table_two "a" "b" (And(Var("a"), Or(Var "a",Var "b")));; 