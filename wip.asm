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
