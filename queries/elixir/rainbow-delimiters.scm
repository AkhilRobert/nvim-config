(list
  "[" @delimiter
  "]" @delimiter @sentinel
) @container

(arguments
  "(" @delimiter
  ")" @delimiter @sentinel
) @container

(tuple
  "{" @delimiter
  "}" @delimiter @sentinel
) @container

(access_call
  "[" @delimiter
  "]" @delimiter @sentinel
) @container

(interpolation
  "#{" @delimiter
  "}" @delimiter @sentinel
) @container

