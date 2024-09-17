

#HotIf FindVarString_Loose(WinGetTitle("A"), "Progress Note Properties")
^n::
^+n::enterProgNoteProperties()

:*:ophth::ophthalmology
:*:cat::cataract
:X*:.note::enterProgNoteProperties("OPHTHALMOLOGY/NOTE/SURGICAL")
:X*:.inj::enterProgNoteProperties("OPHTHALMOLOGY  <H&P OPHTHALMOLOGY INJ")
:X*:.int::enterProgNoteProperties("BRIEF OPERATIVE (INTRAOCULAR INJECTION)/OPHTH/SURG")
:X*:.binj::enterProgNoteProperties("BRIEF OPERATIVE (INTRAOCULAR INJECTION)/OPHTH/SURG")
:*:.bri::BRIEF OPERATIVE NOTE/OPHTHALMOLOGY/SURGICAL
#Hotif

global choice_clinic_note_type

choice_clinic_note_type := "H&P OPHTHALMOLOGY INJECTION PROCEDURE/SURG (T)"
choice_clinic_note_type := "OPHTHALMOLOGY/NOTE/SURGICAL"

enterProgNoteProperties(note_type := choice_clinic_note_type){

	Winmove ,, 707, 653, "A"
	Send "{Click 201 17}" ;clicks title of prog note

	; enter note title
	; ----------------

	SendText note_type
	Sleep 500
	Send "{Tab 1}"
	;if FindVarString_Loose(WinGetTitle("A"), "Not a consult title")
		;Send "{left}{Enter}"

	; choose attending
	; ----------------
	Send "{Tab 5}" ;to go to "expected cosigner"

	choice_attending_reverse2 := StrReplace(choice_attending_reverse, A_Space,"")

	if choice_attending_reverse2~="NAME"{
		;MsgBox("need to enter default attending name")
		throw Error("Need to enter attending name in settings", -1)
		;run_settings_GUI()
		;choice_attending_reverse2 := StrReplace(choice_attending_reverse, A_Space,"")
	} else {
		SendWait(choice_attending_reverse2)
		Sleep 500
	}

	Send "{Tab 2}{Enter}"

	; choose attending
	; ----------------

	if choice_attending_reverse~="Paul,"{
		WinWait "Similar Providers"
		Send "{Down} {Tab} {Enter}"
		Sleep 500
	}
	else if choice_attending_reverse~="Murphy"{
		WinWait "Similar Providers"
		Send "{Tab 2} {Enter}"
		Sleep 500
	}

	;WinWait "Cancel Dialog Processing"
	;	Send "y"


	; cancels out the note type without triggering the chart fill in.
	; ------------------------
	WinWait "Template"
	if FindVarString_Loose(WinGetTitle("A"), "OPHTHALMOLOGY INJECTION PROCEDURE/SURG (T)"){
	;if InStr(WinGetTitle("A"), "OPHTHALMOLOGY INJECTION PROCEDURE/SURG (T)"){
		Send "{Tab 2}{Enter}" 
	} else if FindVarString_Loose(WinGetTitle("A"), "OPHTHALMOLOGY/NOTE/SURGICAL"){
		Send "{Tab 3}{Enter}" 
	}



}



/*
new note

Click new note (CTRL+SHIFT+N)

 707, 653; Resize window 

 168, 17; click progress note title
OPHTHALMOLOGY/NOTE/SURGICAL (T) ;paste
	; wait a second

366, 33; CLICK the option

tab
; if "not a consult title"
tab 6
Send attending revers ;insert attending name

tab 2, enter ;clicks ok

	- if paul need to do the extra click


FOR ENTERING BLANK NOTE
tab 3, enter ; clicks ok (to make a blank note)

	FOR ENTERING TEMPLATE
	win active Template: OPHTHALMOLOGY/NOTE/SURGICAL (T)
	800, 490, win size
	11, 41

	tab 2  to higlhight "feeling safe"
	497, 407 to click to change to yes


	676, 438 to press OK
;
Send clipboard
SEND .end


*/