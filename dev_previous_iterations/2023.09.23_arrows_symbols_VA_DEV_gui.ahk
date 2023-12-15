/* iterations of gui control*/

#HotIf GetKeyState("Ctrl")
Capslock & i:: ImagingGUI



ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("ComboBox", "r5 vColorChoice", ["1.VF","Green","Blue"]) ;r5 means 5 tall
	Btn := MyGui.Add("Button", "default xm", "OK")h  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()
	ProcessUserInput(*)
	{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    MsgBox("You entered:`n" Saved.ColorChoice)
	}	

}


; OUtputs which option chosen and then does a specific action
ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("ComboBox", "r11 vImageChoice", ["1.VF","2.OCT Zeiss","3.OCT Heidleberg"]) ;r11 means 11 tall
	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()
	ProcessUserInput(*)
	{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    MsgBox("You entered:`n '" Saved.ImageChoice "'")
	    if Saved.ImageChoice  = 1
	    	Msgbox ("You entered 1.VF")
	    else if Saved.ImageChoice ~= "vf|VF"
	    	Msgbox ("You entered 1.VF")
	    else 
	    	MsgBox("Fail")

	}	
}


; if placing return or multiple lines, need to place in brackets
ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("Text",, " Choos imaging modality. Common options include: `n1.VF `n3.OCT `n5.fundus")
	MyGui.Add("ComboBox", "r11 vImageChoice", ["1.VF","2.OCT Zeiss","3.OCT Heidleberg"]) ;r11 means 11 tall
	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()
	ProcessUserInput(*)
	{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    ;MsgBox("You entered:`n '" Saved.ImageChoice "'")
	    if Saved.ImageChoice  = 1
	    	{
	    	Msgbox ("You entered 1.VF")
	    	return
	    	}
	    else if Saved.ImageChoice ~= "1,|vf|VF"
	    	Msgbox ("You entered 1.VF")
	    else if Saved.ImageChoice ~= "2.|2,|,2|oct zeiss|OCT zeiss|OCT z"
	    	MsgBox ("You entered 2.zeiss")
	    else
	    	MsgBox("Fail")

	}	



; multiple selections, moving to clipboard to collect all of them
	ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("Text",, " Choose imaging modality. Common options include: `n1.VF `n3.OCT `n5.fundus")
	MyGui.Add("ComboBox", "r11 vImageChoice", ["1.VF","2.OCT Zeiss","3.OCT Heidleberg"]) ;r11 means 11 tall
	MyGui.Add("Text",, " Accepted abbreviations include the [number], vf, octz, octh, fund, fundus")

	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()
	ProcessUserInput(*)
	{
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    ;MsgBox("You entered:`n '" Saved.ImageChoice "'")
	    if Saved.ImageChoice  = 1
	    	{
	    	Msgbox ("You entered 1.VF")
	    	return
	    	}
	    else if Saved.ImageChoice ~= "1,|vf|VF"
	    	Msgbox ("You entered 1.VF")
	    else if Saved.ImageChoice ~= "2|oct zeiss|OCT zeiss|OCT z|octz"
	    	MsgBox ("You entered 2.zeiss")
	    else if Saved.ImageChoice ~= "3|oct h|OCT H|octh"
	    	MsgBox ("You entered 2.zeiss")	 
	    else if Saved.ImageChoice ~= "5|fund|fundus"
	    	MsgBox ("You entered 5.fundus")
	    else
	    	MsgBox("Fail")

	}	
}



; before cleaning up the clicking actions
ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("Text",, " Choose imaging modality. Common options include: `n1.VF `n3.OCT `n5.fundus")
	MyGui.Add("ComboBox", "r11 vImageChoice", ["1.VF","2.OCT Zeiss","3.OCT Heidleberg"]) ;r11 means 11 tall
	MyGui.Add("Text",, " Accepted abbreviations include the [number], vf, octz, octh, fund, fundus `n OCT defaults to Heidleberg")

	Btn := MyGui.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
	Btn.OnEvent("Click", ProcessUserInput)
	MyGui.OnEvent("Close", ProcessUserInput)
	MyGui.OnEvent("Escape", ProcessUserInput)
	MyGui.Show()
	ProcessUserInput(*)
	{
		if WinExist("Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT")
			WinActivate 
		MyText :="You entered:"
	    Saved := MyGui.Submit()  ; Save the contents of named controls into an object.
	    ;MsgBox("You entered:`n '" Saved.ImageChoice "'")
	    if Saved.ImageChoice  = 1
	    	{
	    	MyText .= "1.VF"
	    	MouseClick "left", 55, 182
	    	}
	    if Saved.ImageChoice ~= "1,|vf|VF"
	    	{
	    	MyText .= "`n1.VF"
	    	MouseClick "left", 55, 182
	    	}
	    if Saved.ImageChoice ~= "2|oct zeiss|OCT zeiss|OCT z|octz"
	    	{
	    	MyText .= "`n2.zeiss"
	    	MouseClick "left", 55, 202 
	    	}
	    if Saved.ImageChoice ~= "3|oct|OCT|oct h|OCT H|octh"
	    	{
	    	MyText .= "`n3.OCT Heidleberg"
	    	MouseClick "left", 55, 220
	    	}
 
	    if Saved.ImageChoice ~= "5|fund|fundus"
	    	{
	    	MyText .= "`n5.fundus photos"
	    	MouseClick "left", 55, 260
	    	}
	    ;MsgBox MyText
	}	
}


********************************************************************* 

Capslock & s::
{
MyText :=""
For key, value in ImagingOptions
	Mytext .= "`n" key ' = ' value

MsgBox MyText
MsgBox ImagingOptions.x
}
ImagingOptions := Map("x",55,"y",182,"abbr", "1.VF", "name", "1. Visual Fields by Zeiss Visual Field")




Capslock & s::
{
MsgBox ImagingOptions.x "`n" ImagingOptions.y "`n" ImagingOptions.abbr "`n" ImagingOptions.name
}

ImagingOptions:= {x:55, y:182, abbr:"1.VF", name:"1. Visual Fields by Zeiss Visual Field"}
