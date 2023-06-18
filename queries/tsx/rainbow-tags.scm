; inherits: typescript
;; This is to remove tag highlighting in the JSX Tags

(jsx_expression
  "{" @opening
  "}" @closing
) @container


(variable_declarator
  name: (array_pattern 
    "[" @opening
    "]" @closing
  )
)
