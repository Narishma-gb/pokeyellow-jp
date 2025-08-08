RedsHouse1FPrintMomText::
	ld a, [wStatusFlags4]
	bit BIT_GOT_STARTER, a
	jp nz, RedsHouse1FMomHealScript
	ld hl, .WakeUpText
	call PrintText
	ret

.WakeUpText:
	text "おかあさん『<⋯>　そうね"
	line "おとこのこは　いつか"
	cont "たびに　でるもの　なのよ"
	cont "うん<⋯>　テレビの　はなしよ！"

	para "そういえば"
	line "となりの　オーキドはかせが"
	cont "あなたを　さがしてたわよ"
	done

RedsHouse1FMomHealScript:
	ld hl, RedsHouse1FMomYouShouldRestText
	call PrintText
	call GBFadeOutToWhite
	call ReloadMapData
	predef HealParty
	ld a, MUSIC_PKMN_HEALED
	ld [wNewSoundID], a
	call PlaySound
.next
	ld a, [wChannelSoundIDs]
	cp MUSIC_PKMN_HEALED
	jr z, .next
	ld a, [wMapMusicSoundID]
	ld [wNewSoundID], a
	call PlaySound
	call GBFadeInFromWhite
	ld hl, RedsHouse1FMomLookingGreatText
	call PrintText
	ret

RedsHouse1FMomYouShouldRestText:
	text "おかあさん『<PLAYER><⋯>！"
	line "あんまり　むり　させてると"
	cont "#に　きらわれるわよ"

	para "やすんで　いったら　どうかしら<⋯>？"
	prompt

RedsHouse1FMomLookingGreatText:
	text "おかあさん『あらあら！"
	line "あなたも　#も"
	cont "げんき　いっぱいね！"
	cont "それじゃ　きを　つけて！"
	cont "いってらっしゃい！"
	done

RedsHouse1FPrintTVText::
	ld hl, .WrongSideText
	ld a, [wSpritePlayerStateData1FacingDirection]
	cp SPRITE_FACING_UP
	jp nz, .got_text
	ld hl, .StandByMeMovieText
.got_text
	call PrintText
	ret

.StandByMeMovieText:
	text "テレビで　えいがを　やってる！"
	line "おとこのこが　４にん"
	cont "せんろのうえを　あるいてる<⋯>"

	para "<⋯>　ぼくも　もう　いかなきゃ！"
	done

.WrongSideText:
	text "みえない<⋯>"
	done
