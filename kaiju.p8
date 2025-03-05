pico-8 cartridge // http://www.pico-8.com
version 42
__lua__
-- kaiju
-- @umagrillo v0.0.1
-- Based on the origial game Projeto H.A.D.E.S. by Tiago Junges
-- https://coisinhaverde.com.br/jogos/downloadsgratuitos/

h = {}
d = {}
c = 1
k = {}
tx = {}
updt = {}
t = 1
kaijus = {
	{"akuma no tsubasa", 3, 20, 700},
	{"katai koura", 2, 30, 600 },
	{"kyouryuu", 3, 30, 900},
	{"ono atama", 4, 30, 1000},
	{"kyodainaga", 3,40,1000},
	{"shin-ennaru kyoufu",4,50,3000}
}
hp = {
	{false,15,7,{sub1}},
	{false,27,{add1,sub1}},
	{false,39,7,{add1}},
	{false,51,12,{eq1}},
	{false,63,7,{sub1}},
	{false,75,7,{add1,lt}},
	{false,87,7,{gt}},
	{false,-1,24,{neqn}},
	{false,11,24,{neql,neqn}},
	{false,23,24,{neql}},
	{false,82,27,{eqn}},
	{false,94,27,{eql}},
	{false,-1,57,{lt}},
	{false,11,57,{gt,eqn}},
	{false,23,57,{eql}},
	{false,74,57,{lt}},
	{false,86,57,{gt,eqn}},
	{false,98,57,{eql}},
	{false,14,84,{}}	
}


function _init()
--	i_title()
 i_intro()
 i_prelevel()
 i_level()
end

function init(u,d)
	t = 1
	updt = u
	_draw= d
end

function _update()
	t = 1 + t
	updt()
end

function i_title()
	init(u_title,d_title)  
end

function i_intro()
	init(u_intro,d_intro)
	h = {
		lm = 18,
		l = 18,
		n = "hero",
		p = 1,
		m = 300,
		c = 4,
		h = 4,
		a = 0,
		ma= 0
	}
	--damage
	for hpp in all(hp) do
		hpp[1] = false
	end
end

function i_briefing()
	init(u_briefing,d_briefing)
end

function i_prelevel()
	h.l = h.lm
	h.s = "idle"
	h.h = 4
	i_kaiju(ceil(rnd(#kaijus)))
	init(u_prelevel,d_prelevel)
end

function i_level()
	init(u_level,d_level)
end

function i_poslevel()
	init(u_poslevel,d_poslevel)
end

function i_gameover()
	init(u_gameover,d_gameover)
end

function i_kaiju(i)
	local kaiju = kaijus[i]
	k.n = kaiju[1]
	k.p = kaiju[2]
	k.lm= kaiju[3]
	k.l = k.lm
	k.r = kaiju[4]
	print("kaiju: "..k.n..": "..k.p.."/"..k.lm)
end
-->8
-- draw

function d_title()
 cls(1)
	print("this is a title screen",0,64,6)
end

function d_intro()
 cls(1)
	print("this is the intro",0,64,6)
end

function d_briefing()
 cls(1)
	print("this is the briefing",0,64,6)
end

function d_prelevel()
 cls(1)
	print("the level is loading...",0,64,6)
end

function d_level()
 cls(1)
	d_sky()
	d_back()
	d_mid()
	d_hero()
	d_kaiju()
	h.s="take"
	if h.s == "take" then
		d_select_target()	
	elseif h.s == "taking" then
	 d_taking()
	elseif h.s == "attack" then
	 d_select_attack()
	elseif h.s == "attacking" then
	 d_attacking()
	end
end

function d_poslevel()
	cls(1)
	print("the level is over",0,64,6)
end

function d_gameover()
	cls(1)
	print("game over screen",0,64,6)
end

function d_life(who)
	
end
--level
function	d_sky()
	
end
function	d_back()
	
end
function	d_mid()
	
end
function	d_hero()

end
function d_dmg_panel(x,y)
	-- head
	spr(16,48+x,16+y,1,2)
	spr(16,56+x,16+y,1,2,true)
	-- right arm 
	spr(17,32+x,26+y,2,2)
	spr(49,32+x,42+y,1,1)
	-- left arm
	spr(17,64+x,26+y,2,2,true)
	spr(49,72+x,42+y,1,1,true)
	-- trunk
	spr(19,44+x,33+y,2,2)
	spr(19,60+x,33+y,1,2,true)
	-- right leg
	spr(21,44+x,50+y)
	spr(37,37+x,58+y,2,2)
	-- left leg
	spr(21,60+x,50+y,1,1,true)
	spr(37,59+x,58+y,2,2,true)
	-- die
	-- right arm
	d_die(hp[1][1],17+x,y)
	d_die(hp[2][1],29+x,y)
	d_die(hp[3][1],41+x,y)
	spr(10,23+x,y)
	spr(10,35+x,y)
	line(16+x,9+y,49+x,9+y,7)
	line(49+x,10+y,40+x,24+y,7)
	-- head
	d_die(hp[4][1],53+x,5+y)
	spr(11,53+x,y)
	line(52+x,14+y,61+x,14+y,7)
	line(57+x,15+y,56+x,16+y,7)
	-- left arm
	d_die(hp[5][1],65+x,y)
	d_die(hp[6][1],77+x,y)
	d_die(hp[7][1],89+x,y)
	spr(10,71+x,y)
	spr(9,83+x,y)
	line(64+x,9+y,97+x,9+y,7)
	line(80+x,10+y,75+x,24+y,7)
	-- upper body
	d_die(hp[8][1],1+x,17+y)
	d_die(hp[9][1],13+x,17+y)
	d_die(hp[10][1],25+x,17+y)
	spr(8,19+x,16+y)
	spr(8,7+x,16+y)
	line(x,25+y,34+x,25+y,7)
	line(17+x,26+y,50+x,36+y,7)
	-- lower body
	d_die(hp[11][1],84+x,20+y)
	d_die(hp[12][1],96+x,20+y)
 spr(7,90+x,20+y)
	line(83+x,29+y,104+x,29+y,7)
	line(92+x,30+y,60+x,44+y,7)
	-- right leg
	d_die(hp[13][1],1+x,50+y)
	d_die(hp[14][1],13+x,50+y)
	d_die(hp[15][1],25+x,50+y)
	spr(9,7+x,50+y)
	spr(7,19+x,50+y)
	line(x,59+y,33+x,59+y)
	line(16+x,60+y,39+x,67+y)
	-- left leg
	d_die(hp[16][1],76+x,50+y)
	d_die(hp[17][1],88+x,50+y)
	d_die(hp[18][1],100+x,50+y)
	spr(9,82+x,50+y)
	spr(7,94+x,50+y)
	line(75+x,59+y,108+x,59+y)
	line(91+x,60+y,72+x,67+y)
	-- core
	print("core",0,77,7)
	for i=1,4 do
		local ★=48
		if i>h.c then
			★=51
		end
		spr(★,7+(i*9),76)
	end
	
	-- overheat
	print("heat",58,77,9)
	for i=1,4 do
		local ★=48
		if i>h.h then
			★=50
		end
		spr(★,65+(i*9),76)
	end
	-- cursor
	if t%5 ~= 0 then
		spr(52,hp[c][1],hp[c][2])
	end
end

function d_die(val,x,y)
	if val then
		spr(val,x,y)
	else
	 spr(48,x,y)
	end
end

function d_attack_roll()
	
end
function d_damage_roll()
	
end
function d_cockpit(x,y)
	
end

function	d_kaiju()
	
end
function d_select_target()
 d_dmg_panel(0,0)
end

function d_dices()
 
end	
function d_taking()
	
end
function d_select_attack()
	
end
function d_attacking()
	
end
-- briafing
function d_room()
	
end
function d_missions()
	
end
function d_garage()
	
end
function d_money()
	
end

-->8
-- update

function u_title()
	if btnp(❎) then
		i_intro()
	end
end

function u_intro()
	if t%30 == 0 then
		i_briefing()
	end
end

function u_briefing()
	if btnp(❎) then
		i_prelevel()
	end
end

function u_prelevel()
 if t%30 == 0 then
 	i_level()
 end
end

function u_level()
 

 local die = d[#d]
	if h.l <= 0 or k.l <= 0 then
		i_poslevel()
	end
	if btnp(⬅️) or btnp(⬆️) then
  c = find_next(c,die,false)
	elseif btnp(➡️) or btnp(⬇️) then
	 c = find_next(c,die,true)
	elseif btnp(🅾️) or btnp(❎) then
	 local valid = true
	 for fn in all(hp[c][4]) do
	 	valid = valid and fn(c,die)
  end
  if valid then
  	hp[c][1] = die
  	deli(d,#d)
  else
   print("invalid position")
  end
	end
end

function u_poslevel()
	if t%30 == 0 then
		if h.l <= 0 then
			i_gameover()
		else
		 i_briefing()
		end
	end
end

function u_gameover()
	if t%30 == 0 then
		i_title()
	end
end

function find_next(pos,die,reverse)
 local step,ini,fim = 1,pos+1,pos+18
	if (reverse) step = -1,pos+18,pos+1
	for i=ini,fim,step do
	 local cn = i%19 
	 if cn>0 and not hp[cn][1] then
	 	return cn
  end 
	end
	return 19
end
__gfx__
00000000077777700777777007777770077777700777777007777770000000000000200000a0000000000900000008002265555ddddddddd1111111100000000
0000000077777776777771167777711671177116711771167117711600333300002272000a7aa00000909790088887808865555dddd111115555555500000000
00700700777777767777711677777116711771167117711671177116037777300277772000a77a0009799790877787806666555ddd1555550000000000000000
000770007778877677777776777887767777777677788776788778860033330000257200000a77a09777979008888780969655ddd15000000000000000000000
00077000777887767777777677788776777777767778877678877886037777300277772000a77a0009799790877787809a9a65ddd15000000000000000000000
0070070077777776711777767117777671177116711771167117711600333300002722000a7aa0000090979008888780b3b365ddd15000000000000000000000
00000000777777667117776671177766711771167117711671177116000000000002000000a00000000009000000080066666ddddd1500000000000000000000
000000000666666006666660066666600666666006666660066666600000000000000000000000000000000000000000dddddddddd1500000000000000000000
00000000000006666660000000000666600000060066660000800020008822000000020000000000000000000bb0000000000880ddd150000000000000000000
6000060000006cccccc60000000006ccc666666c06cccc608088022008888220000228200445444000000000bbbb000000008882ddd150000000000000000000
600066660006cccccccc600000006ccccc6cc6cc06ccccc60888882028888822022888204554554500000000bbbb000000088220ddd150000000000000000000
6006cc6c006cccccccccc66600006ccccc6cc6cc06ccccc6888888802882888828882282544544540bbbbb00b33b000000822000ddd150000000000000000000
606ccc6c0066666cccccccc60666cccccc6cc6cc6cccccc6888118180288228220828822255455423bb55bb033330000028800881ddd15000000066666666666
606cccc600000006ccccccc66cccccccccc66ccc6cccccc68888181802888820002882023222222333bbb33043434000022888201ddd15000000061c11111111
06c66cc6000000006cccccc66cccccccccc66ccc6666cc6608288888002288200200200003bbb3300333303043434000000220201ddd15000000061111111111
06cc666600000006c6cccc606cccccccccc66ccc6ccc66000082822800002200000020000033330000000000000000000000000051ddd155555556c111111111
06cc66c60000006cc6666660066ccccccc6cc6cc00000066ccc6000000000000000000000008888000000000008000000000000051dddd111111161111111111
06ccccc6000006cccccc60000006666666cccc660000006c666c600000000000000000000028888800000000008800000000000051ddddddddddd61c11111111
006cccc600006cccccc600000006cccc6c6cc6c60000006ccccc60000000000000000000028888888000000000888000000000001dddddddddddd66666666666
006cc66c000066cccc6000000006cccc6cc66cc60000006cccccc600000700700700000002888888880000000881188000000000dd6666ddddd6666666666666
006c6c6c0066cc6cc600000000006cc6cc6cc6cc0000006cccccc600007707707700000028888888880000008288182800000000dd6bb65dddd65c1c11111111
0006cc6c06ccccc660000000000006c6cc6cc6cc0000006cccccc600008888888888000028828882880000008228888800000000d633655dddd611c111111111
0006ccc606cccccc600000000000006cc6cccc6c000006cccccccc60088882888828800022882222220000002222222800000000d666655dddd611c111111111
000066666ccccccc600000000000000666666666000006cccccccc608828888828822800228888888800000022200000000000006996555dddd6cc1c11111111
066666606cccccc608888a800222222000000000000006cc66cccc60288228288228888022888888880000000900990000000000000000000000000000000000
611111166cc66660888aa8822277772500888880000006c6cc666c60822888822882882022888888888000009000099000000000000000000000000000000000
611111166c6cccc688aa8882277777750022288000000666cc6cc600888888888888822002222888888000009449999900000000000000000000000000000000
6111111606ccccc68aa9a882271771750008828000066ccc66ccc600822282222888220002222288828000009499919900000000000000000000000000000000
6111111606ccccc68aa9aa822676576500888080066cccccc66ccc60022222222222200002222228222000009499991900000000000000000000000000000000
6111111600666cc68a999a8222566525002820806cccccccc60ccc60002222222222000000222228222000009991199900000000000000000000000000000000
611111160000066088a9a82222277255000200206ccccccc6006ccc6000222222220000000222222220000004444099000000000000000000000000000000000
06666660000000000222222005555550000000006666666660006666000000000000000000022222200000004440990000000000000000000000000000000000
