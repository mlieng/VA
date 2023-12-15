


/*

;will need to add own name0606

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

#HotIf GetKeyState("Shift")
	Capslock & c:: FillConsent("Salvatore J. Loporchio, MD")

#HotIf

FillConsent(attending)
{
	WinActivate "Informed Consent"
	Send "{Tab 3}"

	SendWait("Monica K Lieng, MD")

	Send "{Tab 2}"
	
	SendDownUp() ;under supervision of attending
	Send "{Tab 3}"

	SendWait(attending)
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
Capslock & f::
{
MouseClick "left", 98, 342

MouseClick "left", 38, 380 ;verify

MouseClick "left", 40, 455
MouseClick "left", 40, 480
MouseClick "left", 40, 495
MouseClick "left", 40, 518

MouseClick "left", 36, 590
Sleep 2000

Send "{End}"
Sleep 1000

MouseClick "left", 40, 426
MouseClick "left", 40, 446
MouseClick "left", 38, 471
MouseClick "left", 38, 506

MouseClick "left", 38, 527
MouseClick "left", 38, 563
MouseClick "left", 39, 586

Sleep 2000

Send "{tab 2}"

;MouseClick "left", 67, 647 ;physician
SendWait(attending)
Send "{tab}"
SendWait("Pete Ortiz")

Send "{tab}"
SendDownUp() ; chooses "yes decision making capacity"

MouseClick "left", 38, 657

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





/*
--------------------------------------------------------------------------------
 already moved to main file
--------------------------------------------------------------------------------
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
