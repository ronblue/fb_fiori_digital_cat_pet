#INCLUDE ONCE "fbsound_dynamic.bi"


'ENUM poses
'   poses1
'   poses2
'   poses3
'END ENUM

TYPE cat
   x AS integer
   DECLARE SUB CP(row AS INTEGER, s AS STRING)
   DECLARE SUB display_screen(index AS INTEGER)
   'DECLARE SUB make_sound(f AS STRING, t AS integer)
   DECLARE SUB animation(f AS STRING, t AS INTEGER)
END TYPE

SUB cat.CP(row AS INTEGER, s AS STRING)
   LOCATE row, (100 - LEN(s)) / 2 : PRINT s
END SUB

SUB cat.display_screen(index AS integer)
   
   SELECT CASE index
      CASE 0:
         CLS
   CP 4, "^                        ^"
   CP 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   CP 6, "<| (( <|> ))  ||   ((  <|>  )) |>"
   CP 7, "_                              _"
   CP 8, "_                            _"
   CP 9, "_    >(::| * |::)<     _"
   CP 10, "        -------          "
   CP 11, "(  -----  )"
   CP 12, "\\---//"
   CP 13, "%%%"
      CASE 1:
         CLS
   CP 4, "^                        ^"
   CP 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   CP 6, "<| (( <I> ))  ||   ((  <I>  )) |>"
   CP 7, "_                              _"
   CP 8, "_                            _"
   CP 9, "_    >(::| * |::)<     _"
   CP 10, "                          "
   CP 11, "(  OOOO  )"
   CP 12, "\\   //"
   CP 13, "%%%"
      CASE 2:
         cls
   CP 4, "^                        ^"
   CP 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   CP 6, "<| (( <dOb> ))  ||   ((  <dOb>  )) |>"
   CP 7, "_                              _"
   CP 8, "_                            _"
   CP 9, "_    >(::| & |::)<     _"
   CP 10, "                          "
   CP 11, "(  ~~~~~  )"
   CP 12, "\\ ~~~ //"
   CP 13, "%%%"
   END SELECT
END SUB

SUB CAT.ANIMATION(f AS STRING, t AS INTEGER)
   DIM i AS INTEGER = 0
   DIM AS Integer hWave
	fbs_Load_WAVFile(f , @hWave)
	fbs_Play_Wave(hWave , t)
   DO
      IF i >= 3 THEN i = 0
      DISPLAY_SCREEN(i)
      SLEEP 500
      i += 1
      
   LOOP UNTIL INKEY <> ""
   fbs_Destroy_Wave(@hWave)
END SUB

'SUB cat.make_sound(f AS STRING, t AS INTEGER)
'   DIM AS Integer hWave
'	fbs_Load_WAVFile(f , @hWave)
'	fbs_Play_Wave(hWave , t)
'	SLEEP
'  While Inkey <> "":WEND
'	fbs_Destroy_Wave(@hWave)
'END SUB

IF fbs_Init()=false then
  print "error: FBS_INIT() " & FBS_Get_PlugError()
  beep : sleep : end 1
end IF


DIM SHARED fiori AS cat