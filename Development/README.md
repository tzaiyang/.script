the mostly used bash shell  
===

## wildcard  pattern  
see also 'metacharacter' from manual of bash  
```bash
man bash  
```

## process characters    
  ${parameter#word}  
  ${parameter##word}    
  The  word  is expanded to produce a pattern just as in pathname expansion.  If the pattern matches the beginning of the value of parameter, then the
  result of the expansion is the expanded value of parameter with the shortest matching pattern (the ``#'' case) or the longest matching pattern  (the
  ``##''  case)  deleted.  If parameter is @ or *, the pattern removal operation is applied to each positional parameter in turn, and the expansion is
  the resultant list.  If parameter is an array variable subscripted with @ or *, the pattern removal operation is applied to each member of the array
  in turn, and the expansion is the resultant list.  

  ${parameter%word}  
  ${parameter%%word}  
  The word is expanded to produce a pattern just as in pathname expansion.  If the pattern matches a trailing portion of the expanded value of parame-
  ter, then the result of the expansion is the expanded value of parameter with the shortest matching pattern (the ``%'' case) or the longest matching
  pattern  (the  ``%%'' case) deleted.  If parameter is @ or *, the pattern removal operation is applied to each positional parameter in turn, and the
  expansion is the resultant list.  If parameter is an array variable subscripted with @ or *, the pattern removal operation is applied to each member
  of the array in turn, and the expansion is the resultant list.


  see more from part of 'Parameter Expansion' from manual of bash  

tr  
The tr utility copies the standard input to the standard output with substitution or deletion of selected characters.

## Input/Output  
tee  
The tee utility copies standard input to standard output, making a copy in zero or more files.  The output is unbuffered.    

tree   
list contents of directories in a tree-like format.
