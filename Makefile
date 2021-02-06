program.tap: loader.tap flash.tap screen.tap
	cat loader.tap flash.tap screen.tap > program.tap

screen.tap: screen.scr screen.asm
	pasmo --tap --name screen screen.asm screen.tap

loader.tap: loader.bas
	zmakebas -l -a 10 -n loader -o loader.tap loader.bas

flash.tap: flash.asm BIFROST_L.asm lennaflash.ctile
	pasmo --tap --name flash flash.asm flash.tap
