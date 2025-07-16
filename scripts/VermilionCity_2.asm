VermilionCityPrintOfficerJennyText::
	CheckEvent EVENT_GOT_SQUIRTLE_FROM_OFFICER_JENNY
	jr nz, .asm_f1a69
	ld a, [wBeatGymFlags]
	bit BIT_THUNDERBADGE, a
	jr nz, .asm_f1a24
	ld hl, OfficerJennyText1
	call PrintText
	ret

.asm_f1a24
	ld hl, OfficerJennyText2
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .asm_f1a62
	ld a, SQUIRTLE
	ld [wNamedObjectIndex], a
	ld [wCurPartySpecies], a
	call GetMonName
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	lb bc, SQUIRTLE, 10
	call GivePokemon
	ret nc
	ld a, [wAddedToParty]
	and a
	call z, WaitForTextScrollButtonPress
	ld a, $1
	ld [wDoNotWaitForButtonPressAfterDisplayingText], a
	ld hl, OfficerJennyText3
	call PrintText
	SetEvent EVENT_GOT_SQUIRTLE_FROM_OFFICER_JENNY
	ret

.asm_f1a62
	ld hl, OfficerJennyText4
	call PrintText
	ret

.asm_f1a69
	ld hl, OfficerJennyText5
	call PrintText
	ret

OfficerJennyText1:
	text "さいきん　いたずら　ばかりする"
	line "ゼニガメを　つかまえたの！"

	para "うでのいい　トレーナーが　いたら"
	line "このこを　まかせたいんだけど<⋯>"
	done

OfficerJennyText2:
	text "その　オレンジバッジ！"
	line "あなた<⋯>"

	para "うでのいい　トレーナーのようね！"

	para "さいきん　いたずら　ばかりする"
	line "ゼニガメを　つかまえたの！"
	cont "あなた　ひきとって　くれない？"
	done

OfficerJennyText3:
	text "まかせたわ！"
	line "だいじに　そだてて　あげてね！@"
	text_waitbutton
	text_end

OfficerJennyText4:
	text "どうしようかしら<⋯>"
	line "こまったわ"
	done

OfficerJennyText5:
	text "ゼニガメ　げんきで　やっている？"
	done

VermilionCityPrintSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "ここは　クチバ　シティ"
	line "クチバは　オレンジ　ゆうやけのいろ"
	done

VermilionCityPrintNoticeSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "<⋯>　おしらせの　チラシだ！"

	para "さいきん<⋯>　１２ばん　どうろに"
	line "いねむり　#が　しゅつぼつ"
	cont "とおれない　ことが　あります！"

	para "そういう　とき　シオン　タウンへ"
	line "いく　かたは　いわやま　トンネルを"
	cont "とおって　ください！"

	para "<⋯>　クチバ　けいさつ　より"
	done

VermilionCityPrintPokemonFanClubSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "こちら　#　だいすき　クラブ"
	line "#ずき　だれでも　かんげい！"
	done

VermilionCityPrintGymSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "クチバ　シティ　#　ジム"
	line "リーダー　マチス"
	cont "イナズマ　アメリカン！"
	done

VermilionCityPrintHarborSignText::
	ld hl, .text
	call PrintText
	ret

.text
	text "クチバ　みなと　いりぐち"
	done
