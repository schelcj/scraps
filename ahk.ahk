#Persistent
SetTimer, MoveMouse

MoveMouse:
If ( A_TimeIdle > 59999 ) {
  MouseMove, 1 , 1,, R
  MouseMove, -1,-1,, R
}
Return
