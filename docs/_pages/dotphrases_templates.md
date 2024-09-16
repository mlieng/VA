---
  title: Dotphrases & Templates
  author: Monica Lieng
  date: 2024-09-13
  category: pages
  layout: post
---

In `autohotkey` terminology, these are also called `hotkeys`

They are located in the folder `templates`

Feel free to add your own at the bottom of the list
These are like a combination of the dictionary autoreplace and the dotphrases/smartphrases in `Epic`

## Explanation

### Short Replacements

`::phrase::thenewphrase`

- The `::` signals that it is a autohotkey
- typing the word `phrase` + any key (such as space) will trigger the replacement of `phrase` to become `thenewphrase`

`:*:.alpha::α`

`:*:.jriv::Rivera,Jorge`

- placing a `*` in between the first set of `::` makes it so that you won't have te press that extra key to trigger the replacement.
- For example, try `.degC` or `.alpha` or `.jriv`

> ##### TIP
>
> Unlike `Epic` you are not forced to start a phrase with a `.` at the beginning of the phrase. You can also make it caps-sensitive, insensitive. 
{: .block-tip }

`:C:tid::3 times daily`

- placing a `C` in between the first set of `::` makes it so the smart phrase is case sensitive
- so for this example typing `tid` will be replaced by `3 times daily`
-but typing `TID`, nothing will happen 

```
::.brim::
:*:brimo::
brimonidine
```
- you can have multiple phrases point to the same replacement phrase
- ex. typing `.brim` or `brimo` will both result in brimonidine


### Longer Replacements

Needs to have the following format:

Starts with `{ SendText"(` and ends with `)"}`

```
::.eomi::{
SendText "
	(

	Prism cover testing sc: 
        Primary gaze: ortho
        RIGHT gaze: ortho
        LEFT gaze: ortho
        RIGHT head tilt: ortho
        LEFT head tilt: ortho

	)"
}
```
