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


INCLUDE "main.asm"


SECTION "rom62", ROMX
; ROM $3e : $F8000 - $FBFFF
	set_bank_offset 62

	dr SurfingPikachuMinigame, 62, $4000
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
