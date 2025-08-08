CeladonMansion1F_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonMansion1F_TextPointers:
	def_text_pointers
	dw_const CeladonMansion1FMeowthText,            TEXT_CELADONMANSION1F_MEOWTH
	dw_const CeladonMansion1FGrannyText,            TEXT_CELADONMANSION1F_GRANNY
	dw_const CeladonMansion1FClefairyText,          TEXT_CELADONMANSION1F_CLEFAIRY
	dw_const CeladonMansion1FNidoranFText,          TEXT_CELADONMANSION1F_NIDORANF
	dw_const CeladonMansion1FManagersSuiteSignText, TEXT_CELADONMANSION1F_MANAGERS_SUITE_SIGN

CeladonMansion1FMeowthText:
	text "ニャース『にゃーご！@"
	text_asm
	ld a, MEOWTH
	call PlayCry
	jp TextScriptEnd

CeladonMansion1FGrannyText:
	text_asm
	farcall CeladonMansion1FPrintGrannyText
	ld a, [wPikachuHappiness]
	cp 251
	jr c, .asm_485d9
	ld c, 50
	call DelayFrames
	ldpikacry e, PikachuCry23
	callfar PlayPikachuSoundClip
.asm_485d9
	jp TextScriptEnd

CeladonMansion1FClefairyText:
	text "ピッピ『ぴ　ぴっぴ！@"
	text_asm
	ld a, CLEFAIRY
	call PlayCry
	jp TextScriptEnd

CeladonMansion1FNidoranFText:
	text "ニドラン『きゃ　きゃう！@"
	text_asm
	ld a, NIDORAN_F
	call PlayCry
	jp TextScriptEnd

CeladonMansion1FManagersSuiteSignText:
	text "タマムシ　マンション"
	line "<⋯>　かんりにん　しつ"
	done
