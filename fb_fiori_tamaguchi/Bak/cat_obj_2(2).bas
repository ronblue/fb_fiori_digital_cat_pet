#INCLUDE ONCE "fbsound_dynamic.bi"
#INCLUDE "vbcompat.bi"
#INCLUDE "fbgfx.bi"


CONST AS SHORT scr_w = 800, scr_h = 600 ' screen constants
CONST file AS STRING = "cat_log.txt"

ENUM age
   kitten
   young
   adult
   old
END ENUM

TYPE cat
   PRIVATE:
   AS STRING cat_name
   PUBLIC:
   AS FB.Image PTR imge(1 TO 10)
   AS DOUBLE d1, d2
   AS STRING text1, text2, text3, text4, text5, text6, cat_age
   AS boolean isOut, isneglect
   AS INTEGER hunger, pet_count, nap_count
   DECLARE PROPERTY cat_name1() AS STRING
   DECLARE PROPERTY cat_name1(BYVAL cat_name AS STRING)
   DECLARE SUB time_diff()
   DECLARE SUB settings(i AS age)
   DECLARE SUB pet_cat(key AS STRING)
   DECLARE SUB CP(row AS INTEGER, s AS STRING)
   DECLARE SUB display_screen(index AS INTEGER)
   DECLARE SUB make_sound(f AS STRING, hWave AS INTEGER,t AS INTEGER)
   DECLARE SUB animation(f AS STRING, t AS INTEGER)
   DECLARE SUB cat_hunger(key AS STRING)
   DECLARE SUB nap_time(inx AS INTEGER)
   DECLARE SUB cat_napping(key AS STRING)
   DECLARE SUB write_file(filename AS STRING)
   DECLARE SUB read_file(filename AS STRING)
   DECLARE CONSTRUCTOR()
   DECLARE DESTRUCTOR()
   
END TYPE

CONSTRUCTOR cat
this.isOut = FALSE
THIS.text1 = ""
this.text2 = ""
this.text3 = ""
this.text4 = ""
this.text5 = ""

for i as integer = 1 to 10
  this.imge(i) = ImageCreate(800,600)
next i
END CONSTRUCTOR

DESTRUCTOR cat
IMAGEDESTROY(imge(1))
IMAGEDESTROY(imge(2))
IMAGEDESTROY(imge(3))
IMAGEDESTROY(imge(4))
IMAGEDESTROY(imge(5))
IMAGEDESTROY(imge(6))
IMAGEDESTROY(imge(7))
IMAGEDESTROY(imge(8))
IMAGEDESTROY(imge(9))
IMAGEDESTROY(imge(10))
END DESTRUCTOR

PROPERTY cat.cat_name1() AS STRING
RETURN this.cat_name
END PROPERTY

PROPERTY cat.cat_name1(BYVAL cat_name AS STRING)
this.cat_name = cat_name
END PROPERTY

SUB cat.write_file(filename AS STRING)
   this.d1 = NOW()
   
   DIM f AS LONG = FREEFILE()
   OPEN filename FOR OUTPUT AS #f
   WRITE #f, cat_name1
   WRITE #f, this.hunger
   WRITE #f, THIS.pet_count
   WRITE #f, this.nap_count
   WRITE #f, this.isOut
   WRITE #f, this.cat_age
   write #f, this.d1
   CLOSE #f
END SUB

SUB cat.read_file(filename AS STRING)
   DIM h AS LONG = FREEFILE()
   DIM fline AS STRING
   OPEN filename FOR INPUT AS #h
   INPUT #h, fline
   cat_name1 = fline
   INPUT #h, this.hunger
   INPUT #h, THIS.pet_count
   INPUT #h, this.nap_count
   INPUT #h, this.isOut
   INPUT #h, this.cat_age
   INPUT #h, this.d1
   CLOSE #h
   
END SUB

sub cat.time_diff()
   this.d2 = NOW()
   IF DATEDIFF("d", this.d1, this.d2) > 7 THEN
      this.isneglect = TRUE
   ENDIF
END sub


SUB cat.nap_time(inx AS INTEGER)
   SELECT CASE inx
      CASE 0
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
   CP 1, this.cat_age & " " & cat_name1
      CASE 1
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
CP 1, this.cat_age & " " & cat_name1
CASE 2
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
CP 1, this.cat_age & " " & cat_name1
END SELECT
END SUB

SUB cat.settings(i AS age)
   SELECT CASE i
      CASE 0
         this.hunger = INT(RND*501)
         this.pet_count = INT(RND*501)
         this.nap_count = INT(RND*601)
         this.cat_age = "kitten"
      CASE 1
         this.hunger = INT(RND*601)
         this.pet_count = INT(RND*501)
         this.nap_count = INT(RND*601)
         this.cat_age = "young cat"
      CASE 2
         this.hunger = INT(RND*601)
         this.pet_count = INT(RND*501)
         this.nap_count = INT(RND*601)
         this.cat_age = "adult cat"
      CASE 3
         this.hunger = INT(RND*601)
         this.pet_count = INT(RND*601)
         this.nap_count = INT(RND*601)
         this.cat_age = "old cat"   
END SELECT
END SUB




SUB cat.pet_cat(key AS STRING)
   
   THIS.pet_count -= 1
   
   IF THIS.pet_count <= 50 THEN
      this.text4 = "the cat need some petting press key 'p' to pet cat!"
      
   ELSE
      this.text4 = ""
      
      ENDIF
      IF key = CHR(112) THEN 
         THIS.pet_count += 1000
         this.text4 = ""
         ENDIF
         
      END SUB
      
SUB cat.CP(row AS INTEGER, s AS STRING)
   LOCATE row, (100 - LEN(s)) / 2 : PRINT s
   'DIM AS INTEGER tx, ty 
   'tx = (800 / 2) - (Len(s) / 2)
   'ty = row
   'Draw String (tx * 8, ty * 8), s, RGB(0,0,0)
END SUB
      
SUB cat.display_screen(index AS INTEGER)

BLOAD ("catsheet\Idle (" & index & ").bmp"), imge(index)  

SCREENLOCK

put (0,0),imge(index), TRANS
CP 1, this.cat_age & " " &cat_name1
CP 34, text1
CP 35, text2
CP 32, text4
CP 33, text3
CP 31, text6
SCREENUNLOCK
SLEEP 1

END SUB

SUB cat.cat_napping(key AS STRING)
   
   DIM x AS INTEGER = 0
   DIM xx AS INTEGER = 30
   
   DO
      nap_time(x)
      this.text5 = "NAP TIME!"
      x += 1
      xx -= 1
      IF key = CHR(27) THEN 
         write_file(file): END
      ENDIF
      SLEEP 250
      IF x >= 3 THEN x = 0
   LOOP UNTIL xx <= 0
   
END SUB
SUB cat.cat_hunger(key AS STRING)
   
   IF this.hunger < 25 THEN
      this.text1 = "cat is hungry! press key 'f' to feed it"
   ELSE
      this.text1 = ""

   ENDIF
   IF this.hunger <= -450 THEN
     isOut = TRUE
   
   ENDIF
   IF key = CHR(102) THEN
      this.hunger += 1000
   ENDIF
END SUB
         
         
         
SUB cat.make_sound(f AS STRING, hWave AS INTEGER, t AS INTEGER)
   
   fbs_Load_WAVFile(f , @hWave)
   fbs_Play_Wave(hWave , t)
   
END SUB
         
SUB CAT.ANIMATION(f AS STRING, t AS INTEGER)
         VAR key = "" , hwave = 0, age2 = 0
         DO
      WITH THIS
            IF .isOut = TRUE ORELSE cbool(NOT FILEEXISTS(file)) ORELSE .isNeglect = TRUE THEN 
               DIM AS STRING catname, age1
               INPUT "enter cat name or enter 'quit' to exit: ", catname
               IF catname = "quit" THEN
                  .write_file(file)
                  END
               ENDIF
               .cat_name1 = catname
               INPUT "select age of cat - 0 for kitten, 1 for young, 2 for adult, 3 for old: ", age1
               .settings(VALINT(age1))
            
            ELSE 
               .read_file(file)
            ENDIF
               .isOut = FALSE
               .isNeglect = FALSE 
            DIM i AS INTEGER = 1
            .make_sound(f,hWave, t)
                        
            
            DO
                  key = INKEY
               IF .nap_count > 50 THEN
                  IF key = CHR(115) THEN
                     .make_sound(f,hWave, t)
                  ENDIF
                  
                  IF i >= 11 THEN i = 1
                     .DISPLAY_SCREEN(i)
                     SLEEP 100
                     i += 1
                     .cat_hunger(key)
                     .pet_cat(key)
                     .time_diff()
                  IF .isOut = TRUE OR .isneglect = TRUE THEN EXIT DO
                     .text2 = " cat hunger is: " & .hunger & " cat napping counter is: " & .nap_count & _
                     " cat pet time is: " & .pet_count
                     .nap_count -= 1
                     .hunger -= 1
                  IF key = CHR(27) THEN
                     .write_file(file)
                     END
                  ENDIF
               ELSEIF .nap_count <= 50 THEN
                  .cat_napping(key)
                  .nap_count = INT(RND*3001)
               ENDIF  
                                 
            LOOP
               fbs_Destroy_Wave(@hWave)
         IF .isOut = TRUE ORELSE .isNeglect = TRUE THEN
            CLS
               
            .text2 = "IT'S BEEN " & DATEDIFF("d", this.d1, this.d2) & " MINUTES SINCE YOU LAST OPEN THE PROGRAM"
            .text1 = "CAT DIED FROM NEGLECT!!!"
            .text4 = "PRESS ANY KEY TO START OVER WITH A NEW CAT!"
            CP 31, .text1
            CP 34, .text4
            CP 30, .text2
            SLEEP 
            cls
            .write_file(file)
         ENDIF
      END WITH
   LOOP UNTIL INKEY() = CHR(27)
                           
END SUB


IF fbs_Init()=false THEN
PRINT "error: FBS_INIT() " & FBS_Get_PlugError()
BEEP : SLEEP : END 1
END IF

SCREENRES scr_w, scr_h, 32
WIDTH scr_w \ 8, scr_h \ 16
DIM fiori AS cat
fiori.animation("cat_sound.wav", 1)