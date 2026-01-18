AerodactylFossil:
	ld a, FOSSIL_AERODACTYL
	ld [wCurPartySpecies], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre AerodactylFossilText
	ret

AerodactylFossilText::
	text "めずらしい　こだい　#"
	line "プテラの　カセキ"
	done

KabutopsFossil:
	ld a, FOSSIL_KABUTOPS
	ld [wCurPartySpecies], a
	call DisplayMonFrontSpriteInBox
	call EnableAutoTextBoxDrawing
	tx_pre KabutopsFossilText
	ret

KabutopsFossilText::
	text "めずらしい　こだい　#"
	line "カブトプスの　カセキ"
	done
