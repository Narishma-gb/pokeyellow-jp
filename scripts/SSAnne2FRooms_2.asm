SSAnne2FRoomsPrintGentleman5Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "セキチク　シティ　サファリ　ゾーン"
	line "いった　こと　あるかね？"

	para "あそこは　めずらしい　#が"
	line "たくさん　いた！"
	done

SSAnne2FRoomsPrintLittleBoyText::
	ld hl, .text
	call PrintText
	ret

.text
	text "パパも　ぼくも"
	line "サファリ　ゾーン　だいすき！"
	cont "また　あそびに　いきたいな！"
	done

SSAnne2FRoomsPrintBrunetteGirlText::
	ld hl, .text
	call PrintText
	ret

.text
	text "せんちょうさん　みたんだけど"
	line "ぐあい　わるいって"
	cont "まっさおな　かお　してたよ！"
	done

SSAnne2FRoomsPrintBeautyText::
	ld hl, .text
	call PrintText
	ret

.text
	text "けっこう　おおい　らしいわ！"
	line "ふなよい　する　ひと！"
	done
