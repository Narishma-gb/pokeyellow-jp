PrintTrashText:
	call EnableAutoTextBoxDrawing
	tx_pre_jump VermilionGymTrashText

VermilionGymTrashText::
	text "ガサゴソ<⋯>！"
	line "なかは　ゴミ　ばっかり！"
	done

GymTrashScript:
	call EnableAutoTextBoxDrawing
	ld a, [wHiddenEventFunctionArgument]
	ld [wGymTrashCanIndex], a

; Don't do the trash can puzzle if it's already been done.
	CheckEvent EVENT_2ND_LOCK_OPENED
	jr z, .ok

	tx_pre_jump VermilionGymTrashText

.ok
	CheckEventReuseA EVENT_1ST_LOCK_OPENED
	jr nz, .trySecondLock

	ld a, [wFirstLockTrashCanIndex]
	ld b, a
	ld a, [wGymTrashCanIndex]
	cp b
	jr z, .openFirstLock

	tx_pre_id VermilionGymTrashText
	jr .done

.openFirstLock
; Next can is trying for the second switch.
	SetEvent EVENT_1ST_LOCK_OPENED
	callfar Yellow_SampleSecondTrashCan
	tx_pre_id VermilionGymTrashSuccessText1
	jr .done

.trySecondLock
	ld a, [wGymTrashCanIndex]
	ld b, a
	ld a, [wSecondLockTrashCanIndex]
	cp b
	jr z, .openSecondLock
	ld a, [wSecondLockTrashCanIndex + 1]
	cp b
	jr z, .openSecondLock

; Reset the cans.
	ResetEvent EVENT_1ST_LOCK_OPENED
	call Random

	and $e
	ld [wFirstLockTrashCanIndex], a

	tx_pre_id VermilionGymTrashFailText
	jr .done

.openSecondLock
; Completed the trash can puzzle.
	SetEvent EVENT_2ND_LOCK_OPENED
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_2, [hl]

	tx_pre_id VermilionGymTrashSuccessText3

.done
	jp PrintPredefTextID

GymTrashCans:
; byte 0: mask for random number
; bytes 1-4: indices of the trash cans that can have the second lock
; Note that the mask is simply the number of valid trash can indices that
; follow. The remaining bytes are filled with -1 to pad the length of each entry
; to 5 bytes.
; This is functionally replaced with GymTrashCans3a but was never removed from source.

	db 2,  1,  3, -1, -1 ; 0
	db 3,  0,  2,  4, -1 ; 1
	db 2,  1,  5, -1, -1 ; 2
	db 3,  0,  4,  6, -1 ; 3
	db 4,  1,  3,  5,  7 ; 4
	db 3,  2,  4,  8, -1 ; 5
	db 3,  3,  7,  9, -1 ; 6
	db 4,  4,  6,  8, 10 ; 7
	db 3,  5,  7, 11, -1 ; 8
	db 3,  6, 10, 12, -1 ; 9
	db 4,  7,  9, 11, 13 ; 10
	db 3,  8, 10, 14, -1 ; 11
	db 2,  9, 13, -1, -1 ; 12
	db 3, 10, 12, 14, -1 ; 13
	db 2, 11, 13, -1, -1 ; 14

VermilionGymTrashSuccessText1::
	text "ガサゴソ<⋯>！"
	line "おっと！　ゴミばこの　そこに"
	cont "スイッチが　あった！"
	cont "おして　みよう！　<⋯>　ポチッとな"

	para "でんどうドアの"
	line "だい１　ロックが　はずれた！@"
	text_asm
	call WaitForSoundToFinish
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

; unused
VermilionGymTrashSuccessText2::
	text "ガサゴソ<⋯>！"
	line "おっと！　ゴミばこの　そこに"
	cont "また　スイッチが　あった！"
	cont "おして　みよう！　<⋯>　ポチッとな"
	prompt

; unused
VermilionGymTrashSuccessPlaySfx:
	text_asm
	call WaitForSoundToFinish
	ld a, SFX_SWITCH
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashSuccessText3::
	text "でんどうドアの"
	line "だい２　ロックが　はずれた！"

	para "おおきな　でんどうドアが"
	line "かんぜんに　ひらいた！@"
	text_asm
	call WaitForSoundToFinish
	ld a, SFX_GO_INSIDE
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd

VermilionGymTrashFailText::
	text "ガサゴソ<⋯>！"
	line "なかは　ゴミ　ばっかり！"
	cont "あッ！　でんどうドアの"
	cont "ロックが　もどって　しまった！@"
	text_asm
	call WaitForSoundToFinish
	ld a, SFX_DENIED
	call PlaySound
	call WaitForSoundToFinish
	jp TextScriptEnd
