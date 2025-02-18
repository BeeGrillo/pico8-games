pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- maiden
-- a simple rpg

th = 64 -- text/upper half
oh = 66 -- option/lower half

text_buff = {}
page_i = {}
actions = {}
game_state = "title"

function dr_split_screen()
 cls(0)
 rect(1,1,126,th-1,7)
 rect(3,3,124,th-3,6)
	local y = 5
	if game_state == "title" then
	 dr_title()
	else
		for i=1,#text_buff do
 		if y < th-8 then
	 		print(text_buff[i],10,y,7)
		 	y += 8
		 end
	 end
	
	 for i=1, #actions do
		 local opt_y = oh + (i-1)*10
		 if i == selected then
			 spr(1,2,opt_y-2) -- draw cursor
		 end
		 print(actions[i].label, 15,opt_y,7)
	 end
	 if #text_buff > 4 then
		 spr(2,110,55)
	 end
	end
end

function handle_text_input()
	if btnp(❎) then
		if page_i < #text_buff then
			page_i += 1
		else
		 game_state = "choose_action"
		end
	end
end

function enter_capitol()
	game_state = "text_scroll"
	text_buff = {
	 "you approach the grand gates",
	 "of the capitol. guards eye",
	 "you from top to bottom...",
	 "(rep: "..party[1].rep..")"
	}
	if party[1].rep < 5 then
		add(text_buff, "they deny you entry!")
		actions = {{label="leave",func=exit_location}}
	else
	 add(text_buff, "the gates creak open!")
	 actions = {
	 	{label="find new quests", func=find_quests},
	 	{label="visit market", func=open_market},
	 	{label="leave", func=exit_location}
	 }
	end
	page_i = 1
end

function _draw()
	cls()
	dr_split_screen()
	
end

function _update()
	if game_state== "text_scroll" then
	 handle_text_input()
 elseif game_state == "choose_action" then
 	handle_action_selected()
 end
end

function dr_title()
	rectfill(4,4,123,19,1)
	rectfill(4,20,123,35,12)
	rectfill(4,36,123,43,11)
	rectfill(4,44,123,60,3)
	for i=0,14 do
	 spr(18,4+(i*8),12)
	 spr(19,4+(i*8),36)
	end
	for i=0,6 do
	 --	spr(34,4+(i*16),45,2,1)
			spr(34,4+(i*16),53,2,1)
 end
	spr(34,116,53)
 spr(16,80,26,2,2)
 spr(16,96,26,2,2,true)
 spr(20,18,18,5,1)
 spr(25,28,28,5,1)
end


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000009990c00000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700099999999c00000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700044449994dcc0ccd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000099400ddcdd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000004400000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000001c1c1c1cbbbbbbbba9a90a99900a000a9990a99900a99990a9900a997ffff507f0f507ffff507ffff507ffff500000000000000000000000
0000000000000000111111113b3b3b3b0a99a99900a99000940009449009409009990940f555510f50f10f555510f555510f5555100000000000000000000000
0000000000000000c1c1c1c1bbbbbbbb094494490a949900940009404909400009499940f500510f50f10f500000f50000000f50000000000000000000000000
50505000000000001c1c1c1cb3b3b3b30940404909404900940009404909990009409940f500510f50f10f55f00001ff50000f50000000000000000000000000
1555100000000000c1c1c1c13b3b3b3b0940004909999900940009404909440009400940f5ff510f50f10f500000001151000f50000000000000000000000000
1111100000000000ccccccccb3b3b3b30940004909444900940009404909400009400940f555510f5f510f555510f55551000f50000000000000000000000000
01110000000055551c1c1c1c33333333094000490940490094000940490940a00940094051111505111105111110511110000510000000000000000000000000
0151555555555151cccccccc3b3b3b3ba9400049a940499a9990a99990a99990a940a94900000000000000000000000000000000000000000000000000000000
015555551515555533333333333333b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05515555515551113133b333313331b3000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
055155551555121233333b3333333333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
051151555151221433331b3b33b33333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0551555515512414333b331b333b3333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0511515511512412331b3333331b3333000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05515555155124143333313333333b33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
05115555115111113333333333331b33000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
