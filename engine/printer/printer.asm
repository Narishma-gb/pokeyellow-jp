PrintPokedexEntry:
	xor a
	ldh [hCanceledPrinting], a
	call Printer_PlayPrinterMusic
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, $9
	ldh [rIE], a
	xor a
	ldh [hAutoBGTransferEnabled], a
	callfar DrawDexEntryOnScreen
	call GetMonHeader
	hlcoord 1, 1
	call LoadFlippedFrontSpriteByMonIndex
	call Printer_StartTransmission
	ld a, 19
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call ClearScreen
	callfar Pokedex_DrawInterface
	callfar Pokedex_PlacePokemonList
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Printer_ResetJoypadHRAM
.print_loop
	call JoypadLowSensitivity
	call Printer_StopIfPressB
	jr c, .quit
	ld a, [wPrinterSendState]
	bit 7, a
	jr nz, .quit
	call PrinterTransmissionJumptable
	call GBPrinter_CheckForErrors
	call GBPrinter_UpdateStatusMessage
	call DelayFrame
	jr .print_loop

.quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call ReloadMapAfterPrinter
	call Printer_PlayMapMusic
	ret

PrintSurfingMinigameHighScore::
	xor a
	ldh [hCanceledPrinting], a
	call Printer_PlayPrinterMusic
	call Printer_PrepareSurfingMinigameHighScoreTileMap
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, $9
	ldh [rIE], a
	call Printer_StartTransmission
	ld a, $13
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call Printer_ResetJoypadHRAM
.loop
	call JoypadLowSensitivity
	call Printer_StopIfPressB
	jr c, .quit
	ld a, [wPrinterSendState]
	bit 7, a
	jr nz, .quit
	call PrinterTransmissionJumptable
	call GBPrinter_CheckForErrors
	call GBPrinter_UpdateStatusMessage
	call DelayFrame
	jr .loop

.quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	call Printer_CopyTileMapFromPrinterTileBuffer
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call ReloadMapAfterPrinter
	call Printer_PlayMapMusic
	ret

PrintDiploma::
	xor a
	ldh [hCanceledPrinting], a
	call Printer_PlayPrinterMusic
	call DisplayDiplomaTop
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, $9
	ldh [rIE], a
	call Printer_StartTransmission
	ld a, $10
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call PrintDiplomaPage
	jr c, .quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ld c, $c
	call DelayFrames
	call SaveScreenTilesToBuffer1
	xor a
	ldh [hAutoBGTransferEnabled], a
	call DisplayDiplomaBottom
	call Printer_StartTransmission
	ld a, $3
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call LoadScreenTilesFromBuffer1
	call PrintDiplomaPage
.quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	call Printer_CopyTileMapFromPrinterTileBuffer
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call ReloadMapAfterPrinter
	call Printer_PlayMapMusic
	ret

PrintDiplomaPage:
	call Printer_ResetJoypadHRAM
.print_loop
	call JoypadLowSensitivity
	call Printer_StopIfPressB
	jr c, .pressed_b
	ld a, [wPrinterSendState]
	bit 7, a
	jr nz, .completed
	call PrinterTransmissionJumptable
	call GBPrinter_CheckForErrors
	call GBPrinter_UpdateStatusMessage2
	call DelayFrame
	jr .print_loop

.completed
	and a
	ret

.pressed_b
	scf
	ret

PrintPCBox::
	ld a, [wBoxCount]
	and a
	jp z, .emptyBox
	xor a
	ldh [hCanceledPrinting], a
	call Printer_PlayPrinterMusic
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, $9
	ldh [rIE], a
	call SaveScreenTilesToBuffer1
	xor a
	ldh [hAutoBGTransferEnabled], a
	call PrintPCBox_DrawPage1
	call Printer_StartTransmission
	ld a, $10
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call LoadScreenTilesFromBuffer1
	call PrintPCBoxPage
	jr c, .quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ld c, 12
	call DelayFrames
	xor a
	ldh [hAutoBGTransferEnabled], a
	call PrintPCBox_DrawPage2
	call Printer_StartTransmission
	ld a, $0
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call LoadScreenTilesFromBuffer1
	call PrintPCBoxPage
	jr c, .quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ld c, 12
	call DelayFrames
	xor a
	ldh [hAutoBGTransferEnabled], a
	call PrintPCBox_DrawPage3
	call Printer_StartTransmission
	ld a, $0
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call LoadScreenTilesFromBuffer1
	call PrintPCBoxPage
	jr c, .quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ld c, 12
	call DelayFrames
	xor a
	ldh [hAutoBGTransferEnabled], a
	call PrintPCBox_DrawPage4
	call Printer_StartTransmission
	ld a, $3
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call LoadScreenTilesFromBuffer1
	call PrintPCBoxPage
.quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call ReloadMapAfterPrinter
	call Printer_PlayMapMusic
	ret

.emptyBox
	ld hl, NoPokemonText
	call PrintText
	ret

PrintPCBoxPage:
	call Printer_ResetJoypadHRAM
.print_loop
	call JoypadLowSensitivity
	call Printer_StopIfPressB
	jr c, .pressed_b
	ld a, [wPrinterSendState]
	bit 7, a
	jr nz, .completed
	call PrinterTransmissionJumptable
	call GBPrinter_CheckForErrors
	call GBPrinter_UpdateStatusMessage
	call DelayFrame
	jr .print_loop

.completed
	and a
	ret

.pressed_b
	scf
	ret

NoPokemonText:
	text "#が　はいっていません！"
	prompt

PrintFanClubPortrait::
	xor a
	ldh [hCanceledPrinting], a
	call Printer_PlayPrinterMusic
	call Printer_GetMonStats
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, $9
	ldh [rIE], a
	call Printer_StartTransmission
	ld a, $13
	ld [wcae2], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call Printer_ResetJoypadHRAM
.print_loop
	call JoypadLowSensitivity
	call Printer_StopIfPressB
	jr c, .quit
	ld a, [wPrinterSendState]
	bit 7, a
	jr nz, .quit
	call PrinterTransmissionJumptable
	call GBPrinter_CheckForErrors
	call GBPrinter_UpdateStatusMessage
	call DelayFrame
	jr .print_loop

.quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	call Printer_CopyTileMapFromPrinterTileBuffer
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	call ReloadMapAfterPrinter
	call Printer_PlayMapMusic
	ret

PrinterDebug:
	push af
	push bc
	push de
	push hl
	call StopAllMusic
	ldh a, [rIE]
	push af
	xor a
	ldh [rIF], a
	ld a, $9
	ldh [rIE], a
	call Printer_StartTransmission
	ld a, $13
	ld [wcae2], a
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Printer_CopyTileMapToPrinterTileBuffer
	call PrinterDebug_LoadGFX
.loop
	ld a, [wPrinterSendState]
	bit 7, a
	jr nz, .quit
	call PrinterDebug_DoFunction
	call PrinterDebug_ConvertStatusFlagsToTiles
	call DelayFrame
	jr .loop

.quit
	xor a
	ld [wPrinterConnectionOpen], a
	ld [wPrinterOpcode], a
	ld hl, wShadowOAMSprite32
	ld bc, 8 * 4
	xor a
	call FillMemory
	xor a
	ldh [rIF], a
	pop af
	ldh [rIE], a
	pop hl
	pop de
	pop bc
	pop af
	ret

Printer_StopIfPressB:
	ldh a, [hJoyHeld]
	and PAD_B
	jr nz, .quit
	and a
	ret

.quit
	ld a, [wPrinterSendState]
	cp $c
	jr nz, .already_done
.wait_current_task
	ld a, [wPrinterOpcode]
	and a
	jr nz, .wait_current_task
	ld a, $16
	ld [wPrinterOpcode], a
	ld a, $88
	ldh [rSB], a
	ld a, $1
	ldh [rSC], a
	ld a, $81
	ldh [rSC], a
.wait_send_cancel
	ld a, [wPrinterOpcode]
	and a
	jr nz, .wait_send_cancel
.already_done
	ld a, $1
	ldh [hCanceledPrinting], a
	scf
	ret

Printer_CopyTileMapToPrinterTileBuffer:
	hlcoord 0, 0
	decoord 0, 0, wPrinterTileBuffer
	ld bc, SCREEN_AREA
	call CopyData
	ret

Printer_CopyTileMapFromPrinterTileBuffer:
	hlcoord 0, 0, wPrinterTileBuffer
	decoord 0, 0
	ld bc, SCREEN_AREA
	call CopyData
	ret

Printer_ResetJoypadHRAM:
	xor a
	ldh [hJoyLast], a
	ldh [hJoyReleased], a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ldh [hJoy5], a
	ldh [hJoy6], a
	ret

Printer_PlayPrinterMusic:
	call Printer_FadeOutMusicAndWait
	ld a, [wAudioROMBank]
	ld [wAudioSavedROMBank], a
	ld a, BANK(Music_GBPrinter)
	ld [wAudioROMBank], a
	ld a, MUSIC_GB_PRINTER
	ld [wNewSoundID], a
	call PlaySound
	ret

Printer_PlayMapMusic:
	call Printer_FadeOutMusicAndWait
	call PlayDefaultMusic
	ret

Printer_FadeOutMusicAndWait:
	ld a, $4
	ld [wAudioFadeOutControl], a
	call StopAllMusic
.wait_music_stop
	ld a, [wAudioFadeOutControl]
	and a
	jr nz, .wait_music_stop
	ret

GBPrinter_CheckForErrors:
	ld a, [wPrinterHandshake]
	cp $ff
	jr nz, .check_other_errors
	ld a, [wPrinterStatusFlags]
	cp $ff
	jr z, .error2

.check_other_errors
	ld a, [wPrinterStatusFlags]
	and %11100000
	ret z
	bit 7, a
	jr nz, .error1
	bit 6, a
	jr nz, .error4
	; error 3
	ld a, PRINTER_ERROR_3
	jr .load_status

.error4
	ld a, PRINTER_ERROR_4
	jr .load_status

.error1
	ld a, PRINTER_ERROR_1
	jr .load_status

.error2
	ld a, PRINTER_ERROR_2
.load_status
	ld [wPrinterStatusIndicator], a
	ret

GBPrinter_UpdateStatusMessage:
	ld a, [wPrinterStatusIndicator]
	and a
	ret z
	push af
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 2, 5
	lb bc, 10, 14
	call TextBoxBorder
	pop af
	ld e, a
	ld d, $0
	ld hl, PrinterStatusMessages
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 4, 7
	call PlaceString
	hlcoord 4, 15
	ld de, PressBToCancelString
	call PlaceString
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	xor a
	ld [wPrinterStatusIndicator], a
	ret

GBPrinter_UpdateStatusMessage2:
	ld a, [wPrinterStatusIndicator]
	and a
	ret z
	push af
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 2, 4
	lb bc, 13, 16
	call ClearScreenArea
	pop af
	ld e, a
	ld d, $0
	ld hl, PrinterStatusMessages
	add hl, de
	add hl, de
	ld e, [hl]
	inc hl
	ld d, [hl]
	hlcoord 4, 7
	call PlaceString
	hlcoord 4, 15
	ld de, PressBToCancelString
	call PlaceString
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	xor a
	ld [wPrinterStatusIndicator], a
	ret

PressBToCancelString:
	db "ビーボタンで　ちゅうし@"

PrinterStatusMessages:
	dw .Blank
	dw .CheckingLink
	dw .Transmitting
	dw .Printing
	dw .Error1
	dw .Error2
	dw .Error3
	dw .Error4
	dw .WrongDevice

.Blank:
	db   "@"
.CheckingLink:
	db   ""
	next "せつぞくかくにん　ちゅう@"
.Transmitting:
	db   ""
	next "データてんそう　ちゅう@"
.Printing:
	db   ""
	next "プリントアウト　ちゅう@"
.Error1:
	db   "プリントエラー　エラー１"
	next ""
	next "ポケットプリンタ　の"
	next "せつめいしょを　よんでね@"
.Error2:
	db   "プリントエラー　エラー２"
	next ""
	next "ポケットプリンタ　の"
	next "せつめいしょを　よんでね@"
.Error3:
	db   "プリントエラー　エラー３"
	next ""
	next "ポケットプリンタ　の"
	next "せつめいしょを　よんでね@"
.Error4:
	db   "プリントエラー　エラー４"
	next ""
	next "ポケットプリンタ　の"
	next "せつめいしょを　よんでね@"
.WrongDevice:
	db   "これは"
	next "ポケットプリンタでは"
	next "ありません！@"

Printer_PrepareSurfingMinigameHighScoreTileMap::
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld de, SurfingPikachu2Graphics
	ld hl, vChars2
	lb bc, BANK(SurfingPikachu2Graphics), (SurfingPikachu2GraphicsEnd - SurfingPikachu2Graphics) / $10
	call CopyVideoData
	hlcoord 0, 0
	call .PlaceRowAlternatingTiles
	hlcoord 0, 17
	call .PlaceRowAlternatingTiles
	hlcoord 0, 0
	call .PlaceColumnAlternatingTiles
	hlcoord 19, 0
	call .PlaceColumnAlternatingTiles
	ld a, $4
	hlcoord 0, 0
	ld [hl], a
	hlcoord 0, 17
	ld [hl], a
	hlcoord 19, 0
	ld [hl], a
	hlcoord 19, 17
	ld [hl], a
	ld de, .Tilemap1
	hlcoord 10, 8
	lb bc, 3, 8
	call Diploma_Surfing_CopyBox
	ld de, .Tilemap2
	hlcoord 2, 11
	lb bc, 6, 16
	call Diploma_Surfing_CopyBox
	ld de, .PikachusBeachString
	hlcoord 4, 2
	call PlaceString
	ld de, .HiScoreString
	hlcoord 9, 4
	call PlaceString
	ld de, .PointsString
	hlcoord 12, 6
	call PlaceString
	ld de, wPlayerName
	hlcoord 3, 4
	call PlaceString
	call CopySurfingMinigameScore
	ld b, SET_PAL_GENERIC
	call RunPaletteCommand
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	call Delay3
	call GBPalNormal
	ret

.PlaceRowAlternatingTiles:
	ld c, SCREEN_WIDTH / 2
.row_loop
	ld [hl], $0
	inc hl
	ld [hl], $1
	inc hl
	dec c
	jr nz, .row_loop
	ret

.PlaceColumnAlternatingTiles:
	ld c, SCREEN_HEIGHT / 2
	ld de, SCREEN_WIDTH
.col_loop
	ld [hl], $2
	add hl, de
	ld [hl], $3
	add hl, de
	dec c
	jr nz, .col_loop
	ret

.Tilemap1:
INCBIN "gfx/surfing_pikachu/high_score_1.tilemap"

.Tilemap2:
INCBIN "gfx/surfing_pikachu/high_score_2.tilemap"

.PikachusBeachString:
	db "ピカチュウのサマービーチ@"
.HiScoreString:
	db "のベストスコア@"
.PointsString:
	db "ポイント@"

Diploma_Surfing_CopyBox:
.y
	push bc
	push hl
.x
	ld a, [de]
	inc de
	ld [hli], a
	dec c
	jr nz, .x
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	pop bc
	dec b
	jr nz, .y
	ret

CopySurfingMinigameScore:
	ld de, wSurfingMinigameHiScore + 1
	hlcoord 7, 6
	ld a, [de]
	call .BCDConvertScore
	ld a, [de]
.BCDConvertScore:
	ld c, a
	swap a
	and $f
	add -10
	ld [hli], a
	ld a, c
	and $f
	add -10
	ld [hli], a
	dec de
	ret

SurfingPikachu2Graphics: INCBIN "gfx/surfing_pikachu/surfing_pikachu_2.2bpp"
SurfingPikachu2GraphicsEnd:

PrintPCBox_DrawPage1:
	xor a
	ld [wBoxNumString], a
	call ClearScreen
	call PrintPCBox_PlaceHorizontalLines
	hlcoord 0, 0
	ld bc, 11 * SCREEN_WIDTH
	ld a, "　"
	call FillMemory
	call PrintPCBox_DrawLeftAndRightBorders
	call PrintPCBox_DrawTopBorder
	hlcoord 5, 4
	ld de, .PokemonListString
	call PlaceString
	hlcoord 8, 6
	ld de, .BoxString
	call PlaceString
	hlcoord 13, 6
	ld a, [wCurrentBoxNum]
	and $7f
	add "１"
	ld [hl], a
	hlcoord 4, 11
	ld de, wBoxSpecies
	ld c, 4
	call PrintPCBox_PlaceBoxMonInfo
	ret

.PokemonListString: db "#リスト@"
.BoxString: db "ボックス@"

PrintPCBox_DrawPage2:
	call ClearScreen
	call PrintPCBox_PlaceHorizontalLines
	call PrintPCBox_DrawLeftAndRightBorders
	ld a, [wBoxCount]
	cp 5
	ret c
	hlcoord 4, 1
	ld de, wBoxSpecies + 4
	ld c, 9
	call PrintPCBox_PlaceBoxMonInfo
	ret

PrintPCBox_DrawPage3:
	call ClearScreen
	call PrintPCBox_PlaceHorizontalLines
	call PrintPCBox_DrawLeftAndRightBorders
	ld a, [wBoxCount]
	cp 14
	ret c
	hlcoord 4, 1
	ld de, wBoxSpecies + 13
	ld c, 9
	call PrintPCBox_PlaceBoxMonInfo
	ret

PrintPCBox_DrawPage4:
	call ClearScreen
	call PrintPCBox_PlaceHorizontalLines
	call PrintPCBox_DrawLeftAndRightBorders
	call PrintPCBox_DrawBottomBorder


	ld a, [wBoxCount]
	cp 23
	ret c
	hlcoord 4, 1
	ld de, wBoxSpecies + 22
	ld c, 8
	call PrintPCBox_PlaceBoxMonInfo
	ret

PrintPCBox_PlaceBoxMonInfo:
.loop
	ld a, c
	and a
	jr z, .done
	dec c
	ld a, [de]
	cp $ff
	jr z, .done
	ld [wPokedexNum], a
	push bc
	push hl
	push de
	push hl
	ld bc, 12
	ld a, "　"
	call FillMemory
	pop hl
	push hl
	call GetMonName
	pop hl
	call PlaceString
	push hl
	ld hl, wBoxMonNicks
	ld bc, NAME_LENGTH
	ld a, [wBoxNumString]
	call AddNTimes
	ld e, l
	ld d, h
	pop hl
	ld bc, NAME_LENGTH
	add hl, bc
	ld [hl], "／"
	inc hl
	call PlaceString
	ld hl, wBoxNumString
	inc [hl]
	pop de
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	inc de
	jr .loop

.done
	ret

PrintPCBox_DrawTopBorder:
	hlcoord 0, 0
	ld a, $79
	ld [hli], a
	ld a, $7a
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld a, $7b
	ld [hl], a
	ret

PrintPCBox_DrawLeftAndRightBorders:
	hlcoord 0, 0
	ld de, SCREEN_WIDTH - 1
	ld c, SCREEN_HEIGHT
.loop
	ld a, $7c
	ld [hl], a
	add hl, de
	ld a, $7c
	ld [hli], a
	dec c
	jr nz, .loop
	ret

PrintPCBox_DrawBottomBorder:
	hlcoord 0, 17
	ld a, $7d
	ld [hli], a
	ld a, $7a
	ld c, SCREEN_WIDTH - 2
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ld a, $7e
	ld [hl], a
	ret

PrintPCBox_PlaceHorizontalLines:
	hlcoord 4, 1
	ld c, 9
.loop
	push bc
	push hl
	ld de, .HorizontalLineString
	call PlaceString
	pop hl
	ld bc, 2 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

.HorizontalLineString:
	db "ーーーーー　／ーーーーー@"
