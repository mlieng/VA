#HotIf GetKeyState("Shift")
Capslock & f:: findVA
#Hotif

findVAwrapper(Item,*){
    findVA
}

findVA(){
        Send "^C"
    ClipWait(2)
    mytext := A_Clipboard
    ;mytext :=  EditGetSelectedText()

    mytext2 := StrReplace(mytext, "`r`n", "`n")
 ;   RegExMatch("OD 20/000", "(.*) 20/(?<od>\d+)", &VA_OD)
 ;   RegExMatch("OD 20/000", "(.*) 20/(?<os>\d+)", &VA_OS)


    RegExMatch("OD: 20/000 PH", 
          "(OD|OS)\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})", 
          &VA_OD)

    RegExMatch("OS:  20/000 PH", 
          "(OD|OS)\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})", 
          &VA_OS)

    RegExMatch(mytext2, "OD\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    RegExMatch(mytext2, "OS\:{0,1}\s*20/(?<os>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)


    ;"OD 20/(.{2}) PH" worked for OD 20/__ PH
    ;RegExMatch(mytext2, "OD 20/(.{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(mytext2, "OS 20/(.{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)
    ;VA_OD := 0
    ;VA_OS := 0
    ;if (VA_OD=0)
    ;    RegExMatch(mytext2, "OD(\s|\s*)20/(.{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    ;if (VA_OS.count!=1)
    ;if (VA_OS=0)
    ;    RegExMatch(mytext2, "OS(\s|\s*)20/(.{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)
    ;if (VA_OD=0)
    ;    RegExMatch(mytext2, "OD:(\s|\s*)20/(.{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    ;if (VA_OS=0)
    ;    RegExMatch(mytext2, "OS:(\s|\s*)20/(.{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)


    ;RegExMatch(mytext2, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(mytext2, "OS\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OS)
    ;RegExMatch(mytext2, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|+\d*\s*)(`n|PH)", &VA_OD)
    ;RegExMatch(mytext2, "OS\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|+\d*\s*)(`n|PH)", &VA_OS)
    ;RegExMatch(mytext2, "abc(.*)123", &SubPat)
    ;VA_OD[1]
    ;Send "^V"
    ;A_Clipboard := mytext2
    MsgBox VA_OD[1] "," VA_OS[1]
    A_Clipboard := VA_OD[1] "," VA_OS[1]
}

/*

things that work

 
     OD 20/20-1
     OS 20/30+2
 
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

outputs: "Count2; P1-OD; P2-000; named-000"

    RegExMatch("OD 20/000", "(.*) 20/(?<od>\d+)", &VA_OD)
    ;MsgBox "count" VA_OD.Count "--- \n part 1:" VA_OD[1] " \n part 2:" VA_OD.od "\n Named Part"
    ;MsgBox Format("Count{1}; P1-{2}; P2-{3}; named-{4}", "a", "b", "c", "d")
    newtext := Format("Count{1}; P1-{2}; P2-{3}; named-{4}", VA_OD.Count, VA_OD[1], VA_OD[2], VA_OD.od)

outputs "Count2; P1-OD; P2-000; named-000"

     ;placing thOS(?<side>OD|OS) matches the OD or OS, and saves it in variable "side"
    RegExMatch("OD 20/000", "(?<side>OD|OS)\:{0,1}\s*20/(?<od>\d+)", &VA_OD)
    newtext := Format("Count{1}; P1-{2}; P2-{3}; named-{4}", VA_OD.Count, VA_OD[1], VA_OD[2], VA_OD.od)

;replace (?<od>\d+) with (?<od>[a-zA-Z0-9]{2,3}) to find 2-3 digits

    RegExMatch("OD 20/000", "(?<side>OD|OS)\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})", &VA_OD)
    newtext := Format("Count{1}; P1-{2}; P2-{3}; named-{4}", 
               VA_OD.Count, VA_OD[1], VA_OD[2], VA_OD.od)


     outputs: "Count2; P1-OD; P2-000; named-000"


    RegExMatch("OD 20/LP", "(?<side>OD|OS)\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})", &VA_OD)
    newtext := Format("Count{1}; P1-{2}; P2-{3}; named-{4}", 
               VA_OD.Count, VA_OD[1], VA_OD[2], VA_OD.od)

     outputs: "Count2; P1-OD; P2-LP; named-LP"

; to detect PH -20, +20 etc. 

    RegExMatch("OD 20/000 PH", 
          "(?<side>OD|OS)\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", 
          &VA_OD)
    newtext := Format("Count{1}; P1-{2}; P2-{3}; named-{4}", 
               VA_OD.Count, VA_OD[1], VA_OD[2], VA_OD.od)
    
     outputs: "Count4; P1-OD; P2-000; named-000"

*/

    RegExMatch("OD:  20/000 PH", 
          "(?<side>OD|OS)\:{0,1}\s*20/(?<od>[a-zA-Z0-9]{2,3})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", 
          &VA_OD)
    newtext := Format("Count{1}; P1-{2}; P2-{3}; named-{4}", 
               VA_OD.Count, VA_OD[1], VA_OD[2], VA_OD.od)
    

    MsgBox newtext
    A_Clipboard := newtext


     ;RegExMatch(mytext2, "OD\:{0,1}\s*20/{0,1}(.{2})(\s*|\,\s*|-\d*\s*|\+\d*\s*)(`n|PH)", &VA_OD)