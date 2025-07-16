PokecenterChanseyText::
	ld hl, NurseChanseyText
	call PrintText
	ld a, CHANSEY
	call PlayCry
	call WaitForSoundToFinish
	ret

NurseChanseyText:
	text "ラッキー『ラッキー"
	done
