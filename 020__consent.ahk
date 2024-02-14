


/*

;will need to add own name

active window Informed Consent - Work - MIcrosoft Edge
tab
Lieng
wait
tab (to add button)
enter

tab x 3
down
up

tab 
loporchio
wait
*/

/*
Loporchio
Greenberg
*/

#HotIf GetKeyState("Shift") & FindVarString_Loose(WinGetTitle("A"), "Informed Consent")
	Capslock & c:: FillConsent()


;#HotIf

FillConsent(*){
	if WinExist("Informed Consent")
	WinActivate
	WinMove (A_ScreenWidth/2)-(1250/2),(A_ScreenHeight/2)-(950/2),1250,950
	
	Send "{Tab 3}"

	;SendWait("Monica K Lieng, MD")
	SendWait(choice_resident)

	Send "{Tab 2}"
	
	SendDownUp() ;under supervision of attending
	Send "{Tab 3}"

	SendWait(choice_attending)
	Sleep 1000

	Send "{Tab 2}"

	SendDownUpDown() ; chooses 'no' for other practitioner

	Send "{Tab}"	
	SendDownUp() ; chooses "yes decision making capacity"

	Send "{Tab}"	
	SendDownUp() ; chooses "no sedation"

	Send "{Tab 2}"
	SendDownUp() ; chooses "no high risk for cardiac arrest "

	Send "{Tab 4}"
	;InjChoiceText := EyeInjSideGui()
	;EyeInjSideGui()
	;WinActivate "Informed Consent"
	;Send "{Ctrl}v"



}


; Noelle Pruzan, David Rivera, Jorge Rivera, Crystal Zhang, Ezra Galler
;********************************************************************* 
; added 10/24/2023


#HotIf FindVarString_Loose(WinGetTitle("A"), "Informed Consent")
Capslock & f::fillTimeout()



fillTimeout(*){
if WinExist("Informed Consent")
	WinActivate
WinMove (A_ScreenWidth/2)-(1250/2),(A_ScreenHeight/2)-(950/2),1250,950

;verify patient id
MouseClick "left", 38, 390 ;verify

; verify 4 steps
MouseClick "left", 40, 505
MouseClick "left", 40, 525
MouseClick "left", 40, 545
MouseClick "left", 40, 565

; site marked
MouseClick "left", 40, 634
Sleep 500

;scrolls down
Send "{End}"
Sleep 500

;
MouseClick "left", 40, 417
MouseClick "left", 40, 436
MouseClick "left", 38, 456

MouseClick "left", 38, 499
MouseClick "left", 38, 518

MouseClick "left", 38, 554
MouseClick "left", 39, 574

Sleep 500

Send "{tab 2}"

;MouseClick "left", 67, 647 ;physician
SendWait(choice_attending)
Send "{tab}"
SendWait(choice_nurse)

Send "{tab}"
SendDownUpDown() ; chooses "yes decision making capacity"

; 
MouseClick "left", 96, 657

; put in laterality


}
#HotIf



EyeInjSide := Array(
	{abbr:"OD, od, r, right", name:"RIGHT Eye Injection"},
	{abbr:"OS, os, l, left", name:"LEFT Eye Injection"},
	{abbr:"OU, ou, b, botH", name:"BOTH - RIGHT and LEFT Eye Injections"}
)


/*

;Capslock & q::EyeInjSideGui()

; working on this!!!

EyeInjSideGui()
{
	MyGui := Gui()
	
	AbbrNameGuide := PrintAbbrNames(EyeInjSide)
	
	ArrNames := GetNames(EyeInjSide)
	ArrAbbr := GetAbbr(EyeInjSide)
	MyGui.Add("ComboBox", "r3 w350 vInjSideChoice", ArrNames)

	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)

	MyGui.Add("Text",,AbbrNameGuide)

	MyGui.Show()

		ProcessUserInput(*)
		{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    ;MsgBox("You entered:`n '" Saved.InjSideChoice "'")
	    A_Clipboard := Saved.InjSideChoice
	    return A_Clipboard

		}	
}



*/





SendWait(string)
	{
		Loop parse string
			{
				Send A_LoopField
				Sleep 50			
			}

	}
SendDownUp()
	{
	Send "{Down}"
	Sleep 50
	Send "{Up}"	
	Sleep 50	
	}

SendDownUpDown()
	{
	Send "{Down}"
	Sleep 50
	Send "{Up}"
	Sleep 50
	Send "{Down}"		
	Sleep 50
	}



PrintArray(MyArray)
	{
		MyText := ""
		Loop MyArray.length
			MyText .= "`n" MyArray[A_Index]
			;
		MsgBox MyText
	}

GetNames(Array_of_Maps)
	{
		NewArray := []
		Loop Array_of_Maps.Length
			{
			Item := Array_of_Maps[A_Index]
			NewArray.Push(Item.name)
			}
		return NewArray
	}

GetAbbr(Array_of_Maps)
	{
		NewArray := []
		Loop Array_of_Maps.Length
			{
			Item := Array_of_Maps[A_Index]
			NewArray.Push(Item.abbr)
			}
		return NewArray
	}

PrintAbbrNames(ArrayOfOptions)
	{
		/*
		example: textboard := PrintAbbrNames(ImagingOptions)

			Abbr					Full Name
			-----					---------
			 B, BLAH, 2.blah  		full name
			 2, 2.BLAH, 3.blah  	full name 2


		*/
	textboard := ""
	ArrayOfNames := GetNames(ArrayOfOptions)
	ArrayOfAbbr := GetAbbr(ArrayOfOptions)
	
	textboard := "Abbr`t`tFull Name`n-----`t`t---------"
	Loop ArrayOfNames.Length
		textboard .= "`n " ArrayOfAbbr[A_Index] "  `t" ArrayOfNames[A_Index]
		
	
	return textboard	
	}



FindVarString_Strict(haystack, needle)
	{
		/*

			 'blah' 		 is in: 	BLAH, blah
			 '2' 			 is in: 	2, 2.BLAH, 3.blah

			 'blah' 	 was not is in: 	2, 2.BLAH, 3.blah

 		*/

		NewString := StrReplace(haystack, ",", "|")
		NewString := StrReplace(NewString, A_Space, "")
		boolVar := false
		if needle ~= NewString
			boolVar := true
		else
			boolVar := false
		return boolVar	
	}

FindVarString_Loose(haystack, needle)
	{
		/*
			 'blah' 		 is in: 	B, BLAH, 2.blah
			 'blah' 		 is in: 	2, 2.BLAH, 3.blah
			 '2' 			 is in: 	B, BLAH, 2.blah
			 '2' 			 is in: 	2, 2.BLAH, 3.blah
			in InStr(), the _false_ makes it caps insensitive
		*/
		boolVar := false
		if InStr(haystack, needle, false) 
			boolVar := true
		else
			boolVar := false
		return boolVar	
	}
