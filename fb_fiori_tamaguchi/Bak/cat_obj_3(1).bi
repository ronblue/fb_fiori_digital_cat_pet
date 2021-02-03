#INCLUDE ONCE "../inc/fbsound_dynamic.bi"

Const As Short scr_w = 800, scr_h = 600 ' screen constants

TYPE cat
    PRIVATE:
    AS string cat_name
    PUBLIC:
    AS STRING text1, text2, text3, text4, text5, text6
    isOut AS boolean
    AS INTEGER hunger, pet_count, nap_count
    DECLARE PROPERTY cat_name1() AS STRING
    DECLARE PROPERTY cat_name1(BYVAL cat_name AS STRING)
    DECLARE SUB pet_cat(key As String)
    DECLARE SUB CP(row AS INTEGER, s AS STRING)
    DECLARE SUB display_screen(index AS INTEGER)
    DECLARE SUB makeye_sound(f AS STRING, hWave As Integer, t AS integer)
    DECLARE SUB animation(f AS STRING, t AS INTEGER)
    DECLARE SUB cat_hunger(key As string)
    DECLARE SUB nap_time(inx AS INTEGER)
    DECLARE SUB cat_napping()
    DECLARE CONSTRUCTOR()
    DECLARE DESTRUCTOR()
End TYPE

CONSTRUCTOR cat
    this.isOut = FALSE
    this.hunger = INT(RND*101)
    THIS.text1 = ""
    this.text2 = ""
    this.text3 = ""
    this.text4 = ""
    this.text5 = ""
    this.pet_count = INT(RND*201)
    this.nap_count = INT(RND*151)
End CONSTRUCTOR

DESTRUCTOR cat
END DESTRUCTOR

PROPERTY cat.cat_name1() AS String
    Return this.cat_name
END PROPERTY

PROPERTY cat.cat_name1(BYVAL cat_name AS STRING)
    this.cat_name = cat_name
END PROPERTY


SUB cat.nap_time(inx AS INTEGER)
    Select CASE As Const inx
        Case 0
            CLS
            CP  4, "------------"
            CP  5, "          / "
            CP  6, "         /  "
            CP  7, "        /   "
            CP  8, "       /    "
            CP  9, "      /     "
            CP 10, "     /      "
            CP 11, "    /       "
            CP 12, "   /        "
            CP 13, "  /         "
            CP 13, " /          "
            CP 14, "------------"
            CP 35, text5
            CP 15, "cat " & cat_name1
        Case 1
            CLS
            CP  4, "%%%%%%%%%%%%"
            CP  5, "          % "
            CP  6, "         %  "
            CP  7, "        %   "
            CP  8, "       %    "
            CP  9, "      %     "
            CP 10, "     %      "
            CP 11, "    %       "
            CP 12, "   %        "
            CP 13, "  %         "
            CP 13, " %          "
            CP 14, "%%%%%%%%%%%%"
            CP 35, text5
            CP 15, "cat " & cat_name1
      CASE 2
            CLS
            CP  4, "zzzzzzzzzzzz"
            CP  5, "          z "
            CP  6, "         z  "
            CP  7, "        z   "
            CP  8, "       z    "
            CP  9, "      z     "
            CP 10, "     z      "
            CP 11, "    z       "
            CP 12, "   z        "
            CP 13, "  z         "
            CP 13, " z          "
            CP 14, "zzzzzzzzzzzz"
            CP 35, text5
            CP 15, "cat " & cat_name1
   END SELECT
END Sub

Sub cat.pet_cat(key As String)
   THIS.pet_count -= 1
   
   IF THIS.pet_count <= 50 THEN
      this.text4 = "the cat need some petting press keyey 'p' to pet cat!"
   ELSE
      this.text4 = ""
   ENDIF
   IF key = CHR(112) THEN
      THIS.pet_count = INT(RND*101)
      this.text4 = ""
   ENDIF
   
END SUB

SUB cat.CP(row AS INTEGER, s AS STRING)
   LOCATE row, scr_w \ 16 - (LEN(s) \ 2)
   PRINT s
END SUB

SUB cat.display_screen(index AS integer)
   
   SELECT CASE As Const index
       CASE 0
           Cls
           CP 15, "cat " & cat_name1
           CP  4, "^                        ^"
           CP  5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
           CP  6, "<| (( <|> ))  ||   ((  <|>  )) |>"
           CP  7, "_                              _"
           CP  8, "_                            _"
           CP  9, "_    >(::| * |::)<     _"
           CP 10, "        -------          "
           CP 11, "(  -----  )"
           CP 12, "\\---//"
           CP 13, "%%%"
           CP 34, text1
           CP 35, text2
           CP 32, text4
           CP 33, text3
           CP 31, text6
       CASE 1
           Cls
           CP 15, "cat " & cat_name1
           CP  4, "^                        ^"
           CP  5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
           CP  6, "<| (( <I> ))  ||   ((  <I>  )) |>"
           CP  7, "_                              _"
           CP  8, "_                            _"
           CP  9, "_    >(::| * |::)<     _"
           CP 10, "                          "
           CP 11, "(  OOOO  )"
           CP 12, "\\   //"
           CP 13, "%%%"
           CP 34, text1
           CP 35, text2
           CP 32, text4
           CP 33, text3
           CP 31, text6
       CASE 2
           Cls
           CP 15, "cat " & cat_name1
           CP  4, "^                        ^"
           CP  5, "( ) %%%%%%%%%%%%%%%%%%%  ( )"
           CP  6, "<| (( <dOb> ))  ||   ((  <dOb>  )) |>"
           CP  7, "_                              _"
           CP  8, "_                            _"
           CP  9, "_    >(::| & |::)<     _"
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

Sub cat.cat_napping()
    Dim x AS INTEGER = 0
    Dim xx AS INTEGER = 50
    Do
        nap_time(x)
        this.text5 = "NAP TIME!"
        x += 1
        xx -= 1
        Sleep 250
        If x >= 3 THEN x = 0
    Loop UNTIL xx <= 0
End Sub

SUB cat.cat_hunger(key As String)
    IF this.hunger < 25 THEN
        this.text1 = "cat is hungry! press keyey 'f' to feed it"
    ELSE
        this.text1 = ""
    ENDIF
    IF this.hunger <= 0 Then isOut = TRUE
    IF key = CHR(102) Then this.hunger = INT(RND*101)
End Sub

SUB cat.makeye_sound(f AS STRING, hWave As Integer, t AS INTEGER)
    fbs_Load_WAVFile(f, @hWave)
    fbs_Play_Wave(hWave, t)
End SUB

SUB CAT.ANIMATION(f AS STRING, t AS INTEGER)
    Var key = "", hWave = 0
   
    With This   ' saves a lot of "This" typing !!!
        Do
            Dim catname AS STRING
            Input "enter cat name: ", catname
            cat_name1 = catname
         
            .isOut = FALSE
            Dim i AS INTEGER = 0
            makeye_sound(f, hWave, t)
            .hunger = INT(RND*101)
            .pet_count = INT(RND*201)
            Dim x AS INTEGER = 0
            Dim xx AS INTEGER = 50
            Do
                key = INkey
                If .nap_count > 50 THEN
                    If i >= 3 THEN i = 0
                    DISPLAY_SCREEN(i)
                    Sleep 500
                    i += 1
                    cat_hunger(key)
                    pet_cat(key)
                    If .isOut = TRUE THEN EXIT DO
                    .text2 = " cat hunger is: " & this.hunger & _
                                 " cat napping counter is: " & this.nap_count & _
                                 " cat pet time is: " & this.pet_count
                    .nap_count -= 1
                    .hunger -= 1
                    If key = CHR(27) THEN end
                ElseIf .nap_count <= 50 THEN
                    cat_napping()
                    .nap_count = INT(RND*151)
                EndIf
            Loop
            fbs_Destroy_Wave(@hWave)
            If .isOut = TRUE THEN
                Cls
                .text1 = "CAT DIED FROM HUNGER - YOU DIDN'T FEED IT ON TIME!"
                .text4 = "PRESS ANY keyEY TO START OVER WITH A NEW CAT!"
                CP 31, .text1
                CP 34, .text4
                Sleep
                .isOut = FALSE
                .text1 = ""
                .text4 = ""
            EndIf
       loop UNTIL Key = CHR(27)
    End With
End SUB

' ===== MAIN =====
IF Not fbs_Init() then
  print "error: FBS_INIT() " & FBS_Get_PlugError()
  beep : sleep : end 1
end If

DIM As cat  fiori

ScreenRes scr_w, scr_h
Width scr_w \ 8, scr_h \ 16
fiori.animation("../data/atem.wav", 1)
' ===== end MAIN =====
' ----- EOF -----