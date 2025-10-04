SECTION "Garbage Header", ROM0
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_header.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_header.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_header.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_header.bin"
ENDC


SECTION "Garbage 0", ROM0
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_0.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_0.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_0.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_0.bin"
ENDC


SECTION "Garbage 1", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_1.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_1.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_1.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_1.bin"
ENDC


IF DEF(_REV0) || DEF(_REV1) || DEF(_REV2)

	SECTION "Garbage 2", ROMX, BANK[2]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_2.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_2.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_2.bin"
	ENDC


	SECTION "Garbage 3", ROMX, BANK[3]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_3.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_3.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_3.bin"
	ENDC


	SECTION "Garbage 4", ROMX, BANK[4]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_4.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_4.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_4.bin"
	ENDC


	SECTION "Garbage 5", ROMX, BANK[5]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_5.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_5.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_5.bin"
	ENDC

ENDC


SECTION "Garbage 6", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_6.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_6.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_6.bin"
ELIF DEF(_REV3)
	db $FF, $20
ENDC


SECTION "Garbage 7", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_7.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_7.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_7.bin"
ELIF DEF(_REV3)
	db $56, $7F, $56, $57
ENDC


IF DEF(_REV0) || DEF(_REV1) || DEF(_REV2)

	SECTION "Garbage 8", ROMX, BANK[8]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_8.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_8.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_8.bin"
	ENDC


	SECTION "Garbage 9", ROMX, BANK[9]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_9.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_9.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_9.bin"
	ENDC


	SECTION "Garbage 10", ROMX, BANK[10]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_10.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_10.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_10.bin"
	ENDC


	SECTION "Garbage 11", ROMX, BANK[11]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_11.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_11.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_11.bin"
	ENDC


	SECTION "Garbage 12", ROMX, BANK[12]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_12.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_12.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_12.bin"
	ENDC


	SECTION "Garbage 13", ROMX, BANK[13]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_13.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_13.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_13.bin"
	ENDC


	SECTION "Garbage 14", ROMX, BANK[14]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_14.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_14.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_14.bin"
	ENDC

ENDC


SECTION "Garbage 15", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_15.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_15.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_15.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_15.bin"
ENDC


IF DEF(_REV0) || DEF(_REV1) || DEF(_REV2)

	SECTION "Garbage 16", ROMX, BANK[16]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_16.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_16.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_16.bin"
	ENDC

ENDC


SECTION "Garbage 17", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_17.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_17.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_17.bin"
ELIF DEF(_REV3)
	db $D6, $CB, $E6, $C9
ENDC


SECTION "Garbage 18", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_18.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_18.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_18.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_18.bin"
ENDC


IF DEF(_REV0) || DEF(_REV1) || DEF(_REV2)

	SECTION "Garbage 19", ROMX, BANK[19]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_19.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_19.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_19.bin"
	ENDC


	SECTION "Garbage 20", ROMX, BANK[20]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_20.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_20.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_20.bin"
	ENDC


	SECTION "Garbage 21", ROMX, BANK[21]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_21.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_21.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_21.bin"
	ENDC


	SECTION "Garbage 22", ROMX, BANK[22]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_22.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_22.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_22.bin"
	ENDC

ENDC


SECTION "Garbage 23", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_23.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_23.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_23.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_23.bin"
ENDC


SECTION "Garbage 24", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_24.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_24.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_24.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_24.bin"
ENDC


IF DEF(_REV0) || DEF(_REV1) || DEF(_REV2)

	SECTION "Garbage 26", ROMX, BANK[26]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_26.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_26.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_26.bin"
	ENDC


	SECTION "Garbage 28", ROMX, BANK[28]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_28.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_28.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_28.bin"
	ENDC


	SECTION "Garbage 29", ROMX, BANK[29]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_29.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_29.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_29.bin"
	ENDC


	SECTION "Garbage 30", ROMX, BANK[30]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_30.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_30.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_30.bin"
	ENDC


	SECTION "Garbage 31", ROMX, BANK[31]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_31.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_31.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_31.bin"
	ENDC


	SECTION "Garbage 32", ROMX, BANK[32]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_32.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_32.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_32.bin"
	ENDC


	SECTION "Garbage 33", ROMX, BANK[33]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_33.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_33.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_33.bin"
	ENDC


	SECTION "Garbage 34", ROMX, BANK[34]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_34.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_34.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_34.bin"
	ENDC


	SECTION "Garbage 35", ROMX, BANK[35]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_35.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_35.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_35.bin"
	ENDC


	SECTION "Garbage 36", ROMX, BANK[36]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_36.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_36.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_36.bin"
	ENDC


	SECTION "Garbage 37", ROMX, BANK[37]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_37.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_37.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_37.bin"
	ENDC


	SECTION "Garbage 38", ROMX, BANK[38]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_38.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_38.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_38.bin"
	ENDC


	SECTION "Garbage 39", ROMX, BANK[39]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_39.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_39.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_39.bin"
	ENDC


	SECTION "Garbage 40", ROMX, BANK[40]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_40.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_40.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_40.bin"
	ENDC


	SECTION "Garbage 41", ROMX, BANK[41]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_41.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_41.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_41.bin"
	ENDC


	SECTION "Garbage 42", ROMX, BANK[42]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_42.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_42.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_42.bin"
	ENDC


	SECTION "Garbage 43", ROMX, BANK[43]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_43.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_43.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_43.bin"
	ENDC


	SECTION "Garbage 44", ROMX, BANK[44]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_44.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_44.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_44.bin"
	ENDC


	SECTION "Garbage 45", ROMX, BANK[45]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_45.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_45.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_45.bin"
	ENDC


	SECTION "Garbage 46", ROMX, BANK[46]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_46.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_46.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_46.bin"
	ENDC


	SECTION "Garbage 47", ROMX, BANK[47]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/bank_47.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/bank_47.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/bank_47.bin"
	ENDC


	SECTION "Garbage 48", ROMX, BANK[48]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_48.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_48.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_48.bin"
	ENDC


	SECTION "Garbage 49", ROMX, BANK[49]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_49.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_49.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_49.bin"
	ENDC


	SECTION "Garbage 51", ROMX, BANK[51]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_51.bin"
	ELIF DEF(_REV1) || DEF(_REV2)
		INCBIN "garbage/rev_1/garbage_51.bin"
	ENDC


	SECTION "Garbage 52", ROMX, BANK[52]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_52.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_52.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_52.bin"
	ENDC


	SECTION "Garbage 53", ROMX, BANK[53]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_53.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_53.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_53.bin"
	ENDC


	SECTION "Garbage 54", ROMX, BANK[54]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_54.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_54.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_54.bin"
	ENDC


	SECTION "Garbage 55", ROMX, BANK[55]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_55.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_55.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_55.bin"
	ENDC


	SECTION "Garbage 56", ROMX, BANK[56]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_56.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_56.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_56.bin"
	ENDC


	SECTION "Garbage 57", ROMX, BANK[57]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_57.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_57.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_57.bin"
	ENDC


	SECTION "Garbage 58", ROMX, BANK[58]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_58.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_58.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_58.bin"
	ENDC


	SECTION "Garbage 59", ROMX, BANK[59]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_59.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_59.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_59.bin"
	ENDC


	SECTION "Garbage 60", ROMX, BANK[60]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_60.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_60.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_60.bin"
	ENDC


	SECTION "Garbage 61", ROMX, BANK[61]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_61.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_61.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_61.bin"
	ENDC


	SECTION "Garbage 62", ROMX, BANK[62]
	IF DEF(_REV0)
		INCBIN "garbage/rev_0/garbage_62.bin"
	ELIF DEF(_REV1)
		INCBIN "garbage/rev_1/garbage_62.bin"
	ELIF DEF(_REV2)
		INCBIN "garbage/rev_2/garbage_62.bin"
	ENDC

ENDC


SECTION "Garbage 63", ROMX
IF DEF(_REV0)
	INCBIN "garbage/rev_0/garbage_63.bin"
ELIF DEF(_REV1)
	INCBIN "garbage/rev_1/garbage_63.bin"
ELIF DEF(_REV2)
	INCBIN "garbage/rev_2/garbage_63.bin"
ELIF DEF(_REV3)
	INCBIN "garbage/rev_3/garbage_63.bin"
ENDC
