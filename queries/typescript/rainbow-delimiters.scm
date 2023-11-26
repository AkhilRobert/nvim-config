;inherits: javascript

(array_pattern
  "[" @delimiter
  "]" @delimiter @sentinel
) @container

(array_type
  "[" @delimiter
  "]" @delimiter @sentinel
) @container

(object_type
  "{" @delimiter
  "}" @delimiter @sentinel
) @container

(variable_declarator
  name: (array_pattern 
    "[" @delimiter
    "]" @delimiter @sentinel
  )
) @container
