Func_f23d0:
	call SaveScreenTilesToBuffer2
	xor a
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	callfar PrintSurfingMinigameHighScore
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ReloadTilesetTilePatterns
	call RestoreScreenTilesAndReloadTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
	ld hl, Text_f2412
	ldh a, [hOaksAideResult]
	and a
	jr nz, .asm_f2406
	ld hl, Text_f240c
.asm_f2406
	call PrintText
	jp TextScriptEnd

Text_f240c:
	text "プリント　しゅうりょう　しました@"
	text_waitbutton
	text_end

Text_f2412:
	text "うまく　プリント　できません@"
	text_waitbutton
	text_end
