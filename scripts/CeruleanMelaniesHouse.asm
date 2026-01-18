CeruleanMelaniesHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

CeruleanMelaniesHouse_TextPointers:
	def_text_pointers
	dw_const CeruleanMelanieHouseMelanieText, TEXT_CERULEANMELANIESHOUSE_MELANIE
	dw_const CeruleanMelanieHouseBulbasaurText, TEXT_CERULEANMELANIESHOUSE_BULBASAUR
	dw_const CeruleanMelanieHouseOddishText, TEXT_CERULEANMELANIESHOUSE_ODDISH
	dw_const CeruleanMelanieHouseSandshrewText, TEXT_CERULEANMELANIESHOUSE_SANDSHREW

CeruleanMelanieHouseMelanieText:
	text_asm
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	CheckEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
	jr nz, .asm_1cfbf
	ld hl, CeruleanHouse1Text_1cfc8
	call PrintText
	ld a, [wPikachuHappiness]
	cp 147
	jr c, .asm_1cfb3
	ld hl, CeruleanHouse1Text_1cfce
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_1cfb6
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld a, BULBASAUR
	ld [wNamedObjectIndex], a
	ld [wCurPartySpecies], a
	call GetMonName
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	lb bc, BULBASAUR, 10
	call GivePokemon
	jr nc, .asm_1cfb3
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, CeruleanHouse1Text_1cfd3
	call PrintText
	ld a, TOGGLE_CERULEAN_BULBASAUR
	ld [wToggleableObjectIndex], a
	predef HideObject
	SetEvent EVENT_GOT_BULBASAUR_IN_CERULEAN
.asm_1cfb3
	jp TextScriptEnd

.asm_1cfb6
	ld hl, CeruleanHouse1Text_1cfdf
	call PrintText
	jp TextScriptEnd

.asm_1cfbf
	ld hl, CeruleanHouse1Text_1cfd9
	call PrintText
	jp TextScriptEnd

CeruleanHouse1Text_1cfc8:
	text "わたしは　ここで　きずついた"
	line "#たちの　せわを　しています"

	para "この　フシギダネも"
	line "すっかり　げんきに　なったし"
	cont "だいじに　してくれる"
	cont "トレーナーを　さがしているの@"
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfce:
	text "そうだ！"
	line "あなた　この　フシギダネの"
	cont "めんどうを　みてくださらない？"
	done

CeruleanHouse1Text_1cfd3:
	text "それじゃ　おねがいします！@"
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfd9:
	text "フシギダネ　がんばってます？@"
	text_waitbutton
	text_end

CeruleanHouse1Text_1cfdf:
	text "そう<⋯>"
	line "ざんねん　です<⋯>@"
	text_waitbutton
	text_end

CeruleanMelanieHouseBulbasaurText:
	text "フシギダネ『ダネ@"
	text_asm
	ld a, BULBASAUR
	call PlayCry
	jp TextScriptEnd

CeruleanMelanieHouseOddishText:
	text "ナゾノクサ『ナゾー@"
	text_asm
	ld a, ODDISH
	call PlayCry
	jp TextScriptEnd

CeruleanMelanieHouseSandshrewText:
	text "サンド『ピキー@"
	text_asm
	ld a, SANDSHREW
	call PlayCry
	jp TextScriptEnd
