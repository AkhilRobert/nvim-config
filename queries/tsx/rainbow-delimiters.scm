; inherits: typescript
;; This removes highlighting the arrow of JSX elements

; (jsx_expression
;   "{" @delimiter
;   "}" @delimiter @sentinel
; ) @container
;
; (variable_declarator
;   name: (array_pattern 
;     "[" @delimiter
;     "]" @delimiter @sentinel
;   )
; ) @container
