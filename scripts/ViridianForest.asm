ViridianForest_Script:
	call EnableAutoTextBoxDrawing
	ld hl, ViridianForest_TrainerHeaders
	ld de, ViridianForest_ScriptPointers
	ld a, [wViridianForestCurScript]
	call ExecuteCurMapScriptInTable
	ld [wViridianForestCurScript], a
	ret

ViridianForest_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_VIRIDIANFOREST_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_VIRIDIANFOREST_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_VIRIDIANFOREST_END_BATTLE

ViridianForest_TextPointers:
	def_text_pointers
	dw_const ViridianForestYoungster1Text,      TEXT_VIRIDIANFOREST_YOUNGSTER1
	dw_const ViridianForestYoungster2Text,      TEXT_VIRIDIANFOREST_YOUNGSTER2
	dw_const ViridianForestYoungster3Text,      TEXT_VIRIDIANFOREST_YOUNGSTER3
	dw_const ViridianForestYoungster4Text,      TEXT_VIRIDIANFOREST_YOUNGSTER4
	dw_const ViridianForestCooltrainerFText,    TEXT_VIRIDIANFOREST_COOLTRAINER_F
	dw_const ViridianForestYoungster5Text,      TEXT_VIRIDIANFOREST_YOUNGSTER5
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_POTION1
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_POTION2
	dw_const PickUpItemText,                    TEXT_VIRIDIANFOREST_POKE_BALL
	dw_const ViridianForestYoungster6Text,      TEXT_VIRIDIANFOREST_YOUNGSTER6
	dw_const ViridianForestTrainerTips1Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS1
	dw_const ViridianForestUseAntidoteSignText, TEXT_VIRIDIANFOREST_USE_ANTIDOTE_SIGN
	dw_const ViridianForestTrainerTips2Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS2
	dw_const ViridianForestTrainerTips3Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS3
	dw_const ViridianForestTrainerTips4Text,    TEXT_VIRIDIANFOREST_TRAINER_TIPS4
	dw_const ViridianForestLeavingSignText,     TEXT_VIRIDIANFOREST_LEAVING_SIGN

	def_trainers ViridianForest, 2
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_0, 4, Youngster2
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_1, 4, Youngster3
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_2, 1, Youngster4
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_3, 0, CooltrainerF
	trainer EVENT_BEAT_VIRIDIAN_FOREST_TRAINER_4, 4, Youngster5
	db -1 ; end

ViridianForestYoungster1Text:
	text "ともだちと　むし　#"
	line "とりに　きてるんだ！"

	para "#　しょうぶ　したくて"
	line "みんな　ウズウズ　してるよ！"
	done

ViridianForestYoungster2Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader0
	jr ViridianForestTalkToTrainer

ViridianForestYoungster3Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader1
	jr ViridianForestTalkToTrainer

ViridianForestYoungster4Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader2
	jr ViridianForestTalkToTrainer

ViridianForestCooltrainerFText:
	text_asm
	ld hl, ViridianForest_TrainerHeader3
	jr ViridianForestTalkToTrainer

ViridianForestYoungster5Text:
	text_asm
	ld hl, ViridianForest_TrainerHeader4
ViridianForestTalkToTrainer:
	call TalkToTrainer
	jp TextScriptEnd

ViridianForestYoungster2BattleText:
	text "よーしッ！"
	line "きみは　#　もってるな？"
	cont "しょうぶ　しようぜ！"
	done

ViridianForestYoungster2EndBattleText:
	text "まけたあ！"
	line "キャタピー　なんか　じゃ　ダメか"
	prompt

ViridianForestYoungster2AfterBattleText:
	text "しッ<⋯>！"
	line "むしが　にげる　から　またな！"
	done

ViridianForestYoungster3BattleText:
	text "おーいッ！"
	line "#　<TRAINER>なら"
	cont "しょうぶは　ことわれ　ないぜ！"
	done

ViridianForestYoungster3EndBattleText:
	text "あれ？"
	line "もう　#が　ないや"
	prompt

ViridianForestYoungster3AfterBattleText:
	text "くやしいな！"
	line "つよいのを　つかまえて　こよう！"
	done

ViridianForestYoungster4BattleText:
	text "ちょっと　まったあ！"
	line "そんな　いそいで　どこに　いく？"
	done

ViridianForestYoungster4EndBattleText:
	text "まいった！"
	line "きみは　つよいな！"
	prompt

ViridianForestYoungster4AfterBattleText:
	text "みえない　ところ　でも　ホントは"
	line "なにか　おちてたり　する！"

	para "さっき　おとしもの　したんだ"
	line "きみも　さがして　みて　くれる？"
	done

ViridianForestCooltrainerFBattleText:
	text "ねえ　ねえ"
	line "あなた　ピカチュウ　もってる？"
	done

ViridianForestCooltrainerFEndBattleText:
	text "うそでしょー！？"
	prompt

ViridianForestCooltrainerFAfterBattleText:
	text "こんなに　さがしても　ピカチュウ"
	line "ぜんぜん　みつからないの"
	cont "きっと　ここには　いないのよ！"
	done

ViridianForestYoungster5BattleText:
	text "さいきょうの　<TRAINER>を　めざす"
	line "ぼくに　かてるかな？"
	done

ViridianForestYoungster5EndBattleText:
	text "<⋯>　せっかく"
	line "キャタピーから　そだてたのに"
	prompt

ViridianForestYoungster5AfterBattleText:
	text "かたくて　こうげき　できる"
	line "トランセルって　さいこうだよ！"
	done

ViridianForestYoungster6Text:
	text "#　とろうとして"
	line "モンスターボール　なげてたら"
	cont "すぐ　なくなっちゃった"

	para "きみも　おおめに"
	line "かって　おくと　いいよ"
	done

ViridianForestTrainerTips1Text:
	text_asm
	ld hl, ViridianForestPrintTrainerTips1Text
	jp ViridianForestSign_Common

ViridianForestUseAntidoteSignText:
	text_asm
	ld hl, ViridianForestPrintUseAntidoteSignText
	jp ViridianForestSign_Common

ViridianForestTrainerTips2Text:
	text_asm
	ld hl, ViridianForestPrintTrainerTips2Text
	jp ViridianForestSign_Common

ViridianForestTrainerTips3Text:
	text_asm
	ld hl, ViridianForestPrintTrainerTips3Text
	jp ViridianForestSign_Common

ViridianForestTrainerTips4Text:
	text_asm
	ld hl, ViridianForestPrintTrainerTips4Text
	jp ViridianForestSign_Common

ViridianForestLeavingSignText:
	text_asm
	ld hl, ViridianForestPrintTrainerTips1Text ; supposed to be ViridianForestPrintLeavingSignText
ViridianForestSign_Common:
	ld b, BANK(ViridianForestPrintTrainerTips1Text)
	call Bankswitch
	jp TextScriptEnd
