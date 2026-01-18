FanClubPicture1:
	ld a, RAPIDASH
	ld [wCurPartySpecies], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre FanClubPicture1Text
	ret

FanClubPicture1Text::
	text "わしの　かわいい　ギャロップ"
	done

FanClubPicture2:
	ld a, FEAROW
	ld [wCurPartySpecies], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre FanClubPicture2Text
	ret

FanClubPicture2Text::
	text "わしの　いとしい　オニドリル"
	done
