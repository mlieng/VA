; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.

;#INCLUDE 2023.10.20_GUI_attending_DEV.ahk

/*
to do:: assign shortcuts of folders to hotkey (would need to make sure that window isn't already open)
run or activate (especially for google calendar)

UPDATES
2023/02/06 - added '.pi' %>% 
2023/04/07 - MAJOR - cleaned up file'
:*: does an automatic replacemeint. w
2023/08/14 - μm um 
2023/08/15 - fixed up/down for onenote 
https://stackoverflow.com/questions/44170454/up-down-key-not-working-in-onenote-2016-for-autohotkey

2023/09/20 - changed to alt
2023/09/23 -autocorrected


[ ] convert menu to choice selection to ahk2
*/



/*
;autodictionary

simple replacement
https://unicode-table.com/en/; ➝, 🠕 , 🠗,⭠, α,β,γ,
https://www.arrowsymbol.com/triangle-arrows-symbols
putting the star does an instant replace
https://graphemica.com/unicode/characters/page/35
*/

::.r::{U+279D} 			;➝ {U+279D}
::.ra::➝				;➝
::.l::{U+2B60} 			;⭠ 
::.bi::{U+2B64}			;⭤
::.u::⭡					;⭡ {U+2B61} 
::.uu::⇈ 				;
::.incr::⇑	 			;⭡
::.d::⭣					;⭣ {U+2B63}
::.decr::⇓				;⭣ 
::.dd::⇊
::.primary::1°
::.secondary::2° 
::.tertiary::3° 
::.neutrophil::Nφ
::.macrophage::Mφ
::.none::🚫
::.none2::⛔
::.check::✅

:*:.event::{U+21D2} 	;⇒
:*:.leadsto::{U+21D2} 	;⇒
:*:.degC::{U+2103} 		;℃
:*:.degF::{U+2109} 		;℉
::.deg::{U+00B0} 		;° 
:*:.alpha::{U+03B1} 	;α
:*:.beta::{U+03B2} 		;β
:*:.gamma::{U+03B3} 	;γ
::.delta::{U+0394} 		;Δ
::.deltalower::{U+03B4} ;δ
::.pi::%>% 				;%>% 
::.um::μm 				;μm
::.ul::μl      			;μl
:*:.psi::φ				;φ
::.female::♀			;U+2640 ♀️ ○ U+25CB
::.male::♂  			;U+2642 ♂️△	U+25B3

::aka::AKA

::optom::optometry
::ophtho::ophthalmology
::fluoro::fluorescein
::rapd::RAPD
::oct::OCT
::od::OD
::os::OS
::ou::OU
::crao::CRAO
::brao::BRAO
::crvo::CRVO
::brvo::BRVO
::iso::in the setting of
::onh::ONH (optic nerve head)

::wamd::WAMD

::.esq::Esq-Sp-Ophth


; https://jacks-autohotkey-blog.com/2015/10/26/add-currency-and-other-symbols-with-autohotkey-hotstring-menus-part-6-beginning-hotstrings/
;updated for AHK2
; https://www.autohotkey.com/docs/v2/lib/StrSplit.htm
; https://www.autohotkey.com/docs/v2/lib/Menu.htm

/*
TextMenu(TextOptions)
{
  MenuItems := StrSplit(TextOptions, ",")
  Loop %MenuItems0%
  {
    Item := MenuItems%A_Index%
    Menu, MyMenu, add, %Item%, MenuAction
  }
  Menu, MyMenu, Show
  Menu, MyMenu, DeleteAll
}

MenuAction:
  SendInput %A_ThisMenuItem%{raw}%A_EndChar%
Return

::.c`t::
  TextMenu("¢,£,€,¥")
Return

; unused ,ζ,η,ς,φ,ψ,ω
Capslock & d::
  TextMenu("α,β,γ,Δ,δ,ε,θ,ι,κ,λ,μ,π,φ,ρ,σ,τ,χ")
Return

Capslock & s::
  TextMenu("°,±,≥,≤,÷,×,¹,²,³,Δ,ƒ,∫,∑,∞,≈,≠,∡,⦦,⊾,⊕,⊖")
Return

Capslock & a::
  TextMenu("⤷,↳,⮡,⇄,⇿,⬄,⬌,⭤,⮆,⇈,⇊,⇶,➝,⭬,↑,🠕,🠑,🠱,↓,🠗,🠓,🠯,⭯,⭮,⮥,⮧,⥿,↷,⤻, ⇑,⇓,⇡,⇣,⭡,⭣,⇒")
Return

Capslock & w::
    TextMenu("◐,◑,◒,◓")
Return

*/

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


; ARROWS
; --------------------------------------------------------------------
/*
Replacing arrows with ijkl

# For some reason, using just alt and the previous GetKeyState didn't work for pressing through Shift, So had to force it through
*/

!+i::SendPlay "+{Up}"
!+k::SendPlay "+{Down}"
!+j::Send "+{Left}"
!+l::Send "+{Right}"
!+u::Send "+{Home}"
!+o::Send "+^{End}"
!+h::Send "+^{Left}"
!+SC027::Send "+^{Right}"

!i::SendPlay "{Up}"
!k::SendPlay "{Down}"
!j::Send "{Left}"
!l::Send "{Right}"
!u::Send "{Home}"
!o::Send "{End}"
!h::Send "^{Left}"
!SC027::Send "^{Right}" ; SC027 is the same as a ; 
!BS::Send "{Del}"

!F::Send "{Click 2}"


/* assigning wheel up/down/left right 
	theoretically SHIFT + wheel up is the same as wheel right
*/

!n::Send "{WheelUp}"
!m::Send "{WheelDown}"
!+n::Send "{WheelLeft}"
!+m::Send "{WheelRight}"



!8::Send "{WheelUp}"
!9::Send "{WheelDown}"
!7::Send "{WheelLeft}"
!0::Send "{WheelRight}"
!+8::Send "+{WheelUp}"
!+9::Send "+{WheelDown}"

; in epic
; --------------------------------------------------------------------

#Hotif FindVarString_Loose(WinGetTitle("A"), "Hyperspace")

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
	Send "{F2}"
}

Capslock & F::
{
	Send "{F2}"
}

#Hotif


; Showstart 
; --------------------------------------------------------------------

;https://www.autohotkey.com/docs/v2/lib/Win.htm

ShowStart(title, exe)
{
if WinExist(title)
	if WinActive(title)
		WinMinimize ; minimize if already showing
	else
    	WinActivate ; Use the window found by WinExist.
else
	Run exe
}

Capslock & g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")
;^g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")





;********************************************************************* 
; general commands
;********************************************************************* 

; get window coordinates
Capslock & c::
{
	;https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
	A_Clipboard := "" ; empties clipboard
	MouseGetPos &xpos, &ypos 
	MsgBox "The cursor is at X" xpos " Y" ypos
	A_Clipboard := xpos ", " ypos
	;MsgBox "The cursor is at " A_Clipboard
	;return
}

; GET ACTIVE WINDOW NAME
Capslock & w::
{
	MsgBox "The active window is '" WinGetTitle("A") "'."
	A_Clipboard := WinGetTitle("A")
	return
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

;********************************************************
#INCLUDE _GuiCtlExt.ahk


choice_attending := ""
choice_resident := "test"

!q:: Send(choice_resident)
::.res2::
	{
		Send(choice_resident)
	}

::.res::
	{
		Send(Saved.CB)
	}


CapsLock & L:: ListVars

CapsLock & Q::
{
Global g

g := Gui("-MinimizeBox -MaximizeBox","Note")
g.SetFont("s10","Consolas")
g.OnEvent("close",gui_close)
g.OnEvent("escape",gui_close)


ResidentList := [
	"Althea Alquitran, MD",
	"Franklin Jeng, MD",
	"Matthew Hogan, MD, MPH",
	"Monica K Lieng, MD, PhD",
	"Nita Bhat, MD",
	"Nicholas Janigian, MD",
	"Purvi Shah, MD",
	"Palmer Feibelman, MD",
	"Shaunt Fereshetian, MD"
	]
AttendingList := [
	"Pruzan, Noelle",
	"Murphy, Marjorie"]
g.Add("Text",, "Your name:")
CtlRes := g.Add("ComboBox","vCB yp w200 h100 r5 Section",ResidentList)
; CtlRes := g.Add("ComboBox","vCB +10 yp w200 h100 r5 Section",ResidentList)
CtlRes.AutoComplete := true

g.Add("Text","xm", "Attending Last Name:") ;xp starts a new row, same location as previous. xm starts new row below all aspects
CtlAtt := g.Add("ComboBox","vCB2 yp w200 h100 r5 Section",AttendingList) ; yp next col
CtlAtt.AutoComplete := true

Btn := g.Add("Button", "default xm", "OK")  ; xm puts it at the bottom left corner.
Btn.OnEvent("Click", gui_close)


g.show("")

gui_close(*) {
	Global Saved
	Saved := g.Submit()
	Global choice_resident
	choice_resident :=CtlRes.Text
	;MsgBox("You entered:" choice_resident, "`n" Saved.CB2)
	MsgBox("You entered:" Saved.CB "`n" Saved.CB2)
	ListVars
	Return Saved
}
}
