

;********************************************************************* 
; programming gui interaction with cprs 
;*********************************************************************

^+r::
Capslock & r::
	/* 
	FOR RETURN TO CLINIC

	CTRL + O, opens orders
	r, then clicks return to clinic
	 - will automatically highlight the clinic
	tab, will go to the return to clinic date

	*/
	{
	SwitchToOrderTab()
	Send "r"
	;MsgBox "The active window is '" WinGetTitle("A") "'."
	;WinActivate "Return To Clinic"	
	Send "{tab}"
	  MouseClick "left", 353, 135
	  MouseClick "left", 353, 135
	return
	}
^+a::
Capslock & a::AddNewOrder()
^+m::
Capslock & m::AddNewMedicine()

^+4::
^+t::
Capslock & 4::
Capslock & t::AddTextOrder()

#Hotif FindVarString_Loose(WinGetTitle("A"), "Order Menu")
	a::
		{
		ClickAnesthesia()
		Sleep 50
		;EnterAnesthesiaOrderDetails()
		return
		}
	c:: ClickCardsConsult()
	e:: ClickEKG()
	i::
		{
		ClickImaging()
		WinWait "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		ImagingGUI()
		return
		}
	o::
		{
		ClickImaging()
		WinWait "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		ClickOct()
		EnterImageOrderDetails()
		return
		}
	j::ClickInjection()
	n::ClickNonFormulary()

	d:: ExitOrderMenu()
	x:: ExitOrderMenu()
	Backspace:: MouseClick "left", 14, 12 ;goes to previous


#Hotif FindVarString_Loose(WinGetTitle("A"), "Order a Procedure")
	;Capslock & e:: EnterEKGOrderDetails()
#Hotif FindVarString_Loose(WinGetTitle("A"), "Order a Consult")
	Capslock & f:: 
	{
		MouseClick "left", 414, 60
		Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
		MouseClick "left", 604, 403
		;MouseClick "left", 574, 401
		return
	}
#Hotif FindVarString_Loose(WinGetTitle("A"), "Reason for Request: ANESTHESIA E-CONSULT INPT")
	::cat:: 
	{
		WinActive(WinGetTitle("A"))
		EnterAnesthesiaOrderDetails2()
		return
	}

#Hotif



/*
IMAGING orders
opens new window 'Order Menu'
42 - internal
34 surgical
optometry/ophthalmology imaging services Outpt
opens new window : 'Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT'

55, 182 	1. visual fields by Zeiss visual field
55, 202 	2. posterior OCT by Zeiss stratus
55, 220 	3. posterior OCT by Heidleberg HRA-OCT Spectralis
55, 239 	4. fluorescein angiography by Heidleberg HRA-OCT Spectralis
55, 260 	5. fundus photography by topcon 50 ex fundus camera
55, 280 	6. IOL calculation by Zeiss IOL Master
55, 295		7. Cornea Topography by Zeiss Altas 993 Topopgrapher
55, 315		8. A/B Ultrasound by AVISO Ultrasound
55, 335		9. Anterior Segment Photography by Haag-Streit Slitlamp camera
55, 355		10. Anterior Segment OCT Visante (Zeiss)


*/


ImagingOptions := Array(
	{x:55, y:182, abbr:"1.VF", 			name:"1. Visual Fields by Zeiss Visual Field"},
	{x:55, y:202, abbr:"2.OCT (Zeiss)", name:"2. posterior OCT by Zeiss stratus"},
	{x:55, y:220, abbr:"3.OCT", 		name:"3. posterior OCT by Heidleberg HRA-OCT Spectralis"},
	{x:55, y:239, abbr:"4.FA", 			name:"4. fluorescein angiography by Heidleberg HRA-OCT Spectralis"},
	{x:55, y:260, abbr:"5.Fundus", 		name:"5. fundus photography by topcon 50 ex fundus camera"},
	{x:55, y:280, abbr:"6.IOL Calc", 	name:"6. IOL calculation by Zeiss IOL Master"},
	{x:55, y:295, abbr:"7.Topo", 		name:"7. Cornea Topography by Zeiss Altas 993 Topopgrapher"},
	{x:55, y:315, abbr:"8.U/S", 		name:"8. A/B Ultrasound by AVISO Ultrasound"},
	{x:55, y:335, abbr:"9.Ant Seg Photo", name:"9. Anterior Segment Photography by Haag-Streit Slitlamp camera"},
	{x:55, y:355, abbr:"10.Ant Seg OCT", name:"10. Anterior segment OCT Visante (Zeiss)"}	 
	)

ImagingOptionsNames := GetNames(ImagingOptions)

ExitOrderMenu()
	{ ;"TfrmOMNavA"
		if WinExist("Order Menu") ;
			WinActivate 
		MouseClick "left", 841, 10 ;exits
		return
	}

AddTextOrder()
	{
		SwitchToOrderTab()
		Send "t"
		WinWait "Word Processing Order" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600

			SendText "
			(
			For cataract surgery -  eye - on :
			 Pre-op: 
				)"
		Sleep 10 ;wait to be processed\
		MouseClick "left", 333, 40
		Sleep 100 ;wait to be processed\
		;Send "{tab 2}"
		;Send "{.4b}{space}"
		return
	}

AddNewOrder()
	{	
		SwitchToOrderTab()
		Send "a"
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		return	
	}

SwitchToOrderTab() ;literally so that it stop runs into weird bugs. 
{
		Send "{LCtrl down}{o down}"
		;Send "^o"
		SetKeyDelay 100
		Send "{LCtrl up}{o up}"
		;Sleep 20 ;wait to be processed
		MouseClick "left", 10, 400
		SetKeyDelay 100
		return
}
AddNewMedicine()
	{
		Send "^o"
		Sleep 10 ;wait to be processed
		MouseClick "left", 10, 400
		Send "m"
		return	
	}

ClickImaging()
	{	
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		Send "{Click 735 30}" ;clicks 42 local consults/requests
		MouseClick "left", 510, 302 ; clicks 34 surgical consult
		MouseClick "left", 421, 339 ; clicks optometry/ophthalmology imaging services Outpt
		;
	}
ClickEKG()
	{	
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		Send "{Click 735 30}" 	; clicks 42 local consults/requests
		Send "{Click 78 367}"	; clicks 14 medical  consult
		Send "{Click 71 79}"	; clicks CARDIOLOGY
		Send "{Click 525 144}" 	; clicks 8 EKG w/rhythm strip


		;enter EKG order details
		WinWait "Order a Procedure" 
		Send "Preop EKG for anesthesia; for cataract surgery"
		Send "{Click 251 88}"	; clicks date
		Send FormatTime(, "M/d/yy")
		Sleep 50
		Send "{Tab 4}" 	; moves to location selection
		Send "{Down 2}"	; clicks 'outpatient'
		Send "{Tab 3}" 	; MOVES TO 'accept order'
		return
	}

ClickCardsConsult()
	{
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600

		Send "{Click 735 30}" 	; clicks 42 local consults/requests
		Send "{Click 78 367}"	; clicks 14 medical  consult
		Send "{Click 71 79}"	; clicks CARDIOLOGY

		;Send "{Click 174 316}" ;clicks cards econsult
		Send "{Click 181 433}" ;clicks cardiology preop consult

		;MouseClick "left", 165, 87 ; clicks 'CARDIOLOGY CONSULTATION'
		;MouseClick "left", 160, 290 ; clicks 'Cardiology eConsult'

		;WinWait "Reason for Request: CARDIOLOGY E-CONSULT OUTPT"
		;WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(1000/2),783,755
		
		;MouseClick "left", 11, 39 ; clicks [ ] for 'Chart Review'
		;Send "{tab}"
		;Send "Cataract surgery, pacemaker"

		;KeyWait "Tab"
		;Mouseclick "left", 676, 700 ;clicks OK

		;same as capslock & f

		;WinWait "Order a Consult"
		;WinMove ,, 650, 450
		;MouseClick "left", 414, 60
		;Send FormatTime(, "M/d/yy")  ; 'It will look like 10/4/23'
		;MouseClick "left", 604, 403
		return


	}

ClickAnesthesia()
	{	WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600

		Send "{Click 735 30}" 	; clicks 42 local consults/requests
		Send "{Click 536 302}"	; clicks 34 surgical consult
		Send "{Click 152 112}"	 ; clicks 'Anesthesia E consult'
		return
	}

EnterAnesthesiaOrderDetails2()
	{	Send "{Backspace 3}"
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),1069,893
		Send "{Click 170 251}" ;clicks procedure
		Send "{Tab}" ; moves to dx planned procedure
		Sleep 50
		Send "Age related cataract"
		Sleep 50
		Send "{Tab}" ; moves to type of anesthesia
		Sleep 50
		Send "MAC/Topical"
		Sleep 50
		Send "{Click 21 706}" ;clicks acknowledge
		Send "{PgDn 2}"
		Send "{Click 25 538}" ;clicks not GLp1
		Send "{Click 15 622}" ;clicks not glp1
		Send "{Click 27 730}" ;clicks not glp1
		Send "{PgUp 2}"
		Sleep 50
		Send "{Click 170 251}" ;clicks procedure
		Sleep 50
		Send "Cataract Extraction and intraocular lens placement,  eye"
		return

	}

EnterAnesthesiaOrderDetails()
	{	WinWait "Anesthesia E-CONSULT" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),1069,893

		Send "{Click 170 251}" ;clicks procedure
		Send "{Tab}" ; moves to planned procedure
		Sleep 50
		Send "Age related cataract"
		Sleep 50
		Send "{Tab}" ; moves to type of anesthesia
		Sleep 50
		Send "MAC/Topical"
		Sleep 50
		Send "{Click 21 706}" ;clicks acknowledge
		Send "{PgDn 2}"
		Send "{Click 25 538}" ;clicks not GLp1
		Send "{Click 15 622}" ;clicks not glp1
		Send Send "{Click 27 730}" ;clicks not glp1
		Send "{PgUp 2}"
		Sleep 50
		Send "{Click 170 251}" ;clicks procedure
		Sleep 50
		Send "Cataract Extraction and intraocular lens placement,  eye"

		/*
			MouseClick "left", 102, 319 ;clicks diagnosis
			Sleep 50
			WinWait "ANESTHESIA E" 
			Send "Age related cataract"
			Send "{Tab}"
			Send "MAC"
			Sleep 50
			MouseClick "left", 239, 92 ; clicks date
			Sleep 50
			Send "Cataract Extraction and intraocular lens placement,  eye"
			Send "{Left 4}"
		*/

		return
	}
/*
 EnterEKGOrderDetails()
	{
			Send "Preop EKG for anesthesia; for cataract surgery"
			MouseClick "left", 239, 92 ; clicks date
			Send FormatTime(, "M/d/yy")
			Sleep 50
			Send "{Tab 4}"
			Send "{Down 2}"	
	}
*/



ClickNonFormulary()
	{	
		MsgBox "clicked N"
		WinWait "Order Menu" 
		WinMove (A_ScreenWidth/2)-(900/2),(A_ScreenHeight/2)-(800/2),900,600
		MouseClick "left", 683, 37 ; clicks 42 local consults/requests
		MouseClick "left", 513, 185 ;clicks 23 pharmacy consult
		MouseClick "left", 72, 197 ;clicks NFDR EConsult Outpatient
		Send "{Tab 2}" ;PLACES CURSOR FOR MEDICATION NAME
		return
	}


ClickOct()
	{
		WinWait "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		WinMove 100,100, 785,490
		MouseClick "left", 55, 220 ; clicks OCT
		;Send "{Enter}" ;clicks 'Preview'
		
		Send "{Click 694 436}" ;clicks  'ok'
		;WinWaitClose "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
		return
	}	

EnterImageOrderDetails()
{
			
		WinWait "Order a Consult"
		WinMove 430,200, 640, 414
		Send "{Click 374 69}"
		Send FormatTime(, "M/d/yy")  	; 'It will look like 10/4/23'
		Send "{tab 7}"
		Send "{enter}" ; closes window
		return

}


; need to add multiline text/all the options

ImagingGUI()
{
	MyGui := Gui()
	MyGui.Add("Text",, " Choose imaging modality. `n Can insert multiple separated by commas, examples:`n '1,3,5' `n 'oct'")
	MyGui.Add("ComboBox", "r11 w350 vImageChoice", ImagingOptionsNames) ;r11 means 11 tall
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
			AppendClick(MyText, ImagingOptions[1])
	    if Saved.ImageChoice ~= "1,|vf|VF"
			AppendClick(MyText, ImagingOptions[1])
	    if Saved.ImageChoice ~= "2|oct zeiss|OCT zeiss|OCT z|octz"
			AppendClick(MyText, ImagingOptions[2])
	    if Saved.ImageChoice ~= "3|oct|OCT|oct h|OCT H|octh"
			AppendClick(MyText, ImagingOptions[3])
	    if Saved.ImageChoice ~= "4|fa|FA"
			AppendClick(MyText, ImagingOptions[4])
	    if Saved.ImageChoice ~= "5|fund|fundus"
			AppendClick(MyText, ImagingOptions[5])
	    if Saved.ImageChoice ~= "6|iol|IOL"
			AppendClick(MyText, ImagingOptions[6])
		if Saved.ImageChoice ~= "7|topo|cornea topography|cornea"
			AppendClick(MyText, ImagingOptions[7])
		if Saved.ImageChoice ~= "8|ultrasound|bscan|b-scan"
			AppendClick(MyText, ImagingOptions[8])
		if Saved.ImageChoice ~= "9"
			AppendClick(MyText, ImagingOptions[9])
	    if Saved.ImageChoice ~= "10"
			AppendClick(MyText, ImagingOptions[10])

		number_chosen := StrSplit(Saved.ImageChoice,",")
		number_chosen := number_chosen.Length

		if number_chosen = 1
			{
				Send "{Enter}"
				WinWaitActive "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
				WinMove 100,100, 785,490
				Send "{Click 702 431}"	;clicks  ok 
				;WinWaitClose "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"

				EnterImageOrderDetails()
				ExitOrderMenu()
				
			}
		else {
				Send "{Enter}"
				WinWaitActive "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"
				WinMove 100,100, 785,490
				MouseMove 702, 431
				;Send "{Click 702 431}"	;clicks  ok 
				;WinWaitClose "Reason for Request: OPTOMETRY/OPHTHALMOLOGY IMAGING SERVICES OUTPT"

				EnterImageOrderDetails()
				ExitOrderMenu()			

		}
		
	}	
}

; supporting function for above
AppendClick(MyText, ImageOption)
	{
	MyText := ImageOption.name
	MouseClick "left", ImageOption.x, ImageOption.y 
	}

;********************************************************************* 
; injections
;*********************************************************************

ClickInjection()
	{
		WinActivate "Order Menu"	
		MouseClick "left", 313, 509 ; clicks clinic orders
		WinActivate "Order Menu"
		MouseClick "left", 79, 128 ; eagle square
		return
	}

InjectionOptions := Array(
	{x:55, y:182, abbr:"l31", 	name:"Lucentis 0.3mg (once)"},
	{x:55, y:182, abbr:"l3", 	name:"Lucentis 0.3mg (continuous)"},

	{x:55, y:182, abbr:"l51", 	name:"Lucentis 0.5mg (once)"},
	{x:55, y:182, abbr:"l5", 	name:"Lucentis 0.5mg (continuous"},

	{x:55, y:182, abbr:"a1", 	name:"Avastin 1.25mg (once)"},
	{x:55, y:182, abbr:"a", 	name:"Avastin 1.25 (continuous)"},

	{x:55, y:182, abbr:"e1",	name:"Eylea 2mg (once)"},
	{x:55, y:182, abbr:"e", 	name:"Eylea 2mg (continuous"},

	{x:55, y:182, abbr:"o", 	name:"other"}
	)

InjectionOptionsGUI()
{
}

ClickCoordsFromObject(coords)
	{
	MouseClick "left", coords.x, coords.y 
	}
/*
Capslock & s::
{
	NewArray := []
	MyText := ""
	for line in InjectionOptions
	{
		index_val := A_Index
		for k,v in line.OwnProps()
			if k="name"
				{
	    		;NewArray.Push(v)
	    		MyText .= index_val
	    		MyText .= k "=" v "`n"
	    		NewArray[index_val] := v
	    		}
	    	}
	MsgBox MyText
	loop parse, NewArray
	{
	   MsgBox "Color number " A_Index " is " A_LoopField
	}
}
*/
