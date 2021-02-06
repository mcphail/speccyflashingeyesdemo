INCLUDE 'BIFROST_L.asm'
org TILE_IMAGES
INCBIN 'lennaflash.ctile'

org 45000
	ld hl,TILE_MAP+80
	ld a,208
fill_tilemap:
	ld (hl),a
	dec hl
	dec a
	cp 127
	jr nz,fill_tilemap
	ld a,84
	ld (TILE_MAP+31),a
	ld a,88
	ld (TILE_MAP+33),a

	call 64995		; start BIFROST rendering

flashloop:
	ld a,7
showflash:
	ld bc,95
	ld hl,#5800 + 21*32
	ld de,#5801 + 21*32
	halt			; sync with interrupts to reduce flicker
	ld (hl),a
	ldir
	dec a
	cp 0
	jr z,flashloop
	jr showflash