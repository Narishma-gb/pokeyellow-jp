Museum1FPrintScientist1Text::
	ld a, [wYCoord]
	cp 4
	jr nz, .not_right_of_scientist
	ld a, [wXCoord]
	cp 13
	jp z, .behind_counter
	jr .check_ticket
.not_right_of_scientist
	cp 3
	jr nz, .not_behind_counter
	ld a, [wXCoord]
	cp 12
	jp z, .behind_counter
.not_behind_counter
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr nz, .already_bought_ticket
	ld hl, .GoToOtherSideText
	call PrintText
	jp .done
.check_ticket
	CheckEvent EVENT_BOUGHT_MUSEUM_TICKET
	jr z, .no_ticket
.already_bought_ticket
	ld hl, .TakePlentyOfTimeText
	call PrintText
	jp .done
.no_ticket
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	xor a
	ldh [hJoyHeld], a
	ld hl, .WouldYouLikeToComeInText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .deny_entry
	xor a
	ldh [hMoney], a
	ldh [hMoney + 1], a
	ld a, $50
	ldh [hMoney + 2], a
	call HasEnoughMoney
	jr nc, .buy_ticket
	ld hl, .DontHaveEnoughMoneyText
	call PrintText
	jp .deny_entry
.buy_ticket
	ld hl, .ThankYouText
	call PrintText
	SetEvent EVENT_BOUGHT_MUSEUM_TICKET
	xor a
	ld [wPriceTemp], a
	ld [wPriceTemp + 1], a
	ld a, $50
	ld [wPriceTemp + 2], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	ld a, SFX_PURCHASE
	call PlaySoundWaitForCurrent
	call WaitForSoundToFinish
	jr .allow_entry
.deny_entry
	ld hl, .ComeAgainText
	call PrintText
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, D_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	call StartSimulatingJoypadStates
	call UpdateSprites
	jr .done
.allow_entry
	ld a, SCRIPT_MUSEUM1F_NOOP
	ld [wMuseum1FCurScript], a
	jr .done

.behind_counter
	ld hl, .DoYouKnowWhatAmberIsText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	cp $0
	jr nz, .explain_amber
	ld hl, .TheresALabSomewhereText
	call PrintText
	jr .done
.explain_amber
	ld hl, .AmberIsFossilizedTreeSapText
	call PrintText
.done
	ret

.ComeAgainText:
	text "また　きてね"
	done

.WouldYouLikeToComeInText:
	text "はいはい　こどもは　"
	line "けんがくりょう　５０えん　です"

	para "けんがく　しますか？"
	done

.ThankYouText:
	text "はい　たしかに"
	line "５０えん　いただき　ました！"
	done

.DontHaveEnoughMoneyText:
	text "<⋯>あら"
	line "おかねが　ないよ"
	prompt

.DoYouKnowWhatAmberIsText:
	text "うらぐちから　タダで　はいろうなんて"
	line "ちゃっかりもの　だね"

	para "それより　きみ"
	line "コハクって　しってる？"
	done

.TheresALabSomewhereText:
	text "コハクに　まじった"
	line "むかしのいきものを　よみがえらせる"

	para "そうだいな　じっけんを　どこかの"
	line "けんきゅうじょが　してるんだって"
	done

.AmberIsFossilizedTreeSapText:
	text "おおむかし　きから　でた　しるが"
	line "カセキのように　かたまった　ものを"
	cont "コハクと　いうんだよ"
	done

.GoToOtherSideText:
	text "あちらへ　おまわりください"
	done

.TakePlentyOfTimeText:
	text "ごゆっくり　どうぞ！"
	done

Museum1FPrintGamblerText::
	ld hl, .Text
	call PrintText
	ret

.Text:
	text "ありがたや！　ありがたや！"

	para "りゅうじん　さまの"
	line "ほねを　おがめる　とは！"
	done

Museum1FPrintScientist2Text::
	CheckEvent EVENT_GOT_OLD_AMBER
	jr nz, .got_item
	ld hl, .TakeThisToAPokemonLabText
	call PrintText
	lb bc, OLD_AMBER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_OLD_AMBER
	ld a, HS_OLD_AMBER
	ld [wMissableObjectIndex], a
	predef HideObject
	ld hl, .ReceivedOldAmberText
	jr .done
.bag_full
	ld hl, .YouDontHaveSpaceText
	jr .done
.got_item
	ld hl, .GetTheOldAmberCheckText
.done
	call PrintText
	ret

.TakeThisToAPokemonLabText:
	text "しー！"
	line "ないしょ　だけど　このコハク"

	para "ポケモンの　いでんしが　のこってると"
	line "おれは　にらんでるんだ！"

	para "もし　いきかえらせたら"
	line "#の　いちだい　はっけんだ！"

	para "でも　ここの　なかまは"
	line "おれの　いうこと　しんじないんだ"

	para "⋯⋯それで"
	line "きみに　たのみが　ある！"

	para "これを　どこかの"
	line "けんきゅうじょに　もって　いって"

	para "しらべて　ほしいんだ！"
	prompt

.ReceivedOldAmberText:
	text "<PLAYER>は　おじさんから"
	line "ひみつのコハクを　もらった！@"
	sound_get_item_1
	text_end

.GetTheOldAmberCheckText:
	text "<⋯>しー！"
	line "コハク　よろしく　たのむよ！"
	done

.YouDontHaveSpaceText:
	text "もちものが　いっぱいだ"
	done

Museum1FPrintScientist3Text::
	ld hl, .Text
	call PrintText
	ret

.Text:
	text "ここでは　せかいでも　めずらしい"
	line "こだい　#の　カセキのうち"

	para "２しゅるいを　てんじ　してます！"
	done

Museum1FPrintOldAmberText::
	ld hl, .Text
	call PrintText
	ret

.Text:
	text "こがねいろに　すき　とおった"
	line "きれいな　コハクが　ある！"
	done
