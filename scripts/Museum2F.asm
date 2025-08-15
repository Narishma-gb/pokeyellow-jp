Museum2F_Script:
	call EnableAutoTextBoxDrawing
	ret

Museum2F_TextPointers:
	def_text_pointers
	dw_const Museum2FYoungsterText,        TEXT_MUSEUM2F_YOUNGSTER
	dw_const Museum2FGrampsText,           TEXT_MUSEUM2F_GRAMPS
	dw_const Museum2FScientistText,        TEXT_MUSEUM2F_SCIENTIST
	dw_const Museum2FBrunetteGirlText,     TEXT_MUSEUM2F_BRUNETTE_GIRL
	dw_const Museum2FHikerText,            TEXT_MUSEUM2F_HIKER
	dw_const Museum2FSpaceShuttleSignText, TEXT_MUSEUM2F_SPACE_SHUTTLE_SIGN
	dw_const Museum2FMoonStoneSignText,    TEXT_MUSEUM2F_MOON_STONE_SIGN

Museum2FYoungsterText:
	text "つきの　いしね<⋯>"

	para "そこらへんの　いしころと"
	line "どこが　ちがうんだろう？"
	done

Museum2FGrampsText:
	text "１９６９ねん　７がつ　２０か！"

	para "じんるい"
	line "はじめて　つきに　たつ！"

	para "わしは　あの　ニュースが　みたくて"
	line "カラーテレビを　かったんじゃ！"
	done

Museum2FScientistText:
	text "こんげつは"
	line "うちゅう　はくらんかいを　やってます"
	done

Museum2FBrunetteGirlText:
	text "わたしね　わたしね"
	line "かわいいから　ピカチュウ　ほしい！"

	para "おとうさんに　とってきてね　って"
	line "おねがい　してるの"
	done

Museum2FHikerText:
	text_asm
	ld a, [wd471]
	bit 7, a
	jr nz, .asm_5c1f6
	ld hl, Museum2FText_5c20e
	call PrintText
	jr .asm_5c20b

.asm_5c1f6
	ld a, [wPikachuHappiness]
	cp 101
	jr c, .asm_5c205
	ld hl, Museum2FText_5c218
	call PrintText
	jr .asm_5c20b

.asm_5c205
	ld hl, Museum2FText_5c213
	call PrintText
.asm_5c20b
	jp TextScriptEnd

Museum2FText_5c20e:
	text "はい　はい！"
	line "ピカチュウだな！　こんどな！"
	done

Museum2FText_5c213:
	text "きみの　ピカチュウ"
	line "なついてないようだが　よかったら"
	cont "むすめに　ゆずって　くれないか？"
	done

Museum2FText_5c218:
	text "きみの　ピカチュウが　ほしいんだが"
	line "そんなに　なついてちゃ"
	cont "もらうわけには　いかないなぁ<⋯>"
	done

Museum2FSpaceShuttleSignText:
	text "スペース　シャトル　コロンビアごう"
	done

Museum2FMoonStoneSignText:
	text "オツキミやまに　らっかした　ぶったい"
	line "たぶん<⋯>　つきの　いし"
	done
