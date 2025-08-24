; \1 current label
; \2 label offset
MACRO dr
	ASSERT rom_offset >= 0 && rom_offset < 1048576, "Out of bounds ROM offset"
	IF _NARG > 2 && (\2) > 0
		ASSERT (\3) < $8000 && (\3) > $3FFF, "Wrong bank address format"
		DEF label_offset = ((\2) - 1) * $4000 + (\3)
	ELSE
		DEF label_offset = \2
	ENDC
	ASSERT label_offset - rom_offset >= 0, "Negative binary INCLUDE"
	INCBIN "pkmy.bin", rom_offset, label_offset - rom_offset
	DEF rom_offset = label_offset
	\1::
ENDM

MACRO dr_end
	ASSERT rom_offset >= 0 && rom_offset < 1048576, "Out of bounds ROM offset"
	ASSERT ((\1) + 1) * 16384 - rom_offset >= 0, "Negative binary INCLUDE"
	INCBIN "pkmy.bin", rom_offset, ((\1) + 1) * 16384 - rom_offset
ENDM

MACRO set_bank_offset
	IF _NARG == 1
		DEF rom_offset = (\1) * 16384
	ELIF (\1) == 0
		DEF rom_offset = \2
	ELSE
		ASSERT (\2) < $8000 && (\2) > $3FFF, "Wrong bank address format"
		DEF rom_offset = ((\1) - 1) * $4000 + (\2)
	ENDC
ENDM


INCLUDE "constants_wip.asm"
INCLUDE "main.asm"


SECTION "rom49", ROMX
; ROM $31 : $C4000 - $C7FFF
	set_bank_offset 49

	dr PikachuCry16, 49, $4000
	dr PikachuCry18, 49, $549A
	dr PikachuCry22, 49, $63A4

	dr_end 49

SECTION "rom50", ROMX
; ROM $32 : $C8000 - $CBFFF
	set_bank_offset 50

	dr PikachuCry20, 50, $4000
	dr PikachuCry21, 50, $6002

	dr_end 50

SECTION "rom51", ROMX
; ROM $33 : $CC000 - $CFFFF
	set_bank_offset 51

	dr PikachuCry19, 51, $4000
	dr PikachuCry24, 51, $5632
	dr PikachuCry26, 51, $725C

	dr_end 51

SECTION "rom52", ROMX
; ROM $34 : $D0000 - $D3FFF
	set_bank_offset 52

	dr PikachuCry17, 52, $4000
	dr PikachuCry23, 52, $4862
	dr PikachuCry25, 52, $573C

	dr_end 52

SECTION "rom53", ROMX
; ROM $35 : $D4000 - $D7FFF
	set_bank_offset 53

	dr PikachuCry27, 53, $4000
	dr PikachuCry28, 53, $4B5A
	dr PikachuCry29, 53, $5DA4
	dr PikachuCry30, 53, $69CE
	dr PikachuCry31, 53, $6E80

	dr_end 53

SECTION "rom54", ROMX
; ROM $36 : $D8000 - $DBFFF
	set_bank_offset 54

	dr PikachuCry32, 54, $4000
	dr PikachuCry33, 54, $458A
	dr PikachuCry34, 54, $523C
	dr PikachuCry41, 54, $6746

	dr_end 54

SECTION "rom55", ROMX
; ROM $37 : $DC000 - $DFFFF
	set_bank_offset 55

	dr PikachuCry35, 55, $4000
	dr PikachuCry36, 55, $522A
	dr PikachuCry39, 55, $6E0C

	dr_end 55

SECTION "rom56", ROMX
; ROM $38 : $E0000 - $E3FFF
	set_bank_offset 56

	dr PikachuCry37, 56, $4000
	dr PikachuCry38, 56, $4DFA
	dr PikachuCry40, 56, $5A64
	dr PikachuCry42, 56, $6976

	dr_end 56

SECTION "rom57", ROMX
; ROM $39 : $E4000 - $E7FFF
	set_bank_offset 57

	dr_end 57

SECTION "rom58", ROMX
; ROM $3a : $E8000 - $EBFFF
	set_bank_offset 58

	dr PrinterSerial_, 58, $42D1
	dr PrintPokedexEntry, 58, $43E7
	dr PrintDiploma, 58, $44B6
	dr PrintPCBox, 58, $453A
	dr PrintFanClubPortrait, 58, $4627
	dr PrinterDebug, 58, $467C
	dr _DisplayDiploma, 58, $5190

	dr_end 58

SECTION "rom59", ROMX
; ROM $3b : $EC000 - $EFFFF
	set_bank_offset 59, $410C


	dr_end 59

SECTION "rom60", ROMX
; ROM $3c : $F0000 - $F3FFF
	set_bank_offset 60, $619C

	dr BillsHousePrintBillPokemonText_cpy, 60, $659A
INCLUDE "scripts/BillsHouse_2.asm"
INCLUDE "scripts/ViridianForest_2.asm"
INCLUDE "scripts/SSAnne2FRooms_2.asm"
INCLUDE "scripts/SilphCo11F_2.asm"
	set_bank_offset 60, $6AEA
CheckForHiddenObject::

	dr Yellow_SampleSecondTrashCan, 60, $71FE

	dr_end 60

SECTION "rom61", ROMX
; ROM $3d : $F4000 - $F7FFF
	set_bank_offset 61

	dr PrintBeginningBattleText, 61, $4000
	dr PrintSendOutMonMessage, 61, $4154
	dr RetreatMon, 61, $41EB
	dr DisplayLinkBattleVersusTextBox, 61, $426A
	dr DoubleSelectedStats, 61, $42A1
	dr HalveSelectedStats, 61, $42C8
	dr _ScrollTrainerPicAfterBattle, 61, $42F4
	dr StarterPikachuBattleEntranceAnimation, 61, $433A
	dr DecrementPP, 61, $4376
	dr ModifyPikachuHappiness, 61, $43A5
	dr RedPicBack, 61, $444C
	dr OldManPicBack, 61, $44DC
	dr ProfOakPicBack, 61, $456D
	dr LinkMenu, 61, $4BE6
	dr PrintStrengthText, 61, $4F0D
	dr IsSurfingAllowed, 61, $4F5F
	dr AddItemToInventory_, 61, $4FC6
	dr RemoveItemFromInventory_, 61, $5036
	dr TrainerInfoTextBoxTileGraphics, 61, $5079
	dr TrainerInfoTextBoxTileGraphicsEnd, 61, $5109
	dr TrainerCardFontGraphics, 61, $5109
	dr BadgeNumbersTileGraphics, 61, $5279
	dr InitBattle, 61, $52F9
	dr InitOpponent, 61, $52FF
	dr LoadMonBackPic, 61, $547C
	dr AnimateSendingOutMon, 61, $54AA
	dr CopyUncompressedPicToTilemap, 61, $54FD
	dr CopyUncompressedPicToHL, 61, $5507
	dr FocusEnergyEffect_, 61, $558C
	dr HealEffect_, 61, $55C6
	dr TransformEffect_, 61, $56B2
	dr ReflectLightScreenEffect_, 61, $579E
	dr MistEffect_, 61, $580E
	dr OneHitKOEffect_, 61, $5848
	dr PayDayEffect_, 61, $5881
	dr ParalyzeEffect_, 61, $58DF
	dr GetMachinePrice, 61, $5951
	dr _Multiply, 61, $598B
	dr _Divide, 61, $59EF
	dr _GivePokemon, 61, $5A77
	dr GetTrainerName_, 61, $5B82
	dr Random_, 61, $5BB9

	dr GetPredefPointer_cpy, 61, $5BCA
INCLUDE "engine/predefs.asm"
	set_bank_offset 61, $5D23

	dr_end 61

SECTION "rom62", ROMX
; ROM $3e : $F8000 - $FBFFF
	set_bank_offset 62

	dr PlayIntroScene, 62, $57C7

	dr_end 62

SECTION "rom63", ROMX
; ROM $3f : $FC000 - $FFFFF
	set_bank_offset 63

	dr MapSongBanks, 63, $4000
	dr MapHeaderPointers, 63, $41F2
	dr MapHeaderBanks, 63, $43E4
	dr SchedulePikachuSpawnForAfterText, 63, $44FA
	dr SetPikachuSpawnOutside, 63, $45FA
	dr SetPikachuSpawnWarpPad, 63, $465B
	dr SetPikachuSpawnBackOutside, 63, $469A
	dr SpawnPikachu_, 63, $46D5
	dr IsPikachuRightNextToPlayer, 63, $4B01
	dr GetPikachuFacingDirectionAndReturnToE, 63, $4B4D
	dr RefreshPikachuFollow, 63, $4BA1
	dr Func_fcc08, 63, $4C08
	dr IsStarterPikachuInOurParty, 63, $4DB8
	dr IsThisPartymonStarterPikachu_Box, 63, $4E0D
	dr IsThisPartymonStarterPikachu_Party, 63, $4E18
	dr IsThisPartymonStarterPikachu, 63, $4E18
	dr UpdatePikachuMoodAfterBattle, 63, $4E5A
	dr CheckPikachuFaintedOrStatused, 63, $4E73
	dr IsPlayerTalkingToPikachu, 63, $4F0C
	dr InitializePikachuTextID, 63, $4F20
	dr PlaySpecificPikachuEmotion, 63, $5001
	dr TalkToPikachu, 63, $5004
	dr PikachuEmotionTable, 63, $5019
	dr PikachuEmotion23_id, 63, $5047
	dr PikachuEmotion26_id, 63, $504D
	dr PikachuEmotion27_id, 63, $504F
	dr PikachuEmotion31_id, 63, $5057
	dr PikachuEmotion32_id, 63, $5059
	dr IsPlayerPikachuAsleepInParty, 63, $50D0
	dr PikachuWalksToNurseJoy, 63, $5252
	dr ApplyPikachuMovementData_, 63, $529A
	dr LoadPikachuShadowIntoVRAM, 63, $582A
	dr OfficerJennySprite, 63, $6662
	dr PikachuSprite, 63, $67E2
	dr SandshrewSprite, 63, $6962
	dr OddishSprite, 63, $6A22
	dr BulbasaurSprite, 63, $6AE2
	dr JigglypuffSprite, 63, $6BA2
	dr ClefairySprite, 63, $6C62
	dr ChanseySprite, 63, $6D22
	dr SurfingPikachuSprite, 63, $6DE2
	dr JessieSprite, 63, $6F62
	dr JamesSprite, 63, $70E2

	dr_end 63
