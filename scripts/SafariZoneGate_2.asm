SafariZoneGatePrintSafariZoneWorker1WouldYouLikeToJoinText::
	ld hl, .WelcomeText
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .PleaseComeAgain
	ld hl, wPlayerMoney
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	jr nz, .has_positive_balance
	call SafariZoneEntranceGetLowCostAdmissionText
	jr c, .CantPayWalkDown
	jr .poor_mans_discount

.has_positive_balance
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $05
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .success
	ld hl, .NotEnoughMoneyText
	call PrintText
	call SafariZoneEntranceCalculateLowCostAdmission
	jr c, .CantPayWalkDown
	jr .poor_mans_discount

.success
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $05
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, 3
	predef SubBCDPredef
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, .MakePaymentText
	call PrintText
	ld a, 30
	ld hl, 502
.poor_mans_discount
	ld [wNumSafariBalls], a
	ld a, h
	ld [wSafariSteps], a
	ld a, l
	ld [wSafariSteps + 1], a
	ld a, PAD_UP
	ld c, 3
	call SafariZoneEntranceAutoWalk2
	SetEvent EVENT_IN_SAFARI_ZONE
	ResetEventReuseHL EVENT_SAFARI_GAME_OVER
	ld a, SCRIPT_SAFARIZONEGATE_PLAYER_MOVING
	ld [wSafariZoneGateCurScript], a
	jr .done

.PleaseComeAgain
	ld hl, .PleaseComeAgainText
	call PrintText
.CantPayWalkDown
	ld a, PAD_DOWN
	ld c, 1
	call SafariZoneEntranceAutoWalk2
	ld a, SCRIPT_SAFARIZONEGATE_PLAYER_MOVING_DOWN
	ld [wSafariZoneGateCurScript], a
.done
	ret

.WelcomeText
	text "この　ひろい　サファリで"
	line "いろんな　#　とりほうだいの"
	cont "ゲームが　たった　５００円！"

	para "さっそく　やりますか？"
	done

.MakePaymentText
	text "それでは<⋯>！"
	line "@"
	text_bcd wPriceTemp, 3 | LEADING_ZEROES | LEFT_ALIGN
	text "円　いただきまーす！"

	para "ここでは　サファリ　せんようの"
	line "モンスターボールを　つかいます！"
	cont "<⋯>　これです！"

	para "<PLAYER>は　うけつけ　から"
	line "サファリボール　３０こ　もらった！@"
	sound_get_item_1
	text_start

	para "のこり　じかんが　なくなるか！"
	line "サファリボールが　なくなったら"
	cont "メガホンで　しらせます！"
	cont "では<⋯>！　ぐっど　らっく！"
	done

.PleaseComeAgainText
	text "そうか<⋯>！　また　きて　ください"
	done

.NotEnoughMoneyText
	text "あッ　おかねが　たりない！"
	done

SafariZoneGatePrintSafariZoneWorker2Text::
	ld hl, .FirstTimeHereText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .YoureARegularHereText
	jr nz, .print_text
	ld hl, .SafariZoneExplanationText
.print_text
	call PrintText
	ret

.FirstTimeHereText
	text "こんちわ！"
	line "サファリ　ゲームは　はじめて？"
	done

.SafariZoneExplanationText
	text "サファリ　ゲームは"
	line "４つの　ゾーンに　わかれてます！"

	para "それぞれに　めずらしい　#が"
	line "せいそく　してますから"
	cont "せんようの　サファリボールで"
	cont "つかまえて　ください！"

	para "ただし　じかんが　なくなるか"
	line "サファリボールを　ぜんぶ　なげたら"
	cont "ゲームは　おわり　だよ！"
	done

.YoureARegularHereText
	text "おっと　しつれい！"
	line "じょうれん　さん　だったね！"
	done

SafariZoneEntranceAutoWalk2:
	push af
	ld b, 0
	ld a, c
	ld [wSimulatedJoypadStatesIndex], a
	ld hl, wSimulatedJoypadStatesEnd
	pop af
	call FillMemory
	jp StartSimulatingJoypadStates

SafariZoneEntranceCalculateLowCostAdmission:
	ld hl, wPlayerMoney
	ld de, hMoney
	ld bc, $3
	call CopyData
	xor a
	ldh [hDivideBCDDivisor], a
	ldh [hDivideBCDDivisor + 1], a
	ld a, 23
	ldh [hDivideBCDDivisor + 2], a
	predef DivideBCDPredef3
	ldh a, [hDivideBCDQuotient + 2]
	call SafariZoneEntranceConvertBCDtoNumber
	push af
	ld hl, wPlayerMoney
	xor a
	ld bc, $3
	call FillMemory
	ld hl, SafariZoneEntranceText_f20c4
	call PrintText_NoCreatingTextBox
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld hl, SafariZoneEntranceText_f20c9
	call PrintText
	pop af
	inc a
	jr z, .max_balls
	cp 29
	jr c, .load_balls
.max_balls
	ld a, 29
.load_balls
	ld hl, 502
	and a
	ret

SafariZoneEntranceText_f20c4:
	text_start

	para "<⋯>しょうがないなあ"
	line "あるだけでいいよ"
	prompt

SafariZoneEntranceText_f20c9:
	text "でも　ボールは　へらしとくからね"
	done

SafariZoneEntranceGetLowCostAdmissionText:
	ld hl, wSafariSteps
	ld a, [hl]
	push af
	inc [hl]
	ld e, a
	ld d, $0
	ld hl, Pointers_f2100
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call PrintText
	pop af
	cp $3
	jr z, .give_one_ball
	scf
	ret

.give_one_ball
	ld hl, SafariZoneEntranceText_f20f6
	call PrintText_NoCreatingTextBox
	ld a, $1
	ld hl, 502
	and a
	ret

SafariZoneEntranceText_f20f6:
	text_start

	para "まったく　しつこいな⋯"
	line "こんかいだけだからね"

	para "ラッキー！　ただで　いれてくれた！@"
	sound_get_item_1
	text_start
	done

Pointers_f2100:
	dw SafariZoneEntranceText_f210a
	dw SafariZoneEntranceText_f210f
	dw SafariZoneEntranceText_f2114
	dw SafariZoneEntranceText_f2119
	dw SafariZoneEntranceText_f2119

SafariZoneEntranceText_f210a:
	text "おかねを　もってない　ひとは"
	line "はいれません！"
	done

SafariZoneEntranceText_f210f:
	text "おかねが　ないひとは　ダメです！"
	done

SafariZoneEntranceText_f2114:
	text "おかねが　ないひとは　ダメって"
	line "いってるだろ！"
	done

SafariZoneEntranceText_f2119:
	text "だめなものは　ダメだって<⋯>"
	done

SafariZoneEntranceConvertBCDtoNumber:
	push hl
	ld c, a
	and $f
	ld l, a
	ld h, $0
	ld a, c
	and $f0
	swap a
	ld bc, 10
	call AddNTimes
	ld a, l
	pop hl
	ret
