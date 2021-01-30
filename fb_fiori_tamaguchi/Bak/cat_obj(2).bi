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
   DECLARE SUB make_sound(f AS STRING, t AS integer)
   DECLARE SUB animation()
END TYPE

SUB cat.CP(row AS INTEGER, s AS STRING)
   LOCATE row, (100 - LEN(s)) / 2 : PRINT s
END SUB

SUB cat.display_screen(index AS integer)
   
   SELECT CASE index
      CASE 0:
         CLS
   this.CP 4, "^                        ^"
   this.CP 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   this.CP 6, "<| (( <|> ))  ||   ((  <|>  )) |>"
   this.cp 7, "_                              _"
   this.cp 8, "_                            _"
   this.cp 9, "_    >(::| * |::)<     _"
   this.cp 10, "        -------          "
   this.cp 11, "(  -----  )"
   this.cp 12, "\\---//"
   this.cp 13, "%%%"
      CASE 1:
         CLS
   this.cp 4, "^                        ^"
   this.cp 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   this.cp 6, "<| (( <I> ))  ||   ((  <I>  )) |>"
   this.cp 7, "_                              _"
   this.cp 8, "_                            _"
   this.cp 9, "_    >(::| * |::)<     _"
   this.cp 10, "                          "
   this.cp 11, "(  OOOO  )"
   this.cp 12, "\\   //"
   this.cp 13, "%%%"
      CASE 2:
         cls
   this.cp 4, "^                        ^"
   this.cp 5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
   this.cp 6, "<| (( <dOb> ))  ||   ((  <dOb>  )) |>"
   this.cp 7, "_                              _"
   this.cp 8, "_                            _"
   this.cp 9, "_    >(::| & |::)<     _"
   this.cp 10, "                          "
   this.cp 11, "(  ~~~~~  )"
   this.cp 12, "\\ ~~~ //"
   this.cp 13, "%%%"
   END SELECT
END SUB

SUB CAT.ANIMATION()
   DIM i AS INTEGER = 0
   DO
      IF i >= 2 THEN i = 0
      this.DISPLAY_SCREEN(i)
      SLEEP 500
      i += 1
      
   LOOP UNTIL INKEY <> ""
END SUB

SUB cat.make_sound(f AS STRING, t AS INTEGER)
   DIM AS Integer hWave
	fbs_Load_WAVFile(f , @hWave)
	fbs_Play_Wave(hWave , t)
	'Sleep
	fbs_Destroy_Wave(@hWave)
END SUB

IF fbs_Init()=false then
  print "error: FBS_INIT() " & FBS_Get_PlugError()
  beep : sleep : end 1
end IF


DIM SHARED fiori AS cat