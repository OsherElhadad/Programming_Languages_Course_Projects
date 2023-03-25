let rec insert_at element index list = match index, list with
 | 0, list -> element :: list 
 | x, first::rest -> first :: (insert_at element (index-1) rest);;

let insert_none_at index list = insert_at "None" index list;;
