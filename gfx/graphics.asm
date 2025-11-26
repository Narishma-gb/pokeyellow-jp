SECTION "Version Graphics", ROMX

Version_GFX:
INCBIN "gfx/title/blue_version.1bpp" ; unused
Version_GFXEnd:


SECTION "Surfing Pikachu Graphics", ROMX

	ret ; unused

SurfingPikachu1Graphics1:: INCBIN "gfx/surfing_pikachu/surfing_pikachu_1a.2bpp"
SurfingPikachu1Graphics2:: INCBIN "gfx/surfing_pikachu/surfing_pikachu_1b.2bpp"
SurfingPikachu1Graphics3:: INCBIN "gfx/surfing_pikachu/surfing_pikachu_1c.2bpp"


SECTION "Intro Graphics", ROMX

YellowIntroGraphics1:: INCBIN "gfx/intro/yellow_intro_1.2bpp"
YellowIntroGraphics1End::
YellowIntroGraphics2:: INCBIN "gfx/intro/yellow_intro_2.2bpp"
YellowIntroGraphics2End::
