Route1PrintYoungster1Text::
	CheckAndSetEvent EVENT_GOT_POTION_SAMPLE
	jr nz, .got_item
	ld hl, .MartSampleText
	call PrintText
	lb bc, POTION, 1
	call GiveItem
	jr nc, .bag_full
	ld hl, .GotPotionText
	jr .done
.bag_full
	ld hl, .NoRoomText
	jr .done
.got_item
	ld hl, .AlsoGotPokeballsText
.done
	call PrintText
	ret

.MartSampleText:
	text "わたし　フレンドリィショップの"
	line "てんいん　です"

	para "べんりな　どうぐや　ですから"
	line "トキワ　シティで"
	cont "ぜひ　よって　くださいね！"

	para "そうだ！"
	line "みほんを　さしあげましょう"
	cont "<⋯>　どうぞ！"
	prompt

.GotPotionText:
	text "<PLAYER>は"
	line "「@"
	text_ram wStringBuffer
	text "」を　もらった！@"
	sound_get_item_1
	text_end

.AlsoGotPokeballsText:
	text "#を　つかまえる"
	line "モンスターボール　かう　ときも"
	cont "ショップへ　いらして　ください！"
	done

.NoRoomText:
	text "にもつが　いっぱいだ！"
	done

Route1PrintYoungster2Text::
	ld hl, .text
	call PrintText
	ret

.text
	text "みちに　だんさが　あるだろ！"

	para "とび　おりるのは"
	line "ちょっと　こわいけど<⋯>"

	para "マサラ　タウンに　かえる　ときは"
	line "はやく　かえれて　いいよ"
	done

Route1PrintSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "ここは　１ばん　どうろ"
	line "マサラ　タウン　<⋯>　トキワ　シティ"
	done
