Route22PrintRival1Text::
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE
	jr z, .before_battle
	ld hl, Route22RivalAfterBattleText1
	call PrintText
	jr .text_script_end
.before_battle
	ld hl, Route22RivalBeforeBattleText1
	call PrintText
.text_script_end
	ret

Route22RivalBeforeBattleText1:
	text "<RIVAL>『あーッ！　<PLAYER>！"

	para "#　リーグに　いくのか？"
	line "やめとけ！"

	para "おまえ　どうせ"
	line "バッジ　もってねーだろ？"

	para "みはりの　おっさんが"
	line "とおして　くれねーよ！"

	para "<⋯>　それよりさあ！"
	line "おまえの　#"
	cont "すこしは　つよく　なったかよ？"
	done

Route22RivalAfterBattleText1:
	text "どうやら　#　リーグには"
	line "つよくて　すごい　<TRAINER>が"
	cont "ウジャウジャ　いるらしいぜ"

	para "どうにか"
	line "あそこを　とおりぬける"
	cont "ほうほうを　かんがえなきゃな！"

	para "おまえも　いつまでも"
	line "ここらに　いないで"
	cont "とっとと　さきに　すすめよ！"
	done

Route22PrintRival2Text::
	CheckEvent EVENT_BEAT_ROUTE22_RIVAL_2ND_BATTLE
	jr z, .before_battle
	ld hl, Route22RivalAfterBattleText2
	call PrintText
	jr .text_script_end
.before_battle
	ld hl, Route22RivalBeforeBattleText2
	call PrintText
.text_script_end
	ret

Route22RivalBeforeBattleText2:
	text "<RIVAL>『なんだ？　<PLAYER>！"
	line "こんな　ところで　あうとは"
	cont "またまた　ぐうぜんだ！"

	para "じゃあ<⋯>　おまえも"
	line "#　リーグに　いく　わけ？"

	para "バッジも"
	line "ぜんぶ　あつまったのか！"
	cont "あ　そう<⋯>　やるじゃん！"

	para "それじゃ　#　リーグ"
	line "いくまえに　<PLAYER>で"
	cont "ウォーミング　アップと　いくか！"

	para "かかって　きな！"
	done

Route22RivalAfterBattleText2:
	text "からだも　ほぐれたし<⋯>！"
	line "いよいよ　#　リーグ"
	cont "せいはに　むかうと　するか！"

	para "<PLAYER>は<⋯>"
	line "もっと　れんしゅう　したほうが"
	cont "いいんじゃないの！"

	para "おっと！　おせっかい　だったか！"
	line "とにかく<⋯>　おれは　さき　いくぜ"
	cont "じゃあ！<⋯>　あーばよ！"
	done

Route22PrintPokemonLeagueSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "ここは　#　リーグ"
	line "しょうめん　ゲート"
	done
