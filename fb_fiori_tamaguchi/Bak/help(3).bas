'PRINT ASC("s")
'sleep
#INCLUDE "fbgfx.bi"

SCREENRES 800,600,32

'#include "vbcompat.bi"
'
'Dim s As String, d1 As Double, d2 As Double
'
'Line Input "Enter your birthday: ", s
'
'If IsDate( s ) Then
'  d1 = DateValue( s )
'  d2 = Now()
'
'  Print "You are " & DateDiff( "yyyy", d1, d2 ) & " years old."
'  Print "You are " & DateDiff( "d", d1, d2 ) & " days old."
'  Print "You are " & DateDiff( "s", d1, d2 ) & " seconds old."
'
'Else
'  Print "Invalid date"
'
'End If
'sleep


FUNCTION MapRange(s As Integer, a1 As Integer, a2 As Integer, b1 As Integer, b2 As Integer) As Double
    Return b1+(s-a1)*(b2-b1)/(a2-a1)
End Function
 
'FOR i As Integer = 0 To 10
'    Print Using "## maps to ##.#"; i; MapRange(i,0,10,-1,0)
'Next i
'SLEEP

sub drawBar( v as integer, x as integer, y as integer )
  dim as integer w = 100
  
  line( x, y ) - ( x + w - 1, y + 10 ), rgba( 255, 255, 0, 255 ), b
  line( x + 2, y + 2 ) - ( x + v, y + 8 ), rgba( 255, 255, 0, 255 ), bf
end SUB

'screenRes( 800, 600, 32 )
'
'drawBar( 25, 100, 100 )
'
'sleep()

DIM i AS INTEGER = 100
DIM sec AS INTEGER 
DO 
  
   i -= 1
   SLEEP 100
   sec = MAPRANGE(i, 0, 1000, 0, 100)
   SCREENLOCK
   DRAWBAR(sec, 100, 100)
   SCREENUNLOCK
   SLEEP 1
   
LOOP UNTIL INKEY = CHR(27)

