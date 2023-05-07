(list
  "[" @opening
  "]" @closing
) @container

(arguments
  "(" @opening
  ")" @closing
) @container

(tuple
  "{" @opening
  "}" @closing
) @container

(access_call
  "[" @opening 
  "]" @closing
) @container

(interpolation
  "#{" @opening 
  "}" @closing
) @container
