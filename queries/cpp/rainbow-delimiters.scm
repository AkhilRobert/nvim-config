; inherits: cpp

(condition_clause
  "(" @delimiter
  ")" @delimiter @sentinel
) @container

(for_statement
  "(" @delimiter
  ")" @delimiter @sentinel
) @container

(for_range_loop
  body: (compound_statement
          "{" @delimiter 
          "}" @delimiter @sentinel) 
) @container

(for_range_loop
  "(" @delimiter
  ")" @delimiter @sentinel
) @container

