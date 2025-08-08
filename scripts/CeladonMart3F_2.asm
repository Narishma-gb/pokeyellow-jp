CeladonMart3FPrintClerkText::
	CheckEvent EVENT_GOT_TM18
	jr nz, .got_item
	ld hl, .TM18PreReceiveText
	call PrintText
	lb bc, TM_COUNTER, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_TM18
	ld hl, .ReceivedTM18Text
	jr .done
.bag_full
	ld hl, .TM18NoRoomText
	jr .done
.got_item
	ld hl, .TM18ExplanationText
.done
	call PrintText
	ret

.TM18PreReceiveText:
	text "いらっしゃい！"
	line "いやあー！"
	cont "#　やっと　おわったよ！"

	para "きみは　まだ　なの？"
	line "それじゃあ"
	cont "いい　もの　あげよう"
	prompt

.ReceivedTM18Text:
	text "<PLAYER>は　てんいん　から"
	line "@"
	text_ram wStringBuffer
	text "を　もらった！@"
	sound_get_item_1
	text_end

.TM18ExplanationText:
	text "てんいんの　プレゼント　だけに"
	line "<TM>１８の　わざは"
	cont "<⋯>　カウンター！　だよ！"
	cont "それじゃ　がんばってね！"
	done

.TM18NoRoomText:
	text "にもつが　いっぱいだ！"
	done
