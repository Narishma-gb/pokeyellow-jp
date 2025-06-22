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

; WRAM
; add Range wPikachuOverworldStateFlags - wd49b
; Check if all labels are used in ROM

INCLUDE "constants_wip.asm"

SECTION "rom0", ROM0
	set_bank_offset 0, $10E4

; Progress:
; home/pokemon.asm
; _LABEL_10E4_

	dr CheckPikachuFollowingPlayer, $151E
	dr LCDC,   $1580
	dr DisableLCD, $1597
	dr EnableLCD, $15B1
	dr IsTilePassable, $15D3
	dr FarCopyData, $15E4
	dr CopyVideoData, $1622
	dr FillMemory, $16C6
	dr CopyData, $16D9
	dr _Start, $1D60
	dr StopAllSounds, $1E20
	dr VBlank, $1E35
	dr DelayFrame, $1EA8
	dr LoadGBPal, $1EB3
	dr GBFadeOutToBlack, $1EE8
	dr GBFadeInFromWhite, $1EEF
	dr Serial, $1FA2
	dr Timer,  $2193
	dr PlayDefaultMusic, $2194
	dr PlayDefaultMusicFadeOutCurrent, $219F
	dr UpdateMusic6Times, $220C
	dr StopAllMusic, $225C
	dr PlaySound, $2261
	dr UpdateSprites, $2349
	dr DisplayTextID, $2881
	dr IsPlayerCharacterBeingControlledByGame, $30BC
	dr RunNPCMovementScript, $30CD
	dr IsSurfingPikachuInParty, $344B
	dr BankswitchHome, $35FA
	dr BankswitchBack, $3609
	dr LoadTextBoxTilePatterns, $36C4
	dr DelayFrames, $3750
	dr JoypadLowSensitivity, $383F
	dr InitMapSprites, $3DC5
	dr Delay3, $3DE6
	dr RunPaletteCommand, $3DFE
	dr ReloadMapSpriteTilePatterns, $3E17
	dr GiveItem, $3E38
	dr BankswitchCommon, $3E77
	dr Bankswitch, $3E7D

	dr Predef_cpy, $3EAD
include "home/predef.asm"
	set_bank_offset 0, $3EE9

	dr CheckForHiddenObjectOrBookshelfOrCardKeyDoor, $3EF2


	dr_end 0

SECTION "rom1", ROMX
; ROM $01 : $4000 - $7FFF
	set_bank_offset 1

	dr PickUpItem, 1, $4CA3
	dr CableClub_Run, 1, $5A39
	dr EmptyFunc, 1, $5A89
	dr Diploma_TextBoxBorder, 1, $5A8A
	dr SpecialEnterMap, 1, $5C1C
	dr DisplayPicCenteredOrUpperRight, 1, $60B1
	dr PrepareForSpecialWarp, 1, $60E6
	dr AskName, 1, $6301
	dr LearnMove, 1, $6D36

	dr_end 1

SECTION "rom2", ROMX
; ROM $02 : $8000 - $BFFF
	set_bank_offset 2

	dr_end 2

SECTION "rom3", ROMX
; ROM $03 : $C000 - $FFFF
	set_bank_offset 3

	dr ReadJoypad, $C000
	dr ClearVariablesOnEnterMap, 3, $4085
	dr IsPlayerStandingOnWarp, 3, $40AF
	dr CheckForceBikeOrSurf, 3, $40DB
	dr IsPlayerFacingEdgeOfMap, 3, $4151
	dr IsWarpTileInFrontOfPlayer, 3, $41A0
	dr IsPlayerStandingOnDoorTileOrWarpTile, 3, $41EF
	dr GetTileAndCoordsInFrontOfPlayer, 3, $42CD
	dr GetTileTwoStepsInFrontOfPlayer, 3, $4305
	dr CheckForCollisionWhenPushingBoulder, 3, $4352
	dr ApplyOutOfBattlePoisonDamage, 3, $43DA
	dr LoadTilesetHeader, 3, $44F0
	dr LoadWildData, 3, $4B5E
	dr IsNextTileShoreOrWater, 3, $6AEB
	dr DrawBadges, 3, $6B63
	dr ReplaceTileBlock, 3, $6FFE
	dr UsedCut, 3, $70B4
	dr MarkTownVisitedAndLoadMissableObjects, 3, $7297
	dr IsObjectHidden, 3, $7326
	dr ShowObject, 3, $7348
	dr ShowObject2, 3, $7348
	dr HideObject, 3, $7357
	dr TryPushingBoulder, 3, $73A5
	dr DoBoulderDustAnimation, 3, $7435
	dr _AddPartyMon, 3, $7465
	dr LoadMovePPs, 3, $75FD
	dr FlagActionPredef, 3, $77F0
	dr HealParty, 3, $782F
	dr DivideBCDPredef, 3, $78A8
	dr DivideBCDPredef2, 3, $78A8
	dr DivideBCDPredef3, 3, $78A8
	dr DivideBCDPredef4, 3, $78A8 
	dr AddBCDPredef, 3, $79A7
	dr SubBCDPredef, 3, $79C0
	dr InitPlayerData, 3,  $79DA
	dr InitPlayerData2, 3, $79DA
	dr GetQuantityOfItemInBag, 3, $7A39
	dr FindPathToPlayer, 3, $7A4E
	dr CalcPositionOfPlayerRelativeToNPC, 3, $7ABD
	dr ConvertNPCMovementDirectionsToJoypadMasks, 3, $7B34
	dr HPBarLength, 3, $7B70
	dr UpdateHPBar, 3, $7BB1
	dr UpdateHPBar2, 3, $7BB1



	dr_end 3

SECTION "rom4", ROMX
; ROM $04 : $10000 - $13FFF
	set_bank_offset 4

	dr DrawHP, 4, $5888
	dr DrawHP2, 4, $588F
	dr StatusScreen, 4, $58E1
	dr StatusScreen2, 4, $5B05
	dr CanLearnTM, 4, $682F
	dr TMToMove, 4, $685C

	dr_end 4

SECTION "rom5", ROMX
; ROM $05 : $14000 - $17FFF
	set_bank_offset 5

	dr RedBikeSprite, 5, $43F1
	dr RedSprite, 5, $4571
	dr SeelSprite, 5, $7AB1

	dr_end 5

SECTION "rom6", ROMX
; ROM $06 : $18000 - $1BFFF
	set_bank_offset 6

	dr PewterGuys, 6, $7BE7
	dr HandleLedges, 6, $7CF6

	dr_end 6

SECTION "rom7", ROMX
; ROM $07 : $1C000 - $1FFFF
	set_bank_offset 7

	dr DisplayElevatorFloorMenu, 7, $427A
	dr SafariZoneCheck, 7, $798C
	dr SafariZoneCheckSteps, 7, $799B

	dr_end 7

SECTION "rom8", ROMX
; ROM $08 : $20000 - $23FFF
	set_bank_offset 8


	dr_end 8

SECTION "rom9", ROMX
; ROM $09 : $24000 - $27FFF
	set_bank_offset 9

	dr PrintMonType, 9, $7D20
	dr PrintMoveType, 9, $7D50

	dr_end 9

SECTION "rom10", ROMX
; ROM $0a : $28000 - $2BFFF
	set_bank_offset 10

	dr ChangeBGPalColor0_4Frames, 10, $7D4C
	dr PredefShakeScreenVertically, 10, $7D61
	dr PredefShakeScreenHorizontally, 10, $7D87

	dr_end 10

SECTION "rom11", ROMX
; ROM $0b : $2C000 - $2FFFF
	set_bank_offset 11
	
	dr ScaleSpriteByTwo, 11, $7DA1

	dr_end 11

SECTION "rom12", ROMX
; ROM $0c : $30000 - $33FFF
	set_bank_offset 12

	dr_end 12

SECTION "rom13", ROMX
; ROM $0d : $34000 - $37FFF
	set_bank_offset 13

	dr_end 13

SECTION "rom14", ROMX
; ROM $0e : $38000 - $3BFFF
	set_bank_offset 14

	dr EvolutionAfterBattle, 14, $7145
	dr LearnMoveFromLevelUp, 14, $73C3
	dr WriteMonMoves, 14, $74F6

	dr_end 14

SECTION "rom15", ROMX
; ROM $0f : $3C000 - $3FFFF
	set_bank_offset 15

	dr AnyPartyAlive, 15, $4BF8
	dr DrawPlayerHUDAndHPBar, 15, $4F6B
	dr DrawEnemyHUDAndHPBar, 15, $4FF6
	dr DoubleOrHalveSelectedStats, 15, $7188
	dr JumpMoveEffect, 15, $73A1

	dr_end 15

SECTION "rom16", ROMX
; ROM $10 : $40000 - $43FFF
	set_bank_offset 16

	dr ShowPokedexMenu, 16, $4000
	dr ShowPokedexData, 16, $42F8
	dr IndexToPokedex, 16, $6819
	dr EmotionBubble, 16, $68EB
	dr InternalClockTradeAnim, 16, $6B61
	dr ExternalClockTradeAnim, 16, $6B72
	dr PlayIntro, 16, $7175

	dr_end 16

SECTION "rom17", ROMX
; ROM $11 : $44000 - $47FFF
	set_bank_offset 17

	dr DisplayDexRating, 17, $428E
	dr LoadSpinnerArrowTiles, 17, $58D9

	dr_end 17

SECTION "rom18", ROMX
; ROM $12 : $48000 - $4BFFF
	set_bank_offset 18

	dr_end 18

SECTION "rom19", ROMX
; ROM $13 : $4C000 - $4FFFF
	set_bank_offset 19

	dr_end 19

SECTION "rom20", ROMX
; ROM $14 : $50000 - $53FFF
	set_bank_offset 20

	dr_end 20

SECTION "rom21", ROMX
; ROM $15 : $54000 - $57FFF
	set_bank_offset 21

	dr TrainerEngage, 21, $7E2E

	dr_end 21

SECTION "rom22", ROMX
; ROM $16 : $58000 - $5BFFF
	set_bank_offset 22

	dr OaksAideScript, 22, $4EC6

	dr_end 22

SECTION "rom23", ROMX
; ROM $17 : $5C000 - $5FFFF
	set_bank_offset 23

	dr StarterDex, 23, $40D4
	dr SetPartyMonTypes, 23, $769E

	dr_end 23

SECTION "rom24", ROMX
; ROM $18 : $60000 - $63FFF
	set_bank_offset 24

	dr_end 24

SECTION "rom25", ROMX
; ROM $19 : $64000 - $67FFF
	set_bank_offset 25

	dr_end 25

SECTION "rom26", ROMX
; ROM $1a : $68000 - $6BFFF
	set_bank_offset 26

	dr_end 26

SECTION "rom27", ROMX
; ROM $1b : $6C000 - $6FFFF
	set_bank_offset 27

	dr_end 27

SECTION "rom28", ROMX
; ROM $1c : $70000 - $73FFF
	set_bank_offset 28

	dr EnterMapAnim, 28, $4561
	dr _LeaveMapAnim, 28, $460F
	dr IsPlayerStandingOnWarpPadOrHole, 28, $47E1
	dr _HandleMidJump, 28, $48F4
	dr BattleTransition, 28, $49E3
	dr FlashScreen, 28, $4BD3
	dr LoadTownMap_Nest, 28, $4FE4
	dr DoInGameTradeDialogue, 28, $5ADD
	dr _RunPaletteCommand, 28, $5F2E
	dr LoadSGB, 28, $6225
	dr LoadSAV, 28, $751F
	dr LoadSAV2, 28, $75FA
	dr SaveSAV, 28, $763D
	dr SaveSAVtoSRAM0, 28, $7718
	dr SaveSAVtoSRAM1, 28, $7765
	dr SaveSAVtoSRAM2, 28, $7789

	dr_end 28

SECTION "rom29", ROMX
; ROM $1d : $74000 - $77FFF
	set_bank_offset 29

	dr_end 29

SECTION "rom30", ROMX
; ROM $1e : $78000 - $7BFFF
	set_bank_offset 30

	dr MoveAnimation, 30, $4D5E
	dr GetIntroMoveSound, 30, $5919
	dr CopyDownscaledMonTiles, 30, $5B6A
	dr CopyTileIDsFromList, 30, $5E7D

	dr_end 30

SECTION "rom31", ROMX
; ROM $1f : $7C000 - $7FFFF
	set_bank_offset 31

	dr_end 31

SECTION "rom32", ROMX
; ROM $20 : $80000 - $83FFF
	set_bank_offset 32

	dr_end 32

SECTION "rom33", ROMX
; ROM $21 : $84000 - $87FFF
	set_bank_offset 33

	dr_end 33

SECTION "rom34", ROMX
; ROM $22 : $88000 - $8BFFF
	set_bank_offset 34

	dr_end 34

SECTION "rom35", ROMX
; ROM $23 : $8C000 - $8FFFF
	set_bank_offset 35

	dr_end 35

SECTION "rom36", ROMX
; ROM $24 : $90000 - $93FFF
	set_bank_offset 36

	dr_end 36

SECTION "rom37", ROMX
; ROM $25 : $94000 - $97FFF
	set_bank_offset 37

	dr_end 37

SECTION "rom38", ROMX
; ROM $26 : $98000 - $9BFFF
	set_bank_offset 38

	dr_end 38

SECTION "rom39", ROMX
; ROM $27 : $9C000 - $9FFFF
	set_bank_offset 39

	dr_end 39

SECTION "rom40", ROMX
; ROM $28 : $A0000 - $A3FFF
	set_bank_offset 40

	dr_end 40

SECTION "rom41", ROMX
; ROM $29 : $A4000 - $A7FFF
	set_bank_offset 41

	dr_end 41

SECTION "rom42", ROMX
; ROM $2a : $A8000 - $ABFFF
	set_bank_offset 42

	dr_end 42

SECTION "rom43", ROMX
; ROM $2b : $AC000 - $AFFFF
	set_bank_offset 43

	dr_end 43

SECTION "rom44", ROMX
; ROM $2c : $B0000 - $B3FFF
	set_bank_offset 44

	dr_end 44

SECTION "rom45", ROMX
; ROM $2d : $B4000 - $B7FFF
	set_bank_offset 45

	dr_end 45

SECTION "rom46", ROMX
; ROM $2e : $B8000 - $BBFFF
	set_bank_offset 46

	dr_end 46

SECTION "rom47", ROMX
; ROM $2f : $BC000 - $BFFFF
	set_bank_offset 47

	dr_end 47

SECTION "rom48", ROMX
; ROM $30 : $C0000 - $C3FFF
	set_bank_offset 48

	dr _AdvancePlayerSprite, 48, $4000
	dr ResetStatusAndHalveMoneyOnBlackout, 48, $4168
	dr SetMapSpecificScriptFlagsOnMapReload, 48, $41CE
	dr HallOfFamePC, 48, $4698

	dr_end 48

SECTION "rom49", ROMX
; ROM $31 : $C4000 - $C7FFF
	set_bank_offset 49

	dr_end 49

SECTION "rom50", ROMX
; ROM $32 : $C8000 - $CBFFF
	set_bank_offset 50

	dr_end 50

SECTION "rom51", ROMX
; ROM $33 : $CC000 - $CFFFF
	set_bank_offset 51

	dr_end 51

SECTION "rom52", ROMX
; ROM $34 : $D0000 - $D3FFF
	set_bank_offset 52

	dr_end 52

SECTION "rom53", ROMX
; ROM $35 : $D4000 - $D7FFF
	set_bank_offset 53

	dr_end 53

SECTION "rom54", ROMX
; ROM $36 : $D8000 - $DBFFF
	set_bank_offset 54

	dr_end 54

SECTION "rom55", ROMX
; ROM $37 : $DC000 - $DFFFF
	set_bank_offset 55

	dr_end 55

SECTION "rom56", ROMX
; ROM $38 : $E0000 - $E3FFF
	set_bank_offset 56

	dr_end 56

SECTION "rom57", ROMX
; ROM $39 : $E4000 - $E7FFF
	set_bank_offset 57

	dr_end 57

SECTION "rom58", ROMX
; ROM $3a : $E8000 - $EBFFF
	set_bank_offset 58

	dr_end 58

SECTION "rom59", ROMX
; ROM $3b : $EC000 - $EFFFF
	set_bank_offset 59

	dr_end 59

SECTION "rom60", ROMX
; ROM $3c : $F0000 - $F3FFF
	set_bank_offset 60

	dr LoadMissableObjectData, 60, $4741

	dr_end 60

SECTION "rom61", ROMX
; ROM $3d : $F4000 - $F7FFF
	set_bank_offset 61

	dr PrintStrengthText, 61, $4F0D
	dr InitBattle, 61, $52F9
	dr InitOpponent, 61, $52FF
	dr LoadMonBackPic, 61, $547C
	dr AnimateSendingOutMon, 61, $54AA
	dr CopyUncompressedPicToTilemap, 61, $54FD


	dr GetPredefPointer_cpy, $F5BCA
INCLUDE "engine/predefs.asm"
	set_bank_offset 61, $5D23


	dr_end 61

SECTION "rom62", ROMX
; ROM $3e : $F8000 - $FBFFF
	set_bank_offset 62

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
	dr Func_fcc08, 63, $4C08
	dr IsPlayerTalkingToPikachu, 63, $4F0C
	dr SurfingPikachuSprite, 63, $6DE2

	dr_end 63
