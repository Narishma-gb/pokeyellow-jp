CeladonMansion3F_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonMansion3_PokedexCount:
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ret

CeladonMansion3F_TextPointers:
	def_text_pointers
	dw_const CeladonMansion3FProgrammerText,     TEXT_CELADONMANSION3F_PROGRAMMER
	dw_const CeladonMansion3FGraphicArtistText,  TEXT_CELADONMANSION3F_GRAPHIC_ARTIST
	dw_const CeladonMansion3FWriterText,         TEXT_CELADONMANSION3F_WRITER
	dw_const CeladonMansion3FGameDesignerText,   TEXT_CELADONMANSION3F_GAME_DESIGNER
	dw_const CeladonMansion3FGameProgramPCText,  TEXT_CELADONMANSION3F_GAME_PROGRAM_PC
	dw_const CeladonMansion3FPlayingGamePCText,  TEXT_CELADONMANSION3F_PLAYING_GAME_PC
	dw_const CeladonMansion3FGameScriptPCText,   TEXT_CELADONMANSION3F_GAME_SCRIPT_PC
	dw_const CeladonMansion3FDevRoomSignText,    TEXT_CELADONMANSION3F_DEV_ROOM_SIGN

CeladonMansion3FProgrammerText:
	text_asm
	call CeladonMansion3_PokedexCount
	cp NUM_POKEMON - 1 ; discount Mew
	ld hl, CeladonMansion3Text_486f5
	jr nc, .print
	ld hl, CeladonMansion3Text_486f0
.print
	call PrintText
	jp TextScriptEnd

CeladonMansion3Text_486f0:
	text "おれ？　プログラマー　だよ！"
	done

CeladonMansion3Text_486f5:
	text "おれ？　プログラマー　だよ！"

	para "おどろいたなー！"
	line "ずかんを　かんせいさせる　ひとが"
	cont "いるとは　おもわなかったよ！"
	done

CeladonMansion3FGraphicArtistText:
	text_asm
	call CeladonMansion3_PokedexCount
	cp NUM_POKEMON - 1 ; discount Mew
	jr nc, .completed
	ld hl, .Text1
	jr .print

.completed
	ld hl, .Text2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .declined_print
	call SaveScreenTilesToBuffer2
	xor a
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	callfar PrintDiploma
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ReloadTilesetTilePatterns
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
	ld hl, .Text5
	ldh a, [hCanceledPrinting]
	and a
	jr nz, .print
	ld hl, .Text4
	jr .print

.declined_print
	ld hl, .Text3
.print
	call PrintText
	jp TextScriptEnd

.Text1:
	text "おれ　グラフィッカー！"
	line "おまえを　かいたの　おれさ！"
	done

.Text2:
	text "おれ　グラフィッカー！"

	para "おっ　ずかん　かんせい　したんだ！"
	line "きねんに　ひょうしょうじょう　を"
	cont "プリント　して　あげようか？"
	done

.Text3:
	text "プリント　したく　なったら"
	line "こえを　かけてね"
	done

.Text4:
	text "おわったよ"
	done

.Text5:
	text "プリントは　ちゅうし　するよ"
	done

CeladonMansion3FWriterText:
	text_asm
	call CeladonMansion3_PokedexCount
	cp NUM_POKEMON - 1 ; discount Mew
	ld hl, .Text2
	jr nc, .print
	ld hl, .Text1
.print
	call PrintText
	jp TextScriptEnd

.Text1:
	text "ぼく　シナリオ　かいた！"
	line "あの<⋯>　エリカ　かわいい　でしょ"

	para "カスミも　いいよね！"

	para "ナツメも　いいよね！"
	done

.Text2:
	text "ぼく　シナリオ　かいた！"

	para "ぜんぶの　#みつけてくれて"
	line "とても　うれしいよ！"
	done

CeladonMansion3FGameDesignerText:
	text_asm
	call CeladonMansion3_PokedexCount
	cp NUM_POKEMON - 1 ; discount Mew
	jr nc, .completed_dex
	ld hl, .Text
	jr .done
.completed_dex
	ld hl, .CompletedDexText
	call PrintText
	call Delay3
	xor a
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, .UnlockedDiplomaPrinting
.done
	call PrintText
	jp TextScriptEnd

.Text:
	text "そーですかー！"

	para "ぼくは　ゲーム　デザイナー"

	para "#ずかん　ぜんぶ　あつめるの"
	line "たいへん　だけど　がんばって！"
	cont "もし　ぜんぶ　あつめたら"

	para "おしえてね！"
	done

.CompletedDexText:
	text "わあ　すごい！"
	line "#ずかん　ぜんぶの　ページ"
	cont "とうとう　あつめたんだね！"
	cont "おめでとう！"
	cont "<⋯><⋯>@"
	text_promptbutton
	text_asm
	callfar DisplayDiploma
	ld a, TRUE
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	jp TextScriptEnd

.UnlockedDiplomaPrinting
	text "かいはつの　みんなにも"
	line "ひょうしょうじょう　を"
	cont "みせて　あげてよ！"
	done

CeladonMansion3FGameProgramPCText:
	text_asm
	farcall CeladonMansion3FPrintGameProgramPCText
	jp TextScriptEnd

CeladonMansion3FPlayingGamePCText:
	text_asm
	farcall CeladonMansion3FPrintPlayingGamePCText
	jp TextScriptEnd

CeladonMansion3FGameScriptPCText:
	text_asm
	farcall CeladonMansion3FPrintGameScriptPCText
	jp TextScriptEnd

CeladonMansion3FDevRoomSignText:
	text_asm
	farcall CeladonMansion3FPrintDevRoomSignText
	jp TextScriptEnd
