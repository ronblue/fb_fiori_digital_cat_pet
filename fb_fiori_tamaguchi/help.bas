'v = value you want to represent
'x = x coordinate of the bar
'y = y coordinate of the bar
'w/h = width/height of the bar (depends on if you want to draw a horizontal or vertical bar)

DIM AS INTEGER x = 100, y = 100, h = 100



'' Remaps a value from one range into another
private function remap( _
  x as single, startF as single, endF as single, startT as single, endT as single ) as single
  
  return( ( x - startF ) * ( endT - startT ) / ( endF - startF ) + startT )
end function
 
sub drawHBar( v as integer, x as integer, y as integer, w as integer )
  line( x, y ) - ( x + w - 1, y + 10 ), rgba( 255, 255, 0, 255 ), b
  line( x + 2, y + 2 ) - ( x + v, y + 8 ), rgba( 255, 255, 0, 255 ), bf
end SUB

sub drawVBar( v as integer, x as integer, y as integer, h as integer )
  line( x, y ) - ( x + 10, y + h ), rgba( 255, 255, 0, 255 ), b
  line( x + 2, y + 2 ) - ( x + 8, y + v ), rgba( 255, 255, 0, 255 ), bf
end SUB

SCREENRES 800,600,32

DIM v AS INTEGER = 0

DO 
   v += 1
   SLEEP 10
   
   SCREENLOCK
   DRAWHBAR( remap(v, 0, 1000, 0, 100), 100, 100, 100 )
   DRAWVBAR( remap(v, 0, 1000, 0, 100), 300, 100, 100 )
   SCREENUNLOCK
   SLEEP 1
LOOP UNTIL INKEY = CHR(27)
