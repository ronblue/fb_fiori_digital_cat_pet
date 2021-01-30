

SUB cp (row AS INTEGER, s AS STRING)
   LOCATE row, (100 - LEN(s)) / 2 : PRINT s
END SUB

SUB pose1()
   cp 4, "^                        ^"
   cp 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   cp 6, "<| (( <|> ))  ||   ((  <|>  )) |>"
   cp 7, "_                              _"
   cp 8, "_                            _"
   cp 9, "_    >(::| * |::)<     _"
   cp 10, "        -------          "
   cp 11, "(  -----  )"
   cp 12, "\\---//"
   cp 13, "%%%"
END SUB

SUB pose2()
   cp 4, "^                        ^"
   cp 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   cp 6, "<| (( <I> ))  ||   ((  <I>  )) |>"
   cp 7, "_                              _"
   cp 8, "_                            _"
   cp 9, "_    >(::| * |::)<     _"
   cp 10, "                          "
   cp 11, "(  OOOO  )"
   cp 12, "\\   //"
   cp 13, "%%%"
END SUB
