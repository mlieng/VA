#Requires AutoHotkey v2.0+

/*

I am working on this script to convert using the tab key to using the alt key instead.
Hopefully this will cause less strain on my pinky finger, especially when doing extensive excel in put.


Modifier key guide:
#		Windows logo key
!		Alt
^		Ctrl
+		Shift
&		(use between any two keys to combine into a custom hotkey)
<		left key of pair (ex <! left alt
						 	 >! right alt, aka AltGr)
Capslock 


*/

; alt + v = view
; alt + vf, default view
; alt + vm, change view


/*
Send "{Click 101 377}" ;CLICKS GROUP BY
SendText "Visit Date"
SendText "Location"
SendText "Author"
Send "{Click 256 513}" ;clicks ok 

*/


;attempt

;https://stackoverflow.com/questions/2096253/autohotkey-key-sequence-not-just-single-key-hotkey

alt_v := false

!v:: alt_v := true ; assign the Boolean value "true" or "1" to this variable

!v up:: alt_v := false

; The #HotIf  directive creates context-sensitive hotkeys:

#HotIf (alt_v := true ) ; If this variable has the value "true"
	send "!"
	send "v"

	f:: { ;return to default view 	
		alt_v := false	
		SetKeyDelay 100
		Send "f"
		;MsgBox "Alt +v then A"
	}

	d:: { ;return by date
		alt_v := false

		SetKeyDelay 100
		Send "m"
		if WinWaitActive("List Selected Documents",,10){
			Send "{Click 101 377}" ;CLICKS GROUP BY
			SetKeyDelay 100
			SendText "Visit Date"
			Send "{Click 291 508}"
		}

	}

	l:: { ;return by location
		alt_v := false	
		SetKeyDelay 100
		Send "m"
		if WinWaitActive("List Selected Documents",,10){
			Send "{Click 101 377}" ;CLICKS GROUP BY
			SetKeyDelay 100
			SendText "Location"
			Send "{Click 291 508}"
		}
	}


	t:: { ;return by location
		alt_v := false	
		SetKeyDelay 100
		Send "m"		
		if WinWaitActive("List Selected Documents",,10){
			Send "{Click 101 377}" ;CLICKS GROUP BY
			SetKeyDelay 100
			SendText "title"
			Send "{Click 291 508}"
		}
	}

#HotIf




;https://stackoverflow.com/questions/2096253/autohotkey-key-sequence-not-just-single-key-hotkey



	!d:: { ;return by date
		alt_v := false
		SetKeyDelay 100
		Send "!v"
		SetKeyDelay 100
		Send "m"
		WinWaitActive("List Selected Documents",,10)
		Send "{Click 101 377}" ;CLICKS GROUP BY
		SetKeyDelay 100
		SendText "Visit Date"
		Send "{Click 291 508}"
	}

CapsLock & l::
!l:: { ;return by date
		WinWaitActive("List Selected Documents",,10)
		alt_v := false	
		SetKeyDelay 100
		Send "!v"
		SetKeyDelay 100
		Send "d"
		Send "{Click 101 377}" ;CLICKS GROUP BY
		SetKeyDelay 100
		SendText "Location"
		Send "{Click 291 508}"
	}
