ViridianCityPrintYoungster1Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "きみが　こしに　つけてる"
	line "その　モンスターボールは<⋯>！"
	cont "まさしく　#だね！"

	para "いつでも　#の　だしいれが"
	line "じゆうに　できる　なんて"
	cont "べんりな　よのなかだね"
	done

ViridianCityPrintGambler1Text::
	ld hl, .GymLeaderReturnedText
	ld a, [wObtainedBadges]
	cp ~(1 << BIT_EARTHBADGE)
	jr z, .print_text
	CheckEvent EVENT_BEAT_VIRIDIAN_GYM_GIOVANNI
	jr nz, .print_text
	ld hl, .GymAlwaysClosedText
.print_text
	call PrintText
	ret

.GymAlwaysClosedText:
	text "いつ　きても"
	line "この　#　ジムは　しまっとる"

	para "いったい　どんな　ヤツが"
	line "リーダーを　しとるんじゃろか？"
	done

.GymLeaderReturnedText:
	text "トキワ　ジムの　リーダーが"
	line "かえって　きたぞ！"
	done

ViridianCityPrintYoungster2Text::
	ld hl, .YouWantToKnowAboutText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ld hl, .OkThenText
	jr nz, .no
	ld hl, .CaterpieAndWeedleDescriptionText
.no
	call PrintText
	ret

.YouWantToKnowAboutText:
	text "いもむし　#には"
	line "２しゅるい　いるって　しらない？"
	done

.OkThenText:
	text "それなら　いいんだ！"
	done

.CaterpieAndWeedleDescriptionText:
	text "キャタピーは　どくが　ないけど"
	line "ビードルには　どくが　あるよ"

	para "#が　さされないように"
	line "きを　つけようね"
	done

ViridianCityPrintGirlText::
	ld hl, .WhenIGoShopText
	CheckEvent EVENT_GOT_POKEDEX
	jr nz, .got_pokedex
	ld hl, .HasntHadHisCoffeeYetText
.got_pokedex
	call PrintText
	ret

.HasntHadHisCoffeeYetText:
	text "あらら　じいちゃん！"
	line "こんな　ところで　ねちゃって"
	cont "しょーが　ないわね！"
	cont "よいが　さめるまで　まつしかないわ"
	done

.WhenIGoShopText:
	text "ときどき　ニビシティまで"
	line "おかいものに　いきますけど"

	para "トキワのもり　って"
	line "みちが　まがり　くねってるのよ"
	done

ViridianCityPrintOldManSleepyText::
	ld hl, .PrivatePropertyText
	call PrintText
	call StartSimulatingJoypadStates
	ld a, $1
	ld [wSimulatedJoypadStatesIndex], a
	ld a, PAD_DOWN
	ld [wSimulatedJoypadStatesEnd], a
	ld a, SCRIPT_VIRIDIANCITY_PLAYER_MOVING_DOWN
	ld [wViridianCityCurScript], a
	ret

.PrivatePropertyText:
	text "ういーっ！　ひっく<⋯>　まちやがれ！"
	line "わしの　はなしを　きけ！"

	para "<⋯>　こら！"
	line "いくな！　と　いっとろーが！"
	done

ViridianCityPrintFisherText::
	CheckEvent EVENT_GOT_TM42
	jr nz, .got_item
	ld hl, .YouCanHaveThisText
	call PrintText
	lb bc, TM_DREAM_EATER, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .ReceivedTM42Text
	call PrintText
	SetEvent EVENT_GOT_TM42
	ret
.bag_full
	ld hl, .TM42NoRoomText
	call PrintText
	ret
.got_item
	ld hl, .TM42ExplanationText
	call PrintText
	ret

.YouCanHaveThisText:
	text "ふあー！"
	line "ひなたぼっこ　してて"
	cont "ねむって　しまった！"

	para "<⋯>　へんな　ゆめを　みた"
	line "スリープが　ゆめを　くっていた！"
	cont "<⋯>およ？　ぼく　いつのまに"
	cont "<TM>　もってるけど？"

	para "うーん"
	line "きみが　わるい！"
	cont "これ　きみに　あげる！"
	prompt

.ReceivedTM42Text:
	text "<PLAYER>は　にいちゃんから"
	line "<TM>４２を　もらった！@"
	sound_get_item_2
	text_end

.TM42ExplanationText:
	text "<TM>４２の　なかみは<⋯>"
	line "ゆめくい　だよ<⋯>"
	cont "<⋯>　ぐー<⋯>"
	done

.TM42NoRoomText:
	text "にもつ　いっぱい　じゃん"
	done

ViridianCityPrintOldManText::
	ld hl, .WantMeToShowYouAgainText
	call PrintText
	ld c, 2
	call DelayFrames
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .refused
	ld hl, .WatchCloselyText
	call PrintText
	ld a, SCRIPT_VIRIDIANCITY_OLD_MAN_START_CATCH_TRAINING
	ld [wViridianCityCurScript], a
	jr .done
.refused
	ld hl, .NotGoodEnoughForYouText
	call PrintText
.done
	ret

.WantMeToShowYouAgainText:
	text "なんじゃ！？"
	line "また　つかまえかたの"
	cont "おてほんを　みに　きたのか？"
	done

.WatchCloselyText:
	text "ほっほう！"
	line "では<⋯>　わしが"
	cont "おてほんを　みせて　やるかな！"
	done

.NotGoodEnoughForYouText:
	text "そうか<⋯><⋯><⋯>"
	line "わしは　うまくないからなー"
	done

ViridianCityPrintSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "ここは　トキワシティ"
	line "トキワは　みどり　えいえんのいろ"
	done

ViridianCityPrintTrainerTips1Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おとくな　けいじばん！"

	para "とにかく　#を　つかまえて"
	line "ドンドン　ふやそう！"
	cont "<TRAINER>との　しょうぶも"
	cont "たくさん　もってると　ゆうり！"
	done

ViridianCityPrintTrainerTips2Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おとくな　けいじばん！"

	para "#には　たいりょくの　ほか"
	line "わざを　くりだす　げんきの　もと"
	cont "パワーポイントが　あります"

	para "わざ　ごとの　パワーポイントが"
	line "なくなった　ときも"
	cont "#センターで　やすませて！"
	done

ViridianCityPrintGymSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "トキワ　#ジム"
	done

ViridianCityPrintGymLockedText::
	ld hl, .text
	call PrintText
	ret

.text
	text "トキワ　ジムのドアには"
	line "カギが　かかって　いた<⋯>！"
	done
