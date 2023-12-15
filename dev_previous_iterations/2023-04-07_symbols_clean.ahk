; IMPORTANT INFO ABOUT GETTING STARTED: Lines that start with a
; semicolon, such as this one, are comments.  They are not executed.


;to do:: assign shortcuts of folders to hotkey (would need to make sure that window isn't already open)
;run or activate (especially for google calendar)

; UPDATES
; 2023/02/06 - added '.pi' %>% 
; 2023/04/07 - MAJOR - cleaned up file'
; :*: does an automatic replacemeint. w
; 2023/08/14 - μm um 
; 2023/08/15 - fixed up/down for onenote 
; https://stackoverflow.com/questions/44170454/up-down-key-not-working-in-onenote-2016-for-autohotkey

;*******************************************************************************
;*******************************************************************************
/*
simple replacement
https://unicode-table.com/en/; ➝, 🠕 , 🠗,⭠, α,β,γ,
https://www.arrowsymbol.com/triangle-arrows-symbols
putting the star does an instant replace
https://graphemica.com/unicode/characters/page/35
*/

 
::.r::{U+279D} 		;➝ {U+279D}
::.ra::➝		;➝
::.l::{U+2B60} 		;⭠ 
::.bi::{U+2B64}		;⭤

; ::.u::{U+1F815} 	;🠕
; :*:.incr::{U+1F815} 	;↑
; ::.d::{U+1F817} 	;↓ 
; :*:.decr::{U+1F817} 	;↓ 

; ::.u::{U+2191} 	;↑ 
; :*:.incr::{U+2191} 	;↑
; ::.d::{U+2193} 	;↓ 
; :*:.decr::{U+2193} 	;↓ 


; although cleaner, this may results in extra space above and below
::.u::⭡			;⭡ {U+2B61} 
::.uu::⇈ 		;
::.incr::⇑	 	;⭡
::.d::⭣			;⭣ {U+2B63}
::.decr::⇓		;⭣ 
::.dd::⇊
::.primary::1°
::.secondary::2° 
::.tertiary::3° 
::.neutrophil::Nφ
::.macrophage::Mφ
::.none::🚫


:*:.event::{U+21D2} 	;⇒
:*:.leadsto::{U+21D2} 	;⇒
:*:.degc::{U+2103} 	;℃
:*:.degf::{U+2109} 	;℉
::.deg::{U+00B0} 	;° 
:*:.alpha::{U+03B1} 	;α
:*:.beta::{U+03B2} 	;β
:*:.gamma::{U+03B3} 	;γ
::.delta::{U+0394} 	;Δ
::.deltalower::{U+03B4} ;δ
::.pi::%>% 		;%>% 
::.um::μm 		;μm
::.ul::μl      		;μl
:*:.psi::φ		;φ

; https://jacks-autohotkey-blog.com/2015/10/26/add-currency-and-other-symbols-with-autohotkey-hotstring-menus-part-6-beginning-hotstrings/

TextMenu(TextOptions)
{
  StringSplit, MenuItems, TextOptions , `,
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

::.pro::⊕ 	;U+2295
::.con::⊝ 	;U+229D
;⊸ 	U+22B8
::.stim::➝+^{+}⊕+^{+}   ;➝ ⊕ ⨭↦↣↺∅∵≠⊶⊷⇢⫰⊕⊚⊝⊖⊛⫱⫰
::.stim2::➝+^{+}{+}+^{+} ;➝+
::.inh::{⊣}+^{+}⊝+^{+} ; ⊣⊝
::.inh2::{⊣}+^{+}{-}+^{+} ; ⊣-

; ⊸, ;U+22A3 left tack ➝⊕, ⊣⊝ 
;⊢	U+22A2 right tack
;⦦	U+29A6 
;∡	U+2221
;⊾
;https://www.alt-codes.net/angle-symbols
; ⋂	U+22C2
; ↷ U+21b7
; ⤻ U+293b
;https://www.hotsymbol.com/symbol/clockwise-top-semicircle-arrow

/*
25D	
◐
◑
◒
◓
◔
◕
◖
◗
	
◱
◲
◳
◴
◵
◶
◷
◠	
◡
◢
◣
◤
◥
◦
*/

;*******************************************************************************
;*******************************************************************************
/*
Use Caps Lock for Hand-Friendly Text Navigation
httplifehacker.com5277383use-caps-lock-for-hand+friendly-text-navigation
 
Written by Philipp Otto, Germany
 
Script Function
Template script (you can customize this template by editing ShellNewTemplate.ahk in your Windows folder)
 
    Normal usage with capslock as a modifier
    j left
    k down
    l right
    i up
    h simulates CTRL+left (jumps to the next word)
    ; simulates CTRL+right
    , simulates CTRL+Down
    8 simulates CTRL+Up
    u simulates Home (jumps to the beginning of the current line) (i forgot to mention this in my comment)
    o simulates End
    Backspace simulates Delete
    b cut
    c copy
    v paste
 
    If you keep pressing "Shift" in addition to Capslock it works as if you are pressing Shift — you highlight the text. Shift + Capslock activates the actual Capslock functionality (normal capslock-hitting deactivates it again).
 
*/
;*******************************************************************************
;*******************************************************************************

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
 
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
SetCapsLockState, AlwaysOff
 
CapsLock & i::
       if getkeystate("Shift") = 0
                        {
                        SendPlay,{Up}
                        }
       else           {
               SendPlay,+{Up}
                        }
return
 
CapsLock & l::
       if getkeystate("Shift") = 0
               Send,{Right}
       else
               Send,+{Right}
return
 
CapsLock & j::
       if getkeystate("Shift") = 0
               Send,{Left}
       else
               Send,+{Left}
return
 
CapsLock & k::
       if getkeystate("Shift") = 0
               SendPlay,{Down}
       else
               SendPlay,+{Down}
return
 
CapsLock & ,::
       if getkeystate("Shift") = 0
               Send,^{Down}
       else
               Send,+^{Down}
return
 
CapsLock & 8::
       if getkeystate("Shift") = 0
               Send,^{Up}
       else
               Send,+^{Up}
return
 
CapsLock & u::
       if getkeystate("Shift") = 0
               Send,{Home}
       else
               Send,+{Home}
return
 
CapsLock & o::
       if getkeystate("Shift") = 0
               Send,{End}
       else
               Send,+{End}
return
 
CapsLock & H::
       if getkeystate("Shift") = 0
               Send,^{Left}
       else
               Send,+^{Left}
return
 
       CapsLock & SC027::                                  ;has to be changed (depending on the keyboard-layout)
               if getkeystate("Shift") = 0
                       Send,^{Right}
               else
                       Send,+^{Right}
       return
 
CapsLock & BS::Send,{Del}

;Prevents CapsState-Shifting
CapsLock & Space::Send,{Space}
 
*Capslock::SetCapsLockState, AlwaysOff
+Capslock::SetCapsLockState, On

; CapsLock & 1::Run C:\allMYfiles\BOX\my_sandbox\after_CViz\





; to change outlook hotkeys



;*******************************************************************************
; Information
;*******************************************************************************
; AutoHotkey Version: 3.x
; Language: English
; Platform: XP/Vista/7
; Updated by: Toby Garcia
; Previously updated by: Ty Myrick
; Author: Lowell Heddings (How-To Geek)
; URL: http://lifehacker.com/5175724/.....gmail-keys
; Original script by: Jayp
; Original URL: http://www.ocellated.com/2009/.....t-outlook/
;
; Script Function: Gmail Keys adds Gmail Shortcut Keys to Outlook
; Version 3.x updated for Outlook 2013
;
;*******************************************************************************
; Version History
;*******************************************************************************
; Version 3.1 - added delete & spam functionality and enabled move/star funcs
; Version 3.0 - updated by Toby Garcia to work with Outlook 2013
; Version 2.0 - updated by Ty Myrick to work with Outlook 2010
; Version 1.0 - updated by Lowell Heddings
; Version 0.1 - initial set of hotkeys by Jayp
;*******************************************************************************
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode 2 ;allow partial match to window titles
;************************
;Hotkeys for Outlook 2013
;************************
;As best I (Ty Myrick) can tell, the window text 'NUIDocumentWindow' is not present on 
;any other items except the main window. Also, I look for the phrase ' - Microsoft Outlook'
;in the title, which will not appear in the title (unless a user types this string into the
;subject of a message or task).
;#IfWinActive, - Microsoft Outlook ahk_class rctrl_renwnd32, NUIDocumentWindow	;for Outlook 2010, uncomment this line
#IfWinActive, - Outlook ahk_class rctrl_renwnd32, NUIDocumentWindow		;for Outlook 2013, uncomment this line
y::HandleOutlookKeys("^+1", "y") ;archive message using Quick Steps hotkey (ctrl+Shift+1)
f::HandleOutlookKeys("^f", "f") ;forwards message
r::HandleOutlookKeys("^r", "r") ;replies to message
a::HandleOutlookKeys("^+r", "a") ;reply all
v::HandleOutlookKeys("^+v", "v") ;move message box
+u::HandleOutlookKeys("^u", "+u") ;marks messages as unread
+i::HandleOutlookKeys("^q", "+i") ;marks messages as read
j::HandleOutlookKeys("{Down}", "j") ;move down in list
+j::HandleOutlookKeys("+{Down}", "+j") ;move down and select next item
k::HandleOutlookKeys("{Up}", "k") ;move up
+k::HandleOutlookKeys("+{Up}", "+k") ;move up and select next item
o::HandleOutlookKeys("^o", "o") ;open message
s::HandleOutlookKeys("{Insert}", "s") ;toggle flag (star)
; s::HandleOutlookKeys("^+g", "s") ;set follow up options (star)
c::HandleOutlookKeys("^n", "c") ;new message
/::HandleOutlookKeys("^e", "/") ;focus search box
.::HandleOutlookKeys("+{F10}", ".") ;Display context menu
l::HandleOutlookKeys("!3", "l") ;categorize message using All Categories hotkey in Quick Access Toolbar (Alt+3)
+3::HandleOutlookKeys("{Delete}", "+3") ;delete selected message(s)
+1::HandleOutlookKeys("!4", "+1") ;Mark message as spam using Block Sender hotkey in Quick Access Toolbar (Alt+4)
#IfWinActive
;Passes Outlook a special key combination for custom keystrokes or normal key value, depending on context
HandleOutlookKeys( specialKey, normalKey )
{
;Activates key only on main outlook window, not messages, tasks, contacts, etc.
;IfWinActive, - Microsoft Outlook ahk_class rctrl_renwnd32, NUIDocumentWindow, ,	;for Outlook 2010, uncomment this line
IfWinActive, - Outlook ahk_class rctrl_renwnd32, NUIDocumentWindow, ,			;for Outlook 2013, uncomment this line
{
;Find out which control in Outlook has focus
ControlGetFocus currentCtrl, A
; MsgBox, Control with focus = %currentCtrl%
;Set list of controls that should respond to specialKey. Controls are the list of emails and the main
;(and minor) controls of the reading pane, including controls when viewing certain attachments.
;Currently I handle archiving when viewing attachments of Word, Excel, Powerpoint, Text, jpgs, pdfs
;The control 'RichEdit20WPT1' (email subject line) is used extensively for inline editing. Thus it 
;had to be removed. If an email's subject has focus, it won't archive...
ctrlList = Acrobat Preview Window1,AfxWndW5,AfxWndW6,EXCEL71,MsoCommandBar1,OlkPicturePreviewer1,paneClassDC1,OutlookGrid1,OutlookGrid2,RichEdit20WPT2,RichEdit20WPT4,RichEdit20WPT5,RICHEDIT50W1,SUPERGRID2,SUPERGRID1,_WwG1
if currentCtrl in %ctrlList%
{
; MsgBox, Control in list.
Send %specialKey%
}
;Allow typing normalKey somewhere else in the main Outlook window. (Like the search field or the folder pane.)
else
{
; MsgBox, Control not in list.
Send %normalKey%
}
}
;Allow typing normalKey in another window type within Outlook, like a mail message, task, appointment, etc.
else
{
Send %normalKey%
}
}




; ################################################################


ShowStart(title, exe)
{
IfWinActive, %title%
{
WinMinimize, %title%
}
else
{
    IfWinExist, %title%
        WinActivate
    else
    {
        Run, %exe%,, UseErrorLevel
        If ErrorLevel
        {
            Msgbox, File Not Found
            Return
        }
        WinActivate
    }
}
}


Capslock & g::ShowStart("Google Calendar", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://www.google.com/calendar/render?pli=1")
