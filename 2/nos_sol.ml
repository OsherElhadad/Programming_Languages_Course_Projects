[@@@ocaml.warning "-8"];;

let rec nos c = match c with 
 (Ast.Ass (x, e), s) -> Semantics.update x e s
 | (Skip, s) -> s
 | (Comp (s1, s2), s) -> nos (s2, nos(s1, s))
 | (If (b, s1, s2), s) -> if ((Semantics.solve_b b s) = "tt") then (nos (s1, s)) else (nos (s2, s))
 | (While (b, s1), s) -> if ((Semantics.solve_b b s) = "tt") then (nos (While (b, s1),nos (s1, s))) else (nos (Skip, s))
 | (Do_While((s1, b)), s) -> if((Semantics.solve_b b s) = "tt") then nos(Do_While(s1,b), nos (s1, s)) else nos (s1, s);;

(* tests *) 

print_string "x = ";;
print_int (let new_state = nos (Ast.test1, Semantics.s0) in new_state "x");;
print_endline "";;

print_string "x = ";;
print_int (let new_state = nos (Ast.test2, Semantics.s0) in new_state "x");;
print_endline "";;

print_string "x = ";;
print_int (let new_state = nos (Ast.test3, Semantics.s0) in new_state "x");;
print_endline "";;

print_string "x = ";;
print_int (let new_state = nos (Ast.test4, Semantics.s1) in new_state "x");;
print_endline "";;

print_string "y = ";;
print_int (let new_state = nos (Ast.test4, Semantics.s1) in new_state "y");;
print_endline "";;