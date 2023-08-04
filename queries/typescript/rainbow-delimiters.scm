;inherits: javascript

(array_pattern
  "[" @opening
  "]" @closing
) @container

(array_type
  "[" @opening
  "]" @closing
) @container

(object_type
  "{" @opening
  "}" @closing
) @container

(variable_declarator
  name: (array_pattern 
    "[" @opening
    "]" @closing
  )
)
