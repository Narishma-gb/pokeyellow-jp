CeladonMansion3FPrintGameProgramPCText::
	ld hl, .text
	call PrintText
	ret

.text
	text "ゲームの　プログラムだ！"
	line "これ　かえたら　バグる　かも"
	done

CeladonMansion3FPrintPlayingGamePCText::
	ld hl, .text
	call PrintText
	ret

.text
	text "<PC>で　しごと　ちゅう<⋯>"
	line "と　おもったら　ゲーム　だった！"
	done

CeladonMansion3FPrintGameScriptPCText::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　ポケモンの　シナリオだ！"
	line "これは　エンディングだ！"
	cont "いまは　みないで　おこう<⋯>！"
	done

CeladonMansion3FPrintDevRoomSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "ゲームフリーク　かいはつ　しつ"
	done
