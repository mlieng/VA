---
title: Updates & To-Dos
author: ML
date: 2024-09-12
category: posts
layout: post
---


# To-Dos

- [ ] clicking of injections
- [x] needs adding the attending expansion 
- [x] re format text for indentation for text wrapping
- [ ] shortcuts to see 
	- [x] Hba1c specifically!
		- labs > worksheet > enter hgb a1c, enter. tab 6
	- [ ] blood pressure Reports > CLinical Reports>  Vital Signs
	- [ ] image reports> Radiology Imaging Local Only
	- [ ] labs > labs > Cumaltive
	- [ ] labs > graphing
- [ ] re-route ctrl L, ctrl e, ctrl r 
- [x] create a file to create a bunch of text files for pre-charting too hard
- [x] create a settings GUI. (tools?)
- [x] create help screen
- [x] ADD NONFORMULARY ON ORDERS
- [ ] hotstring expander [https://github.com/henrystern/hotstring_hints](https://github.com/henrystern/hotstring_hints)
- [x] auto processing optometry note

- [ ] auto extract name + birthdate

```
LASTNAME,FIRSTNAME MI; 1234567890 000-00-0000 mmm d,yyyy

10 digit MRN
```
- [ ] auto extract IOP
- [ ] auto extract past ocular history
- format indent 6, 7 


# Updates

## 2024

### h3


## 2023

* 2023/09/20 
* 2023/09/23 -autocorrected
* 2023/10/03 - started developing consent
* 2023/10/04 - addded abbreviation list, dates, choosing encounter types
* 2023/10/05 - text wrapping (see below)
* 2023/10/07 - figure out how to do a hotstring/hotkey
* 2023/11/03 - add F2/F3  for sublime
* 2023/12/15 - 

2023/10/05
- install package control
	- https://packagecontrol.io/installation
	- ctrl + shift + p
	- type `install package control`, press `enter`
- install wrap plus (https://github.com/ehuss/Sublime-Wrap-Plus)
	- Bring up the Command Palette (CommandShiftP on OS X, CtrlShiftP on Linux/Windows).
	- Select `package control: install package`
	- type `wrap plus`
- restart sublime

- setting up on an individual file
	- View > Wordwrap
	- View > Wordwrap 80
	- highlight text
	- Alt + q 
- setting up word wrapping for all text files
	- make sure bottom write = "txt"
	- Preference > settings > syntax specific
	- insert the following and click save

		// These settings override both User and Default settings for the Plain text syntax
		{
		// Calculates indentation automatically when pressing enter
		"auto_indent": false,

	    // Disables horizontal scrolling if enabled.
	    // May be set to true, false, or "auto", where it will be disabled for
	    // source code, and otherwise enabled.
	    "word_wrap": "true",

		// Set to a value other than 0 to force wrapping at that column rather than
		// the window width. See "wrap_width_style" for extra options.
		"wrap_width": 80,
		// Columns in which to display vertical rulers. You can also pair the column
		// with a ruler style (See "ruler_style"), eg: [[80, "solid"]]
		"rulers": [[80, "solid"]],
		}


