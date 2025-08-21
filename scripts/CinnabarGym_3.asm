CinnabarGymPrintGymGuideText::
	CheckEvent EVENT_BEAT_BLAINE
	jr nz, .afterBeat
	ld hl, .ChampInMakingText
	jr .done
.afterBeat
	ld hl, .BeatBlaineText
.done
	call PrintText
	ret

.ChampInMakingText:
	text "おーす！"
	line "みらいの　チャンピオン！"

	para "ねっけつ　カツラは"
	line "ほのおの　プロフェッショナルだ！"

	para "それなら　こっちは"
	line "クールに　みずで　きめろ！"

	para "あと　やけどなおしを"
	line "もって　いった　ほうが　いいぜ！"
	done

.BeatBlaineText:
	text "<PLAYER>！　かったか！"
	line "あつ　くるしい　おやじ　だったな！"
	done

Func_f2150::
	ld hl, TextPointers_f215d
	ld d, 0
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp PrintText

TextPointers_f215d:
	dw CinnabarGymText_f2169
	dw CinnabarGymText_f216e
	dw CinnabarGymText_f2173
	dw CinnabarGymText_f2178
	dw CinnabarGymText_f217d
	dw CinnabarGymText_f2182

CinnabarGymText_f2169:
	text "ここは　べつめい　クイズジム！"
	line "カツラに　ちょうせん　するなら"
	cont "クイズに　こたえて　もらいやす！"

	para "せいかいの　あとで　おいらたちと"
	line "たたかうのは　じゆう　でさ！"
	done

CinnabarGymText_f216e:
	text "きみに　せいかいが　わかるかな？"
	done

CinnabarGymText_f2173:
	text "むずかしい　もんだい　だぜ！"
	done

CinnabarGymText_f2178:
	text "#も　クイズも　すきなのさ"
	done

CinnabarGymText_f217d:
	text "クイズジムって　いいねぇ"
	done

CinnabarGymText_f2182:
	text "さいごの　クイズだよ"
	done

CinnabarGymText_f2187:
	text "クイズに　こたえろ！" ; unused
	done
