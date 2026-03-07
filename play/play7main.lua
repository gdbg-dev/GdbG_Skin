-- Copyright GroundbreakinG

-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at

--     http://www.apache.org/licenses/LICENSE-2.0

-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

local main_state = require("main_state")
local layout = require("layout")
local build_sources = require("sources")
local build_images = require("images")
local build_values = require("values")
local build_text = require("text")
local destinations = require("destinations")


local category = {
	{name = "メイン", item = {
		"main_1",
		"main_2",
		"main_5",
		"main_6"
	}},
	{name = "プレイ", item = {
		"play_1",
		"play_2",
		"play_3",
		"play_4",
		"play_16",
		"play_17",
		"play_5",
		"play_6",
		"play_18",
		"play_19",
		"play_7",
		"play_15",
		"play_8",
		"play_10",
		"play_11",
		"play_12",
		"play_13",
		"play_14",
	}},

}

local property = {
	{name = "スクラッチノーツ", category = "main_1", item = {
		{name = "左", op = 900},
		{name = "右", op = 901}
	}},
	{name = "プレイエリア", category = "main_2", item = {
		{name = "1P側(左)", op = 902},
		{name = "2P側(右)", op = 906},
	}},
	{name = "スクラッチキービーム", category = "play_15", def = "Scratch", item = {
		{name = "スクラッチ", op = 922},
		{name = "キーボード", op = 923}
	}},
	{name = "ターゲット", category = "play_3", def = "Off", item = {
		{name = "なし", op = 912},
		{name = "ベストスコア", op = 913},
		{name = "ターゲットスコア", op = 914}
	}},
	{name = "Fast/Slow", category = "play_5", def = "Off", item = {
		{name = "なし", op = 915},
		{name = "あり", op = 916},
		{name = "あり(+スコア差分)", op = 926},
	}}
}

local function isScratchRight()
	return skin_config.option["スクラッチノーツ"] == 901
end

local function is2P()
	return skin_config.option["プレイエリア"] == 906
end

local function plays_2P_side()
	local value = 0
	local index = skin_config.option["プレイエリア"]
	if index == 906 then -- 2P
		value = 1280
	elseif index == 902 then -- 正常
		value = 0
	else
		value = 640
	end
	return value
end

local function f_gaugewidth()
	local value = 0
	local index = skin_config.option["プレイエリア"]
	if index == 902 then -- 正常
		value = 0
	elseif index == 906 then -- 2P
		value = -350
	else
		value = 1280
	end
	return value
end

local function f_score_pos()
	local value = 0
	local index = skin_config.option["プレイエリア"]
	if index == 902 then
		value = 0
	elseif index == 906 then
		value = 480
	else
		value = 1280
	end
	return value
end

local function f_info_pos()
	local value = 0
	local index = skin_config.option["プレイエリア"]
	if index == 902 then
		value = 0
	elseif index == 906 then
		value = 910
	else
		value = 1280
	end
	return value
end

local function isTargetBest()
	return skin_config.option["ターゲット"] == 913
end

local function isKeybeamKB()
	return skin_config.option["スクラッチキービーム"] == 923
end
local function isFastSlowOn()
	return skin_config.option["Fast/Slow"] == 916
end

local function isFastSlowMS()
	return skin_config.option["Fast/Slow"] == 926
end



local filepath = {
	{name = "ノーツ", category = "play_1", path = "parts/notes/*.png"},
	{name = "判定", category = "play_2", path = "parts/judge/*.png", def = "_default2"},
	{name = "キービーム", category = "play_7", path = "parts/keybeam/*.png", def = "medium"},
	{name = "ボム", category = "play_8", path = "parts/bomb/*.png", def = "_default"},
	{name = "レーンカバー", category = "play_11", path = "parts/lanecover/*.png", def = "_default"},
	{name = "リフトカバー", category = "play_12", path = "parts/liftcover/*.png", def = "_default"},
	{name = "HIDDEN用カバー", category = "play_13", path = "parts/hiddencover/*.png", def = "_black"}

}

local offset = {
	{name = "レーンの明るさ(0~255)", category = "play_10", id = 50, x = false, y = false, w = false, h = false, r = false, a = true},
	{name = "BGAの明るさ(0~255)", category = "main_6", id = 55, x = false, y = false, w = false, h = false, r = false, a = true}

}



local header = {
	type = 0,
	name = "GroundbreakinG Skin Ver.0.1 7Keys",
	w = 1920,
	h = 1080,
	loadend = 3000,
	playstart = 1000,
	scene = 3600000,
	input = 0,
	close = 3000,
	fadeout = 500,
	property = property,
	filepath = filepath,
	offset = offset,
	category = category
}



local function main()
	local skin = layout.copy_header(header)

	local c_play_pos = plays_2P_side()
	local c_score_pos = f_score_pos()
	local c_info_pos = f_info_pos()
	local c_info_gwidth = f_gaugewidth()
	local geometry, notesInfo = layout.build_geometry({
		play_position = c_play_pos,
		score_position = c_score_pos,
		gauge_width = c_info_gwidth,
		info_position = c_info_pos,
		is_scratch_right = isScratchRight(),
	})

	skin.source = build_sources()

	local score_label_font_path = "../fonts/Audiowide-Regular.ttf"

	skin.font = {
		{id = 0, path = "../fonts/Mplus1p-Medium.ttf"},
		{id = 1, path = "../fonts/Mplus1p-ExtraBold.ttf"},
		{id = 2, path = score_label_font_path},
	}

	skin.image = build_images(geometry, notesInfo)
	skin.imageset = {}
	skin.value = build_values()
	skin.text = build_text()
	skin.slider = {
		{id = "song-progress", src = "system_src", x = 1090, y = 900, w = 15, h = 30, angle = 2, range = 745, type = 6},
		{id = "lanecover", src = "lanecover_src", x = 0, y = 0, w = -1, h = -1, angle = 2, range = 853, type = 4},

	}
	skin.hiddenCover = {
		{id = "hiddencover", src = "hiddencover_src", x = 0, y = 0, w = 513, h = 853, disapearLine = geometry.lane_y + 3},

	}
	skin.liftCover = {
		{id = "liftcover", src = "liftcover_src", x = 0, y = 0, w = 513, h = 853, disapearLine = geometry.lane_y + 3},

	}
	skin.graph = {
		{id = "graph-now", src = "system_src", x = 605, y = 350, w = 5, h = 10, angle = 1, type = 110},
		{id = "graph-final", src = "system_src", x = 605, y = 350, w = 5, h = 10, angle = 1, type = 111},
		{id = "graph-best", src = "system_src", x = 615, y = 360, w = 5, h = 10, angle = 1, type = 113},
		{id = "graph-best-now", src = "system_src", x = 615, y = 360, w = 5, h = 10, angle = 1, type = 112},
		{id = "graph-target", src = "system_src", x = 625, y = 360, w = 5, h = 10, angle = 1, type = 115},
		{id = "graph-target-now", src = "system_src", x = 625, y = 360, w = 5, h = 10, angle = 1, type = 114},

		{id = "load-progress", src = "system_src", x = 530, y = 0, w = 1450, h = 3, angle = 0, type = 102},


	}
	skin.note = {
		id = "notes",
		note = {"note-Wh", "note-Bl", "note-Wh", "note-Ye", "note-Wh", "note-Bl", "note-Wh", "note-Sc"},
		lnend = {"lnEn-Wh", "lnEn-Bl", "lnEn-Wh", "lnEn-Ye", "lnEn-Wh", "lnEn-Bl", "lnEn-Wh", "lnEn-Sc"},
		lnstart = {"lnSt-Wh", "lnSt-Bl", "lnSt-Wh", "lnSt-Ye", "lnSt-Wh", "lnSt-Bl", "lnSt-Wh", "lnSt-Sc"},
		lnbody = {"lnBo-Wh", "lnBo-Bl", "lnBo-Wh", "lnBo-Ye", "lnBo-Wh", "lnBo-Bl", "lnBo-Wh", "lnBo-Sc"},
		lnactive = {"lnAc-Wh", "lnAc-Bl", "lnAc-Wh", "lnAc-Ye", "lnAc-Wh", "lnAc-Bl", "lnAc-Wh", "lnAc-Sc"},
		hcnend = {"hcEn-Wh", "hcEn-Bl", "hcEn-Wh", "hcEn-Ye", "hcEn-Wh", "hcEn-Bl", "hcEn-Wh", "hcEn-Sc"},
		hcnstart = {"hcSt-Wh", "hcSt-Bl", "hcSt-Wh", "hcSt-Ye", "hcSt-Wh", "hcSt-Bl", "hcSt-Wh", "hcSt-Sc"},
		hcnbody = {"hcBo-Wh", "hcBo-Bl", "hcBo-Wh", "hcBo-Ye", "hcBo-Wh", "hcBo-Bl", "hcBo-Wh", "hcBo-Sc"},
		hcnactive = {"hcAc-Wh", "hcAc-Bl", "hcAc-Wh", "hcAc-Ye", "hcAc-Wh", "hcAc-Bl", "hcAc-Wh", "hcAc-Sc"},
		hcndamage = {"hcDm-Wh", "hcDm-Bl", "hcDm-Wh", "hcDm-Ye", "hcDm-Wh", "hcDm-Bl", "hcDm-Wh", "hcDm-Sc"},
		hcnreactive = {"hcRe-Wh", "hcRe-Bl", "hcRe-Wh", "hcRe-Ye", "hcRe-Wh", "hcRe-Bl", "hcRe-Wh", "hcRe-Sc"},
		mine = {"mine-Wh", "mine-Bl", "mine-Wh", "mine-Bl", "mine-Wh", "mine-Bl", "mine-Wh", "mine-Sc"},
		hidden = {},
		processed = {},
		group = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y, w = geometry.lane_w - (geometry.lane_line_width * 2), h = 3, r = 128, g = 128, b = 128}
			}}
		},
		time = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y, w = geometry.lane_w - (geometry.lane_line_width * 2), h = 15, r = 100, g = 100, b = 255}
			}}
		},
		bpm = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y, w = geometry.lane_w - (geometry.lane_line_width * 2), h = 15, r = 100, g = 255, b = 100}
			}}
		},
		stop = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y, w = geometry.lane_w - (geometry.lane_line_width * 2), h = 15, r = 255, g = 100, b = 100}
			}}
		}
	}

	layout.apply_note_geometry(skin, geometry, notesInfo, isScratchRight())
	





	skin.gauge = {
		id = "gauge",
		nodes = {
		-- 並び順はoverclear(明),underclear(明),overclear(暗),underclear(暗),先端の色(明),先端の色(暗)
		-- アシストイージーゲージ
  "gauge-r1","gauge-p1","gauge-r2","gauge-p2","gauge-r3","gauge-p3",
		-- イージーゲージ
		"gauge-r1","gauge-g1","gauge-r2","gauge-g2","gauge-r3","gauge-g3",
		-- ノーマルゲージ
		"gauge-r1","gauge-b1","gauge-r2","gauge-b2","gauge-r3","gauge-b3",
		-- ハードゲージ(2,4,6番目はダミー？)
		"gauge-r1","gauge-p1","gauge-r2","gauge-p2","gauge-r3","gauge-p3",
		-- EXハードゲージ(2,4,6番目はダミー？)
		"gauge-y1","gauge-p1","gauge-y2","gauge-p2","gauge-y3","gauge-p3",
		-- ハザードゲージ(2,4,6番目はダミー？)
		"gauge-w1","gauge-w1","gauge-w2","gauge-w2","gauge-w3","gauge-w3"
		}
	}
	skin.judge = {
		{
			id = "judge",
			index = 0,
			images = {
				{id = "judge-pg", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y, w = 191, h = 61},
					{time = 500}
				}},
				{id = "judge-gr", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y, w = 191, h = 61},
					{time = 500}
				}},
				{id = "judge-gd", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = 40 + geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y, w = 191, h = 61},
					{time = 500}
				}},
				{id = "judge-bd", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = 50 +geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y, w = 191, h = 61},
					{time = 500}
				}},
				{id = "judge-pr", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = 40 + geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y, w = 191, h = 61},
					{time = 500}
				}},
				{id = "judge-ms", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = 40 + geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y, w = 191, h = 61},
					{time = 500}
				}}
			},
			numbers = {
				{id = "judge-num-pg", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 224, y = 0, w = 50, h = 70},
					{time = 500}
				}},
				{id = "judge-num-gr", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 224, y = 0, w = 50, h = 70},
					{time = 500}
				}},
				{id = "judge-num-gd", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 224, y = 0,  w = 50, h = 70},
					{time = 500}
				}},
				{id = "judge-num-bd", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 224, y = 0, w = 50, h = 70},
					{time = 500}
				}},
				{id = "judge-num-pr", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 224, y = 0,   w = 50, h = 70},
					{time = 500}
				}},
				{id = "judge-num-ms", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 224, y = 0,   w = 50, h = 70},
					{time = 500}
				}}
			},
			shift = true
		}

	}
	skin.bga = {id = "bga"}
	skin.judgegraph = {}
	skin.bpmgraph = {
		{id = "bpm-graph"}
	}
	skin.timingvisualizer = {
		{id = "timing"}
	}
 
	skin.destination = {}
	destinations.append_intro_destinations(skin, geometry, {
		is_2p = is2P,
		main_state = main_state,
	})
	

	-- --プレイヤー情報
	-- --ここから
	-- if isPlayerinfoOn() then

	-- 	--自由スペース・アイコン
	-- 	table.insert(skin.destination, {id = "player-freespace", filter = 1, dst = {{x = 115 + geometry.info_position, y = 45, w = 500, h = 70}}})
	-- 	table.insert(skin.destination, {id = "player-icon", filter = 1, dst = {{x = 35 + geometry.info_position, y = 45, w = 70, h = 70}}})
	-- 	--プレイヤーの名前
	-- 	table.insert(skin.destination, {id = "playername", filter = 1, dst = {{x = 120 + geometry.info_position, y = 76, w = 480, h = 32}}})

	-- 	--間の線
	-- 	table.insert(skin.destination, 
	-- 		{id = "player-line", loop = 600, dst = {
	-- 			{time = 0, x = 115 + geometry.info_position, y = 75, w = 0, h = 3, acc = 2},
	-- 			{time = 100},
	-- 			{time = 600, w = 335}
	-- 	}})

	-- 	--名前下の自由入力欄
	-- 	--ここから
	-- 	table.insert(skin.font, {id = 2, path = "../fonts/Mplus1p-Regular.ttf"})
	-- 		--公式のサンプルコピペしてる　マジで何してるかわからん
	-- 		local lua_path = skin_config.get_path("common/player info/freespace.lua")
	-- 		local frame_parts_status, frame_parts = pcall(function()
	-- 			return dofile(lua_path).load(1)
	-- 		end)

	-- 		if frame_parts_status and frame_parts then
	-- 			for _, v in ipairs(frame_parts.text) do
	-- 				table.insert(skin.text, v)
	-- 			end
	-- 		end
	-- 		--ここまでコピペ
	-- 		table.insert(skin.destination, {id = "freespace-tx", filter = 1, dst = {{x = 120 + geometry.info_position, y = 47, w = 480, h = 19}}})
	-- 	--名前下の自由入力欄
	-- 	--ここまで
	-- end
	-- --プレイヤー情報
	-- --ここまで


--曲情報エリア
--ここまで

------プレイエリア
------ここから
	
--レーン
	--レーン大枠
	table.insert(skin.destination,
		{id = "lanes", loop = 800, dst ={
			{time = 0, x = geometry.lane_x + geometry.play_position, y = 1080, w = geometry.lane_w, h = geometry.lane_h, acc = 2},
			{time = 200},
			{time = 800, y = geometry.lane_y}
		}})
	--レーン線
	table.insert(skin.destination,
		{id = "lanes_line", offset = 3, loop = 1300, dst ={
			{time = 0, x = 3 + geometry.lane_x + geometry.play_position, y = 1080, w = geometry.lane_w - 6, h = geometry.lane_h - 3, acc = 2},
			{time = 500},
			{time = 1300, y = 3 + geometry.lane_y}
		}})
	table.insert(skin.destination,
		{id = -111, offsets = {3, 50}, loop = 1300, dst = {
			{time = 0, x = 3 + geometry.lane_x + geometry.play_position, y = 1080, w = geometry.lane_w - 6, h = geometry.lane_h - 3, r = 19, g = 19, b = 19, a = 0, acc = 2},
			{time = 500},
			{time = 1300, y = 3 + geometry.lane_y}
		}})

	--判定ライン
	table.insert(skin.destination,
		{id = -111, offset = 3, loop = 1700, dst = {
			{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 3 + geometry.lane_y, w = 0, h = 12, r = 255, g = 0, b = 0, acc = 2},
			{time = 1400},
			{time = 1700, w = geometry.lane_w - 6}
	}})	
   --下のボタン
   if isScratchRight() then
   table.insert(skin.destination,
   {id = "lanes_button_2P", loop = 800, dst ={
    {time = 0, x = geometry.lane_x + geometry.play_position, y = 0, w = geometry.lane_w, h = 100, acc = 2},
    {time = 200},
    {time = 800, y = -100 + geometry.lane_y}
   }})
  else
   table.insert(skin.destination,
   {id = "lanes_button", loop = 800, dst ={
    {time = 0, x = geometry.lane_x + geometry.play_position, y = 0, w = geometry.lane_w, h = 100, acc = 2},
    {time = 200},
    {time = 800, y = -100 + geometry.lane_y}
   }})
  end
	--キービーム
	local kb_w = {60, 48, 60, 48, 60, 48, 60, 108}
	local kb_type = {"w", "b", "w", "b", "w", "b", "w", "s"}
	local kb_onTimer = {101, 102, 103, 104, 105, 106, 107, 100}
	local kb_offTimer = {121, 122, 123, 124, 125, 126, 127, 120}
	local kb_x = {}
	local kb_move_x = {}

if isScratchRight() then
	kb_x = {63, 126, 177, 240, 291, 354, 405, 468}
	kb_move_x = {30, 24, 30, 24, 30, 24, 30, 54}
else
	kb_x = {174, 237, 288, 351, 402, 465, 516, 63}
	kb_move_x = {54, 30, 24, 30, 24, 30, 24, 30}
end

	do
		for i = 1, 7, 1 do
			table.insert(skin.destination,	{
				id = "keybeam-"..kb_type[i], offset = 3, timer = kb_onTimer[i], blend = 1, dst = {
					{x = geometry.play_position + kb_x[i], y = geometry.lane_y + geometry.lane_line_width, w = kb_w[i], h = geometry.lane_h}
				}
			})
		end
	end
	--キーが離された時
	do
		for i = 1, 7, 1 do
			table.insert(skin.destination,	{
				id = "keybeam-"..kb_type[i], offset = 3, timer = kb_offTimer[i], loop = -1, blend = 1, dst = {
					{time = 0, x = geometry.play_position + kb_x[i], y = geometry.lane_y + geometry.lane_line_width, w = kb_w[i], h = geometry.lane_h},
					{time = 80, x = geometry.play_position + kb_x[i] + kb_move_x[i], w = 0, a = 0}
				}
			})
		end
	end

	if isKeybeamKB() then
	table.insert(skin.destination,	{
		id = "keybeam-"..kb_type[8], offset = 3, timer = kb_onTimer[8], blend = 1, dst = {
			{x = geometry.play_position + kb_x[8], y = geometry.lane_y + geometry.lane_line_width, w = kb_w[8], h = geometry.lane_h}
		}
	})
	table.insert(skin.destination,	{
		id = "keybeam-"..kb_type[8], offset = 3, timer = kb_offTimer[8], loop = -1, blend = 1, dst = {
			{time = 0, x = geometry.play_position + kb_x[8], y = geometry.lane_y + geometry.lane_line_width, w = kb_w[8], h = geometry.lane_h},
			{time = 80, x = geometry.play_position + kb_x[8] + kb_move_x[8], w = 0, a = 0}
		}
	})
	else
	table.insert(skin.destination,	{
		id = "keybeam-"..kb_type[8], loop = -1, offset = 3, timer = kb_onTimer[8], blend = 1, dst = {
			{time = 0, x = geometry.play_position + kb_x[8], y = geometry.lane_y + geometry.lane_line_width, w = kb_w[8], h = geometry.lane_h},
			{time = 80},
			{time = 160, x = geometry.play_position + kb_x[8] + kb_move_x[8], w = 0, a = 0}
		}
	})
	end



	--ノーツ
	table.insert(skin.destination,
	{id = "notes", offset = 30})

	--HIDDENカバー
	table.insert(skin.destination,
	{id = "hiddencover", loop = 2000, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = (geometry.lane_y + 3) - geometry.lane_h, w = geometry.lane_w - (geometry.lane_line_width * 2), h = geometry.lane_h, a = 0},
		{time = 1700},
		{time = 2000, a = 255}
	}})


	--リフトカバー
	table.insert(skin.destination,
	{id = "liftcover", loop = 1700, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = (geometry.lane_y + 3) - geometry.lane_h, w = geometry.lane_w - (geometry.lane_line_width * 2), h = geometry.lane_h, a = 0},
		{time = 1400},
		{time = 1700, a = 255}
	}})

	--レーンカバー
	table.insert(skin.destination,
	{id = "lanecover", loop = 1300, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1500, w = geometry.lane_w - (geometry.lane_line_width * 2), h = geometry.lane_h, acc = 2},
		{time = 700},
		{time = 1300, y = 1080}
	}})

	--5Kの時に使わないレーン隠すやつ
	local sp5_x = {}
	if isScratchRight() then
		sp5_x = 0
	else
		sp5_x = 399
	end
	table.insert(skin.destination,
	{id = "sp5_lanecover", op = {161}, loop = 2000, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + sp5_x + geometry.play_position, y = geometry.lane_y + 3, w = 114, h = geometry.lane_h - 3, a = 0},
		{time = 1700},
		{time = 2000, a = 255}
	}})

		--レーンカバーの数値周り
	--レーンカバー
	table.insert(skin.destination,
	{id = "lamp_lanecover_v", loop = 1400, offset = 4, op = {270}, dst = {
		{x = 78 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1095, w = 6, h = 14, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	table.insert(skin.destination,
	{id = "lanecover-value", loop = 1400, offset = 4, op = {270}, dst = {
		{x = 90 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1095, w = 15, h = 18, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	--緑数字
	table.insert(skin.destination,
	{id = "lamp_green_v", loop = 1400, offset = 4, op = {270}, dst = {
		{x = 228 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1095, w = 6, h = 14, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	table.insert(skin.destination,
	{id = "lanecover-green", loop = 1400, offset = 4, op = {270}, dst = {
		{x = 240 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1095, w = 15, h = 18, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	--青数字
	table.insert(skin.destination,
	{id = "lamp_duration_v", loop = 1400, offset = 4, op = {270}, dst = {
		{x = 378 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1095, w = 6, h = 14, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	table.insert(skin.destination,
	{id = "lanecover-duration", loop = 1400, offset = 4, op = {270}, dst = {
		{x = 390 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = 1095, w = 15, h = 18, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})

	--リフトの数値周り
	--リフト
	table.insert(skin.destination,
	{id = "lamp_lanecover_v", loop = 1400, offset = 3, op = {270, 272}, dst = {
		{x = 78 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y - 30, w = 6, h = 14, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	table.insert(skin.destination,
	{id = "lift-value", loop = 1400, offset = 3, op = {270, 272}, dst = {
		{x = 90 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y - 30, w = 15, h = 18, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	--緑数字
	table.insert(skin.destination,
	{id = "lamp_green_v", loop = 1400, offset = 3, op = {270, 272}, dst = {
		{x = 228 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y - 30, w = 6, h = 14, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	table.insert(skin.destination,
	{id = "lanecover-green", loop = 1400, offset = 3, op = {270, 272}, dst = {
		{x = 240 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y - 30, w = 15, h = 18, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	--青数字
	table.insert(skin.destination,
	{id = "lamp_duration_v", loop = 1400, offset = 3, op = {270, 272}, dst = {
		{x = 378 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y - 30, w = 6, h = 14, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})
	table.insert(skin.destination,
	{id = "lanecover-duration", loop = 1400, offset = 3, op = {270, 272}, dst = {
		{x = 390 + geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y - 30, w = 15, h = 18, a = 0},
		{time = 1300, a = 0},
		{time = 1400, a = 255}
	}})




	--判定文字
	table.insert(skin.destination,
	{id = "judge"})
	--fast/slowのみ　中央
if isFastSlowOn() then
	table.insert(skin.destination,	{
		id = "judge-dt-fa", offsets = {3, 32, 53}, op = {1242}, loop = -1, timer = 46, dst = {
			{time = 0, x = geometry.lane_x + geometry.judge_x + 40 + geometry.play_position, y = geometry.judge_y + 90 + 5, w = 144, h = 40},
			{time = 500}
		}
	})
	table.insert(skin.destination,	{
		id = "judge-dt-sl", offsets = {3, 32, 53}, op = {1243}, loop = -1, timer = 46, dst = {
			{time = 0, x = geometry.lane_x + geometry.judge_x + 40 + geometry.play_position, y = geometry.judge_y + 84 + 5, w = 144, h = 40},
			{time = 500}
		}
	})
 -- EXスコア差分つき
elseif isFastSlowMS() then
	table.insert(skin.destination,	{
		id = "judge-dt-fa", offsets = {3, 32, 53}, op = {1242}, loop = -1, timer = 46, dst = {
			{time = 0, x = geometry.lane_x + geometry.judge_x + 6 + geometry.play_position, y = geometry.judge_y + 90 + 5,  w = 144, h = 40},
			{time = 500}
		}
	})

	table.insert(skin.destination,	{
		id = "judge-dt-sl", offsets = {3, 32, 53}, op = {1243}, loop = -1, timer = 46, dst = {
			{time = 0, x = geometry.lane_x + geometry.judge_x + 6 + geometry.play_position, y = geometry.judge_y + 84 + 5,  w = 144, h = 40},
			{time = 500}
		}
	})
 if isTargetBest() then
 	table.insert(skin.destination,	{
		id = "diff-best", offsets = {3, 32, 53}, loop = -1, timer = 46, dst = {
			{time = 0, x = 120 + geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y + 90 + 5,  w = 20, h = 20},
			{time = 500}
		}
	})
  else
   table.insert(skin.destination,	{
    id = "diff-target", offsets = {3, 32, 53}, loop = -1, timer = 46, dst = {
     {time = 0, x = 120 + geometry.lane_x + geometry.judge_x + geometry.play_position, y = geometry.judge_y + 90 + 5,  w = 20, h = 20},
     {time = 500}
    }
   })

end



end

--レーン上でのレート表示
-- if isScoreRateOn() then
-- table.insert(skin.destination,	{
-- 	id = "l-rate-num", offsets = {3, 32, 56}, op = {32}, loop = -1, timer = 46, dst = {
-- 		{time = 0, x = geometry.lane_x + geometry.judge_x + geometry.play_position + 43, y = geometry.judge_y + (-23), w = 15, h = 18},
-- 		{time = 500}
-- 	}
-- })
-- table.insert(skin.destination,	{
-- 	id = "l-rate-adot-num", offsets = {3, 32, 56}, op = {32}, loop = -1, timer = 46, dst = {
-- 		{time = 0, x = geometry.lane_x + geometry.judge_x + geometry.play_position + 43 + 51, y = geometry.judge_y + (-23), w = 15, h = 18},
-- 		{time = 500}
-- 	}
-- })
-- table.insert(skin.destination,	{
-- 	id = "l-rate-DnP", offsets = {3, 32, 56}, op = {32}, loop = -1, timer = 46, dst = {
-- 		{time = 0, x = geometry.lane_x + geometry.judge_x + geometry.play_position + 43 + 45, y = geometry.judge_y + (-23), w = 56, h = 18},
-- 		{time = 500}
-- 	}
-- })
-- end


	--ボム ModernChicと同一規格　ほぼModernChicからのコピペ　本当にありがとうございます。大変申し訳無い。
	local bombCycle = 251
	local lnbombCycle = 160

	local b_init = {"1", "2", "3", "4", "5", "6", "7", "s"}
	local bombTimer = {51, 52, 53, 54, 55, 56, 57, 50}
	local lnBombTimer = {71, 72, 73, 74, 75, 76, 77, 70}
	local modernchicLnPosY = {}
	local bombPosX = {}
	local bombWidth = 400
	local bombHeight = 300
	local adjustPosY = 0

		modernchicLnPosY = {300, 600, 300, 600, 300, 600, 300, 900}

		-- ボム中心点
		if isScratchRight() then
			bombPosX = {30, 87, 144, 201, 258, 315, 372, 459}

		else
			bombPosX = {141, 198, 253, 312, 369, 426, 483, 54}
		end
	--ボム切り出し
	table.insert(skin.image, {
		id = "bomb", src = "bomb_src", x = 0, y = 0, w = -1, h = -1
	})
	for i = 1, #b_init, 1 do
		table.insert(skin.image, {
			id = "bomb-"..b_init[i], src = "bomb_src", x = 0, y = 0, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
		})
	end
	-- ModernChic規格ボム・LN
	table.insert(skin.image, {
		id = "lnbomb", src = "bomb_src", x = 0, y = 0, w = -1, h = -1
	})
	for i = 1, #b_init, 1 do
		table.insert(skin.image, {
			id = "lnbomb-"..b_init[i], src = "bomb_src", x = 0, y = modernchicLnPosY[i], w = 3200, h = 300, divx = 8, divy = 1, cycle = lnbombCycle, timer = lnBombTimer[i]
		})
	end
	-- ModernChic規格ボム・SLOW
	for i = 1, #b_init, 1 do
		table.insert(skin.image, {
			id = "slowbomb-"..b_init[i], src = "bomb_src", x = 0, y = 300, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
		})
	end
	-- ModernChic規格ボム・FAST
	for i = 1, #b_init, 1 do
		table.insert(skin.image, {
			id = "fastbomb-"..b_init[i], src = "bomb_src", x = 0, y = 600, w = 6400, h = 300, divx = 16, divy = 1, cycle = bombCycle, timer = bombTimer[i]
		})
	end


	--ボム配置
		-- ボム先読み
		table.insert(skin.destination,{
			id = "bomb", dst = {
				{x = 0, y = 0, w = 1, h = 1},
			}
		})
		table.insert(skin.destination,{
			id = "lnbomb", dst = {
				{x = 0, y = 0, w = 1, h = 1},
			}
		})
		-- 爆発エフェクト
	-- 通常爆発エフェクトの配置

		for i = 1, #b_init, 1 do
			table.insert(skin.destination, {
				id = "bomb-"..b_init[i], offset = 3, loop = -1, filter = 1, timer = bombTimer[i], blend = 2, dst = {
					{time = 0, x = geometry.play_position + geometry.lane_x + geometry.lane_line_width + bombPosX[i] - bombWidth / 2, y = geometry.lane_y + geometry.lane_line_width - (bombHeight / 2), w = bombWidth, h = bombHeight},
					{time = bombCycle - 1}
				}
			})
		end

	-- LN爆発エフェクトの配置
	for i = 1, #b_init, 1 do
		table.insert(skin.destination,	{
			id = "lnbomb-"..b_init[i], offset = 3, filter = 1, timer = lnBombTimer[i], blend = 2, dst = {
				{time = 0, x = geometry.play_position + geometry.lane_x + geometry.lane_line_width + bombPosX[i] - bombWidth / 2, y = geometry.lane_y + geometry.lane_line_width - (bombHeight / 2), w = bombWidth, h = bombHeight},
				{time = lnbombCycle - 1}
			}
		})
	end



--フルコン
table.insert(skin.destination,
	{id = "fc_glow", loop = -1, timer = 48, offset = 3, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y, w = geometry.lane_w - (geometry.lane_line_width * 2), h = 70, a = 255, acc = 2},
		{time = 300, y = geometry.lane_y + geometry.lane_h, a = 0}
}})
table.insert(skin.destination,
	{id = "fc_glow", loop = -1, timer = 48, offset = 3, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y, w = geometry.lane_w - (geometry.lane_line_width * 2), h = 35, a = 255, acc = 2},
		{time = 300, a = 0}
}})

table.insert(skin.destination,
	{id = "fc_text", loop = 750, timer = 48, offset = 3, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + 74 + geometry.play_position, y = geometry.lane_y + 300, w = 439, h = 60, a = 0},
		{time = 500},
		{time = 750, a = 255}
}})
table.insert(skin.destination,
	{id = "fc_lamp", loop = 1000, timer = 48, offset = 3, dst = {
		{time = 0, x = geometry.lane_x + geometry.lane_line_width + geometry.play_position, y = geometry.lane_y + 300, w = 74, h = 60, a = 0},
		{time = 750},
		{time = 1000, a = 255}
}})



--曲終了表示
table.insert(skin.destination,
{id = "lamp_music_end", timer = 143, loop = 250, op = {32}, offset = 3, dst = {
	{time = 0, x = 196 + geometry.lane_x + geometry.play_position, y = geometry.lane_y + 50, w = 20, h = 40, a = 0},
	{time = 250, a = 255}
}})
table.insert(skin.destination,
{id = "music_end", timer = 143, op = {32}, offset = 3, dst = {
	{time = 0, x = 216 + geometry.lane_x + geometry.play_position, y = geometry.lane_y + 50, w = 130, h = 40}
}})
--オートプレイ表示
table.insert(skin.destination,
{id = "lamp_autoplay", loop = 2050, op = {33}, offset = 3, dst = {
	{time = 0, x = 143 + geometry.lane_x + geometry.play_position, y = geometry.lane_y + 40, w = 20, h = 50, a = 0},
	{time = 1800},
	{time = 2050, a = 255}
}})
table.insert(skin.destination,
{id = "autoplay_tx", loop = 2050, op = {33}, offset = 3, dst = {
	{time = 0, x = 163 + geometry.lane_x + geometry.play_position, y = geometry.lane_y + 40, w = 250, h = 50, a = 0},
	{time = 1800},
	{time = 2050, a = 255}
}})
--リプレイ表示
table.insert(skin.destination,
{id = "lamp_replay", loop = 2050, op = {84}, offset = 3, dst = {
	{time = 0, x = 171 + geometry.lane_x + geometry.play_position, y = geometry.lane_y + 40, w = 20, h = 50, a = 0},
	{time = 1800},
	{time = 2050, a = 255}
}})
table.insert(skin.destination,
{id = "replay_tx", loop = 2050, op = {84}, offset = 3, dst = {
	{time = 0, x = 191 + geometry.lane_x + geometry.play_position, y = geometry.lane_y + 40, w = 160, h = 50, a = 0},
	{time = 1800},
	{time = 2050, a = 255}
}})



--ゲージ
	--ゲージ本体
 if is2P() then --2P: 数字 ← ゲージ ← song-progress-bar（右側x=1870～1940）、左右反転
	table.insert(skin.destination, {id = "gauge", dst = {{x = 1870, y = 120, w = -350, h = 34}}})
	-- ゲージの数字（左側に横一列で配置）
	table.insert(skin.destination, {id = "gauge-num", dst = {{x = 69 + geometry.play_position, y = 128, w = 29, h = 36}}})
	table.insert(skin.destination, {id = "gauge-DnP", dst = {{x = 158 + geometry.play_position, y = 128, w = 79, h = 36}}})
	table.insert(skin.destination, {id = "gauge-adot-num", dst = {{x = 171 + geometry.play_position, y = 128, w = 29, h = 36}}})
	
 else -- 1P: song-progress-bar（左側x=0-info_position～70-info_position）← ゲージ ← 数字
  table.insert(skin.destination, {id = "gauge", dst = {{x = 70 - geometry.info_position, y = 120, w = 350, h = 34}}})
  -- ゲージの数字（右側に横一列で配置）
  table.insert(skin.destination, {id = "gauge-num", dst = {{x = 420 - geometry.info_position, y = 128, w = 29, h = 36}}})
  table.insert(skin.destination, {id = "gauge-DnP", dst = {{x = 500 - geometry.info_position, y = 128, w = 79, h = 36}}})
  table.insert(skin.destination, {id = "gauge-adot-num", dst = {{x = 510 - geometry.info_position, y = 128, w = 29, h = 36}}})
  
 end
 

	--ヘッダー
	table.insert(skin.destination,
	{id = "playoption_frame", dst = {
		-- 原寸(560x179)で描画して、枠画像のにじみを抑える。
		{x = 120 + geometry.play_position, y = 0, w = 560, h = 179}
	}})



	
		

--プレイエリア
--ここまで

--スコアエリア
--ここから
	--Score
	--見出し
	table.insert(skin.destination, {id = "score-label-your", filter = 1, dst = {{x = 595 + geometry.score_position, y = 480, w = 180, h = 16, r = 48, g = 205, b = 254}}})
	table.insert(skin.destination, {id = "score-label-mybest", filter = 1, dst = {{x = 595 + geometry.score_position, y = 427, w = 180, h = 16, r = 45, g = 255, b = 222}}})
	if is2P() then
		table.insert(skin.destination, {id = "score-label-target", filter = 1, dst = {{x = 595 + geometry.score_position, y = 380, w = 180, h = 16, r = 255, g = 100, b = 100}}})
	else
		table.insert(skin.destination, {id = "score-label-target", filter = 1, dst = {{x = 595 + geometry.score_position, y = 380, w = 180, h = 16, r = 255, g = 100, b = 100}}})
	end
	---開始前にスコアのダミー表示するやつ
	table.insert(skin.image, 
	{id = "score_dummy", src = "system_src", x = 1500 + geometry.score_position, y= 1150, w = 393, h = 193})
	table.insert(skin.destination,
	{id = "score_dummy", draw = function()
		if (main_state.number(101) < 0) then
			return true
		end
	end, dst = {
		{x = 164 + geometry.score_position + geometry.score_position, y= 764, w = 393, h = 193}}})

	--グラフのグリッド
	table.insert(skin.destination,
	{id = "scoregraph-grid", dst = {
		-- 原寸(237x211)で描画して、線のぼけを抑える。
		{x = 584 + geometry.score_position, y = 850, w = 237, h = 211}}})
   --レート・小数点以下・ドット、パーセント
   table.insert(skin.destination,
   {id = "hispeed-num", dst = {
    {x = 450 + geometry.score_position, y= 30, w = 18, h = 22}}})
   table.insert(skin.destination,
   {id = "rate-DnP1", dst = {
    {x = 475 + geometry.score_position, y= 15, w = 50, h = 50}}})
   table.insert(skin.destination,
   {id = "hispeed-adot-num", dst = {
	    {x = 485 + geometry.score_position, y= 30, w = 18, h = 22}}})
 
	--EXスコア
--"lefttime"と"hispeed"の見出し
   table.insert(skin.destination,
	  {id = "timehispeed", dst = {
		  {x = 260 + geometry.score_position, y= 80, w = 340, h = 22}}})
		if is2P() then --2P
   table.insert(skin.destination,
   {id = "Score-num", dst = {
    {x = 1450 , y= 30, w = 35, h = 43}}})
		else --1P
   table.insert(skin.destination,
   {id = "Score-num", dst = {
    {x = 140, y= 30, w = 35, h = 43}}})
		end





	--レート・小数点以下・ドット、パーセント
	table.insert(skin.destination,
	{id = "rate-num", dst = {
		{x = 715 + geometry.score_position, y= 480, w = 18, h = 24}}})
	table.insert(skin.destination,
	{id = "rate-adot-num", dst = {
		{x = 780 + geometry.score_position, y= 480, w = 18, h = 24}}})
  table.insert(skin.destination,
  {id = "rate-DnP1", draw = function()
   if (main_state.number(101) >= 0) then
    return true
   end
  end, dst = {
   {x = 773 + geometry.score_position, y= 465, w = 50, h = 50}}})
   table.insert(skin.destination,
   {id = "rate-DnP2", draw = function()
    if (main_state.number(101) >= 0) then
     return true
    end
   end, dst = {
    {x = 780 + geometry.score_position, y= 480, w = 94, h = 37}}})

	
	--スコアグラフ
	--現在
 if is2P() then 
	table.insert(skin.destination,
	{id = "graph-now", dst = {
		{x = 762 + geometry.score_position, y=550, w = 68, h = 500}}})
	--現在　予想値
	table.insert(skin.destination,
	{id = "graph-final", dst = {
		{x = 762 + geometry.score_position, y=550, w = 68, h = 500, a = 80}}})
 else
 	table.insert(skin.destination,
	{id = "graph-now", dst = {
		{x = 610 + geometry.score_position, y=550, w = 68, h = 500}}})
	--現在　予想値
	table.insert(skin.destination,
	{id = "graph-final", dst = {
		{x = 610 + geometry.score_position, y=550, w = 68, h = 500, a = 80}}})
 end


	--自己ベストとの差
	table.insert(skin.destination,
	{id = "score-best-dif", draw = function()
		if (main_state.float_number(113) ~= 0) then
			return true
		end
	end, dst = {
		{x = 736 + geometry.score_position, y= 450, w = 18, h = 24}}})
	--自己ベストの点数
	table.insert(skin.destination,
	{id = "score-best", draw = function()
		if (main_state.float_number(113) ~= 0) then
			return true
		end
	end, dst = {
		{x = 756 + geometry.score_position, y= 420, w = 18, h = 24}}})


	--スコアグラフ
	--自己ベスト　現在

	table.insert(skin.destination,
	{id = "graph-best-now", dst = {
		{x = 686 + geometry.score_position, y=550, w = 68, h = 500}}})
	--自己ベスト　最終
	table.insert(skin.destination,
	{id = "graph-best", loop = 600, dst = {
		{time = 0, x = 686 + geometry.score_position, y=550, w = 68, h = 0, a = 80, acc = 2},
		{time = 600, h = 400}}})

	--ターゲットの文字
	do
		local id = {"tg-Am", "tg-A", "tg-Ap", "tg-AAm", "tg-AA", "tg-AAp", "tg-AAA-", "tg-AAA", "tg-AAAp", "tg-max", "tg-next"}
		for i in ipairs(id) do
			table.insert(skin.image,
				{id = id[i], src = "system_src", x = 1500, y= 10 + 28 * (i - 1), w = 110, h = 28})
		end
		table.insert(skin.imageset,
			{id = "score-target-tx", ref = 22, images = { id[1], id[2], id[3], id[4], id[5], id[6], id[7], id[8], id[9], id[10], id[11] }})
	end
	--上で定義した奴を配置
 if is2P() then
	table.insert(skin.destination,
	{id = "targetname", dst = {
		{x = 472 + geometry.score_position, y= 555, w = 110, h = 24}}})
 else
  table.insert(skin.destination,
  {id = "targetname", dst = {
   {x = 845 + geometry.score_position, y= 555, w = 110, h = 24}}})
 end
	--ターゲットとの差
	if is2P() then
		table.insert(skin.destination,
		{id = "score-targ-dif", dst = {
			{x = 735 + geometry.score_position, y= 380, w = 18, h = 24}}})
		--自己ベストの点数
		table.insert(skin.destination,
		{id = "score-targ", dst = {
			{x = 753 + geometry.score_position, y= 350, w = 18, h = 24}}})
	else
		table.insert(skin.destination,
		{id = "score-targ-dif", dst = {
			{x = 735 + geometry.score_position, y= 380, w = 18, h = 24}}})
		--自己ベストの点数
		table.insert(skin.destination,
		{id = "score-targ", dst = {
			{x = 753 + geometry.score_position, y= 350, w = 18, h = 24}}})
	end
	
	--スコアグラフ
	--ターゲット　現在
  if is2P() then
   table.insert(skin.destination,
   {id = "graph-target-now", dst = {
    {x = 610 + geometry.score_position, y= 550, w = 68, h = 500}}})
   --ターゲット　最終
   table.insert(skin.destination,
   {id = "graph-target", loop = 600, dst = {
    {time = 0, x = 610 + geometry.score_position, y=550, w = 68, h = 0, a = 80, acc = 2},
    {time = 600, h = 400}}}) 
   else
    table.insert(skin.destination,
    {id = "graph-target-now", dst = {
     {x = 762 + geometry.score_position, y= 550, w = 68, h = 500}}})
    --ターゲット　最終
    table.insert(skin.destination,
    {id = "graph-target", loop = 600, dst = {
     {time = 0, x = 762 + geometry.score_position, y=550, w = 68, h = 0, a = 80, acc = 2},
     {time = 600, h = 400}}})
   end

	--判定詳細
	--各見出しの切り出し
 y_offset=0
	do
		local id = {"judge-dt-pf", "judge-dt-gr", "judge-dt-gd", "judge-dt-bd", "judge-dt-pr", "judge-dt-ms", "judge-dt-br", "judge-dt-fa", "judge-dt-sl"}
		for i in ipairs(id) do
			table.insert(skin.image,
				{id = id[i], src = "system_src", x = 1345, y= 386 + 41  * (i - 1), w = 144, h = 40})
		end
	end
	--各見出しの配置
	table.insert(skin.destination,
	{id = "judge-dt-pf", dst = {
		{x =580 + geometry.score_position, y= 210 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-gr", dst = {
		{x =580 + geometry.score_position, y= 180 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-gd", dst = {
		{x =580 + geometry.score_position, y= 150 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-bd", dst = {
		{x =580 + geometry.score_position, y= 120 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-pr", dst = {
		{x =580 + geometry.score_position, y= 90 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-ms", dst = {
		{x =580 + geometry.score_position, y= 60 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-br", dst = {
		{x =580 + geometry.score_position, y= 30 + y_offset, w = 75, h = 20}}})
	table.insert(skin.destination,
	{id = "judge-dt-fa", dst = {
		{x = 720 + geometry.score_position, y= 116 + y_offset, w = 144, h = 40}}})
	table.insert(skin.destination,
	{id = "judge-dt-sl", dst = {
		{x = 720 + geometry.score_position, y= 58 + y_offset, w = 144, h = 40}}})
	--各見出しランプの切り出し
	do
		local id = {"lamp-judge-dt-pf", "lamp-judge-dt-gr", "lamp-judge-dt-gd", "lamp-judge-dt-bd", "lamp-judge-dt-pr", "lamp-judge-dt-ms", "lamp-judge-dt-br", "lamp-judge-dt-fa", "lamp-judge-dt-sl"}
		for i in ipairs(id) do
			table.insert(skin.image,
				{id = id[i], src = "system_src", x = 1500, y= 400 + 40  * (i - 1), w = 7, h = 40})
		end
	end
	--各見出しランプの配置
	table.insert(skin.destination,
	{id = "lamp-judge-dt-pf", loop = 500, dst = {
		{time = 0, x =580 + geometry.score_position, y= 358, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-gr", loop = 500, dst = {
		{time = 0, x = 248 + geometry.score_position + geometry.score_position, y= 358, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-gd", loop = 500, dst = {
		{time = 0, x = 435 + geometry.score_position + geometry.score_position, y= 358, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-bd", loop = 500, dst = {
		{x =580 + geometry.score_position, y= 260, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-pr", loop = 500, dst = {
		{x = 196 + geometry.score_position + geometry.score_position, y= 260, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-ms", loop = 500, dst = {
		{x = 332 + geometry.score_position + geometry.score_position, y= 260, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-br", loop = 500, dst = {
		{x = 467 + geometry.score_position + geometry.score_position, y= 260, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-fa", loop = 500, dst = {
		{x = 332 + geometry.score_position + geometry.score_position, y= 173, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	table.insert(skin.destination,
	{id = "lamp-judge-dt-sl", loop = 500, dst = {
		{x = 467 + geometry.score_position + geometry.score_position, y= 173, w = 144, h = 40, a = 0},
		{time = 250},
		{time = 500, a = 255}}})
	--各数字

	table.insert(skin.destination,
	{id = "num-dt-pf", dst = {
		{x = 680 + geometry.score_position, y= 210 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-gr", dst = {
		{x = 680 + geometry.score_position, y= 180 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-gd", dst = {
		{x = 680 + geometry.score_position, y= 150 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-bd", dst = {
		{x = 680 + geometry.score_position, y= 120 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-pr", dst = {
		{x = 680 + geometry.score_position, y= 90 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-ms", dst = {
		{x = 680 + geometry.score_position, y=60 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-br", dst = {
		{x = 680 + geometry.score_position, y= 30 + y_offset, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-fa", dst = {
		{x = 780 + geometry.score_position, y= 90, w = 20, h = 20}}})
	table.insert(skin.destination,
	{id = "num-dt-sl", dst = {
		{x = 780 + geometry.score_position, y= 30, w = 20, h = 20}}})
-- 	--タイミングビジュアライザー
-- 	table.insert(skin.destination,
-- 	{id = "timing", dst = {
-- 		{x =580 + geometry.score_position, y= 155, w = 247, h = 28, a = 150}}})

-- 	--ノーツグラフ
-- if isGraphJudge() then
-- 	table.insert(skin.judgegraph,
-- 		{id = "notes-graph", noGap = 0, orderReverse = 1, type = 1, backTexOff = 1})
-- else
-- 	table.insert(skin.judgegraph,
-- 		{id = "notes-graph", noGap = 0, orderReverse = 1, type = 2, backTexOff = 1})
-- end
-- 	table.insert(skin.destination,
-- 		{id = "notes-graph", dst = {
-- 			{x = 52 + geometry.score_position + geometry.score_position, y= 34, w = 536, h = 81}}})
-- 	--BPMグラフ
-- 	table.insert(skin.destination,
-- 		{id = "bpm-graph", dst = {
-- 			{x = 52 + geometry.score_position + geometry.score_position, y= 34, w = 536, h = 81}}})
	

--スコアエリア
--ここまで

--ロード中曲情報
--ここから
--枠
table.insert(skin.destination,
{id = "bg", loop = 600, op = {80}, dst = {
	{time = 0, x = 0, y = 360, w = 1920, h = 360, a = 0},
	{time = 300},
	{time = 600, a = 150}}})
	--ロード終了
table.insert(skin.destination,
{id = "bg", timer = 40, loop = 300, op = {81}, dst = {
	{time = 0, x = 0, y = 360, w = 1920, h = 360, a = 150},
	{time = 300, a = 0}}})

	--decideからy -170
--ジャンル名・曲名・アーティスト名
table.insert(skin.destination,
{id = "load-genre", loop = 600, op = {80}, filter = 1, dst = {
	{time = 0, x = 445, y = 608, w = 1405, h = 27, a = 0},
	{time = 300},
	{time = 600, a = 255}}})
table.insert(skin.destination,
{id = "load-title", loop = 600, op = {80}, filter = 1, dst = {
	{time = 0, x = 445, y = 520, w = 1405, h = 73, a = 0},
	{time = 300},
	{time = 600, a = 255}}})
table.insert(skin.destination,
{id = "load-artist", loop = 600, op = {80}, filter = 1, dst = {
	{time = 0, x = 445, y = 425, w = 1405, h = 41, a = 0},
	{time = 300},
	{time = 600, a = 255}}})
	--ロード終了
	table.insert(skin.destination,
	{id = "load-genre", timer = 40,loop = 300, op = {81}, filter = 1, dst = {
		{time = 0, x = 445, y = 608, w = 1405, h = 27, a = 255},
		{time = 300, a = 0}}})
	table.insert(skin.destination,
	{id = "load-title", tiemr = 40, loop = 300, op = {81}, filter = 1, dst = {
		{time = 0, x = 445, y = 520, w = 1405, h = 73, a = 255},
		{time = 300, a = 0}}})
	table.insert(skin.destination,
	{id = "load-artist", timer = 40, loop = 300, op = {81}, filter = 1, dst = {
		{time = 0, x = 445, y = 425, w = 1405, h = 41, a = 255},
		{time = 300, a = 0}}})
	
--ステージファイル
table.insert(skin.destination,
{id = -100, loop = 600, filter = 1, op = {80, 191}, dst = {
	{time = 0, x = 50, y = 420, w = 320, h = 240, a = 0},
	{time = 300},
	{time = 600, a = 255}}})
	--ロード終了
	table.insert(skin.destination,
	{id = -100, timer = 40, loop = 300, filter = 1, op = {81, 191}, dst = {
		{time = 0, x = 50, y = 420, w = 320, h = 240, a = 255},
		{time = 300, a = 0}}})

--ステージファイルが無い時
table.insert(skin.destination,
{id = "load-nostagefile", loop = 600, filter = 1, op = {80, 190}, dst = {
	{time = 0, x = 50, y = 420, w = 320, h = 240, a = 0},
	{time = 300},
	{time = 600, a = 255}}})
	--ロード終了
	table.insert(skin.destination,
	{id = "load-nostagefile", timer = 40, loop = 300, filter = 1, op = {81, 190}, dst = {
		{time = 0, x = 50, y = 420, w = 320, h = 240, a = 255},
		{time = 300, a = 0}}})

--曲名下の線
table.insert(skin.destination, 
	{id = "load-titleline", loop = 900, op = {80}, dst = {
		{time = 0, x = 400, y = 505, w = 0, h = 3, a = 100, acc = 2},
		{time = 300, w = 0},
		{time = 400},
		{time = 900, w = 1450}
}})
table.insert(skin.destination, 
	{id = "load-progress", loop = 900, op = {80}, dst = {
		{time = 0, x = 400, y = 505, w = 0, h = 3, acc = 2},
		{time = 300, w = 0},
		{time = 400},
		{time = 900, w = 1450}
}})

	--ロード終了
	table.insert(skin.destination, 
		{id = "load-progress", timer = 40, loop = 300, op = {81}, dst = {
			{time = 0, x = 400, y = 505, w = 1450, h = 3, a = 100},
			{time = 300, a = 0}}})

--難易度
do
	local id = { "load-unknown", "load-beginner", "load-normal", "load-hyper", "load-another", "load-insane" }
	for i in ipairs(id) do
		table.insert(skin.image,
			{id = id[i], src = "system_src", x = 530 + 25 * (i - 1), y = 30, w = 25, h = 50})
		table.insert(skin.destination,
			{id = id[i], loop = 800, op = { 80, 150 + (i - 1) }, dst = {
				{time = 0, x = 400, y = 538, w = 25, h = 50, a = 0},
				{time = 550},
				{time = 800, a = 255}
		}})
		--ロード終了
		table.insert(skin.destination,
		{id = id[i], timer = 40, loop = 300, op = { 81, 150 + (i - 1) }, dst = {
			{time = 0, x = 400, y = 538, w = 25, h = 50, a = 255},
			{time = 300, a = 0}
	}})

	end
end	


--ロード中曲情報
--ここまで

--フェードイン
table.insert(skin.destination,
	{id = -110, loop = 250, dst = {
		{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 255},
		{time = 250, a = 0}
}})



--閉店
table.insert(skin.destination,
	{id = "failedbg", timer = 3, loop = 500, dst = {
		{time = 0, x = 0, y = 1080, w = 1920, h = 1080},
		{time = 50},
		{time = 500, y=0}
}})
table.insert(skin.destination,
	{id = "failed", timer = 3, loop = 6000, dst = {
		{time = 0, x = 382, y = 480, w = 880, h = 240, a = 0},
		{time = 500},
		{time = 700, x = 460,a = 255},
  {time = 6000, a = 255, x = 660}
}})


--フェードアウト
table.insert(skin.destination,
	{id = -110, loop = 250, timer = 2, dst = {
		{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
		{time = 250, a = 255}
}})




	return skin
end

return {
	header = header,
	main = main
}
