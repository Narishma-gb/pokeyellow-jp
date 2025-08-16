SSAnne2FRooms_Script:
	call DisableAutoTextBoxDrawing
	ld hl, SSAnne2FRooms_TrainerHeaders
	ld de, SSAnne2FRooms_ScriptPointers
	ld a, [wSSAnne2FRoomsCurScript]
	call ExecuteCurMapScriptInTable
	ld [wSSAnne2FRoomsCurScript], a
	ret

SSAnne2FRooms_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_SSANNE2FROOMS_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_SSANNE2FROOMS_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_SSANNE2FROOMS_END_BATTLE

SSAnne2FRooms_TextPointers:
	def_text_pointers
	dw_const SSAnne2FRoomsGentleman1Text,   TEXT_SSANNE2FROOMS_GENTLEMAN1
	dw_const SSAnne2FRoomsFisherText,       TEXT_SSANNE2FROOMS_FISHER
	dw_const SSAnne2FRoomsGentleman2Text,   TEXT_SSANNE2FROOMS_GENTLEMAN2
	dw_const SSAnne2FRoomsCooltrainerFText, TEXT_SSANNE2FROOMS_COOLTRAINER_F
	dw_const SSAnne2FRoomsGentleman3Text,   TEXT_SSANNE2FROOMS_GENTLEMAN3
	dw_const PickUpItemText,                TEXT_SSANNE2FROOMS_MAX_ETHER
	dw_const SSAnne2FRoomsGentleman4Text,   TEXT_SSANNE2FROOMS_GENTLEMAN4
	dw_const SSAnne2FRoomsGrampsText,       TEXT_SSANNE2FROOMS_GRAMPS
	dw_const PickUpItemText,                TEXT_SSANNE2FROOMS_RARE_CANDY
	dw_const SSAnne2FRoomsGentleman5Text,   TEXT_SSANNE2FROOMS_GENTLEMAN5
	dw_const SSAnne2FRoomsLittleBoyText,    TEXT_SSANNE2FROOMS_LITTLE_BOY
	dw_const SSAnne2FRoomsBrunetteGirlText, TEXT_SSANNE2FROOMS_BRUNETTE_GIRL
	dw_const SSAnne2FRoomsBeautyText,       TEXT_SSANNE2FROOMS_BEAUTY

	def_trainers SSAnne2FRooms
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_0, 2, Gentleman1
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_1, 3, Fisher
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_2, 3, Gentleman2
	trainer EVENT_BEAT_SS_ANNE_9_TRAINER_3, 2, CooltrainerF
	db -1 ; end

SSAnne2FRoomsGentleman1Text:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsFisherText:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsGentleman2Text:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsCooltrainerFText:
	text_asm
	ld hl, SSAnne2FRooms_TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

SSAnne2FRoomsGentleman3Text:
	text_asm
	call SaveScreenTilesToBuffer1
	ld hl, .Text
	call PrintText
	call LoadScreenTilesFromBuffer1
	ld a, SNORLAX
	call DisplayPokedex
	jp TextScriptEnd

.Text:
	text "せかい　じゅうを　たび　してきたが"
	line "ねむって　ばかりの　あいつを"
	cont "みつけたときは　ほんとに　あきれた"

	para "たしか<⋯>！"
	line "こんな　#　だった"
	prompt

SSAnne2FRoomsGentleman4Text:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "にんげんを　のせて"
	line "みずの　うえ　はしる　#"
	cont "みたこと　ある　アルよ！"
	done

SSAnne2FRoomsGrampsText:
	text_asm
	ld hl, .Text
	call PrintText
	jp TextScriptEnd

.Text:
	text "ほそい　き　なら　#の"
	line "いあいぎりで　きりたおせる　じゃろ"
	done

SSAnne2FRoomsGentleman5Text:
	text_asm
	farcall SSAnne2FRoomsPrintGentleman5Text
	jp TextScriptEnd

SSAnne2FRoomsLittleBoyText:
	text_asm
	farcall SSAnne2FRoomsPrintLittleBoyText
	jp TextScriptEnd

SSAnne2FRoomsBrunetteGirlText:
	text_asm
	farcall SSAnne2FRoomsPrintBrunetteGirlText
	jp TextScriptEnd

SSAnne2FRoomsBeautyText:
	text_asm
	farcall SSAnne2FRoomsPrintBeautyText
	jp TextScriptEnd

SSAnne2FRoomsGentleman1BattleText:
	text "わかもの　との　しょうぶ　こそ"
	line "じんせいの　たのしみ！"
	done

SSAnne2FRoomsGentleman1EndBattleText:
	text "いい　しょうぶ！"
	line "わかがえる　ようだ"
	prompt

SSAnne2FRoomsGentleman1AfterBattleText:
	text "１５ねん　まえ　なら"
	line "わたしが　かって　いた　だろう！"
	done

SSAnne2FRoomsFisherBattleText:
	text "おれが　つった"
	line "じまんの　さかなを　みろ！"
	done

SSAnne2FRoomsFisherEndBattleText:
	text "もう　からっぽ！"
	prompt

SSAnne2FRoomsFisherAfterBattleText:
	text "<⋯>　パーティ？"

	para "せんじょう　パーティは"
	line "もう　おわった　ころ　じゃないかな"
	done

SSAnne2FRoomsGentleman2BattleText:
	text "きみは<⋯>　つよい　#と"
	line "めずらしい　#"
	cont "どっちに　かちを　かんじるかね？"
	done

SSAnne2FRoomsGentleman2EndBattleText:
	text "やる　ものだね！"
	prompt

SSAnne2FRoomsGentleman2AfterBattleText:
	text "わたしは<⋯>　めずらしくて"
	line "つよい　#が　ほしいねえ"
	done

SSAnne2FRoomsCooltrainerFBattleText:
	text "あら　せんじょう　パーティでは"
	line "みかけ　なかった　けど<⋯>？"
	done

SSAnne2FRoomsCooltrainerFEndBattleText:
	text "てかげん　してよ"
	prompt

SSAnne2FRoomsCooltrainerFAfterBattleText:
	text "いいな　つよい　#！"
	line "いいな<⋯>　いいな<⋯>！"
	done
