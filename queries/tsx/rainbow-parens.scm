; inherits: typescript
;; This removes highlighting the arrow of JSX elements

(jsx_expression
  "{" @opening
  "}" @closing
) @container

(array_pattern
  "[" @opening
  "]" @closing
) @container
