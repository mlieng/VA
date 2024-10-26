

; press F1
; right click



sendSignature(my_passkey,*){
	Send "{RButton}"
	Send "{s}"
	if WinWaitActive("Sign",,10){ 
		Sleep 100
		Send "{RButton}"
		;MsgBox my_passkey
		;MsgBox Rtrim(my_passkey,"")
		;SendText Rtrim(my_passkey,"")
		SendText my_passkey
		Send "{Tab}"
		Send "{Enter}"
	}  else {

		MsgBox "timed out autosignature"
	}

}



F1::sendSignature(choice_saved_6digit)


/*
else if WinWaitActive("Sign Note",,10){ 
		Sleep 100
		Send "{RButton}"
		SendText my_passkey
		Send "{Tab}"
		Send "{Enter}"
	}
*/
