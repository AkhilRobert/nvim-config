; inherits: typescript
;; This removes highlighting the arrow of JSX elements

(jsx_expression
  "{" @opening
  "}" @closing) @container

(variable_declarator
  name: (array_pattern 
    "[" @opening
    "]" @closing
  )
)
