INCLUDE 'BIFROST_L.asm'
org TILE_IMAGES
INCBIN 'popeyflash.ctile'

org 45000
	ld hl,TILE_MAP+80
	ld b,80
fill_tilemap:
	ld a,128
	add a,b
	ld (hl),a
	dec hl
	djnz fill_tilemap
	ld (hl),128
	ld a,84			; animate eyes. Animation cycle offset to
	ld (TILE_MAP+11),a	; try to sync colours
	ld a,89
	ld (TILE_MAP+14),a

	call 64995		; start BIFROST rendering

flashloop:
	ld a,7
showflash:
	ld bc,95
	ld hl,#5800 + 21*32
	ld de,#5801 + 21*32
	ld (hl),a
	halt			; sync with interrupts to reduce flicker
	ldir
	dec a
	cp 0
	jr z,flashloop
	jr showflash
