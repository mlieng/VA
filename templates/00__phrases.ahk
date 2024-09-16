/*
;autodictionary

simple replacement
	https://unicode-table.com/en/; ➝, 🠕 , 🠗,⭠, α,β,γ,
	https://www.arrowsymbol.com/triangle-arrows-symbols
	putting the star does an instant replace
	https://graphemica.com/unicode/characters/page/35
*/


::optom::optometry
::ophtho::ophthalmology
::neur::neurology
::fluoro::fluorescein
::rapd::RAPD
::oct::OCT
::ou::OU
::od::OD
::os::OS
;::left::LEFT
;::right::RIGHT
::crao::CRAO
::brao::BRAO
::crvo::CRVO
::brvo::BRVO
::wamd::wAMD
::damd::dAMD
::npdr::NPDR
::pdr::PDR

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
::.box::☐

;the star makes it so you do not need to press "space"
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

::amd::AMD
::cme::CME
::cidme::CI-DME 
::.cc::CHIEF COMPLAINT: 
::.hpi::HISTORY OF PRESENT ILLNESS: 
::.ohx::OCULAR HISTORY:
;::iva::IVA
;::ive::IVE
;::ivl::IVL
:C:iso::in the setting of
:C:onh::ONH (optic nerve head)
::.noh:: No past macular degeneration, surgery, trauma, blindess, RD, glaucoma
::.nfh:: No blindness, AMD, glaucooma
:C:pt::patient
::phni::PHNI
:C:pvd::PVD
::.at::artificial tears
:C:pfat::preservative free artificial tears
::latan::latanoprost
::.latan::latanoprost ("Green cap")
::.cosopt:: dorzolamide-timolol (Cosopt)
::.mrd::MRD1: mm, MRD2: mm
::rtc::RTC
::shp::See H&P
::.rba::R/B/A outlined, informed consent obtained, IV given today.
::.re::right eye
::.le::left eye


; the C makes it caps lock sensitive

:C:tid::3 times daily
:C:bid::2 times daily
:C:qid::4 times daily 
::oclock::o'clock
;'



:C:cnv::CNV (choroidal neovascular membranes)
::.rb::R/B/A outlined, informed consent obtained

:C:ttp::tenderness to palpation
:C:tapulse::good TA pulse, no cords nor tenderness


::.cat::Crystal Zhang MD, David Rivera MD, Ezra Galler MD, Jorge Rivera MD, Noelle Pruzan MD
:*:.jriv::Rivera,Jorge
:*:.driv::Rivera,David
::.gal::Galler,Ezra
::.lop::Loporchio,Salvatore
::.riz::Rizzuto,Philip
::.bry::Bryan,Richard
::.jan::Janigian,Robert
::.mur::Murphy,Marjorie
::.zha::Zhang,Crystal
::.pru::Pruzan,Noelle
:*:.gre::Greenberg,Paul
::.pau::Paul,Alfred
::.sav::Savoie,Brian
::.nan::Nandakumar,Namrata 

::.mar::Marchand,Nicole
::.ort::Ortiz,Pete

::.esq::Esq-Sp-Ophth

; VA phrases
; --------------------------------------------------------------------

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

::odos::{
SendText "
	(
	  OD:
	  OS:
	)"
}

::odos1::{
SendText "
	(
	`tOD:
	`tOS:
	)"
}

::.odos::
::odos2::{
SendText "
	(
	`t`tOD:
	`t`tOS:
	)"
}
