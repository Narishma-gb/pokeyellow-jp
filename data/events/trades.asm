TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH - 1
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	db LICKITUNG,  DUGTRIO,  TRADE_DIALOGSET_CASUAL,    "ぐりお@@"
	db CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL,    "マイム@@"
	db BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,     "チクチク@" ; unused
	db KANGASKHAN, MUK,      TRADE_DIALOGSET_CASUAL,    "ベタぼう@"
	db MEW,        MEW,      TRADE_DIALOGSET_HAPPY,     "まつみや@" ; unused
	db TANGELA,    PARASECT, TRADE_DIALOGSET_CASUAL,    "つんつん@"
	db PIDGEOT,    PIDGEOT,  TRADE_DIALOGSET_EVOLUTION, "まつみや@" ; unused
	db GOLDUCK,    RHYDON,   TRADE_DIALOGSET_EVOLUTION, "ごんすけ@"
	db GROWLITHE,  DEWGONG,  TRADE_DIALOGSET_HAPPY,     "セザンヌ@"
	db CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,     "リッキー@"
	assert_table_length NUM_NPC_TRADES
