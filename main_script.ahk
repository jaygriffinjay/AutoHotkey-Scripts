#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Coding Shortcuts

:*:rrunserver::python manage.py runserver

; Common Symbols
; slightly different syntax allows for hotstringing directly inside a word

:*?:emdash::—
:*?:endash::–
:*:ztrademark::™

; Personal Info

;email
:*:zem::

;cell
:*:ccell::

;Address Line 1
:*:aad1::

;Address Line 2
:*:aad2:: 

;Zip Code
:*:zzip::

:*:ddate::
	SendInput %A_YYYY%-%A_MM%-%A_DD%
	Return

:*:nnow::
	FormatTime, Time,, yyyy-MM-dd h:mm tt
	Send %Time%
	Return

:*:ttime::
	FormatTime, Time,, h:mm tt
	Send %Time%
	Return


; Days of the Week
:*:monday::Monday
:*:tuesday::Tuesday
:*:wednesday::Wednesday
:*:thursday::Thursday
:*:friday::Friday
:*:saturday::Saturday
:*:sunday::Sunday 

; Months
:*:january::January
:*:february::February
; ::march::March ; Commented out because it matches the common word "march"
:*:april::April
; ::may::May  ; Commented out because it matches the common word "may"
:*:june::June
:*:july::July
:*:august::August
:*:september::September
:*:october::October
:*:november::November
:*:december::December

; Autocorrect
:*:aint::ain't 
:*:arent::aren't 
:*:cant::can't 
:*:couldve::could've 
:*:didnt::didn't 
:*:doesnt::doesn't 
:*:dont::don't 
:*:hadnt::hadn't 
:*:havent::haven't
::hed::he'd 
::hes::he's 
:*:isnt::isn't 
:*:itd::it'd 
:*:itll::it'll 
:*:mightve::might've 
:*:mustve::must've 
:*:shes::she's 
:*:shouldve::should've 
:*:thatll::that'll 
:*:thats::that's 
:*:theyll::they'll 
:*:theyre::they're 
:*:theyve::they've 
:*:wasnt::wasn't 
:*:werent::weren't 
:*:whats::what's 
:*:wheres::where's 
:*:whod::who'd 
:*:wholl::who'll 
:*:wont::won't 
:*:wouldve::would've 
:*:wouldnt::wouldn't 
:*:yall::y'all 
:*:youd::you'd 
:*:youll::you'll 
:*:youre::you're 
:*:youve::you've
:*:hasnt::hasn't


; Reload Or Edit This Script
^+Q::Edit

; Uncomment to edit this script in VSCode:
	; ^+Q::
	; Run, C:\Program Files\Microsoft VS Code\Code.exe "C:\Path\to\your\script.ahk"

^+W::Reload

; Title Case Converter
^F14::
; Clears clipboard
	Clipboard := ""
; Copies selected text
	SendInput, ^c  
	ClipWait
; Title mode conversion & paste
	StringUpper Clipboard, Clipboard, T  
	SendInput %Clipboard%
	Return

; Random Time Generator from 8:00 am – 9:59 am
; TODO: feed the time output into FormatTime in order to allow for custom formats of random time if needed.
^F15::
	Random, Minute, 0, 59
	Random, Hour, 8, 9
	Minute := Format("{:02}", Minute)
	Send %Hour%:%Minute% am
	Return

; Opens the AutoHotkey Docs in default browser:
^F16::
	run https://www.autohotkey.com/docs/v1/

; Change Case of Selected Text
; The built-in variables A_ThisMenuItem and A_ThisMenuItemPos contain the name and position of the custom menu item most recently selected by the user (blank if none). Similarly, A_ThisMenu is the name of the menu from which A_ThisMenuItem was selected. These variables are useful when building a menu whose contents are not always the same. In such a case, it is usually best to point all such menu items to the same label and have that label refer to the above variables to determine what action to take.
; TODO: Add functionality for frequently used LaTex, HTML, Markdown formatting into format menu!
; Source RoseCode, Masosjar13 https://www.autohotkey.com/board/topic/121257-tiny-elegant-menu-case-toggle-upper-lower-titlecase/
^F17::
	Clipboard =
	Send ^c
	ClipWait 1
	text := Clipboard
	If text =
		Return
	Menu, TestMenu, Add, Upper, Cases
	Menu, TestMenu, Add, Title, Cases
	Menu, TestMenu, Add, Lower, Cases
	Menu, TestMenu, Show 
	Return

	Cases:
	If (A_ThisMenuItem = "Title")
		{
			StringLower text, text, T
		}
	Else If (A_ThisMenuItem = "Upper")
		{
			StringUpper text, text
		}
	Else  
		{
			StringLower text, text
		}
	
	Clipboard := text
	ClipWait 1
	Send ^v
	Return
