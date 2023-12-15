
/*

Arrows!!!
i 	up
k 	down
j 	left
l 	right

u 	Home (beginning of line)
o 	End (end of line)
H   left one word
; 	right one word
bs  delete
*/



SetCapsLockState "AlwaysOff"
::CapsLockCapsLock:: 
	{
		SetCapsLockState !GetKeyState("CapsLock", "T")
	}
CapsLock & i::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Up}"
		else
			Send "+{Up}"
	}

CapsLock & k::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Down}"
		else
			Send "+{Down}"
	}

CapsLock & j::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Left}"
		else
			Send "+{Left}"
	}

CapsLock & l::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Right}"
		else
			Send "+{Right}"
	}

CapsLock & u::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Home}"
		else
			Send "+{Home}"
	}

CapsLock & o::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{End}"
		else
			Send "+{End}"
	}

CapsLock & H::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "^{Left}"
		else
			Send "+^{Left}"
	}

CapsLock & SC027::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "^{Right}"
		else
			Send "+^{Right}"
	}

CapsLock & BS::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{Del}"
		else
			Send "+{Del}"
	}



CapsLock & 8::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelUp}"
		else
			Send "+{WheelUp}"
	}
CapsLock & 9::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelDown}"
		else
			Send "+{WheelDown}"
	}
CapsLock & 7::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelLeft}"
		else
			Send "+{WheelLeft}"
	}
CapsLock & 0::
	{
		CapsState := GetKeyState("Shift")
		if CapsState = 0 
			Send "{WheelRight}"
		else
			Send "+^{WheelRight}"
	}

Capslock & Enter::
{
	Send "{Click 2}"
}

Capslock & F::
{
	Send "{Click 2}"
}