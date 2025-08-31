Func_f531b::
	ld c, $14
	call DelayFrames
	ld a, $1
	ld [wBuffer], a
	xor a
	ld [wUnknownSerialFlag_d499], a
	hlcoord 0, 0
	lb bc, 4, 5
	call TextBoxBorder
	ld de, Text_f5791
	hlcoord 1, 2
	call PlaceString
	hlcoord 8, 0
	lb bc, 8, 10
	call TextBoxBorder
	hlcoord 10, 2
	ld de, Text_f579c
	call PlaceString
	hlcoord 0, 10
	lb bc, 6, 18
	call TextBoxBorder
	call UpdateSprites
	xor a
	ld [wUnusedLinkMenuByte], a
	ld [wCableClubDestinationMap], a
	ld [wNamedObjectIndex], a
	ld hl, wTopMenuItemY
	ld a, $2
	ld [hli], a
	ld a, $9
	ld [hli], a
	xor a
	ld [hli], a
	inc hl
	ld a, $3
	ld [hli], a
	ld a, $3
	ld [hli], a
	xor a
	ld [hl], a
.asm_f5377
	call Func_f56bd
	call HandleMenuInput
	and $3
	add a
	add a
	ld b, a
	ld a, [wCurrentMenuItem]
	cp $3
	jr nz, .asm_f5390
	bit 2, b
	jr z, .asm_f5390
	dec a
	ld b, $8
.asm_f5390
	add b
	add $c0
	ld [wLinkMenuSelectionSendBuffer], a
	ld [wLinkMenuSelectionSendBuffer + 1], a
.asm_f5399
	ld hl, wLinkMenuSelectionSendBuffer
	ld a, [hl]
	ldh [hSerialSendData], a
	call Serial_ExchangeByte
	call Serial_ExchangeByte
	ld b, a
	and $f0
	cp $c0
	jr nz, .asm_f5399
	ld a, b
	and $c
	jr nz, .asm_f53c4
	ld a, [wLinkMenuSelectionSendBuffer]
	and $c
	jr z, .asm_f5377
	jr .asm_f53df
.asm_f53c4
	ld a, [wLinkMenuSelectionSendBuffer]
	and $c
	jr z, .asm_f53d1
	ldh a, [hSerialConnectionStatus]
	cp $2
	jr z, .asm_f53df
.asm_f53d1
	ld a, $1
	ld [wNamedObjectIndex], a
	ld a, b
	ld [wLinkMenuSelectionSendBuffer], a
	and $3
	ld [wCurrentMenuItem], a
.asm_f53df
	call DelayFrame
	call DelayFrame
	ld hl, wLinkMenuSelectionSendBuffer
	ld a, [hl]
	ldh [hSerialSendData], a
	call Serial_ExchangeByte
	call Serial_ExchangeByte
	ld b, $14
.loop
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .loop
	ld b, "　"
	ld c, "　"
	ld d, "　"
	ld e, "▷"
	ld a, [wLinkMenuSelectionSendBuffer]
	bit 3, a
	jr nz, .asm_f541a
	ld b, e
	ld e, c
	ld a, [wCurrentMenuItem]
	and a
	jr z, .asm_f541a
	ld c, b
	ld b, d
	dec a
	jr z, .asm_f541a
	ld d, c
	ld c, b
.asm_f541a
	ld a, b
	ldcoord_a 9, 2
	ld a, c
	ldcoord_a 9, 4
	ld a, d
	ldcoord_a 9, 6
	ld a, e
	ldcoord_a 9, 8
	ld c, 40
	call DelayFrames
	ld a, [wLinkMenuSelectionSendBuffer]
	bit 3, a
	jr nz, asm_f547f
	ld a, [wCurrentMenuItem]
	inc a
	ld [wUnknownSerialFlag_d499], a
	ld a, [wCurrentMenuItem]
	ld hl, PointerTable_f5488
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, .returnaddress
	push de
	jp hl
.returnaddress
	ld [wLinkMenuSelectionSendBuffer], a
	xor a
	ld [wUnknownSerialCounter], a
	ld [wUnknownSerialCounter + 1], a
	call Serial_SyncAndExchangeNybble
	ld a, [wLinkMenuSelectionSendBuffer]
	and a
	jr nz, asm_f547c
	ld a, [wLinkMenuSelectionReceiveBuffer]
	and a
	jr nz, Func_f5476
	xor a
	ld [wUnknownSerialCounter], a
	ld [wUnknownSerialCounter + 1], a
	and a
	ret

Func_f5476::
	ld hl, ColosseumIneligibleText
	call PrintText
asm_f547c::
	jp Func_f531b

asm_f547f::
	xor a
	ld [wUnknownSerialCounter], a
	ld [wUnknownSerialCounter + 1], a
	scf
	ret

PointerTable_f5488::
	dw PokeCup
	dw PikaCup
	dw PetitCup

PokeCup::
	ld hl, wPartyCount
	ld a, [hli]
	cp $3
	jp nz, NotThreeMonsInParty
	ld b, $3
.loop
	ld a, [hli]
	cp MEW
	jp z, MewInParty
	dec b
	jr nz, .loop
	dec hl
	dec hl
	cp [hl] ; is third mon second mon?
	jp z, DuplicateSpecies
	dec hl ; wPartySpecies
	cp [hl] ; is third mon first mon?
	jp z, DuplicateSpecies
	ld a, [hli]
	cp [hl] ; is first mon second mon?
	jp z, DuplicateSpecies
	ld a, [wPartyMon1Level]
	cp 56
	jp nc, LevelAbove55
	cp 50
	jp c, LevelUnder50
	ld b, a
	ld a, [wPartyMon2Level]
	cp 56
	jp nc, LevelAbove55
	cp 50
	jp c, LevelUnder50
	ld c, a
	ld a, [wPartyMon3Level]
	cp 56
	jp nc, LevelAbove55
	cp 50
	jp c, LevelUnder50
	add b
	add c
	cp 156
	jp nc, CombinedLevelsGreaterThan155
	xor a
	ret

PikaCup::
	ld hl, wPartyCount
	ld a, [hli]
	cp $3
	jp nz, NotThreeMonsInParty
	ld b, $3
.loop
	ld a, [hli] ; wPartySpecies
	cp MEW
	jp z, MewInParty
	dec b
	jr nz, .loop
	dec hl
	dec hl
	cp [hl] ; is third mon second mon?
	jp z, DuplicateSpecies
	dec hl ; wPartySpecies
	cp [hl] ; is third mon first mon?
	jp z, DuplicateSpecies
	ld a, [hli]
	cp [hl] ; is first mon second mon?
	jp z, DuplicateSpecies
	ld a, [wPartyMon1Level]
	cp 21
	jp nc, LevelAbove20
	cp 15
	jp c, LevelUnder15
	ld b, a
	ld a, [wPartyMon2Level]
	cp 21
	jp nc, LevelAbove20
	cp 15
	jp c, LevelUnder15
	ld c, a
	ld a, [wPartyMon3Level]
	cp 21
	jp nc, LevelAbove20
	cp 15
	jp c, LevelUnder15
	add b
	add c
	cp 51
	jp nc, CombinedLevelsAbove50
	xor a
	ret

PetitCup::
	ld hl, wPartyCount
	ld a, [hli]
	cp $3
	jp nz, NotThreeMonsInParty
	ld b, $3
.loop
	ld a, [hli]
	cp MEW
	jp z, MewInParty
	dec b
	jr nz, .loop
	dec hl
	dec hl
	cp [hl] ; is third mon second mon?
	jp z, DuplicateSpecies
	dec hl ; wPartySpecies
	cp [hl] ; is third mon first mon?
	jp z, DuplicateSpecies
	ld a, [hli]
	cp [hl] ; is first mon second mon?
	jp z, DuplicateSpecies
	dec hl
	ld a, [hl]
	ld [wCurPartySpecies], a
	push hl
	callfar Func_3b10f
	pop hl
	jp c, asm_f56ad
	inc hl
	ld a, [hl]
	ld [wCurPartySpecies], a
	push hl
	callfar Func_3b10f
	pop hl
	jp c, asm_f56ad
	inc hl
	ld a, [hl]
	ld [wCurPartySpecies], a
	push hl
	callfar Func_3b10f
	pop hl
	jp c, asm_f56ad
	dec hl
	dec hl
	ld b, $3
.bigloop
	ld a, [hli]
	push hl
	push bc
	push af
	dec a
	ld c, a
	ld b, $0
	ld hl, PokedexEntryPointers
	add hl, bc
	add hl, bc
	ld de, wNameBuffer
	ld bc, $2
	ld a, BANK(PokedexEntryPointers)
	call FarCopyData
	ld hl, wNameBuffer
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wNameBuffer
	ld bc, $a
	ld a, BANK(PokedexEntryPointers)
	call FarCopyData
	ld hl, wNameBuffer
.loop2
	ld a, [hli]
	cp "@"
	jr nz, .loop2
	ld a, [hli]
	cp 21
	jp nc, asm_f5689
	inc hl
	ld a, [hld]
	and a
	jp nz, asm_f569b
	ld a, [hl]
	cp $c9
	jp nc, asm_f569b
	pop af
	pop bc
	pop hl
	dec b
	jr nz, .bigloop
	ld a, [wPartyMon1Level]
	cp 31
	jp nc, LevelAbove30
	cp 25
	jp c, LevelUnder25
	ld b, a
	ld a, [wPartyMon2Level]
	cp 31
	jp nc, LevelAbove30
	cp 25
	jp c, LevelUnder25
	ld c, a
	ld a, [wPartyMon3Level]
	cp 31
	jp nc, LevelAbove30
	cp 25
	jp c, LevelUnder25
	add b
	add c
	cp 81
	jp nc, CombinedLevelsAbove80
	xor a
	ret

NotThreeMonsInParty::
	ld hl, Colosseum3MonsText
	call PrintText
	ld a, $1
	ret

MewInParty::
	ld hl, ColosseumMewText
	call PrintText
	ld a, $2
	ret

DuplicateSpecies::
	ld hl, ColosseumDifferentMonsText
	call PrintText
	ld a, $3
	ret

LevelAbove55::
	ld hl, ColosseumMaxL55Text
	call PrintText
	ld a, $4
	ret

LevelUnder50::
	ld hl, ColosseumMinL50Text
	call PrintText
	ld a, $5
	ret

CombinedLevelsGreaterThan155::
	ld hl, ColosseumTotalL155Text
	call PrintText
	ld a, $6
	ret

LevelAbove30::
	ld hl, ColosseumMaxL30Text
	call PrintText
	ld a, $7
	ret

LevelUnder25::
	ld hl, ColosseumMinL25Text
	call PrintText
	ld a, $8
	ret

CombinedLevelsAbove80::
	ld hl, ColosseumTotalL80Text
	call PrintText
	ld a, $9
	ret

LevelAbove20::
	ld hl, ColosseumMaxL20Text
	call PrintText
	ld a, $a
	ret

LevelUnder15::
	ld hl, ColosseumMinL15Text
	call PrintText
	ld a, $b
	ret

CombinedLevelsAbove50::
	ld hl, ColosseumTotalL50Text
	call PrintText
	ld a, $c
	ret

asm_f5689::
	pop af
	pop bc
	pop hl
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, ColosseumHeightText
	call PrintText
	ld a, $d
	ret

asm_f569b::
	pop af
	pop bc
	pop hl
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, ColosseumWeightText
	call PrintText
	ld a, $e
	ret

asm_f56ad::
	ld a, [hl]
	ld [wNamedObjectIndex], a
	call GetMonName
	ld hl, ColosseumEvolvedText
	call PrintText
	ld a, $f
	ret

Func_f56bd::
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 1, 11
	lb bc, 6, 18
	call ClearScreenArea
	ld a, [wCurrentMenuItem]
	cp $3
	jr nc, .asm_f56e6
	ld hl, PointerTable_f56ee
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l
	hlcoord 1, 12
	call PlaceString
.asm_f56e6
	call Delay3
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ret

PointerTable_f56ee::
	dw Text_f56f4
	dw Text_f5728
	dw Text_f575b

Text_f56f4::
	db "３びきのレベルは　５０から５５まで"
	next "レベルの　ごうけいは　１５５まで"
	next "ミュウは　エントリーできません@"

Text_f5728::
	db "３びきのレベルは　１５から２０まで"
	next "レベルの　ごうけいは　５０まで"
	next "ミュウは　エントリーできません@"

Text_f575b::
	db "しんか　していない　#３びき"
	next "レベル２５から３０　あわせて８０まで"
	next "たかさ２メートル　おもさ２０キロいか@"

Text_f5791::
	db "ルールを"
	next "えらんで！@"

Text_f579c::
	db "にんてんどうカップ"
	next "イエローカップ"
	next "ファンシーカップ"
	next "やめる@"

Colosseum3MonsText::
	text "たたかう#の　かずが"
	line "３たいに　なっていません！"
	prompt

ColosseumMewText::
	text "ミュウは　エントリー　できません！"
	prompt

ColosseumDifferentMonsText::
	text "おなじ　#が"
	line "２たい　います！"
	prompt

ColosseumMaxL55Text::
	text "レベルが　５５を　こえる"
	line "#が　いるようです！"
	prompt

ColosseumMinL50Text::
	text "レベルが　５０に　ならない"
	line "#が　いるようです！"
	prompt

ColosseumTotalL155Text::
	text "レベルの　ごうけいが　１５５を"
	line "こえているようです！"
	prompt

ColosseumMaxL30Text::
	text "レベルが　３０を　こえる"
	line "#が　いるようです！"
	prompt

ColosseumMinL25Text::
	text "レベルが　２５に　ならない"
	line "#が　いるようです！"
	prompt

ColosseumTotalL80Text::
	text "レベルの　ごうけいが　８０を"
	line "こえているようです！"
	prompt

ColosseumMaxL20Text::
	text "レベルが　２０を　こえる"
	line "#が　いるようです！"
	prompt

ColosseumMinL15Text::
	text "レベルが　１５に　ならない"
	line "#が　いるようです！"
	prompt

ColosseumTotalL50Text::
	text "レベルの　ごうけいが　５０を"
	line "こえているようです！"
	prompt

ColosseumHeightText::
	text_ram wNameBuffer
	text "の　たかさが"
	line "２メートルを　こえています！"
	prompt

ColosseumWeightText::
	text_ram wNameBuffer
	text "の　おもさが"
	line "２０キロを　こえています！"
	prompt

ColosseumEvolvedText::
	text_ram wNameBuffer
	text "は　しんかした"
	line "#です！"
	prompt

ColosseumIneligibleText::
	text "たいせんあいての　#が"
	line "ルールいはんの　ようです"
	prompt

LinkMenu:
	xor a
	ld [wLetterPrintingDelayFlags], a
	ld hl, wStatusFlags4
	set BIT_LINK_CONNECTED, [hl]
	ld hl, TextTerminator_f5a16
	call PrintText
	call SaveScreenTilesToBuffer1
	ld hl, ColosseumWhereToText
	call PrintText
	hlcoord 8, 8
	lb bc, 8, 10
	call TextBoxBorder
	call UpdateSprites
	hlcoord 10, 10
	ld de, TradeCenterText
	call PlaceString
	xor a
	ld [wUnusedLinkMenuByte], a
	ld [wCableClubDestinationMap], a
	ld [wNamedObjectIndex], a
	ld hl, wTopMenuItemY
	ld a, 10
	ld [hli], a
	ASSERT wTopMenuItemY + 1 == wTopMenuItemX
	ld a, 9
	ld [hli], a
	ASSERT wTopMenuItemX + 1 == wCurrentMenuItem
	xor a
	ld [hli], a
	inc hl
	ASSERT wCurrentMenuItem + 2 == wMaxMenuItem
	ld a, 3
	ld [hli], a
	ASSERT wMaxMenuItem + 1 == wMenuWatchedKeys
	ASSERT 2 == PAD_B
	ld [hli], a
	ASSERT wMenuWatchedKeys + 1 == wLastMenuItem
	xor a
	ld [hl], a
.waitForInputLoop
	call HandleMenuInput
	and PAD_A | PAD_B
	add a
	add a
	ld b, a
	ld a, [wCurrentMenuItem]
	cp $3
	jr nz, .asm_f586b
	bit 2, b
	jr z, .asm_f586b
	dec a
	ld b, $8
.asm_f586b
	add b
	add $d0
	ld [wLinkMenuSelectionSendBuffer], a
	ld [wLinkMenuSelectionSendBuffer + 1], a
.exchangeMenuSelectionLoop
	call Serial_ExchangeLinkMenuSelection
	ld a, [wLinkMenuSelectionReceiveBuffer]
	ld b, a
	and $f0
	cp $d0
	jr z, .checkEnemyMenuSelection
	ld a, [wLinkMenuSelectionReceiveBuffer + 1]
	ld b, a
	and $f0
	cp $d0
	jr nz, .exchangeMenuSelectionLoop
.checkEnemyMenuSelection
	ld a, b
	and $c ; did the enemy press A or B?
	jr nz, .enemyPressedAOrB
; the enemy didn't press A or B
	ld a, [wLinkMenuSelectionSendBuffer]
	and $c ; did the player press A or B?
	jr z, .waitForInputLoop ; if neither the player nor the enemy pressed A or B, try again
	jr .doneChoosingMenuSelection ; if the player pressed A or B but the enemy didn't, use the player's selection
.enemyPressedAOrB
	ld a, [wLinkMenuSelectionSendBuffer]
	and $c ; did the player press A or B?
	jr z, .useEnemyMenuSelection ; if the enemy pressed A or B but the player didn't, use the enemy's selection
; the enemy and the player both pressed A or B
; The gameboy that is clocking the connection wins.
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr z, .doneChoosingMenuSelection
.useEnemyMenuSelection
	ld a, $1
	ld [wNamedObjectIndex], a
	ld a, b
	ld [wLinkMenuSelectionSendBuffer], a
	and $3
	ld [wCurrentMenuItem], a
.doneChoosingMenuSelection
	ldh a, [hSerialConnectionStatus]
	cp USING_INTERNAL_CLOCK
	jr nz, .skipStartingTransfer
	call DelayFrame
	call DelayFrame
	ld a, SC_START | SC_INTERNAL
	ldh [rSC], a
.skipStartingTransfer
	ld b, "　"
	ld c, "　"
	ld d, "　"
	ld e, "▷"
	ld a, [wLinkMenuSelectionSendBuffer]
	and PAD_B << 2 ; was B button pressed?
	jr nz, .updateCursorPosition
; A button was pressed
	ld a, [wCurrentMenuItem]
	cp $2
	jp z, .asm_f5963
	ld b, e
	ld e, c
	ld a, [wCurrentMenuItem]
	and a
	jr z, .updateCursorPosition
	ld c, b
	ld b, d
	dec a
	jr z, .updateCursorPosition
	ld d, c
	ld c, b
.updateCursorPosition
	call Func_f59ec
	call LoadScreenTilesFromBuffer1
	ld a, [wLinkMenuSelectionSendBuffer]
	and PAD_B << 2 ; was B button pressed?
	jr nz, .choseCancel ; cancel if B pressed
	ld a, [wCurrentMenuItem]
	cp $2
	jr z, .choseCancel
	xor a
	ld [wWalkBikeSurfState], a ; start walking
	ld a, [wCurrentMenuItem]
	and a
	ld a, COLOSSEUM
	jr nz, .next
	ld a, TRADE_CENTER
.next
	ld [wCableClubDestinationMap], a
	ld hl, ColosseumPleaseWaitText
	call PrintText
	ld c, 50
	call DelayFrames
	ld hl, wStatusFlags6
	res BIT_DEBUG_MODE, [hl]
	ld a, [wDefaultMap]
	ld [wDestinationMap], a
	callfar PrepareForSpecialWarp
	ld c, 20
	call DelayFrames
	xor a
	ld [wMenuJoypadPollCount], a
	ld [wSerialExchangeNybbleSendData], a
	inc a ; LINK_STATE_IN_CABLE_CLUB
	ld [wLinkState], a
	ld [wEnteringCableClub], a
	jpfar SpecialEnterMap
.choseCancel
	xor a
	ld [wMenuJoypadPollCount], a
	call Delay3
	callfar CloseLinkConnection
	ld hl, ColosseumCanceledText
	vc_hook Wireless_net_stop
	call PrintText
	ld hl, wStatusFlags4
	res BIT_LINK_CONNECTED, [hl]
	vc_hook Wireless_net_end
	ret

.asm_f5963
	ld a, [wNamedObjectIndex]
	and a
	jr nz, .asm_f5974
	ld b, "　"
	ld c, "　"
	ld d, "▷"
	ld e, "　"
	call Func_f59ec
.asm_f5974
	xor a
	ld [wBuffer], a
	ld a, $ff
	ld [wSerialExchangeNybbleReceiveData], a
	ld a, $b
	ld [wLinkMenuSelectionSendBuffer], a
	ld b, $78
.loop
	ldh a, [hSerialConnectionStatus]
	cp $2
	call z, DelayFrame
	dec b
	jr z, .asm_f59b2
	call Serial_ExchangeNybble
	call DelayFrame
	ld a, [wSerialExchangeNybbleReceiveData]
	inc a
	jr z, .loop
	ld b, $f
.loop2
	call DelayFrame
	call Serial_ExchangeNybble
	dec b
	jr nz, .loop2
	ld b, $f
.loop3
	call DelayFrame
	call Serial_SendZeroByte
	dec b
	jr nz, .loop3
	jr .asm_f59d6

.asm_f59b2
	xor a
	ld [wUnknownSerialCounter], a
	ld [wUnknownSerialCounter + 1], a
	ld a, [wNamedObjectIndex]
	and a
	jr z, .asm_f59cd
	ld b, "　"
	ld c, "　"
	ld d, "　"
	ld e, "▷"
	call Func_f59ec
	jp .choseCancel

.asm_f59cd
	ld hl, ColosseumVersionText
	call PrintText
	jp .choseCancel

.asm_f59d6
	ld b, "　"
	ld c, "　"
	ld d, "▷"
	ld e, "　"
	call Func_f59ec
	call Func_f531b
	jp c, .choseCancel
	ld a, $f0
	jp .next

Func_f59ec::
	ld a, b
	ldcoord_a 9, 10
	ld a, c
	ldcoord_a 9, 12
	ld a, d
	ldcoord_a 9, 14
	ld a, e
	ldcoord_a 9, 16
	ld c, 40
	call DelayFrames
	ret

ColosseumWhereToText:
	text "どちらの　へやに"
	line "いきますか？"
	done

ColosseumPleaseWaitText:
	text "それでは　これより"
	line "ごあんない　いたします"
	done

ColosseumCanceledText:
	text "つうしんは　キャンセル　されました"
	done

ColosseumVersionText:
	text "あいての　バージョンが"
	line "ちがうようです"
	prompt

TextTerminator_f5a16:
	text_end

TradeCenterText:
	db   "トレードセンター"
	next "コロシアム"
	next "コロシアム２"
	next "やめる@"
