; inherits: typescript
;; This is to remove tag highlighting in the JSX Tags

(jsx_expression
  "{" @delimiter
  "}" @delimiter @sentinel
) @container


(variable_declarator
  name: (array_pattern 
    "[" @delimiter
    "]" @delimiter @sentinel
  )
)
