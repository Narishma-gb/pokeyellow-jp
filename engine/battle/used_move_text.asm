PrintUsedMoveText:
	ld hl, UsedMoveText
	jp PrintText

; This function determines the correct sentence to print for each move use,
; first printing either UserNoText or UserWaText, then calling
; GetMoveGrammar to choose which sentence ending is displayed.
; It also handles disobedient mon text through UsedMoveText_CheckObedience
UsedMoveText:
	text "<USER>@"
	text_asm
	ldh a, [hWhoseTurn]
	and a
	ld a, [wPlayerMoveNum]
	ld hl, wPlayerUsedMove
	jr z, .playerTurn

	ld a, [wEnemyMoveNum]
	ld hl, wEnemyUsedMove

.playerTurn
	ld [hl], a
	ld [wMoveGrammar], a
	call GetMoveGrammar
	ld a, [wMonIsDisobedient]
	and a
	ld hl, UserWaText
	ret nz

	; check move grammar
	ld a, [wMoveGrammar]
	cp 3
	ld hl, UserWaText
	ret c
	ld hl, UserNoText
	ret

UserNoText:
	text "の　@"
	text_asm
	jr UsedMoveText_CheckObedience

UserWaText:
	text "は　@"
	text_asm
	; fall through

UsedMoveText_CheckObedience:
	ld a, [wMonIsDisobedient]
	and a
	jr z, .GetMoveNameText
	ld hl, .UsedInsteadText
	ret

.UsedInsteadText:
	text "めいれいをむしして@"
	text_asm
	; fall through

.GetMoveNameText:
	ld hl, MoveNameText
	ret

MoveNameText:
	text_start
	line "@"
	text_ram wStringBuffer
	text_asm
	ld hl, SentenceEndPointerTable
	ld a, [wMoveGrammar]
	add a
	push bc
	ld b, $0
	ld c, a
	add hl, bc
	pop bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

SentenceEndPointerTable:
; entries correspond to MoveGrammar sets
	dw SentenceEnd1Text
	dw SentenceEnd2Text
	dw SentenceEnd3Text
	dw SentenceEnd4Text
	dw SentenceEnd5Text

SentenceEnd1Text:
	text "を　つかった！"
	done

SentenceEnd2Text:
	text "した！"
	done

SentenceEnd3Text:
	text "を　した！"
	done

SentenceEnd4Text:
	text "　こうげき！"
	done

SentenceEnd5Text:
	text "！"
	done

; Input: [wMoveGrammar] = move ID
; Output: [wMoveGrammar] = index 0-4 into SentenceEndPointerTable
GetMoveGrammar:
	push bc
	ld a, [wMoveGrammar] ; move ID
	ld c, a
	ld b, $0
	ld hl, MoveGrammar
.loop
	ld a, [hli]
; end of table?
	cp -1
	jr z, .end
; match?
	cp c
	jr z, .end
; advance grammar type at 0
	and a
	jr nz, .loop
; next grammar type
	inc b
	jr .loop

.end
; wMoveGrammar now contains move grammar
	ld a, b
	ld [wMoveGrammar], a
	pop bc
	ret

INCLUDE "data/moves/grammar.asm"
