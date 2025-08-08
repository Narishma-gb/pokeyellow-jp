CeladonDinerPrintGymGuideText::
	CheckEvent EVENT_GOT_COIN_CASE
	jr nz, .got_item
	ld hl, .ImFlatOutBustedText
	call PrintText
	lb bc, COIN_CASE, 1
	call GiveItem
	jr nc, .bag_full
	SetEvent EVENT_GOT_COIN_CASE
	ld hl, .ReceivedCoinCaseText
	call PrintText
	jr .done
.bag_full
	ld hl, .CoinCaseNoRoomText
	call PrintText
	jr .done
.got_item
	ld hl, .WinItBackText
	call PrintText
.done
	ret

.ImFlatOutBustedText:
	text "うおう<⋯>　わらってくれ！"

	para "ゲーム　コーナーで　すって"
	line "いちもん　なしに　なっちまった！"

	para "もう　スロットは　やらん！"
	line "じみちに　はたらくぞ！"

	para "<⋯>　というわけで"
	line "これは　おまえに　やる！"
	prompt

.ReceivedCoinCaseText:
	text "<PLAYER>は　おっさん　から"
	line "@"
	text_ram wStringBuffer
	text "を　もらった！@"
	sound_get_key_item
	text_end

.CoinCaseNoRoomText:
	text "にもつが　いっぱい　だぜ"
	done

.WinItBackText:
	text "あーあ！"
	line "いつか　かならず　かてる！"
	cont "と　おもったのに　この　ざまだ<⋯>！"
	done
