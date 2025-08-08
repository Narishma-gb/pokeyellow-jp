CeladonDiner_Script:
	call EnableAutoTextBoxDrawing
	ret

CeladonDiner_TextPointers:
	def_text_pointers
	dw_const CeladonDinerCookText,            TEXT_CELADONDINER_COOK
	dw_const CeladonDinerMiddleAgedWomanText, TEXT_CELADONDINER_MIDDLE_AGED_WOMAN
	dw_const CeladonDinerMiddleAgedManText,   TEXT_CELADONDINER_MIDDLE_AGED_MAN
	dw_const CeladonDinerFisherText,          TEXT_CELADONDINER_FISHER
	dw_const CeladonDinerGymGuideText,        TEXT_CELADONDINER_GYM_GUIDE

CeladonDinerCookText:
	text "らっしゃい！"

	para "じょうれん　ばかりで　わるいね！"
	done

CeladonDinerMiddleAgedWomanText:
	text "うちで　かってる　#<⋯>"
	line "たいりょく　ないから　いつも"
	cont "デパートで　おくすり　かって　くるの"
	done

CeladonDinerMiddleAgedManText:
	text "ひそひそ<⋯>　むしゃ　むしゃ<⋯>"
	line "<⋯>　ゲーム　コーナーの　したに"
	cont "ちかしつが　ある　らしいね<⋯>"
	done

CeladonDinerFisherText:
	text "もぐもぐ<⋯>！"

	para "あそこの　テーブルの　おっさん"
	line "スロットで　おかね　ぜんぶ"
	cont "つかっちゃった　らしいよ！"
	done

CeladonDinerGymGuideText:
	text_asm
	callfar CeladonDinerPrintGymGuideText
	jp TextScriptEnd
