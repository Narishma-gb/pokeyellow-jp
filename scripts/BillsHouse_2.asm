BillsHousePrintBillPokemonText::
	ld hl, .ImNotAPokemonText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .answered_no
.use_machine
	ld hl, .UseSeparationSystemText
	call PrintText
	ld a, SCRIPT_BILLSHOUSE_SCRIPT2
	ld [wBillsHouseCurScript], a
	ret
.answered_no
	ld hl, .NoYouGottaHelpText
	call PrintText
	jr .use_machine

.ImNotAPokemonText:
	text "こんちわ！"
	line "ぼく　#<⋯>！"
	cont "<⋯>　ちゃうわい！"

	para "わいは　マサキ！"
	line "ひと　よんで　#マニアや！"
	cont "あッ　なんや　そのめは？"
	cont "あんさん　しんよう　してへんな"

	para "ホントやで！"
	line "じっけんに　しっぱい　して"
	cont "#と　くっついて　もうたんや"

	para "なッ！"
	line "たすけて　くれへん？"
	done

.UseSeparationSystemText:
	text "わいが"
	line "てんそう　マシンに　はいるさかい"
	cont "ぶんり　プログラムを　たのむで！"
	cont "そうや　そこの　<PC>や！"
	done

.NoYouGottaHelpText:
	text "そんなあ<⋯>"
	line "つめたい　こと　いわんといて"
	cont "よッ<⋯>　いろおとこ！"
	cont "にくいねーッ"
	cont "だいとうりょう！"
	cont "ほな！　オッケー　やな！"
	cont "きまりや！"
	prompt

BillsHousePrintBillSSTicketText::
	CheckEvent EVENT_GOT_SS_TICKET
	jr nz, .got_ss_ticket
	ld hl, .ThankYouText
	call PrintText
	lb bc, S_S_TICKET, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .SSTicketReceivedText
	call PrintText
	SetEvent EVENT_GOT_SS_TICKET
	ld a, HS_CERULEAN_GUARD_1
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, HS_CERULEAN_GUARD_2
	ld [wMissableObjectIndex], a
	predef HideObject
.got_ss_ticket
	ld hl, .WhyDontYouGoInsteadOfMeText
	call PrintText
	ret
.bag_full
	ld hl, .SSTicketNoRoomText
	call PrintText
	ret

.ThankYouText:
	text "マサキ『やあー！"
	line "おおきに　おおきに　たすかったわ！"

	para "で<⋯>　あんさん！"
	line "わての　#　コレクション"
	cont "みに　きたの　ちゃうんか？"
	cont "なんや　おもろないなー"
	cont "ああ　そや！"

	para "おれい　っちゅーのも"
	line "なんやけど<⋯>　これ　やるわ！"
	prompt

.SSTicketReceivedText:
	text "<PLAYER>は　マサキから"
	line "@"
	text_ram wStringBuffer
	text "を　もらった！@"
	sound_get_key_item
	text_promptbutton
	text_end

.SSTicketNoRoomText:
	text "にもつ　いっぱいで　もてへんよ"
	done

.WhyDontYouGoInsteadOfMeText:
	text "いま　クチバの　みなとに"
	line "サント·アンヌ　ごうが　きとんのや"
	cont "#　<TRAINER>も"
	cont "ぎょうさん　くる　らしいで"

	para "チケット　もろたのは　ええんやけど"
	line "パーティとか　すきや　ないからな"
	cont "かわりに　いって　あそんでえな"
	done

BillsHousePrintBillCheckOutMyRarePokemonText::
	ld hl, .text
	call PrintText
	ret

.text
	text "マサキ『そや！"

	para "わての　#　コレクション"
	line "ちびっと　だけ　みせたろか？"
	cont "わての　<PC>　みてみぃ"
	done

Func_f24ae::
	ld a, [wCurMap]
	cp BILLS_HOUSE
	jr nz, .asm_f24d2
	call CheckPikachuFollowingPlayer
	jr z, .asm_f24d2
	ld a, [wBillsHouseCurScript]
	cp SCRIPT_BILLSHOUSE_SCRIPT5
	ldpikaemotion e, PikachuEmotion27
	ret z
	cp SCRIPT_BILLSHOUSE_SCRIPT0
	ldpikaemotion e, PikachuEmotion23
	ret z
	CheckEventHL EVENT_MET_BILL_2
	ldpikaemotion e, PikachuEmotion32
	ret z
	ldpikaemotion e, PikachuEmotion31
	ret

.asm_f24d2
	ld e, $ff
	ret

Func_f24d5::
	ld a, PAD_BUTTONS | PAD_CTRL_PAD
	ld [wJoyIgnore], a
	xor a
	ld [wPlayerMovingDirection], a
	call UpdateSprites
	call UpdateSprites
	ld hl, Data_f2505
	call ApplyPikachuMovementData
	ld a, $f ; pikachu
	ld [wEmotionBubbleSpriteIndex], a
	ld a, QUESTION_BUBBLE
	ld [wWhichEmotionBubble], a
	predef EmotionBubble
	call DisablePikachuFollowingPlayer
	callfar InitializePikachuTextID
	ret

Data_f2505:
	db $00
	db $20
	db $20
	db $20
	db $1e
	db $3f
