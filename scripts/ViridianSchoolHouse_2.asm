ViridianSchoolHousePrintLittleGirlText::
	ld hl, .text
	call PrintText
	ret

.text
	text "おねえちゃんが　いってたけど"
	line "#って　だいじに　してると"
	cont "なついて　くれるんだって"
	done

ViridianSchoolHousePrintCooltrainerFText::
	ld hl, .text
	call PrintText
	ret

.text
	text "はい！"

	para "こくばんに　かかれてる　こと"
	line "ちゃんと　みて！"
	done
