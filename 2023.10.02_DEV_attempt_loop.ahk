
/*

version 1
*********

ImagingOptions := {x:100, y:200, abbr:"BLAH, blah", name:"full name"}





Capslock & s::
{

text := ""
for k, v in ImagingOptions.OwnProps()
	text .= k "=" v

MsgBox text
}

*/


/*
version 2
*********
THIS actually prints out the options!!!

ImagingOptions := Array(
	{x:100, y:200, abbr:"BLAH, blah", name:"full name"},
	{x:110, y:210, abbr:"2.BLAH, 3.blah", name:"full name 2"}
)


Capslock & s::
{

text := ""
Loop ImagingOptions.Length
{
	text .= "`n" A_Index 
	;"
	Item := ImagingOptions[A_Index]
	for k, v in Item.OwnProps()
		text .= k "=" v
}


MsgBox text
}

*/

/*
; version 3
*******
; This actually extracts out an aspect of the name

ImagingOptions := Array(
	{x:100, y:200, abbr:"BLAH, blah", name:"full name"},
	{x:110, y:210, abbr:"2.BLAH, 3.blah", name:"full name 2"}
)


Capslock & s::
{

text := ""
arr := []
Loop ImagingOptions.Length
{
	text .= "`n" A_Index "`t"
	;"
	Item := ImagingOptions[A_Index]
	;for k, v in Item.OwnProps()
	;	text .= k "=" v " `t"
	text .= Item.name
	arr.Push(Item.name)
}

text2 := ""
Loop arr.Length
	text2 .= "`n" arr[A_Index]
	;"
MsgBox text2	

}
*/

/*
; check if str is in array
Capslock & s::
{
	text := ""
	;arr := GetNames(ImagingOptions)
	arr := GetAbbr(ImagingOptions)
	
	var := "2"
	vars := "blah,2"
	Loop parse, vars, ","
	Loop arr.Length
		{
			if InStr(arr[A_Index], var, false) 
				text .= "`n" var "is in" arr[A_Index]
			;"

		}
	MsgBox text

	PrintArray(arr)
}

; check if str is in array (strict) more similar to previous method of exact matching

Capslock & s::
{
	textboard := ""
	;arr := GetNames(ImagingOptions)
	arr := GetAbbr(ImagingOptions)
	
	vars := "blah,2"
	Loop parse, vars, ","
		Loop arr.Length
			{
				NewString := StrReplace(arr[A_Index], ",", "|")
				NewString := StrReplace(NewString, A_Space, "")
				MsgBox NewString
				if A_LoopField ~= NewString
				;if InStr(arr[A_Index], A_LoopField, false) 
					textboard .= "`n '" A_LoopField "' is in " arr[A_Index]
				;"

			}
	MsgBox textboard

	;PrintArray(arr)
}

; cleaned up into functions
; -------------------------

Capslock & s::
{
	textboard := ""
	;arr := GetNames(ImagingOptions)
	arr := GetAbbr(ImagingOptions)
	
	vars := "blah,2"
	Loop parse, vars, ","
		Loop arr.Length
			{	
				;if FindVarString_Strict(arr[A_Index],A_LoopField)
				if FindVarString_Loose(arr[A_Index],A_LoopField)
					textboard .= "`n '" A_LoopField "' `t`t is in: `t" arr[A_Index]
				;"

			}
	MsgBox textboard
	A_Clipboard := textboard

	;PrintArray(arr)


Abbr		Full Name
---- 		---------

Capslock & s::
{
	textboard := PrintAbbrNames(ImagingOptions)
	MsgBox textboard
	A_Clipboard := textboard
	;PrintArray(arr)
}



}



*/

ImagingOptions := Array(
	{x:100, y:200, abbr:"B, BLAH, 2.blah", name:"full name"},
	{x:110, y:210, abbr:"2, 2.BLAH, 3.blah", name:"full name 2"}
)


Capslock & s::
{
	textboard := PrintAbbrNames(ImagingOptions)
	/*
	textboard := ""
	ArrayOfNames := GetNames(ImagingOptions)
	ArrayOfAbbr := GetAbbr(ImagingOptions)
	
	textboard := "Abbr`t`tFull Name`n-----`t`t---------"

	Loop ArrayOfNames.Length
		textboard .= "`n " ArrayOfAbbr[A_Index] "  `t" ArrayOfNames[A_Index]
		;"
	*/

	/*
	vars := "blah,2"
	Loop parse, vars, ","
		Loop arr.Length
			{	
				;if FindVarString_Strict(arr[A_Index],A_LoopField)
				if FindVarString_Loose(arr[A_Index],A_LoopField)
					textboard .= "`n '" A_LoopField "' `t`t is in: `t" arr[A_Index]
				;"

			}
			*/
	MsgBox textboard
	A_Clipboard := textboard

	;PrintArray(arr)
}

PrintArray(MyArray)
	{
		MyText := ""
		Loop MyArray.length
			MyText .= "`n" MyArray[A_Index]
			;"
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
		;"
	
	return textboard	
	}