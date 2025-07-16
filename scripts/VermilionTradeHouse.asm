VermilionTradeHouse_Script:
	jp EnableAutoTextBoxDrawing

VermilionTradeHouse_TextPointers:
	def_text_pointers
	dw_const VermilionTradeHouseGentlemanText, TEXT_VERMILIONTRADEHOUSE_GENTLEMAN

VermilionTradeHouseGentlemanText:
	text "ひでんマシンで"
	line "おぼえさせた　わざは"
	cont "わすれさせることが　できない"

	para "おぼえさせるときは"
	line "よく　かんがえた　ほうが　いいな"
	done
