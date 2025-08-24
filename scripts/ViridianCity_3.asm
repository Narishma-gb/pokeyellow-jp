ViridianCityMovePikachu::
	ld hl, ViridianCityPikachuMovementData
	ld b, SPRITE_FACING_RIGHT
	call TryApplyPikachuMovementData
	ret

ViridianCityPikachuMovementData:
	db $00
	db $1d
	db $1f
	db $38
	db $3f
