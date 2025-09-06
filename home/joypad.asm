Joypad::
; Update the joypad state variables:
; [hJoyReleased]  keys released since last time
; [hJoyPressed]   keys pressed since last time
; [hJoyHeld] currently pressed keys
IF DEF(_REV0)
	homecall_alt ReadJoypad_
	ret
ELSE
	homejp _Joypad

ReadJoypad::
	homejp ReadJoypad_
ENDC
