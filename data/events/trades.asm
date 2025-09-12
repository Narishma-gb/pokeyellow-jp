MACRO npctrade
; give mon, get mon, dialog id, nickname
	db \1, \2, \3
	dname \4
ENDM

TradeMons:
; entries correspond to TRADE_FOR_* constants
	table_width 3 + NAME_LENGTH - 1
	; give mon, get mon, dialog id, nickname
	; The two instances of TRADE_DIALOGSET_EVOLUTION are a leftover
	; from the Japanese Blue trades, which used species that evolve.
	npctrade LICKITUNG,  DUGTRIO,  TRADE_DIALOGSET_CASUAL,    "ぐりお"
	npctrade CLEFAIRY,   MR_MIME,  TRADE_DIALOGSET_CASUAL,    "マイム"
	npctrade BUTTERFREE, BEEDRILL, TRADE_DIALOGSET_HAPPY,     "チクチク" ; unused
	npctrade KANGASKHAN, MUK,      TRADE_DIALOGSET_CASUAL,    "ベタぼう"
	npctrade MEW,        MEW,      TRADE_DIALOGSET_HAPPY,     "まつみや" ; unused
	npctrade TANGELA,    PARASECT, TRADE_DIALOGSET_CASUAL,    "つんつん"
	npctrade PIDGEOT,    PIDGEOT,  TRADE_DIALOGSET_EVOLUTION, "まつみや" ; unused
	npctrade GOLDUCK,    RHYDON,   TRADE_DIALOGSET_EVOLUTION, "ごんすけ"
	npctrade GROWLITHE,  DEWGONG,  TRADE_DIALOGSET_HAPPY,     "セザンヌ"
	npctrade CUBONE,     MACHOKE,  TRADE_DIALOGSET_HAPPY,     "リッキー"
	assert_table_length NUM_NPC_TRADES
