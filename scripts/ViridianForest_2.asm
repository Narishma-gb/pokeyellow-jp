ViridianForestPrintTrainerTips1Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おとくな　けいじばん！"

	para "もってる　#が　よわって　きて"
	line "たたかわせたく　ない　ときは"
	cont "くさむらを　よけて　かえろう！"
	done

ViridianForestPrintUseAntidoteSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "どくを　くらったら　どくけし！"
	line "フレンドリィショップで！"
	done

ViridianForestPrintTrainerTips2Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おとくな　けいじばん！"

	para "#ずかんは"
	line "<PC>つうしんで"
	cont "オーキドはかせに　みてもらえる！"
	done

ViridianForestPrintTrainerTips3Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おとくな　けいじばん！"

	para "ひとの　#は　ひとの　もの！"
	line "やせいの　#に　だけ"
	cont "モンスターボールを　なげて"
	cont "つかまえよう！"
	done

ViridianForestPrintTrainerTips4Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おとくな　けいじばん！"

	para "#を　つかまえる　ときは"
	line "なるべく　よわらせてから！"

	para "#が　げんきだと"
	line "にげるかも　しれないよ！"
	done

ViridianForestPrintLeavingSignText:
	ld hl, .text
	call PrintText
	ret

.text
	text "トキワの　もり　<⋯>　でぐち"
	line "このさき　ニビ　シティ"
	done
