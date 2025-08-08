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


SECTION "rom20", ROMX
; ROM $14 : $50000 - $53FFF
	set_bank_offset 20

	dr Route22_Blocks, 20, $403D
	dr Route20_Blocks, 20, $417D
	dr Route24_Blocks, 20, $46ED
	dr SaffronCity_Blocks, 20, $4A98
	dr PrintCardKeyText, 20, $77F3
	dr CeladonPrizeMenu, 20, $78BF

	dr_end 20

SECTION "Trainer Sight", ROMX
SECTION "rom21", ROMX
; ROM $15 : $54000 - $57FFF
	set_bank_offset 21

	dr Route2_Blocks, 21, $4086
	dr Route3_Blocks, 21, $425D
	dr Route4_Blocks, 21, $43F4
	dr Route5_Blocks, 21, $45DA
	dr Route9_Blocks, 21, $4706
	dr Route19_Blocks, 21, $4F01
	dr Route21_Blocks, 21, $507D
	dr GainExperience, 21, $525F
	dr DisplayDiploma, 21, $7CE7
	dr _GetSpritePosition1, 21, $7D18
	dr _GetSpritePosition2, 21, $7D38
	dr _SetSpritePosition1, 21, $7D5C
	dr _SetSpritePosition2, 21, $7D7C
	dr TrainerWalkUpToPlayer, 21, $7DA0
	dr TrainerEngage, 21, $7E2E

	dr_end 21

SECTION "rom22", ROMX
; ROM $16 : $58000 - $5BFFF
	set_bank_offset 22

	dr Route6_Blocks, 22, $4079
	dr Route8_Blocks, 22, $41C6
	dr Route10_Blocks, 22, $4356
	dr Route11_Blocks, 22, $455F
	dr Route12_Blocks, 22, $4710
	dr Route15_Blocks, 22, $49CC
	dr Route16_Blocks, 22, $4B84
	dr Route18_Blocks, 22, $4C9C
	dr CalcLevelFromExperience, 22, $4D99
	dr CalcExperience, 22, $4DC0
	dr PrintStatusAilment, 22, $4E8B
	dr OaksAideScript, 22, $4EC6
	dr RemoveGuardDrink, 22, $7F6B

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

SECTION "rom28", ROMX
; ROM $1c : $70000 - $73FFF
	set_bank_offset 28

	dr AnimateShootingStar, 28, $4044
	dr AnimateHealingMachine, 28, $448E
	dr EnterMapAnim, 28, $4561
	dr _LeaveMapAnim, 28, $460F
	dr IsPlayerStandingOnWarpPadOrHole, 28, $47E1
	dr FishingAnim, 28, $4810
	dr _HandleMidJump, 28, $48F4
	dr BattleTransition, 28, $49E3
	dr FlashScreen, 28, $4BD3
	dr DisplayTownMap, 28, $4EB4
	dr LoadTownMap_Nest, 28, $4FE4
	dr LoadTownMap_Fly, 28, $5014
	dr TownMapSpriteBlinkingAnimation, 28, $56AA
	dr AnimatePartyMon_ForceSpeed1, 28, $56DB
	dr AnimatePartyMon, 28, $56E3
	dr LoadMonPartySpriteGfx, 28, $5750
	dr LoadMonPartySpriteGfxWithLCDDisabled, 28, $5775
	dr WriteMonPartySpriteOAMByPartyIndex, 28, $5858
	dr WriteMonPartySpriteOAMBySpecies, 28, $5886
	dr DoInGameTradeDialogue, 28, $5ADD
	dr _RunPaletteCommand, 28, $5F2E
	dr InitPartyMenuBlkPacket, 28, $61B7
	dr LoadSGB, 28, $6225
	dr LoadSAV, 28, $751F
	dr LoadSAV2, 28, $75FA
	dr SaveSAV, 28, $763D
	dr SaveSAVtoSRAM0, 28, $7718
	dr SaveSAVtoSRAM1, 28, $7765
	dr SaveSAVtoSRAM2, 28, $7789
	dr SaveSAVtoSRAM, 28, $77C4
	dr ChangeBox, 28, $7801
	dr ClearSAV, 28, $7A79

	dr_end 28

SECTION "rom29", ROMX
; ROM $1d : $74000 - $77FFF
	set_bank_offset 29

	dr HiddenItemNear, 29, $405C
	dr CeruleanHideRocket, 29, $40AF
	dr VendingMachineMenu, 29, $4E42
	dr PKMNLeaguePC, 29, $7AB2
	dr ShakeElevator, 29, $7BE0

	dr_end 29

SECTION "rom30", ROMX
; ROM $1e : $78000 - $7BFFF
	set_bank_offset 30

	dr MoveAnimationTiles1, 30, $46EE
	dr SlotMachineTiles2, 30, $4BDE
	dr MoveAnimation, 30, $4D5E
	dr Func_78e98, 30, $4E53
	dr AnimationSlideMonOff, 30, $52D2
	dr AnimationSlideEnemyMonOff, 30, $52DC
	dr AnimationMinimizeMon, 30, $55C2
	dr AnimationSubstitute, 30, $5703
	dr HideSubstituteShowMonAnim, 30, $576A
	dr ReshowSubstituteAnim, 30, $5806
	dr Func_79929, 30, $587D
	dr GetIntroMoveSound, 30, $5919
	dr CopyDownscaledMonTiles, 30, $5B6A
	dr CopyTileIDsFromList, 30, $5E7D
	dr AnimCut, 30, $5F39
	dr AnimateBoulderDust, 30, $5FF7
	dr LoadSmokeTileFourTimes, 30, $6063
	dr EvolveMon, 30, $7E87

	dr_end 30

SECTION "rom31", ROMX
; ROM $1f : $7C000 - $7FFFF
	set_bank_offset 31

SFX_Shooting_Star::
Music_BikeRiding::
Music_MeetEvilTrainer::
Music_TitleScreen::
Music_GameCorner::
Music_Surfing::

	dr PlayPokedexRatingSfx, 31, $50D6
	dr Audio3_PlaySound, 31, $510D

	dr_end 31

SECTION "rom32", ROMX
; ROM $20 : $80000 - $83FFF
	set_bank_offset 32

	dr Audio4_PlaySound, 32, $4F14

	dr_end 32

SECTION "rom33", ROMX
; ROM $21 : $84000 - $87FFF
	set_bank_offset 33

	dr PikachuCry1, 33, $4000
	dr PikachuCry2, 33, $491A
	dr PikachuCry3, 33, $4FDC
	dr PikachuCry4, 33, $59EE

	dr_end 33

SECTION "rom34", ROMX
; ROM $22 : $88000 - $8BFFF
	set_bank_offset 34

	dr PikachuCry5, 34, $4000
	dr PikachuCry6, 34, $5042
	dr PikachuCry7, 34, $6254

	dr_end 34

SECTION "rom35", ROMX
; ROM $23 : $8C000 - $8FFFF
	set_bank_offset 35

	dr PikachuCry8, 35, $4000
	dr PikachuCry9, 35, $50CA
	dr PikachuCry10, 35, $5E0C

	dr_end 35

SECTION "rom36", ROMX
; ROM $24 : $90000 - $93FFF
	set_bank_offset 36

	dr PikachuCry11, 36, $4000
	dr PikachuCry12, 36, $4722
	dr PikachuCry13, 36, $54A4

	dr_end 36

SECTION "rom37", ROMX
; ROM $25 : $94000 - $97FFF
	set_bank_offset 37

	dr PikachuCry14, 37, $4000
	dr PikachuCry15, 37, $589A

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

Music_MeetJessieJames::

	dr_end 40

SECTION "rom41", ROMX
; ROM $29 : $A4000 - $A7FFF
	set_bank_offset 41

	dr LoadYellowTitleScreenGFX, 41, $4000
	dr TitleScreen_PlacePokemonLogo, 41, $402B
	dr TitleScreen_PlacePikaSpeechBubble, 41, $4047
	dr TitleScreen_PlacePikachu, 41, $4065
	dr ReadSuperRodData, 41, $4C47

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
	dr ViridianCityMovePikachu, 48, $4CE8
	dr OaksLabPikachuMovementScript, 48, $4CF6
	dr GameCornerPikachuMovementScript, 48, $4D27
	dr Func_f250b, 48, $4D35

	dr_end 48

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
	dr PrinterDebug, 58, $467C

	dr_end 58

SECTION "rom59", ROMX
; ROM $3b : $EC000 - $EFFFF
	set_bank_offset 59, $410C


	dr_end 59

SECTION "rom60", ROMX
; ROM $3c : $F0000 - $F3FFF
	set_bank_offset 60, $4FD0

	dr RedsHouse1FPrintMomText_cpy, 60, $51EE
INCLUDE "scripts/RedsHouse1F_2.asm"
INCLUDE "scripts/ViridianSchoolHouse_2.asm"
	set_bank_offset 60, $539C

	dr CeladonMart3FPrintClerkText_cpy, 60, $57F4
INCLUDE "scripts/CeladonMart3F_2.asm"
INCLUDE "scripts/CeladonMansion1F_2.asm"
INCLUDE "scripts/CeladonMansion3F_2.asm"
INCLUDE "scripts/CeladonDiner_2.asm"
	set_bank_offset 60, $5B98

	dr MagikarpSalesman_cpy, 60, $60A1
INCLUDE "scripts/MtMoonPokecenter_2.asm"
	set_bank_offset 60, $619C

	dr BillsHousePrintBillPokemonText_cpy, 60, $659A
INCLUDE "scripts/BillsHouse_2.asm"
	set_bank_offset 60, $6886

	dr CheckForHiddenObject, 60, $6AEA

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
