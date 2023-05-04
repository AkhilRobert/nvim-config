; inherits: javascript

;; TODO: create a pull request to the original repo
(object_pattern
  "{" @opening
  "}" @closing
) @container

(named_imports
  "{" @opening
  "}" @closing
) @container

(export_clause
  "{" @opening
  "}" @closing
) @container

(array
  "[" @opening
  "]" @closing) @container

