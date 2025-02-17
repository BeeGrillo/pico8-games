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

function dr_split_screen()
 cls(0)
 rect(1,1,126,th-1,7)
 rect(3,3,124,th-3,6)
	local y = 5
	if game_state == "game_begin"
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


__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000099000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070000009990c00000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700099999999c00000c000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0007700044449994dcc0ccd000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000099400ddcdd0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000004400000d000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
