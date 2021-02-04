program.tap: loader.tap popey.tap screen.tap
	cat loader.tap popey.tap screen.tap > program.tap

screen.tap: screen.scr screen.asm
	pasmo --tap --name screen screen.asm screen.tap

loader.tap: loader.bas
	zmakebas -l -a 10 -n loader -o loader.tap loader.bas

popey.tap: popey.asm BIFROST_L.asm popeyflash.ctile
	pasmo --tap --name popey popey.asm popey.tap
