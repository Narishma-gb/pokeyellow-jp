roms    := \
	pokeyellow.gb \
	pokeyellow11.gb \
	pokeyellow12.gb \
	pokeyellow13.gb
patches := pokeyellow13.patch

rom_obj := \
	audio.o \
	garbage.o \
	home.o \
	wip.o \
	maps.o \
	ram.o \
	gfx/minigame.o \
	gfx/pics.o \
	gfx/sprites.o \
	gfx/tilesets.o
#	main.o \

pokeyellow_obj      := $(rom_obj:.o=_yellow.o)
pokeyellow11_obj    := $(rom_obj:.o=_yellow11.o)
pokeyellow12_obj    := $(rom_obj:.o=_yellow12.o)
pokeyellow13_obj    := $(rom_obj:.o=_yellow13.o)
pokeyellow13_vc_obj := $(rom_obj:.o=_yellow13_vc.o)


### Build tools

ifeq (,$(shell command -v sha1sum 2>/dev/null))
SHA1 := shasum
else
SHA1 := sha1sum
endif

RGBDS ?=
RGBASM  ?= $(RGBDS)rgbasm
RGBFIX  ?= $(RGBDS)rgbfix
RGBGFX  ?= $(RGBDS)rgbgfx
RGBLINK ?= $(RGBDS)rgblink


### Build targets

.SUFFIXES:
.SECONDEXPANSION:
.PRECIOUS:
.SECONDARY:
.PHONY: all yellow clean tidy compare tools

all: $(roms)
yellow:    pokeyellow.gb
yellow_vc: pokeyellow.patch

clean: tidy
	find gfx \
	     \( -iname '*.1bpp' \
	        -o -iname '*.2bpp' \
	        -o -iname '*.pic' \) \
	     -delete
	find audio/pikachu_cries \
	     \( -iname '*.pcm' \) \
	     -delete

tidy:
	$(RM) $(roms) \
	      $(roms:.gb=.sym) \
	      $(roms:.gb=.map) \
	      $(patches) \
	      $(patches:.patch=_vc.gb) \
	      $(patches:.patch=_vc.sym) \
	      $(patches:.patch=_vc.map) \
	      $(patches:%.patch=vc/%.constants.sym) \
	      $(pokeyellow_obj) \
	      $(pokeyellow11_obj) \
	      $(pokeyellow12_obj) \
	      $(pokeyellow13_obj) \
	      $(pokeyellow13_vc_obj) \
	      rgbdscheck.o
	$(MAKE) clean -C tools/

compare: $(roms)
	@$(SHA1) -c roms.sha1

tools:
	$(MAKE) -C tools/


RGBASMFLAGS = -Q8 -P includes.asm -Weverything -Wtruncation=1
# Create a sym/map for debug purposes if `make` run with `DEBUG=1`
ifeq ($(DEBUG),1)
RGBASMFLAGS += -E
endif

$(pokeyellow_obj):      RGBASMFLAGS += -D _REV0
$(pokeyellow11_obj):    RGBASMFLAGS += -D _REV1
$(pokeyellow12_obj):    RGBASMFLAGS += -D _REV2
$(pokeyellow13_obj):    RGBASMFLAGS += -D _REV3
$(pokeyellow13_vc_obj): RGBASMFLAGS += -D _REV3 -D _YELLOW_VC 

%.patch: %_vc.gb %.gb vc/%.patch.template
	tools/make_patch $*_vc.sym $^ $@

rgbdscheck.o: rgbdscheck.asm
	$(RGBASM) -o $@ $<

# Build tools when building the rom.
# This has to happen before the rules are processed, since that's when scan_includes is run.
ifeq (,$(filter clean tidy tools,$(MAKECMDGOALS)))

$(info $(shell $(MAKE) -C tools))

# The dep rules have to be explicit or else missing files won't be reported.
# As a side effect, they're evaluated immediately instead of when the rule is invoked.
# It doesn't look like $(shell) can be deferred so there might not be a better way.
preinclude_deps := includes.asm $(shell tools/scan_includes includes.asm)
define DEP
$1: $2 $$(shell tools/scan_includes $2) $(preinclude_deps) | rgbdscheck.o
	$$(RGBASM) $$(RGBASMFLAGS) -o $$@ $$<
endef

# Dependencies for objects (drop _yellow from asm file basenames)
$(foreach obj, $(pokeyellow_obj), $(eval $(call DEP,$(obj),$(obj:_yellow.o=.asm))))
$(foreach obj, $(pokeyellow11_obj), $(eval $(call DEP,$(obj),$(obj:_yellow11.o=.asm))))
$(foreach obj, $(pokeyellow12_obj), $(eval $(call DEP,$(obj),$(obj:_yellow12.o=.asm))))
$(foreach obj, $(pokeyellow13_obj), $(eval $(call DEP,$(obj),$(obj:_yellow13.o=.asm))))
$(foreach obj, $(pokeyellow13_vc_obj), $(eval $(call DEP,$(obj),$(obj:_yellow13_vc.o=.asm))))

endif


%.asm: ;


pokeyellow_pad      = 0x00
pokeyellow11_pad    = 0x00
pokeyellow12_pad    = 0x00
pokeyellow13_pad    = 0x00
pokeyellow13_vc_pad = 0x00

pokeyellow_opt      = -sv -n 0 -k 01 -l 0x33 -m MBC3+RAM+BATTERY -r 03 -t "POKEMON YELLOW"
pokeyellow11_opt    = -sv -n 1 -k 01 -l 0x33 -m MBC3+RAM+BATTERY -r 03 -t "POKEMON YELLOW"
pokeyellow12_opt    = -sv -n 2 -k 01 -l 0x33 -m MBC3+RAM+BATTERY -r 03 -t "POKEMON YELLOW"
pokeyellow13_opt    = -sv -n 3 -k 01 -l 0x33 -m MBC3+RAM+BATTERY -r 03 -t "POKEMON YELLOW"
pokeyellow13_vc_opt = -sv -n 3 -k 01 -l 0x33 -m MBC3+RAM+BATTERY -r 03 -t "POKEMON YELLOW"

%.gb: $$(%_obj) layout.link
	$(RGBLINK) -p $($*_pad) -d -m $*.map -n $*.sym -l layout.link -o $@ $(filter %.o,$^)
	$(RGBFIX) -p $($*_pad) $($*_opt) $@


### Misc file-specific graphics rules

gfx/battle/move_anim_0.2bpp: tools/gfx += --trim-whitespace
gfx/battle/move_anim_1.2bpp: tools/gfx += --trim-whitespace

gfx/credits/the_end.2bpp: tools/gfx += --interleave --png=$<

gfx/slots/slots_1.2bpp: tools/gfx += --trim-whitespace

gfx/tilesets/%.2bpp: tools/gfx += --trim-whitespace
gfx/tilesets/reds_house.2bpp: tools/gfx += --preserve=0x48

gfx/trade/game_boy.2bpp: tools/gfx += --remove-duplicates

gfx/sgb/border.2bpp: tools/gfx += --trim-whitespace

gfx/surfing_pikachu/surfing_pikachu_1c.2bpp: tools/gfx += --trim-whitespace


### Catch-all graphics rules

%.png: ;

%.2bpp: %.png
	$(RGBGFX) $(rgbgfx) -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -o $@ $@)

%.1bpp: %.png
	$(RGBGFX) $(rgbgfx) -d1 -o $@ $<
	$(if $(tools/gfx),\
		tools/gfx $(tools/gfx) -d1 -o $@ $@)

%.pic: %.2bpp
	tools/pkmncompress $< $@


### Catch-all audio rules

%.wav: ;

%.pcm: %.wav
	tools/pcm $< $@
