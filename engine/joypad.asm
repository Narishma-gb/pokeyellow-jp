ReadJoypad_::
; Poll joypad input.
; Unlike the hardware register, button
; presses are indicated by a set bit.
IF DEF(_REV1) || DEF(_REV2) || DEF(_REV3)
	ldh a, [hDisableJoypadPolling]
	and a
	ret nz
ENDC

	ld a, 1 << 5 ; select direction keys
IF DEF(_REV0)
	ld c, 0
ENDC

	ldh [rJOYP], a
	ldh a, [rJOYP]
	ldh a, [rJOYP]
IF DEF(_REV0)
	REPT 4
		ldh a, [rJOYP]
	ENDR
ENDC
	cpl
	and %1111
	swap a
	ld b, a

	ld a, 1 << 4 ; select button keys
	ldh [rJOYP], a
REPT 6
	ldh a, [rJOYP]
ENDR
IF DEF(_REV0)
	REPT 4
		ldh a, [rJOYP]
	ENDR
	cpl
	and %01001111

	cp PAD_BUTTONS ; soft reset
	jr nz, .notSoftReset
	jp TrySoftReset
.notSoftReset
	or b
	ld b, a
ELSE
	cpl
	and %1111
	or b

	ldh [hJoyInput], a

	ld a, 1 << 4 + 1 << 5 ; deselect keys
	ldh [rJOYP], a
	ret

_Joypad::
; hJoyReleased: (hJoyLast ^ hJoyInput) & hJoyLast
; hJoyPressed:  (hJoyLast ^ hJoyInput) & hJoyInput

	ldh a, [hJoyInput]
	ld b, a
	and PAD_BUTTONS | PAD_UP
	cp PAD_BUTTONS ; soft reset
	jp z, TrySoftReset
ENDC

	ldh a, [hJoyLast]
	ld e, a
	xor b
	ld d, a
	and e
	ldh [hJoyReleased], a
	ld a, d
	and b
	ldh [hJoyPressed], a
IF DEF(_REV0)
	ld a, 1 << 4 + 1 << 5 ; deselect keys
	ldh [rJOYP], a
ENDC
	ld a, b
	ldh [hJoyLast], a

	ld a, [wStatusFlags5]
	bit BIT_DISABLE_JOYPAD, a
	jr nz, DiscardButtonPresses

	ldh a, [hJoyLast]
	ldh [hJoyHeld], a

	ld a, [wJoyIgnore]
	and a
	ret z

	cpl
	ld b, a
	ldh a, [hJoyHeld]
	and b
	ldh [hJoyHeld], a
	ldh a, [hJoyPressed]
	and b
	ldh [hJoyPressed], a
	ret

DiscardButtonPresses:
	xor a
	ldh [hJoyHeld], a
	ldh [hJoyPressed], a
	ldh [hJoyReleased], a
	ret

TrySoftReset:
	call DelayFrame

	ld a, 1 << 4 + 1 << 5 ; deselect keys
	ldh [rJOYP], a

	ld hl, hSoftReset
	dec [hl]
	jp z, SoftReset

	jp Joypad
