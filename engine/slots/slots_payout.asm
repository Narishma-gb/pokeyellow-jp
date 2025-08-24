UnusedDisplaySlotsPayout:
	call SaveScreenTilesToBuffer2
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	xor a
	ld [wUpdateSpritesEnabled], a
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call _DisplaySlotsPayout
	call Delay3
	call GBPalNormal
	call WaitForTextScrollButtonPress
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	call GBPalWhiteOutWithDelay3
	call ReloadTilesetTilePatterns
	call LoadScreenTilesFromBuffer2
	call Delay3
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	jp GBPalNormal

_DisplaySlotsPayout:
	ld de, SlotMachineTiles2
	ld hl, vChars2
	lb bc, BANK(SlotMachineTiles2), (SlotMachineTiles2End + $40 - SlotMachineTiles2) / $10
	; SlotMachineTiles2 is only 24 tiles long, this loads 4 extra garbage tiles in VRAM
	call CopyVideoData
	call PlaceSlotIcons
	call PrintPayoutStrings
	ret

PlaceSlotIcons:
	hlcoord 1, 1
	ld e, 2 ; top left tile index
	ld c, 6
.loop
	push bc
	ld d, e
	call PrintHalfSymbolRow
	ld d, e
	dec d
	dec d ; bottom left tile index
	call PrintHalfSymbolRow
	ld bc, SCREEN_WIDTH
	add hl, bc
	inc e
	inc e
	inc e
	inc e
	pop bc
	dec c
	jr nz, .loop
	ret

PrintHalfSymbolRow:
	push hl
	ld a, d
	ld [hli], a
	inc a
	ld [hli], a
	ld a, d
	ld [hli], a
	inc a
	ld [hli], a
	ld a, d
	ld [hli], a
	inc a
	ld [hli], a
	pop hl
	ld bc, SCREEN_WIDTH
	add hl, bc
	ret

PrintPayoutStrings:
	hlcoord 9, 2
	ld de, SlotPayoutStrings
	ld c, 6
.loop
	push bc
	push hl
	push de
	call PlaceString
	pop de
	ld hl, 8
	add hl, de
	ld e, l
	ld d, h
	pop hl
	ld bc, 3 * SCREEN_WIDTH
	add hl, bc
	pop bc
	dec c
	jr nz, .loop
	ret

SlotPayoutStrings:
	db "⋯　３００まい@"
	db "⋯　１００まい@"
	db "⋯　　　８まい@"
	db "⋯　　１５まい@"
	db "⋯　　１５まい@"
	db "⋯　　１５まい@"
