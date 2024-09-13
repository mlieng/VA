

/*
See original in 
https://www.autohotkey.com/docs/v2/lib/Menu.htm#Remarks
*/

#INCLUDE "000_RUN_THIS.ahk"

/*

UtilMenu := Menu()
MyMenu.Add("&Cursor", getCursorCoords)
MyMenu.Add("&Window", getWindowCoords)

~Capslock & RButton::{
    MouseGetPos &xpos, &ypos 
    ;MouseClick, right, xpos, ypos
    UtilMenu.Show()  ; i.e. press the Win-Z hotkey to show the menu.
}

getCursorCoords(Item,*){
{
    ;https://www.autohotkey.com/docs/v2/lib/A_Clipboard.htm
    A_Clipboard := "" ; empties clipboard
    MouseGetPos &xpos, &ypos 
    MsgBox "The cursor is at X" xpos " Y" ypos
    ;A_Clipboard := xpos ", " ypos
    A_Clipboard :=Format("Send `"{Click {1} {2}}`"", xpos, ypos)
    ;A_Clipboard := "Send `"{ Click" xpos " " ypos "}"""
    ;A_Clipboard := Format("Send ""{Click {1} {2}}""", xpos, ypos)
    ;MsgBox "The cursor is at " A_Clipboard

}

getWindowCoords(Item,*){
    MsgBox "The active window is '" WinGetTitle("A") "'."
    A_Clipboard := WinGetTitle("A")
}
*/



; Create the popup menu by adding some items to it.
MyMenu := Menu()
MyMenu.Add("&Help", help_documentation)
MyMenu.Add("&Settings", run_settings_GUI)
MyMenu.Add()  ; Add a separator line.
MyMenu.Add("&Clean Optometry Note", cleanOptom)
MyMenu.Add("&Extract Visual Acuity", findVA)
MyMenu.Add("&PasteNote", pasteNote)

; Create another menu destined to become a submenu of the above menu.
Submenu1 := Menu()
Submenu1.Add("Item A", MenuHandler)
Submenu1.Add("Item B", MenuHandler)

; Create a submenu in the first menu (a right-arrow indicator). When the user selects it, the second menu is displayed.
MyMenu.Add("My Submen&u", Submenu1)

MyMenu.Add()  ; Add a separator line below the submenu.
MyMenu.Add("&Timeout", fillTimeout)  ; Add another menu item beneath the submenu.
MyMenu.Add("&Injection Consent", FillConsent)  ; Add another menu item beneath the submenu.

;*******************************************************************************
; supporting functions
;*******************************************************************************


MenuHandler(Item, *) {
    MsgBox("You selected " Item)
    ;if Item ="&Timeout"
    ;   fillTimeout()
    ;else if Item ="&Injection Consent"
    ;    FillConsent()
}

;control plus right click
;start the menu
#Z::
~^RButton::{
    MouseGetPos &xpos, &ypos 
    ;MouseClick, right, xpos, ypos
    MyMenu.Show()  ; i.e. press the Win-Z hotkey to show the menu.
}


help_documentation(Item,*){
    ShowStart("VA AHK", "C:\Program Files\Google\Chrome\Application\chrome.exe  --app=https://mlieng.github.io/VA/")
}


help_documentation2(Item,*){
MsgBox "
  (
    The first parameter is displayed as the message.
    The second parameter becomes the window title.
    The third parameter determines the type of message box.
  )", "Window Title", "iconi"
}


    ;*******************************************************************************
    ; edit menu
    ;*******************************************************************************


/*
 place a \ to escape the ()

;replaces the line before OS 
mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n){2}( *)OS", "`n`t`tOS")
; looks ahead  so that don't have to manually put spaces and OS back
mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n){2}(?=(\s+)OS)", "`n")
https://images.datacamp.com/image/upload/v1665049611/Marketing/Blog/Regular_Expressions_Cheat_Sheet.pdfhttps://www.rexegg.com/regex-quickstart.html
*/

;cleanOptom(Item, *){
; cleanOptom2
;}

pasteNote(*){
    newNote := cleanNote2()
    SendText newNote
    Sleep 5 
    SendText "`n`n"
    end_text := write_end_text() 
    ;Send newNote ;"{enter 2}" end_text
    SendText end_text
}

cleanNote2(*){
   text_ := A_Clipboard
   text_ := StrReplace(text_, "`r`n`n", "")
   text_ := StrReplace(text_, "(X) ", "", 0)  ;0/1 case sensitive   
   text_ := StrReplace(text_, "Deep and Quiet","d&q")
   text_ := StrReplace(text_, "Normal and flat without neovascularization","(-)NVI")
   text_ := StrReplace(text_, "Sharp,pink,flat","s/p/f")
   return text_
}

cleanOptom(*){
    ;Send "^C"
    ;ClipWait(2)
    mytext := A_Clipboard
    ;mytext :=  EditGetSelectedText()

    mytext2 := StrReplace(mytext, "`r`n`n", "")
    ;removes the default answer
    
    mytext2 := RegExReplace(mytext2, "m)\( \) White and Quiet(\r\n|\r|\n)\s+", "") 
    mytext2 := RegExReplace(mytext2, "m)\( \) Clear(\r\n|\r|\n)\s+", "") 
    mytext2 := RegExReplace(mytext2, "m)\( \) Normal(\r\n|\r|\n)\s+", "") 
    mytext2 := RegExReplace(mytext2, "m)\( \) Normal without edema, lipid, or hemes.(\r\n|\r|\n)\s+", "") 

    ;replaces Other and deletes the following line
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)  +\( \) Other(.+)(\r\n|\r|\n)", "")
   
    ; deletes empty line before OS
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)OS)", "`n")

    ; delete extra line before OD
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.)(.*))", "`n")   
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)(Vitreous|Disc\sMargin|Cup|Rim|Macula|Vasc|Background|Periphery))(.*)", "`n")   

    ; add extra line before OD
    mytext2 := RegExReplace(mytext2, "(.*)Lids/Lashes:",    "`n$1Lids/Lashes:")    
    mytext2 := RegExReplace(mytext2, "(.*)Conjunctiva:",    "`n$1Conjunctiva:")
    mytext2 := RegExReplace(mytext2, "(.*)Cornea:",         "`n$1Cornea:")
    mytext2 := RegExReplace(mytext2, "(.*)Iris:",           "`n$1Iris:")
    mytext2 := RegExReplace(mytext2, "(.*)Lens:",           "`n$1Lens:")
    mytext2 := RegExReplace(mytext2, "(.*)Ant. Chamber:",  "`n$1Ant. Chamber:")
    mytext2 := RegExReplace(mytext2, "(.*)Angles:",         "`n$1Angles:")
    mytext2 := RegExReplace(mytext2, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;mytext2 := RegExReplace(mytext2, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;mytext2 := RegExReplace(mytext2, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;mytext2 := RegExReplace(mytext2, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;mytext2 := RegExReplace(mytext2, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;mytext2 := RegExReplace(mytext2, "(?=(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.))", "`n`n")   
    ;mytext2 := RegExReplace(mytext2, "^(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.))", "`n$1")
    ;mytext2 := RegExReplace(mytext2, "m)(\n)(?=(\s+)(Vitreous|Disc\sMargin|Cup|Rim|Macula|Vasc|Background|Periphery))", "`n`n") 

    ;mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)OS)", "`n")

    ;to delete the fundus exam part
    mytext2 := RegExReplace(mytext2, "m)\s+\( \) Undilated", "")
        ;deletes from "reason on + dilated on next line "
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)\s+Reason(.*)[(\r\n|\r|\n)\s*(.*)]", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)Dilated with(.*)", "") 
    mytext2 := RegExReplace(mytext2, "\s+Time(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\(\w\) 90 D(.*)", "   +90D") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\( \) 90 D(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\(\w\) 78 D(.*)", "   +78D") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\( \) 78 D(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\(\w\) 20 D(.*)", "   +20D") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)\( \) 20 D(.*)", "") 
    mytext2 := RegExReplace(mytext2, "m)(\r\n|\r|\n)(.*)Direct(.*)", "") 

    mytext2 := StrReplace(mytext2, "Tonometry", "`nTonometry")

    ; clean up text
    mytext2 := StrReplace(mytext2, "Pupils:", "Pupils: PERRL, (-) APD")
    mytext2 := StrReplace(mytext2, "(x) Equal, round, reactive without afferent defect.", "")
    mytext2 := StrReplace(mytext2, "Extraocular Muscle Motility:", "EOMI")
    mytext2 := StrReplace(mytext2, "(x) Full, equal, smooth, accurate", "")
    mytext2 := StrReplace(mytext2, "( ) Other`n", "")

    mytext2 := StrReplace(mytext2, "Confrontation Fields:", "Confrontation Fields: Full 4 quadrants OU")
    mytext2 := StrReplace(mytext2, "(x) Full to finger counting OD, OS", "")

    mytext2 := StrReplace(mytext2, "IRIS Neovascularization", "NVI")
    mytext2 := StrReplace(mytext2, "Normal and flat without neovascularization", "(-) NVI")
    mytext2 := StrReplace(mytext2, "Clear without pigment, heme or cell", "Clear")

    mytext2 := StrReplace(mytext2, "Distinct (-) NVD", "Normal")
    mytext2 := StrReplace(mytext2, "Pink and Healthy, (-) pallor", "Normal")
    mytext2 := StrReplace(mytext2, "Normal without edema, lipid, or hemes. ", "Normal")
    mytext2 := StrReplace(mytext2, "Normal without holes or tears 360º (-) NVE", "Normal")
    mytext2 := StrReplace(mytext2, "Normal without holes or tears 360", "Normal")
    mytext2 := StrReplace(mytext2, "Normal caliber and appearance", "Normal")

    mytext2 := StrReplace(mytext2, "OD (x)", "OD")
    mytext2 := StrReplace(mytext2, "OS (x)", "OS")
    mytext2 := StrReplace(mytext2, "Funduscopic Examination", "DFE")
    mytext2 := StrReplace(mytext2, "Other:")

    ;replaces any extra space before "OD with just one tab"
    ;mytext2 := RegExReplace(mytext2, "^\s+(.*)OD", "`t$1OD")


    ; opens and pastes in notepad
    ;if WinExist("Untitled - Notepad")
    ;    WinActivate ;
    ;else 
    ;    Run "notepad.exe"
    ;    WinWait(2)
    ;    WinActivate "Untitled - Notepad"

    ;ShowStart("", "notepad.exe")
    
    ;WinActivate("Untitled - Notepad")

    A_Clipboard := mytext2
    ;Return A_Clipboard
    Send "^v"
}

CapsLock & z:: cleanOptom
#HotIf GetKeyState("Shift")
Capslock & f:: findVA
#Hotif

;findVAwrapper(Item,*){
;    findVA
;}

findVA(*){
    ;Send "^c"
    ;ClipWait(2)
    mytext := A_Clipboard
    mytext2 := StrReplace(mytext, "`r`n", "`n")

    RegExMatch(mytext2, "OD\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    RegExMatch(mytext2, "OS\:{0,1}\s*20/(?<os>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)

    if(VA_OD.Count=0) 
        VA_OD[1]=000
    if(VA_OS.Count=0) 
        VA_OS[1]=000
    ;RegExMatch(mytext2, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(mytext2, "OS\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)
    ;RegExMatch(mytext2, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(mytext2, "OS\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|+\d*\s*)(`n|PH)", &VA_OS)
    ;RegExMatch(mytext2, "abc(.*)123", &SubPat)
    ;VA_OD[1]
    ;Send "^V"
    ;A_Clipboard := mytext2
    ;MsgBox VA_OD[1] "," VA_OS[1]
    A_Clipboard := VA_OD[1] "," VA_OS[1]
    Send "^{v}"
}

/*

things that work

 
     OD 20/20-1
     OS 20/30+2
 
    OD  20/20-1
     OS  20/30+2
 
     OD  20/20-1
     OS  20/40+2


                OD: 20/25-2 PH 
                OS: 20/25 PH 

                OD:  20/50 PHNI 
                OS:  20/30 PHNI


     
                OD: 20/25 PHNI
                OS: 20/30 PH 25 +2

things that don't work

     OD  20/100-   PH 20/40
     OS  20/25-2



                OD 20/200 PHNI
                OS 20/200+1 PHNI

;HAS THE EXTRA COMMAS
                OD 20/30+1,
                OS 20/25-2

                OD: LP PHNI
                OS: 20/30+2 PHNI
 
 */