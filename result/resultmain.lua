main_state = require("main_state")

local property = require("lua.mainproperty")

local filepath = {
	{name = "Default Stagefile",			path = "parts/stagefile.png"},
	{name = "Result Background (CLEAR AAA)",	path = "backgrounds/aaa.png"},
	{name = "Result Background (CLEAR AA)",		path = "backgrounds/aaa.png"},
	{name = "Result Background (CLEAR A)",		path = "backgrounds/aaa.png"},
	{name = "Result Background (CLEAR)",		path = "backgrounds/aaa.png"},
	{name = "Result Background (FAILED)",		path = "backgrounds/aaa.png"},
}

local header = {
	type = 7,
	name = "GroundbreakinG Skin Ver.0.1 Result",
	w = 1920,
	h = 1080,
	scene = 3600000,
	input = 500,
	fadeout = 500,
	property = property.property,
	filepath = filepath
}

local function main()
	local textproperty = require("lua.textproperty")
	local imageproperty = require("lua.imageproperty")
	local valueproperty = require("lua.valueproperty")
	local graph = require("lua.graph")

	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	skin.source = {
		{id = "parts",	path = "parts.png"},
		{id = "grade", path = "customize/grade/rank.png"},
		{id = "stagefile",	path = "customize/stagefile/*.png"},
  {id = "scoreframe",	path = "parts/scoreframe.png"},
		{id = "bg_aaa",	path = "customize/bg/aaa/*.png"},
		{id = "bg_aa",	path = "customize/bg/aa/*.png"},
		{id = "bg_a",	path = "customize/bg/a/*.png"},
		{id = "bg_c",	path = "customize/bg/clear/*.png"},
		{id = "bg_f",	path = "customize/bg/failed/*.png"},
	}

	skin.font = textproperty.font
	skin.text = textproperty.text
	skin.image = imageproperty.image
	skin.value = valueproperty.value
	skin.gaugegraph = graph.gaugegraph
	skin.judgegraph = graph.judgegraph
	skin.timingdistributiongraph = graph.timingdistributiongraph

	--Commonly used variable values
	local function diffRGB()
		if main_state.option(151) then
			return {113, 255, 168}
		elseif main_state.option(152) then
			return {121, 215, 255}
		elseif main_state.option(153) then
			return {255, 187, 71}
		elseif main_state.option(154) then
			return {189, 95, 103}
		elseif main_state.option(155) then
			return {159, 128, 255}
		elseif main_state.option(150) then
			return {205, 205, 205}
		end
	end

 local timingX = 2500
	local playerX = 300
	local songInfoY = 210
	local RGB = diffRGB()

 local clearX = 530
	local clearY = 415
	local songX = 300
	local gaugeY = 428


	local avg_timing	= main_state.number(374) + (main_state.number(375) * 0.01)
	local std_dev	= main_state.number(376) + (main_state.number(377) * 0.01)
	local avg_str	= nil
	if avg_timing < 0 then
	  avg_timing = avg_timing * -1
	  avg_str = "Avg " .. avg_timing .. " ms"
	else
	  avg_str = "Avg " .. avg_timing .. " ms"
	end
	local std_str = "Stdev " .. std_dev .. " ms"

	local playerid_str = main_state.text(2)

	local ir_str = ""

	
	  table.insert(skin.text, {id = "avg",	font = 0, size = 24, align = 0, constantText = avg_str})
	  table.insert(skin.text, {id = "std",	font = 0, size = 24, align = 0, constantText = std_str})
	  table.insert(skin.text, {id = "player",	font = 0, size = 24, align = 2, constantText = playerid_str})
	 	table.insert(skin.text, {id = "ir",	font = 0, size = 24, align = 2, constantText = ir_str})
	  table.insert(skin.text, {id = "offline",	font = 0, size = 48, align = 2, constantText = "NETWORK OFFLINE"})


	skin.destination = {
		--Background
		{id = "bg_c", op = {90}, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 100}}},
		{id = "bg_aaa", op = {90,300}, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 100}}},
		{id = "bg_aa", op = {90,301}, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 100}}},
		{id = "bg_a", op = {90,302}, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 100}}},
		{id = "bg_f", op = {91}, dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 100}}},


		--Timing Info
		{id = "avg",	filter = 1,	dst = {{x = timingX, y = 36, h = 24, r = 221, g = 229, b = 237}}},
		{id = "std",	filter = 1,	dst = {{x = timingX, y = 6, h = 24, r = 221, g = 229, b = 237}}},

		--IR Info
  {id = "player",	 op = {51, 922, -923}, filter = 1,	dst = {{x = playerX + 480, y = 120, h = 24, r = 221, g = 229, b = 237}}},
		{id = "ir_rank",	filter = 1,op = {51, 922, -923},	dst = {{x = playerX + 90, y = 200, w = 36, h = 36}}},
		{id = "ir_total",	filter = 1, op = {51, 922, -923},	dst = {{x = playerX + 330, y = 200, w = 36, h = 36}}},
		{id = "offline", op = {50, 922, -923},	filter = 1,	dst = {{x = playerX + 530, y = 380, h = 24, r = 221, g = 120, b = 120}}},

		--Gauge Area
		{id = "gaugeborder", dst = {{x = 750, y = gaugeY, w = 688, h = 342}}},
		{id = "gaugegraph", blend = 2, dst = {{x = 880, y = gaugeY + 2, w = 684, h = 200}}},
		--{id = "randombox", filter = 1, dst = {{x = 1025, y = ranY + 1, w = 675, h = 60, r = RGB[1], g = RGB[2], b = RGB[3]}}},
		--{id = "random-option",	filter = 1, dst = {{x = 1038, y = ranY, w = 340, h = 24}}},
		--{id = "random-option-2p",	filter = 1, dst = {{x = 1038, y = ranY, w = 340, h = 24}}},
		--{id = "random-option-dp",	filter = 1, dst = {{x = 1038, y = ranY, w = 340, h = 24}}},

		--Clear Info Area

		--Song Info
		{id = "stagefile", op = {910,190}, stretch = 1, filter = 1, dst = {{x = 1490, y = 40, w = 380, h = 285}}},
		{id = -100, op = {910,191}, stretch = 1, filter = 1, dst = {{x = 1490, y = 40, w = 380, h = 285}}},

		{id = "title", filter = 1, dst = {{x = songX + 60, y = songInfoY + 780, w = 340, h = 48, r = 221, g = 229, b = 237}}},
  {id = "subtitle", filter = 1, dst = {{x = songX + 60, y = songInfoY + 750, w = 680, h = 24, r = 37, g = 230, b = 239}}},
  {id = "artist", filter = 1, dst = {{x = songX + 60, y = songInfoY + 700, w =680, h = 48, r = 221, g = 229, b = 237}}},
  {id = "difficulty",	filter = 1, dst = {{x = songX + 60 , y = songInfoY + 600, w = 475, h = 24, r = RGB[1], g = RGB[2], b = RGB[3]}}},

  {id = "notes", filter = 1, dst = {{x = songX + 288 + 150,  y = songInfoY + 600, w = 280, h = 30, r = 221, g = 229, b = 237}}},

		--Clear
		{id = "bestclear",	loop = 200, dst = {{time = 0, x = clearX - 32, y = clearY + 230,	w = 202, h = 31, a = 0},{time = 200, a = 255}}}, --best
		{id = "clear",	loop = 200, dst = {{time = 0, x = clearX + 140, y = clearY + 230,	w = 202, h = 31, a = 0},{time = 200, a = 255}}}, --current

		--Score
		{id = "bestscore",		loop = 200, dst = {{time = 0, x = clearX,		y = clearY + 120,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "currentscore",		loop = 200, dst = {{time = 0, x = clearX + 180,		y = clearY + 120,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},


		--Miss
		{id = "bestmiss",		loop = 200, dst = {{time = 0, x = clearX,	y = clearY + 70,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "currentmiss",		loop = 200, dst = {{time = 0, x = clearX + 180,	y = clearY + 70,	w = 32, h = 37, a = 0},{time = 200, a = 255}}},



		-- --Score Rate
		-- {id = "bestrate",	loop = 200, dst = {{time = 0, x = 1331,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		-- {id = "rateperiod",			loop = 200, dst = {{time = 0, x = 1377,	y = clearY + 253,	w = 10, h = 18, a = 0},{time = 200, a = 255}}}, --best
		-- {id = "bestratedec",	loop = 200, dst = {{time = 0, x = 1387,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		-- {id = "ratepercent",		loop = 200, dst = {{time = 0, x = 1418,	y = clearY + 253,	w = 21, h = 19, a = 0},{time = 200, a = 255}}}, --best
		-- {id = "currentrate",	loop = 200, dst = {{time = 0, x = 1557,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		-- {id = "rateperiod",			loop = 200, dst = {{time = 0, x = 1603,	y = clearY + 253,	w = 10, h = 18, a = 0},{time = 200, a = 255}}}, --current
		-- {id = "currentratedec",	loop = 200, dst = {{time = 0, x = 1613,	y = clearY + 253,	w = 16, h = 18, a = 0},{time = 200, a = 255}}},
		-- {id = "ratepercent",		loop = 200, dst = {{time = 0, x = 1644,	y = clearY + 253,	w = 21, h = 19, a = 0},{time = 200, a = 255}}}, --current

 --左の文字
 {id = "scoreframe", dst = {{x = 0, y = 10, h = 1080, w = 1320}}},

		--Timing
		{id = "fast",	loop = 200, dst = {{time = 0, x = 1320, y = 340, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "slow",	loop = 200, dst = {{time = 0, x = 1320, y = 299, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
		{id = "cb",	loop = 200, dst = {{time = 0, x = 1320, y = 260, w = 32, h = 37, a = 0},{time = 200, a = 255}}},
	}
	--Grades
	for i = 0, 7 do
		table.insert(skin.destination, {id = "gradesmall"..i,	loop = 200, op = {320 + 1 * i}, dst = {{time = 0, x = clearX + 10, y = clearY + 170,	w = 101, h = 38, a = 0},
		{time = 200, a = 255}}}) --current
		table.insert(skin.destination, {id = "gradesmall"..i,	loop = 200, op = {300 + 1 * i}, dst = {{time = 0, x = clearX + 190, y = clearY + 170,	w = 101, h = 38, a = 0},
		{time = 200, a = 255}}}) --best
		table.insert(skin.destination, {id = "gradelarge"..i,	loop = 200, op = {300 + 1 * i}, dst = {{time = 0, x = clearX + 1000,y = clearY + 300,	w = 415, h = 178, a = 0},
		{time = 200, a = 255}}}) --big
	end

	for i = 0, 4 do
		table.insert(skin.destination, {id = "jg"..i,	loop = 200, dst = {{time = 0, x = 1060, y = 338 - 51 * i, w = 32, h = 37, a = 0},
		{time = 200, a = 255}}})

	end
 table.insert(skin.destination, {id = "miss",	loop = 200, dst = {{time = 0, x = 1060, y = 90, w = 32, h = 37, a = 0},
 {time = 200, a = 255}}})



	--Judges
	for i = 0, 4 do
		table.insert(skin.destination, {id = "judge"..i, filter = 1, op = {180 + 1 * i}, dst = {{x = songX + 330, y = songInfoY + 600, w = 280, h = 24, r = 221, g = 229, b = 237}}})
	end

	--fadein
	table.insert(skin.destination, {id = -110, loop = -1, dst = {
			{time =   0, x = 0, y = 0, w = 1920, h = 1080, a = 255},
			{time = 500, x = 0, y = 0, w = 1920, h = 1080, a = 0},
	}})
	--fadeout
	table.insert(skin.destination, {id = -110, loop = 500, timer = 2, dst = {
			{time =   0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 500, x = 0, y = 0, w = 1920, h = 1080, a = 255},
	}})

 

	return skin
end

return {
	header = header,
	main = main
}