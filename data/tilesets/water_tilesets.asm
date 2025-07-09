; tilesets with water
WaterTilesets:
	db OVERWORLD
	db FOREST
	db DOJO
	db GYM
	db SHIP
	db SHIP_PORT
	db CAVERN
	db FACILITY
	db PLATEAU
	db -1 ; end

; tiles that allow surfing and fishing,
; depending on the tileset (see IsNextTileShoreOrWater)
ShoreTiles:
	db $48 ; eastern shore tile in Safari Zone
	db $32 ; usual eastern shore tile
	; fallthrough
WaterTile:
	db $14
	db -1 ; end
