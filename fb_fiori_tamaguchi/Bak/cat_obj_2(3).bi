#INCLUDE ONCE "fbsound_dynamic.bi"
#INCLUDE "vbcompat.bi"
DIM SHARED AS long hWave
DIM SHARED AS STRING k
CONST file AS STRING = "cat_log.txt"
'DIM SHARED isOut AS boolean = FALSE
'DIM SHARED text1 AS STRING
'DIM SHARED text2 AS STRING
'DIM SHARED AS INTEGER hunger
'hunger = INT(RND*101)
ENUM age
   kitten
   young
   adult
   old
END ENUM

TYPE cat
   PRIVATE:
   AS string cat_name
   PUBLIC:
   AS STRING text1, text2, text3, text4, text5, text6, cat_age
   isOut AS boolean
   AS INTEGER hunger, pet_count, nap_count
   DECLARE PROPERTY cat_name1() AS STRING
   DECLARE PROPERTY cat_name1(BYVAL cat_name AS STRING)
   DECLARE SUB settings(i AS age)
   DECLARE SUB pet_cat()
   DECLARE SUB CP(row AS INTEGER, s AS STRING)
   DECLARE SUB display_screen(index AS INTEGER)
   DECLARE SUB make_sound(f AS STRING, t AS integer)
   DECLARE SUB animation(f AS STRING, t AS INTEGER)
   DECLARE SUB cat_hunger()
   DECLARE SUB nap_time(inx AS INTEGER)
   DECLARE SUB cat_napping()
   DECLARE SUB write_file(filename AS STRING)
   DECLARE SUB read_file(filename AS STRING)
   DECLARE CONSTRUCTOR()
   DECLARE DESTRUCTOR()
   
END TYPE

CONSTRUCTOR cat
   this.isOut = FALSE
   'this.hunger = INT(RND*101)
   THIS.text1 = ""
   this.text2 = ""
   this.text3 = ""
   this.text4 = ""
   this.text5 = ""
   'this.pet_count = INT(RND*201)
   'this.nap_count = INT(RND*151)
   
END CONSTRUCTOR

DESTRUCTOR cat

END DESTRUCTOR

PROPERTY cat.cat_name1() AS String
   RETURN this.cat_name
END PROPERTY

PROPERTY cat.cat_name1(BYVAL cat_name AS STRING)
   this.cat_name = cat_name
END PROPERTY

SUB cat.write_file(filename AS STRING)
   DIM f AS LONG = FREEFILE()
   OPEN filename FOR OUTPUT AS #f
   write #f, cat_name1
   write #f, this.hunger
   write #f, THIS.pet_count
   write #f, this.nap_count
   write #f, this.isOut
   write #f, this.cat_age
   CLOSE #f
END SUB

SUB cat.read_file(filename AS STRING)
   DIM h AS LONG = FREEFILE()
   DIM fline AS STRING
   OPEN filename FOR INPUT AS #h
   'WHILE NOT (EOF)
      'LINE INPUT #h, fline
      INPUT #h, fline
      cat_name1 = fline
      INPUT #h, this.hunger
      INPUT #h, THIS.pet_count
      INPUT #h, this.nap_count
      INPUT #h, this.isOut
      INPUT #h, this.cat_age
      CLOSE #h
   'WEND
END SUB



SUB cat.nap_time(inx AS INTEGER)
   SELECT CASE inx
      CASE 0:
         CLS
         CP 4, "------------"
         CP 5, "          / "
         CP 6, "         /  "
         CP 7, "        /   "
         CP 8, "       /    "
         CP 9, "      /     "
         CP 10, "     /      "
         CP 11, "    /       "
         CP 12, "   /        "
         CP 13, "  /         "
         CP 13, " /          "
         CP 14, "------------"
         CP 35, text5
         CP 15, this.cat_age & " " & cat_name1
      CASE 1:
         CLS
         CP 4, "%%%%%%%%%%%%"
         CP 5, "          % "
         CP 6, "         %  "
         CP 7, "        %   "
         CP 8, "       %    "
         CP 9, "      %     "
         CP 10, "     %      "
         CP 11, "    %       "
         CP 12, "   %        "
         CP 13, "  %         "
         CP 13, " %          "
         CP 14, "%%%%%%%%%%%%"
         CP 35, text5
         CP 15, this.cat_age & " " & cat_name1
      CASE 2:
         CLS
         CP 4, "zzzzzzzzzzzz"
         CP 5, "          z "
         CP 6, "         z  "
         CP 7, "        z   "
         CP 8, "       z    "
         CP 9, "      z     "
         CP 10, "     z      "
         CP 11, "    z       "
         CP 12, "   z        "
         CP 13, "  z         "
         CP 13, " z          "
         CP 14, "zzzzzzzzzzzz"
         CP 35, text5
         CP 15, this.cat_age & " " & cat_name1
   END SELECT
END SUB

SUB cat.settings(i AS age)
   SELECT CASE i
      CASE 0:
         this.hunger = INT(RND*101)
         this.pet_count = INT(RND*201)
         this.nap_count = INT(RND*151)
         this.cat_age = "kitten"
      CASE 1:
         this.hunger = INT(RND*201)
         this.pet_count = INT(RND*301)
         this.nap_count = INT(RND*250)
         this.cat_age = "young cat"
      CASE 2:
         this.hunger = INT(RND*351)
         this.pet_count = INT(RND*451)
         this.nap_count = INT(RND*401)
         this.cat_age = "adult cat"
      CASE 3:
         this.hunger = INT(RND*301)
         this.pet_count = INT(RND*401)
         this.nap_count = INT(RND*161)
         this.cat_age = "old cat"   
   END SELECT
END SUB




SUB cat.pet_cat()
   'this.text3 = "cat pet time is: " & this.pet_count
   THIS.pet_count -= 1
   
   IF THIS.pet_count <= 50 THEN
      this.text4 = "the cat need some petting press key 'p' to pet cat!"
   'ELSEIF this.pet_count <= 25 THEN
   '   this.isOut = TRUE
   ELSE
      this.text4 = ""
      
   ENDIF
   IF k = CHR(112) THEN 
      THIS.pet_count = INT(RND*101)
      this.text4 = ""
   ENDIF
   
END SUB

SUB cat.CP(row AS INTEGER, s AS STRING)
   LOCATE row, (100 - LEN(s)) / 2 : PRINT s
END SUB

SUB cat.display_screen(index AS integer)
   
   SELECT CASE index
      CASE 0:
         CLS
   CP 15, this.cat_age & " " &cat_name1
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
   CP 34, text1
   CP 35, text2
   CP 32, text4
   CP 33, text3
   CP 31, text6
      CASE 1:
         CLS
   CP 15, this.cat_age & " " &cat_name1
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
   CP 34, text1
   CP 35, text2
   CP 32, text4
   CP 33, text3
   CP 31, text6
      CASE 2:
         cls
   CP 15, this.cat_age &" "& cat_name1
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
   CP 34, text1
   CP 35, text2
   CP 32, text4
   CP 33, text3
   CP 31, text6
   END SELECT
END SUB

'SUB CAT.ANIMATION(f AS STRING, t AS INTEGER)
'   start:
'   DIM i AS INTEGER = 0
'   make_sound(f, t)
'	hunger = INT(RND*101)
'   DO
'      IF i >= 3 THEN i = 0
'      DISPLAY_SCREEN(i)
'      SLEEP 500
'      i += 1
'      cat_hunger(hunger)
'         
'      ENDIF
'   LOOP UNTIL INKEY <> ""
'   fbs_Destroy_Wave(@hWave)
'   SLEEP 1000
'   GOTO start
'END SUB
SUB cat.cat_napping()
   'this.text2 = this.text2 & " cat napping counter is: " & this.nap_count
   'this.nap_count -= 1
   DIM x AS INTEGER = 0
   DIM xx AS INTEGER = 50
   'IF this.nap_count <= 50 THEN
          DO
             nap_time(x)
             this.text5 = "NAP TIME!"
             x += 1
             xx -= 1
             SLEEP 250
             IF x >= 3 THEN x = 0
          LOOP UNTIL xx <= 0
          
   'ENDIF
   'this.nap_count = INT(RND*151)
END SUB
SUB cat.cat_hunger()
   'start:
   'hunger = INT(RND*101)
   'DO
   
      'this.hunger -= 1
      'this.text2 = this.text2 & "cat hunger is: " & hunger
      IF this.hunger < 25 THEN
         this.text1 = "cat is hungry! press key 'f' to feed it"
      ELSE
         this.text1 = ""
      'IF this.hunger >= 25 THEN
      ENDIF
      IF this.hunger <= 0 THEN
         'text2 = "cat is hungry! press any key to feed it"
         
         isOut = TRUE
         
      ENDIF
      IF k = CHR(102) THEN
         this.hunger = INT(RND*101)
      ENDIF
   
   'LOOP
   'GOTO start
   
END SUB



SUB cat.make_sound(f AS STRING, t AS INTEGER)
   'DIM AS Integer hWave
	fbs_Load_WAVFile(f , @hWave)
	fbs_Play_Wave(hWave , t)
	'SLEEP
  'While Inkey <> "":WEND
'	fbs_Destroy_Wave(@hWave)
END SUB

SUB CAT.ANIMATION(f AS STRING, t AS INTEGER)
   
   DO
      
      IF this.isOut = TRUE OR NOT FILEEXISTS(file) THEN 
      DIM AS STRING catname, age1
      INPUT "enter cat name or enter 'quit' to exit: ", catname
      IF catname = "quit" THEN
         write_file(file)
         END
      ENDIF
      cat_name1 = catname
      INPUT "select age of cat - 0 for kitten, 1 for young, 2 for adult, 3 for old: ", age1
      'age1 = VAL(age1)
      settings(VAL(age1))
      'this.hunger = INT(RND*101)
	   'this.pet_count = INT(RND*201)
      'write_file(file)
      ELSE 
         read_file(file)
      'ELSE
         
      ENDIF
   this.isOut = FALSE
   DIM i AS INTEGER = 0
   make_sound(f, t)
	
	DIM x AS INTEGER = 0
   DIM xx AS INTEGER = 50
   DO
      k = INKEY
      IF THIS.nap_count > 50 THEN
      IF i >= 3 THEN i = 0
      DISPLAY_SCREEN(i)
      SLEEP 500
      i += 1
      cat_hunger()
         pet_cat()
         IF this.isOut = TRUE THEN EXIT DO
       this.text2 = " cat hunger is: " & this.hunger & " cat napping counter is: " & this.nap_count & _
       " cat pet time is: " & this.pet_count
       THIS.nap_count -= 1
       this.hunger -= 1
       IF k = CHR(27) THEN
          write_file(file)
          end
       ENDIF
      ELSEIF this.nap_count <= 50 THEN
          cat_napping()
          this.nap_count = INT(RND*151)
   ENDIF  
     
   LOOP
   fbs_Destroy_Wave(@hWave)
   IF THIS.isOut = TRUE THEN
   CLS
   write_file(file)
   this.text1 = "CAT DIED FROM HUNGER - YOU DIDN'T FEED IT ON TIME!"
   this.text4 = "PRESS ANY KEY TO START OVER WITH A NEW CAT!"
   CP 31, THIS.text1
   CP 34, this.text4
   SLEEP 
   'this.isOut = FALSE
   this.text1 = ""
   this.text4 = ""
   ENDIF
   loop UNTIL INKEY() = CHR(27)
  
END SUB


IF fbs_Init()=false then
  print "error: FBS_INIT() " & FBS_Get_PlugError()
  beep : sleep : end 1
end IF

'DIM SHARED AS long hWave
'DIM SHARED isOut AS boolean = FALSE
DIM SHARED fiori AS cat