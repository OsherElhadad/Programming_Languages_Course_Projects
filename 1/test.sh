#!/bin/bash
rm -rf results 2> /dev/null || true
mkdir results

if [ "$1" = "insert_at" ] || [ "$1" = "all" ]
then
    # insert_at test1
    cat insert_at.ml >> temp.ml
    echo "
    let res = insert_at \"5\" 2 [\"0\";\"1\";\"2\";\"3\"];;

    List.iter print_endline res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/insert_at_res1.txt
    echo -n "number of error in insert_at_test1: " >> res
    diff -y --suppress-common-lines test/insert_at_test1.txt results/insert_at_res1.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/insert_at_test1.txt results/insert_at_res1.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

    # insert_at test2
    cat insert_at.ml >> temp.ml
    echo "
    let res = insert_at \"Ocaml\" 0 [\"Java\"; \"C\";];;

    List.iter print_endline res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/insert_at_res2.txt
    echo -n "number of error in insert_at_test2: " >> res
    diff -y --suppress-common-lines test/insert_at_test2.txt results/insert_at_res2.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/insert_at_test2.txt results/insert_at_res2.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

    # insert_at test3
    cat insert_at.ml >> temp.ml
    echo "
    let res = insert_at \"Empty List\" 0 [];;

    List.iter print_endline res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/insert_at_res3.txt
    echo -n "number of error in insert_at_test3: " >> res
    diff -y --suppress-common-lines test/insert_at_test3.txt results/insert_at_res3.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/insert_at_test3.txt results/insert_at_res3.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo
fi

if [ "$1" = "insert_none_at" ] || [ "$1" = "all" ]
then
    # insert_none_at test 1
    cat insert_none_at.ml >> temp.ml
    echo "
    let res = insert_none_at 0 [\"0\";\"1\";\"2\";\"3\"];;

    List.iter print_endline res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/insert_none_at_res1.txt
    echo -n "number of error in insert_none_at_test1: " >> res
    diff -y --suppress-common-lines test/insert_none_at_test1.txt results/insert_none_at_res1.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/insert_none_at_test1.txt results/insert_none_at_res1.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

    # insert_none_at test 2
    cat insert_none_at.ml >> temp.ml
    echo "
    let res = insert_none_at 0 [];;

    List.iter print_endline res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/insert_none_at_res2.txt
    echo -n "number of error in insert_none_at_test2: " >> res
    diff -y --suppress-common-lines test/insert_none_at_test2.txt results/insert_none_at_res2.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/insert_none_at_test2.txt results/insert_none_at_res2.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo
fi

if [ "$1" = "add_to_search_tree" ] || [ "$1" = "all" ]
then
    # create_search_tree test 1
    cat add_to_search_tree.ml >> temp.ml
    echo "    
    let res = add_to_search_tree Empty 5;;

 let rec string_of_tree = function
    | Empty -> \"\"
    | Node(data, l, r) ->
       match l, r with
       | Empty, Empty -> string_of_int data
       | _, _ -> (string_of_int data) ^ \"(\" ^ (string_of_tree l)
                 ^ \",\" ^ (string_of_tree r) ^ \")\";;

    print_string (string_of_tree res);;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/add_to_search_tree_res1.txt
    echo -n "number of error in add_to_search_tree_test1: " >> res
    diff -y --suppress-common-lines test/add_to_search_tree_test1.txt results/add_to_search_tree_res1.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/add_to_search_tree_test1.txt results/add_to_search_tree_res1.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

        # create_search_tree test 2
    cat add_to_search_tree.ml >> temp.ml
    echo "    
    let res = add_to_search_tree (Node(5, Empty, Empty)) 1;;

 let rec string_of_tree = function
    | Empty -> \"\"
    | Node(data, l, r) ->
       match l, r with
       | Empty, Empty -> string_of_int data
       | _, _ -> (string_of_int data) ^ \"(\" ^ (string_of_tree l)
                 ^ \",\" ^ (string_of_tree r) ^ \")\";;

    print_string (string_of_tree res);;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/add_to_search_tree_res2.txt
    echo -n "number of error in add_to_search_tree_test2: " >> res
    diff -y --suppress-common-lines test/add_to_search_tree_test2.txt results/add_to_search_tree_res2.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/add_to_search_tree_test2.txt results/add_to_search_tree_res2.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

            # create_search_tree test 3
    cat add_to_search_tree.ml >> temp.ml
    echo "    
    let res = add_to_search_tree (Node(5, Node(1, Empty, Empty), Empty)) 6;;

 let rec string_of_tree = function
    | Empty -> \"\"
    | Node(data, l, r) ->
       match l, r with
       | Empty, Empty -> string_of_int data
       | _, _ -> (string_of_int data) ^ \"(\" ^ (string_of_tree l)
                 ^ \",\" ^ (string_of_tree r) ^ \")\";;

    print_string (string_of_tree res);;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/add_to_search_tree_res3.txt
    echo -n "number of error in add_to_search_tree_test3: " >> res
    diff -y --suppress-common-lines test/add_to_search_tree_test3.txt results/add_to_search_tree_res3.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/add_to_search_tree_test3.txt results/add_to_search_tree_res3.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo
fi

if [ "$1" = "table_two" ] || [ "$1" = "all" ]
then
    # tabe_two test 1
    cat table_two.ml >> temp.ml
    echo "    
    let res = table_two \"a\" \"b\" (And(Var \"a\", Or(Var \"a\", Var \"b\")));;
    let bool_to_string (a : bool) =  if a then \"True\" else \"False\";;
    let print_tuple (a, b, c)  =  bool_to_string a :: [] @ bool_to_string b :: [] @ bool_to_string c:: [];;
    open Printf;;
    let pri (a, b, c) = List.iter (printf \"%s \") (print_tuple (a, b, c));;
    List.iter pri res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/tabe_two_res1.txt
    echo -n "number of error in tabe_two_test1: " >> res
    diff -y --suppress-common-lines test/tabe_two_test1.txt results/tabe_two_res1.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/tabe_two_test1.txt results/tabe_two_res1.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

        # tabe_two test 2
    cat table_two.ml >> temp.ml
    echo "    
    let res = table_two \"x\" \"y\" (Or(And(Var \"y\", Var \"y\"),And(Var \"x\", Var \"x\")));;
    let bool_to_string (a : bool) =  if a then \"True\" else \"False\";;
    let print_tuple (a, b, c)  =  bool_to_string a :: [] @ bool_to_string b :: [] @ bool_to_string c:: [];;
    open Printf;;
    let pri (a, b, c) = List.iter (printf \"%s \") (print_tuple (a, b, c));;
    List.iter pri res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/tabe_two_res2.txt
    echo -n "number of error in tabe_two_test2: " >> res
    diff -y --suppress-common-lines test/tabe_two_test2.txt results/tabe_two_res2.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/tabe_two_test2.txt results/tabe_two_res2.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

          # tabe_two test 3
    cat table_two.ml >> temp.ml
    echo "    
    let res = table_two \"@\" \"$\" (Or(And(Var \"@\", Not(Var \"$\")), And(Var \"$\", Not(Var \"@\"))));;
    let bool_to_string (a : bool) =  if a then \"True\" else \"False\";;
    let print_tuple (a, b, c)  =  bool_to_string a :: [] @ bool_to_string b :: [] @ bool_to_string c:: [];;
    open Printf;;
    let pri (a, b, c) = List.iter (printf \"%s \") (print_tuple (a, b, c));;
    List.iter pri res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/tabe_two_res3.txt
    echo -n "number of error in tabe_two_test3: " >> res
    diff -y --suppress-common-lines test/tabe_two_test3.txt results/tabe_two_res3.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/tabe_two_test3.txt results/tabe_two_res3.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo
fi

if [ "$1" = "table" ] || [ "$1" = "all" ]
then
    # tabe test 1
    cat table.ml >> temp.ml
    echo "    
    let res = table [\"a\"; \"b\"; \"c\"] (Or(And(Var \"a\", Or(Var \"b\", Var \"c\")), Or(And(Var \"a\", Var \"b\"), And(Var \"a\", Var \"c\"))));;
    let bool_to_string (a : bool) =  if a then \"True\" else \"False\";;
    open Printf;;
    let pri (a, b) = (printf \"%s \") (bool_to_string (b));;
    List.iter pri res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/tabe_res1.txt
    echo -n "number of error in tabe_two_test1: " >> res
    diff -y --suppress-common-lines test/tabe_test1.txt results/tabe_res1.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/tabe_test1.txt results/tabe_res1.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo

        # tabe test 2
    cat table.ml >> temp.ml
    echo "    
    let res = table [\"a\"; \"b\"] (And(Var \"a\", Or(Var \"a\", Var \"b\")));;
    let bool_to_string (a : bool) =  if a then \"True\" else \"False\";;
    open Printf;;
    let pri (a, b) = (printf \"%s \") (bool_to_string (b));;
    List.iter pri res;;" >> temp.ml
    ocamlc -o insert temp.ml
    ocamlrun insert >> results/tabe_res2.txt
    echo -n "number of error in tabe_two_test2: " >> res
    diff -y --suppress-common-lines test/tabe_test2.txt results/tabe_res2.txt  | wc -l >> res
    cat res
    rm res
    diff -y --suppress-common-lines test/tabe_test2.txt results/tabe_res2.txt 
    rm insert
    rm temp.ml
    rm temp.cmi
    rm temp.cmo
fi