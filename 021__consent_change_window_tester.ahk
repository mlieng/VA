;Informed Consent - Work - Microsoft

#HotIf FindVarString_Loose(WinGetTitle("A"), "Informed Consent")
Capslock & z::{
	if WinExist("Informed Consent")
    	WinActivate
	WinMove 0,0,1250,950
	}
#HotIf


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
