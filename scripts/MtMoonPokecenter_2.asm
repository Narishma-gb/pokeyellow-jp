MagikarpSalesman::
	CheckEvent EVENT_BOUGHT_MAGIKARP, 1
	jp c, .alreadyBoughtMagikarp
	ld hl, .IGotADealText
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jp nz, .choseNo
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	ld a, $5
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, MAGIKARP, 5
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 2], a
	ld a, $5
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_MAGIKARP
	jr .done
.choseNo
	ld hl, .NoText
	jr .printText
.alreadyBoughtMagikarp
	ld hl, .NoRefundsText
.printText
	call PrintText
.done
	ret

.IGotADealText
	text "おじさん『ぼっちゃん"
	line "あ·な·た·だけに<⋯>！"
	cont "いい　おはなしが　ありまして"

	para "ひみつの　#　コイキングが"
	line "なんと　たったの　５００円！"
	cont "どうだい　かうかね？"
	done

.NoText
	text "そお？　ざんねんだねえ<⋯>"
	done

.NoMoneyText
	text "おかね　たりない　みたいだねえ"
	done

.NoRefundsText
	text "おじさん『そうそう　#の"
	line "へんぴんは　おことわり　だからな"
	done
