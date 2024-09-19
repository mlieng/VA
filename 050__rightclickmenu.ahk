

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
MyMenu.Add("&Clean Note", cleanNote)
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
    ShowStart("VA AHK", "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe  --app=https://mlieng.github.io/VA/")
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
text_ := RegExReplace(text_, "m)(\r\n|\r|\n){2}( *)OS", "`n`t`tOS")
; looks ahead  so that don't have to manually put spaces and OS back
text_ := RegExReplace(text_, "m)(\r\n|\r|\n){2}(?=(\s+)OS)", "`n")
https://images.datacamp.com/image/upload/v1665049611/Marketing/Blog/Regular_Expressions_Cheat_Sheet.pdfhttps://www.rexegg.com/regex-quickstart.html
*/

;cleanNote(Item, *){
; cleanNote2
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

cleanNote(*){
    ;Send "^C"
    ;ClipWait(2)
    mytext := A_Clipboard
    ;mytext :=  EditGetSelectedText()

    text_ := StrReplace(mytext, "`r`n`n", "")
    ;removes the default answer
    
    text_ := RegExReplace(text_, "m)\( \) White and Quiet(\r\n|\r|\n)\s+", "") 
    text_ := RegExReplace(text_, "m)\( \) Clear(\r\n|\r|\n)\s+", "") 
    text_ := RegExReplace(text_, "m)\( \) Normal(\r\n|\r|\n)\s+", "") 
    text_ := RegExReplace(text_, "m)\( \) Normal without edema, lipid, or hemes.(\r\n|\r|\n)\s+", "") 

    ;replaces Other and deletes the following line
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)  +\( \) Other(.+)(\r\n|\r|\n)", "")
   
    ; deletes empty line before OS
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)OS)", "`n")

    ; delete extra line before OD
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.)(.*))", "`n")   
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)(Vitreous|Disc\sMargin|Cup|Rim|Macula|Vasc|Background|Periphery))(.*)", "`n")   

    ; add extra line before OD
    text_ := RegExReplace(text_, "(.*)Lids/Lashes:",    "`n$1Lids/Lashes:")    
    text_ := RegExReplace(text_, "(.*)Conjunctiva:",    "`n$1Conjunctiva:")
    text_ := RegExReplace(text_, "(.*)Cornea:",         "`n$1Cornea:")
    text_ := RegExReplace(text_, "(.*)Iris:",           "`n$1Iris:")
    text_ := RegExReplace(text_, "(.*)Lens:",           "`n$1Lens:")
    text_ := RegExReplace(text_, "(.*)Ant. Chamber:",  "`n$1Ant. Chamber:")
    text_ := RegExReplace(text_, "(.*)Angles:",         "`n$1Angles:")
    text_ := RegExReplace(text_, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;text_ := RegExReplace(text_, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;text_ := RegExReplace(text_, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;text_ := RegExReplace(text_, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;text_ := RegExReplace(text_, "(.*)Vitreous:",        "`n$1Vitreous:")
    ;text_ := RegExReplace(text_, "(?=(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.))", "`n`n")   
    ;text_ := RegExReplace(text_, "^(\s+)(Lids|Conj|Cornea|Iris|Lens|Angles||Ant\.))", "`n$1")
    ;text_ := RegExReplace(text_, "m)(\n)(?=(\s+)(Vitreous|Disc\sMargin|Cup|Rim|Macula|Vasc|Background|Periphery))", "`n`n") 

    ;text_ := RegExReplace(text_, "m)(\r\n|\r|\n)\s+(\r\n|\r|\n)(?=(\s+)OS)", "`n")

    ;to delete the fundus exam part
    text_ := RegExReplace(text_, "m)\s+\( \) Undilated", "")
        ;deletes from "reason on + dilated on next line "
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)\s+Reason(.*)[(\r\n|\r|\n)\s*(.*)]", "") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)Dilated with(.*)", "") 
    text_ := RegExReplace(text_, "\s+Time(.*)", "") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)\(\w\) 90 D(.*)", "   +90D") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)\( \) 90 D(.*)", "") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)\(\w\) 78 D(.*)", "   +78D") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)\( \) 78 D(.*)", "") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)\(\w\) 20 D(.*)", "   +20D") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)\( \) 20 D(.*)", "") 
    text_ := RegExReplace(text_, "m)(\r\n|\r|\n)(.*)Direct(.*)", "") 

    text_ := StrReplace(text_, "Tonometry", "`nTonometry")

    ; clean up text
    text_ := StrReplace(text_, "Pupils:", "Pupils: PERRL, (-) APD")
    text_ := StrReplace(text_, "(x) Equal, round, reactive without afferent defect.", "")
    text_ := StrReplace(text_, "Extraocular Muscle Motility:", "EOMI")
    text_ := StrReplace(text_, "(x) Full, equal, smooth, accurate", "")
    text_ := StrReplace(text_, "( ) Other`n", "")

    text_ := StrReplace(text_, "Confrontation Fields:", "Confrontation Fields: Full 4 quadrants OU")
    text_ := StrReplace(text_, "(x) Full to finger counting OD, OS", "")

    ;iris
    text_ := StrReplace(text_, "IRIS Neovascularization", "NVI")
    text_ := StrReplace(text_, "Normal and flat without neovascularization", "(-) NVI")
    text_ := StrReplace(text_, "Clear without pigment, heme or cell", "Clear")

    ;AC
    text_ := StrReplace(text_, "Deep and Quiet","d&q",0)

    ;rim
    text_ := StrReplace(text_, "Sharp,pink,flat","s/p/f")
    text_ := StrReplace(text_, "Distinct (-) NVD", "Normal")
    text_ := StrReplace(text_, "Pink and Healthy (-)NVD", "Normal")
    text_ := StrReplace(text_, "Pink and Healthy, (-) pallor", "Normal")

    ;macula
    text_ := StrReplace(text_, "Normal without edema, lipid, or hemes. ", "Normal")

    ;background
    text_ := StrReplace(text_, "Normal (-)NVE", "Normal")

    ;periphery
    text_ := StrReplace(text_, "Normal without holes or tears 360º", "Normal")
    text_ := StrReplace(text_, "Normal without holes or tears 360", "Normal")
    text_ := StrReplace(text_, "Normal caliber and appearance", "Normal")

    ;getting rid of the (x)
    text_ := StrReplace(text_, "OD (x)", "OD")
    text_ := StrReplace(text_, "OS (x)", "OS")


    text_ := StrReplace(text_, "Funduscopic Examination", "DFE")
    text_ := StrReplace(text_, "Other:")

    ;replaces any extra space before "OD with just one tab"
    ;text_ := RegExReplace(text_, "^\s+(.*)OD", "`t$1OD")



    ;clean glaucoma section
    text_ := StrReplace(text_, "Medication/treatment history:", "Med/Tx History:",0)
    text_ := StrReplace(text_, "Have the following been performed within the past year?", "Tests",0)
    text_ := StrReplace(text_, "Has a drance heme ever been present?", "Drance heme, ever?",0)
    text_ := StrReplace(text_, "Is a visual field defect present?", "VF defect?",0)
    text_ := StrReplace(text_, ". Date:", "",0)


    ;for some reason generic is not working (Y(*) N(*))
    text_ := StrReplace(text_, "Y(x)  N( ) Fundus photos", "-Fundus photos:")
    text_ := StrReplace(text_, "Y( )  N(x) Fundus photos", "-Fundus photos:")

    text_ := StrReplace(text_, "Y(x)  N( ) Visual Fields", "-Visual Fields:")
    text_ := StrReplace(text_, "Y( )  N(x) Visual Fields", "-Visual Fields:")

    text_ := StrReplace(text_, "Y(x)  N( ) Gonioscopy/Anterior Segment OCT", "-Gonio/AS OCT:")
    text_ := StrReplace(text_, "Y( )  N(x) Gonioscopy/Anterior Segment OCT", "-Gonio/AS OCT:")

    text_ := StrReplace(text_, "Y(x)  N( ) RNFL OCT", "-OCT RNFL:")
    text_ := StrReplace(text_, "Y( )  N(x) RNFL OCT", "-OCT RNFL:")    

    ;replace the leftover yes/no
    text_ := StrReplace(text_, "Y( )  N(x)", "no")
    text_ := StrReplace(text_, "Y(x)  N( )", "yes")

    ;text_ := StrReplace(text_, "Y(*)  N(*) Visual Fields. Date:", "-VF:")
    ;text_ := StrReplace(text_, "Y(*)  N(*) Gonioscopy/Anterior Segment OCT", "-Gonio/Ant OCT:")
    ;text_ := StrReplace(text_, "Y(*)  N(*) RNFL OCT. Date:", "-OCT RNFL:")



    A_Clipboard := text_
    ;Return A_Clipboard
    Send "^v"
}

CapsLock & z:: cleanNote
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
    text_ := StrReplace(mytext, "`r`n", "`n")

    RegExMatch(text_, "OD\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    RegExMatch(text_, "OS\:{0,1}\s*20/(?<os>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)

    if(VA_OD.Count=0) 
        VA_OD[1]=000
    if(VA_OS.Count=0) 
        VA_OS[1]=000
    ;RegExMatch(text_, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(text_, "OS\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)
    ;RegExMatch(text_, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(text_, "OS\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|+\d*\s*)(`n|PH)", &VA_OS)
    ;RegExMatch(text_, "abc(.*)123", &SubPat)
    ;VA_OD[1]
    ;Send "^V"
    ;A_Clipboard := text_
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

 /*

 */