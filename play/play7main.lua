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

main_state = require("main_state")


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
	elseif index == 906  then -- 2P
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
	elseif index == 906  then
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
	elseif index == 906  then
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

	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end


	local c_play_pos = plays_2P_side()
	local c_score_pos = f_score_pos()
	local c_info_pos = f_info_pos()
 local c_info_gwidth = f_gaugewidth()

 local geometry = {}
	geometry.play_position = c_play_pos
	geometry.score_position = c_score_pos
 geometry.gauge_width = c_info_gwidth
	geometry.info_position = c_info_pos
	geometry.lane_x = 60
	geometry.lane_y = 350
	geometry.lane_w = 519
	geometry.lane_h = 853
	geometry.lane_line_width = 3
	geometry.lane_line_src = 900
	geometry.judge_x = 140
	geometry.judge_y = 430
	geometry.bga_y = 510
	geometry.bga_w = 800
	geometry.bga_h = 650


	local notesInfo = {
		height = 12,
		Wh_width = 60,
		Bl_width = 48,
		Sc_width = 108,
		Wh_x = 216,
		Bl_x = 276,
		Ye_x = 276,
		Sc_x = 108,
		As_x = 0,
		Std_y = 12,
		lnEn_y = 48,
		lnSt_y = 84,
		lnAc_y = 168,
		lnBo_y = 120,
		hcEn_y = 228,
		hcSt_y = 264,
		hcBo_y = 120,
		hcAc_y = 300,
		hcDm_y = 300,
		hcRe_y = 336,

		lnCycle = 200,
		hcnCycle = 200,
		hcnDamageCycle = 100,

		mine_y = 372,
	}

	if isScratchRight() then
		geometry.lane_line_src = 950
	end

	skin.source = {
		{id = "bg_src", path = "backgrounds.png"},
  {id = "button", path = "parts/system/button.png"},
  {id = "bar", path = "parts/system/song-bar.png"},
		{id = "system_src", path = "parts/system/system.png"},
  {id = "score_head", path = "parts/system/score_head.png"},
  {id = "time-hispeed", path = "parts/system/timehispeed.png"},
  {id = "BPM-bar", path = "parts/system/bpmbar.png"},
  {id = "graph-grid", path = "parts/system/graphgrid.png"},
		{id = "soundonly_src", path = "common/sound only/*.png"},
		{id = "nostagefile_src", path = "common/stagefile/*.png"},
  {id = "failedbg", path = "parts/failed.png"},
		{id = "notes_src", path = "parts/notes/*.png"},
		{id = "judge_src", path = "parts/judge/*.png"},
		{id = "keybeam_src", path = "parts/keybeam/*.png"},
		{id = "bomb_src", path = "parts/bomb/*.png"},
		{id = "lanecover_src", path = "parts/lanecover/*.png"},
		{id = "liftcover_src", path = "parts/liftcover/*.png"},
		{id = "hiddencover_src", path = "parts/hiddencover/*.png"},

		{id = "p_icon_src", path = "common/player info/icon/*.png"},
		{id = "p_color_src", path = "common/player info/lamp color/*.png"},
		{id = "p_free_src", path = "common/player info/freespace/*.png"}


	}

	skin.font = {
		{id = 0, path = "font/Mplus1p-Medium.ttf"},
		{id = 1, path = "font/Mplus1p-ExtraBold.ttf"},
	}

	skin.image = {
		{id = "bg", src = "bg_src", x = 0, y = 0, w = 1920, h = 1080},
  {id = "failedbg", src = "failedbg", x = 0, y = 0, w = 1920, h = 1080},
		{id = "bga_soundonly", src = "soundonly_src", x = 0, y = 0, w = -1, h = -1},
		{id = "head-line", src = "system_src", x = 622, y = 180, w = 250, h = 3},


		{id = "lanes", src = "system_src", x = 0, y = 0, w = 519, h = 856},
		{id = "lanes_line", src = "system_src", x = 3, y = geometry.lane_line_src, w = 513, h = 10},
  {id = "lanes_button", src = "button", x = 0, y = 0 , w = 500, h = 100},
  {id = "lanes_button_2P", src = "button", x = 0, y = 150 , w = 500, h = 100},

		{id = "lamp_green_v", src = "system_src", x = 660, y = 350, w = 6, h = 14},
		{id = "lamp_duration_v", src = "system_src", x = 670, y = 350, w = 6, h = 14},

		{id = "fast", src = "system_src", x = 33, y = 300, w = 70, h = 19},
		{id = "slow", src = "system_src", x = 1500, y = 350, w = 70, h = 19},
		{id = "fast-lamp", src = "system_src", x = 1500, y = 330, w = 14, h = 19},
		{id = "slow-lamp", src = "system_src", x = 1500, y = 350, w = 14, h = 19},
		{id = "l-rate-DnP", src = "system_src", x = 635, y = 1166, w = 56, h = 18},

		{id = "lamp_music_end", src = "system_src", x = 1350, y = 770, w = 20, h = 40},
		{id = "music_end", src = "system_src", x = 1370, y = 770, w = 130, h = 40},

		{id = "autoplay_tx", src = "system_src", x = 1370, y = 810, w = 250, h = 50},
		{id = "lamp_replay", src = "system_src", x = 1350, y = 860, w = 20, h = 50},
		{id = "replay_tx", src = "system_src", x = 1370, y = 860, w = 160, h = 50},


		{id = "playoption_frame", src = "system_src", x = 900, y = 117, w = 560, h = 179},

		{id = "gauge-DnP", src = "system_src", x = 390, y = 1127, w = 79, h = 36},
		{id = "rate-DnP1", src = "system_src", x = 408, y = 1452, w = 50, h = 50},
  {id = "rate-DnP2", src = "system_src", x = 435, y = 1452, w = 94, h = 37},


		{id = "score-lamp", src = "system_src", x = 600, y = 120, w = 12, h = 60},
		{id = "score-head", src = "score_head", x = 0, y = 0, w = 223, h = 120},
  {id = "notes-head", src = "system_src", x = 1380, y = 750, w = 95, h = 21},
		{id = "lamp-scores", src = "system_src", x = 600, y = 420, w = 10, h = 110},
		{id = "score-mybest-tx", src = "system_src", x = 620, y = 425, w = 83, h = 28},
		{id = "scoregraph-grid", src = "graph-grid", x = 0, y = 0, w = 237, h = 211},
		{id = "graph-best-fp", src = "system_src", x = 615, y = 360, w = 5, h = 20},
		{id = "score-best-fp", src = "system_src", x = 680, y = 340, w = 217, h = 47},







		{id = "songtitle_line", src = "system_src", x = 600, y = 100, w = 610, h = 3},
		{id = "songinfo_frame", src = "system_src", x = 800 + 15, y = 10, w = 500 - 15, h = 64 + 12},
		---後々SP5の方は消す
		{id = "songinfo_sp5", src = "system_src", x = 1340, y = 5, w = 80, h = 52},
		{id = "songinfo_sp7", src = "system_src", x = 1340, y = 60, w = 80, h = 52},
		{id = "sp5_lanecover", src = "system_src", x = 2000, y = 0, w = 114, h = 850},
	

		{id = "songinfo_lamp", src = "system_src", x = 1080, y = 1010, w = 373, h = 36},
		{id = "load-titleline", src = "system_src", x = 530, y = 0, w = 1450, h = 3},
		{id = "load-nostagefile", src = "nostagefile_src", x = 0, y = 0, w = -1, h = -1},


		{id = "BPM-lamp", src = "system_src", x = 600, y = 280, w = 12, h = 60},
		{id = "BPM-head", src = "system_src", x = 622, y = 280, w = 250, h = 60},
		{id = "BPM-bar", src = "BPM-bar", x = 0, y = 0, w = 1027, h =39},
		{id = "BPM-no-change", src = "system_src", x = 1307, y = 300, w = 80, h = 41},
		{id = "song-time-colon", src = "system_src", x = 0, y = 1400, w = 100, h = 100},
		{id = "song-progress-bar", src = "bar", x = 0, y = 0, w = 70, h = 1080},

		{id = "failed", src = "system_src", x = 1000, y = 1050, w = 440, h = 120},
		{id = "lamp_failed", src = "system_src", x = 950, y = 1050, w = 50, h = 120},
		{id = "fc_glow", src = "system_src", x = 950, y = 1200, w = 513, h = 35},
		{id = "fc_text", src = "system_src", x = 1024, y = 1250, w = 439, h = 60},
		{id = "fc_lamp", src = "system_src", x = 950, y = 1250, w = 74, h = 60},


		{id = "timehispeed", src = "time-hispeed", x = 0, y = 0, w = 280, h = 15},
		{id = "player-icon", src = "p_icon_src", x = 0, y = 0, w = -1, h = -1},
		{id = "lamp-player", src = "p_color_src", x = 0, y = 0, w = -1, h = -1},
		{id = "player-freespace", src = "p_free_src", x = 0, y = 0, w = -1, h = -1},
		{id = "player-line", src = "system_src", x = 1090, y = 980, w = 335, h = 3},

		{id = "judge-pg", src = "judge_src", x = 0, y = 0, w = 191, h = 189, divy = 3, cycle = 120},
		{id = "judge-gr", src = "judge_src", x = 0, y = 122, w = 191, h = 122, divy = 2, cycle = 80},
		{id = "judge-gd", src = "judge_src", x = 0, y = 270, w = 382, h = 61, divx = 2, cycle = 80},
		{id = "judge-bd", src = "judge_src", x = 0, y = 311, w = 382, h = 61, divx = 2, cycle = 80},
		{id = "judge-pr", src = "judge_src", x = 0, y = 440, w = 382, h = 61, divx = 2, cycle = 80},
		{id = "judge-ms", src = "judge_src", x = 0, y = 560, w = 382, h = 61, divx = 2, cycle = 80},

		{id = "keybeam-w", src = "keybeam_src", x = 0, y = 0, w = 50, h = 853},
		{id = "keybeam-b", src = "keybeam_src", x = 50, y = 0, w = 50, h = 853},
		{id = "keybeam-s", src = "keybeam_src", x = 100, y = 0, w = 50, h = 853},

		{id = "note-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.Std_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "note-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.Std_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "note-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.Std_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "note-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.Std_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "lnSt-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.lnSt_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "lnSt-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.lnSt_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "lnSt-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.lnSt_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "lnSt-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.lnSt_y, w = notesInfo.Bl_width, h = notesInfo.height},


		{id = "lnEn-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.lnEn_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "lnEn-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.lnEn_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "lnEn-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.lnEn_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "lnEn-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.lnEn_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "lnBo-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.lnAc_y, w = notesInfo.Bl_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},
		{id = "lnBo-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.lnAc_y, w = notesInfo.Wh_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},
		{id = "lnBo-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.lnAc_y, w = notesInfo.Sc_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},
		{id = "lnBo-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.lnAc_y, w = notesInfo.Bl_width, h = notesInfo.height * 2, divy = 2, cycle = notesInfo.lnCycle},

		{id = "lnAc-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.lnBo_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "lnAc-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.lnBo_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "lnAc-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.lnBo_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "lnAc-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.lnBo_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hcSt-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.hcSt_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hcSt-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.hcSt_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hcSt-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.hcSt_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hcSt-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.hcSt_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hcEn-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.hcEn_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hcEn-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.hcEn_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hcEn-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.hcEn_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hcEn-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.hcEn_y, w = notesInfo.Bl_width, h = notesInfo.height},

		{id = "hcAc-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.hcBo_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "hcAc-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.hcBo_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "hcAc-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.hcBo_y, w = notesInfo.Sc_width, h = notesInfo.height},
		{id = "hcAc-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.hcBo_y, w = notesInfo.Ye_width, h = notesInfo.height},

		{id = "hcBo-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.hcAc_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hcBo-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.hcAc_y, w = notesInfo.Wh_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hcBo-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.hcAc_y, w = notesInfo.Sc_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hcBo-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.hcAc_y, w = notesInfo.Ye_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},

		{id = "hcDm-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.hcDm_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hcDm-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.hcDm_y, w = notesInfo.Wh_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hcDm-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.hcDm_y, w = notesInfo.Sc_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},
		{id = "hcDm-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.hcDm_y, w = notesInfo.Ye_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnCycle},

		{id = "hcRe-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.hcRe_y, w = notesInfo.Bl_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},
		{id = "hcRe-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.hcRe_y, w = notesInfo.Wh_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},
		{id = "hcRe-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.hcRe_y, w = notesInfo.Sc_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},
		{id = "hcRe-Ye", src = "notes_src", x = notesInfo.Ye_x, y = notesInfo.hcRe_y, w = notesInfo.Ye_width, h = notesInfo.height, divy = 2, cycle = notesInfo.hcnDamageCycle},

		{id = "mine-Bl", src = "notes_src", x = notesInfo.Bl_x, y = notesInfo.mine_y, w = notesInfo.Bl_width, h = notesInfo.height},
		{id = "mine-Wh", src = "notes_src", x = notesInfo.Wh_x, y = notesInfo.mine_y, w = notesInfo.Wh_width, h = notesInfo.height},
		{id = "mine-Sc", src = "notes_src", x = notesInfo.Sc_x, y = notesInfo.mine_y, w = notesInfo.Sc_width, h = notesInfo.height},

		{id = "section-line", src = "system_src", x = 0, y = 0, w = 1, h = 1},

		{id = "gauge-r1", src = "system_src", x = 900, y = 1000, w = 2, h = 23},
		{id = "gauge-r2", src = "system_src", x = 910, y = 1000, w = 2, h = 23},
		{id = "gauge-r3", src = "system_src", x = 900, y = 1000, w = 2, h = 23},

		{id = "gauge-b1", src = "system_src", x = 905, y = 1000, w = 2, h = 23},
		{id = "gauge-b2", src = "system_src", x = 915, y = 1000, w = 2, h = 23},
		{id = "gauge-b3", src = "system_src", x = 905, y = 1000, w = 2, h = 23},

		{id = "gauge-y1", src = "system_src", x = 900, y = 1025, w = 2, h = 23},
		{id = "gauge-y2", src = "system_src", x = 910, y = 1025, w = 2, h = 23},
		{id = "gauge-y3", src = "system_src", x = 900, y = 1025, w = 2, h = 23},

		{id = "gauge-p1", src = "system_src", x = 900, y = 1025, w = 2, h = 23},
		{id = "gauge-p2", src = "system_src", x = 905, y = 1025, w = 2, h = 23},
		{id = "gauge-p3", src = "system_src", x = 905, y = 1025, w = 2, h = 23},

		{id = "gauge-g1", src = "system_src", x = 925, y = 1000, w = 2, h = 23},
		{id = "gauge-g2", src = "system_src", x = 935, y = 1000, w = 2, h = 23},
		{id = "gauge-g3", src = "system_src", x = 925, y = 1000, w = 2, h = 23},

		{id = "gauge-w1", src = "system_src", x = 923, y = 1025, w = 2, h = 28},
		{id = "gauge-w2", src = "system_src", x = 927, y = 1025, w = 2, h = 28},
		{id = "gauge-w3", src = "system_src", x = 923, y = 1025, w = 2, h = 28}


	}
	skin.imageset = {}
	skin.value = {
		{id = "note", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 74, align = 0},
		{id = "total", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 368, align = 0},


		{id = "lanecover-value", src = "system_src", x = 100, y = 1385, w = 150, h = 18, divx = 10, digit = 3, ref = 14, align = 1},
		{id = "lanecover-green", src = "system_src", x = 100, y = 1385, w = 150, h = 18, divx = 10, digit = 4, ref = 313, align = 1},
		{id = "lanecover-duration", src = "system_src", x = 100, y = 1385, w = 150, h = 18, divx = 10, digit = 4, ref = 312, align = 1},
		{id = "lift-value", src = "system_src", x = 100, y = 1385, w = 150, h = 18, divx = 10, digit = 3, ref = 314, align = 1},

		{id = "diff-best", src = "system_src", x = 470, y = 1220, w = 264, h = 56, divx = 12, divy = 2, digit = 5, ref = 152, align = 1},
		{id = "diff-target", src = "system_src", x = 470, y = 1220, w = 264, h = 56, divx = 12, divy = 2, digit = 5, ref = 153, align = 1},
		{id = "fsms-num", src = "system_src", x = 470, y = 1130, w = 180, h = 36, divx = 12, divy = 2, digit = 4, ref = 525, align = 1},


		{id = "Score-num", src = "system_src", x = 10, y = 990, w = 610, h = 75, divx = 10, digit = 5, ref = 101, align = 1},
		{id = "rate-num", src = "system_src", x = 100, y = 1403, w = 360, h = 49, divx = 10, digit = 3, ref = 102, align = 0},
		{id = "rate-adot-num", src = "system_src", x = 100, y = 1452, w = 308, h = 37, divx = 11, digit = 2, ref = 103, align = 0},
  {id = "scorediff", src = "system_src", x = 10, y = 990, w = 610, h = 75, divx = 10, digit = 5, ref = 12, align = 2},

		
		{id = "l-rate-num", src = "system_src", x = 470, y = 1166, w = 150, h = 18, divx = 10, digit = 3, ref = 102, align = 0},
		{id = "l-rate-adot-num", src = "system_src", x = 470, y = 1166, w = 165, h = 18, divx = 11, digit = 2, ref = 103, align = 0},

		{id = "score-best-dif", src = "system_src", x = 100, y = 1211, w = 336, h = 74, divx = 12, divy = 2, digit = 6, ref = 172, align = 0},
		{id = "score-targ-dif", src = "system_src", x = 100, y = 1211, w = 336, h = 74, divx = 12, divy = 2, digit = 6, ref = 153, align = 0},
		{id = "score-next-dif", src = "system_src", x = 324, y = 1285, w = 336, h = 74, divx = 12, divy = 2, digit = 6, ref = 154, align = 0},
		{id = "score-best", src = "system_src", x = 100, y = 1285, w = 220, h = 28, divx = 10, digit = 5, ref = 170, align = 0},
		{id = "score-targ", src = "system_src", x = 100, y = 1285, w = 220, h = 28, divx = 10, digit = 5, ref = 151, align = 0},

		{id = "num-dt-pf", src = "system_src", x = 100, y = 1163, w = 360, h = 48, divx = 10, digit = 4, ref = 110, align = 2},
		{id = "num-dt-gr", src = "system_src", x = 100, y = 1163, w = 360, h = 48, divx = 10, digit = 4, ref = 111, align = 2},
		{id = "num-dt-gd", src = "system_src", x = 100, y = 1163, w = 360, h = 48, divx = 10, digit = 4, ref = 112, align = 2},
		{id = "num-dt-bd", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 113, align = 2},
		{id = "num-dt-pr", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 114, align = 2},
		{id = "num-dt-ms", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 420, align = 2},
		{id = "num-dt-br", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 425, align = 2},
		{id = "num-dt-fa", src = "system_src", x = 100, y = 1285, w = 220, h = 28, divx = 10, digit = 4, ref = 423, align = 2},
		{id = "num-dt-sl", src = "system_src", x = 100, y = 1285, w = 220, h = 28, divx = 10, digit = 4, ref = 424, align = 2},


		{id = "gauge-num", src = "system_src", x = 100, y = 1073, w = 430, h = 54, divx = 10, digit = 3, ref = 107},
		{id = "gauge-adot-num", src = "system_src", x = 100, y = 1127, w = 290, h = 36, divx = 10, digit = 1, ref = 407},


		{id = "BPM-now", src = "system_src", x = 10, y = 994, w = 610, h = 75, divx = 10, digit = 5, ref = 160, align = 2},
		{id = "BPM-max", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 90, align = 1},
		{id = "BPM-min", src = "system_src", x = 100, y = 1211, w = 280, h = 37, divx = 10, digit = 4, ref = 91, align = 1},

  {id = "hispeed-num", src = "system_src", x = 100, y = 1385, w = 165, h = 18, divx = 11, digit = 1, ref = 310, align = 1},
		{id = "hispeed-adot-num", src = "system_src", x = 100, y = 1385, w = 165, h = 18, divx = 11, digit = 2, ref = 311, align = 1},

		{id = "song-left-m", src = "system_src", x = 100, y = 1385, w = 165, h = 18, divx = 11, digit = 2, ref = 163, align = 1},
		{id = "song-left-s", src = "system_src", x = 100, y = 1385, w = 165, h = 18, divx = 11, digit = 2, ref = 164, align = 1},
		{id = "song-length-m", src = "system_src", x = 100, y = 1385, w = 165, h = 18, divx = 11, digit = 2, ref = 1163, align = 1},
		{id = "song-length-s", src = "system_src", x = 100, y = 1385, w = 165, h = 18, divx = 11, digit = 2, ref = 1164, align = 1},

		{id = "judge-num-pg", src = "judge_src", x = 217, y = 0, w = 290, h = 184, divx = 10, divy = 3, digit = 6, ref = 75, cycle = 120},
		{id = "judge-num-gr", src = "judge_src", x = 217, y = 186, w = 290, h = 122, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judge-num-gd", src = "judge_src", x = 217, y = 250, w = 290, h = 61, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judge-num-bd", src = "judge_src", x = 217, y = 370, w = 580, h = 61, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judge-num-pr", src = "judge_src", x = 217, y = 440, w = 580, h = 61, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},
		{id = "judge-num-ms", src = "judge_src", x = 217, y = 560, w = 580, h = 61, divx = 10, divy = 2, digit = 6, ref = 75, cycle = 80},


	}
	skin.text = {
		{id = "tablename", font = 0, size = 26, ref = 1003, overflow = 1},
		{id = "title", font = 1, align = 0, size = 21, ref = 12, overflow = 1},
		{id = "playername", font = 1, size = 32, ref = 2, overflow = 1},
  {id = "targetname", font = 1, size = 25, ref = 1, overflow = 1, align = 0},

		{id = "load-genre", font = 0, size = 27, ref = 13, overflow = 1},
		{id = "load-title", font = 1, size = 73, ref = 12, overflow = 1},
		{id = "load-artist", font = 0, size = 41, ref = 16, overflow = 1},

	}
	skin.slider = {
		{id = "song-progress", src = "system_src", x = 1080, y = 890, w = 20, h = 30, angle = 2, range = 710, type = 6},
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

		skin.note.dst = {}

		geometry.notes_x = {}
		geometry.notes_w = {}
		
		geometry.notes_w[8] = notesInfo.Sc_width
		geometry.notes_w[1] = notesInfo.Wh_width

		if isScratchRight() then
			geometry.notes_x[1] = geometry.lane_x + geometry.lane_line_width
			geometry.notes_x[8] = geometry.lane_x + geometry.lane_w - geometry.lane_line_width - geometry.notes_w[8]
		else
			geometry.notes_x[8] = geometry.lane_x + geometry.lane_line_width
			geometry.notes_x[1] = geometry.notes_x[8] + geometry.notes_w[8] + geometry.lane_line_width
		end

		for i = 2, 7 do
			if i % 2 == 0 then
				geometry.notes_x[i] = geometry.notes_x[i-1] + notesInfo.Wh_width + geometry.lane_line_width
				geometry.notes_w[i] = notesInfo.Bl_width
			else
				geometry.notes_x[i] = geometry.notes_x[i-1] + notesInfo.Bl_width + geometry.lane_line_width
				geometry.notes_w[i] = notesInfo.Wh_width
			end
		end
	
		for i = 1, 8 do
			skin.note.dst[i] = {
				x = geometry.notes_x[i] + geometry.play_position,
				y = geometry.lane_y + geometry.lane_line_width,
				w = geometry.notes_w[i],
				h = geometry.lane_h}
		end
	





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

   table.insert(skin.destination, {id = "bg", stretch = 1, dst = {
    {x = 0, y = 0, w = 1920, h = 1080}}})

--BGA関連	

 if is2P() then
  table.insert(skin.destination, {id = "bga", filter = 1, dst = {{x = -780+geometry.info_position , y = 200, w = geometry.bga_w, h = geometry.bga_h}}})
 -- table.insert(skin.destination, {id = -101, loop = 400, op = {80, 195}, filter = 1, stretch = 1, dst = {
 --  {time = 0, x =900, y = geometry.bga_y, w = 300,h=300, a = 0},
 --  {time = 400, a = 255}}})
  table.insert(skin.destination, {id = "bga_soundonly", stretch = 1, draw = function()
   if main_state.option(40) or main_state.option(170) then
    return true
   end
  end, timer = 41, loop = 800, dst = {
   {time = 0, x =-780+geometry.info_position,  y = 200, w = geometry.bga_w, h = geometry.bga_h, a = 0},
   {time = 500},
   {time = 800, a = 255}}})
  table.insert(skin.destination, 		{id = -110, timer = 41, offset = 55, dst = {
			{x = -780+geometry.info_position, y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 0}}})
else
 table.insert(skin.destination, {id = "bga", filter = 1, dst = {{x =980+geometry.info_position , y = 200, w = geometry.bga_w, h = geometry.bga_h}}})
 -- table.insert(skin.destination, {id = -101, loop = 400, op = {80, 195}, filter = 1, stretch = 1, dst = {
 --  {time = 0, x =980+geometry.info_position, y = geometry.bga_y, w = 300,h=300, a = 0},
 --  {time = 400, a = 255}}})
 table.insert(skin.destination, {id = "bga_soundonly", stretch = 1, draw = function()
  if main_state.option(40) or main_state.option(170) then
   return true
  end
 end, timer = 41, loop = 800, dst = {
  {time = 0, x =-780+geometry.info_position,  y = 200, w = geometry.bga_w, h = geometry.bga_h, a = 0},
  {time = 500},
  {time = 800, a = 255}}})
 table.insert(skin.destination, 		{id = -110, timer = 41, offset = 55, dst = {
  {x =980+geometry.info_position, y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 0}}})
 end

--曲情報エリア
--ここから
	--ジャンル名・曲名
 if is2P() then
  table.insert(skin.destination, {id = "title", filter = 1, dst = {{x = 400, y = 970, w = 575, h = 30}}})
  table.insert(skin.destination, {id = "tablename", filter = 1, dst = {{x = 400, y = 1050, w = 575, h = 26}}})
 else
  table.insert(skin.destination, {id = "title", filter = 1, dst = {{x = 1180, y = 970, w = 575, h = 30}}})
  table.insert(skin.destination, {id = "tablename", filter = 1, dst = {{x = 1230, y = 1050, w = 575, h = 26}}})
 end



	--notes
 table.insert(skin.destination, {id = "notes-head", dst = {{x = 585 + geometry.score_position, y = 300, w = 95, h = 21}}})
	table.insert(skin.destination, {id = "note", dst = {{x = 790 + geometry.score_position, y = 280, w = 14, h = 18}}})

	--曲の長さ、残り時間
	--残り時間

 if is2P() then
  table.insert(skin.destination,
  {id = "song-left-m", dst = {
   {x = 720 , y = 30, w = 24, h = 22}}})
  table.insert(skin.destination,
  {id = "song-left-s", dst = {
   {x = 780 , y = 30, w = 24, h = 22}}})
    table.insert(skin.destination,
    {id = "song-time-colon", dst = {
     {x = 762 , y = 30, w = 50, h = 50}}})
    
 else
  table.insert(skin.destination,
  {id = "song-left-m", dst = {
   {x = 250, y = 30, w = 24, h = 22}}})
  table.insert(skin.destination,
  {id = "song-left-s", dst = {
   {x = 310, y = 30, w = 24, h = 22}}})
   table.insert(skin.destination,
    {id = "song-time-colon", dst = {
     {x = 292 , y = 30, w = 50, h = 50}}})
 end
 


	--曲の長さスライダー
 if is2P() then
  table.insert(skin.destination,
  {id = "song-progress-bar", dst = {
   {x = 1870, y = 0, w = 70, h = 1080}}})
  table.insert(skin.destination,
  {id = "song-progress", dst = {
   {x = 1883, y = 1007, w = 18, h = 30}}})
 else
 	table.insert(skin.destination,
	{id = "song-progress-bar", dst = {
		{x = 0 - geometry.info_position, y = 0, w = 70, h = 1080}}})
	table.insert(skin.destination,
	{id = "song-progress", dst = {
		{x = 13  - geometry.info_position, y = 1007, w = 18, h = 30}}})
 end
		


	--BPM
	--見出し
	table.insert(skin.destination, {id = "BPM-head", dst = {{x = 52 + geometry.info_position, y = 255, w = 250, h = 60}}})

	--枠
	table.insert(skin.destination, {id = "BPM-bar", dst = {
  {x = 875 - geometry.info_position, y = 80, w = 1000, h = 34}}})
	--今のBPM
	table.insert(skin.destination, {id = "BPM-now", dst = {
		{x = 1270 - geometry.info_position, y = 125, w = 49, h = 56}}})
	--最大BPM
	table.insert(skin.destination, {id = "BPM-max",op = {177}, dst = {
		{x = 1470 - geometry.info_position, y = 125, w = 14, h = 18}}})
	--最小BPM
	table.insert(skin.destination, {id = "BPM-min", op = {177}, dst = {
		{x = 1270 - geometry.info_position, y = 125, w = 14, h = 18}}})
	--BPM変わらない曲のとき
	table.insert(skin.destination, {id = "BPM-no-change", op = {176}, dst = {
		{x = 1470 - geometry.info_position, y = 125, w = 60, h = 21}}})
  table.insert(skin.destination, {id = "BPM-no-change", op = {176}, dst = {
  {x = 1270 - geometry.info_position, y = 125, w = 60, h = 21}}})
	

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
	-- 	table.insert(skin.font, {id = 2, path = "font/Mplus1p-Regular.ttf"})
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
    {time = 0, x = geometry.lane_x + geometry.play_position, y = 0, w = 525, h = 100, acc = 2},
    {time = 200},
    {time = 800, y = -100 + geometry.lane_y}
   }})
  else
   table.insert(skin.destination,
   {id = "lanes_button", loop = 800, dst ={
    {time = 0, x = geometry.lane_x + geometry.play_position, y = 0, w = 525, h = 100, acc = 2},
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
 if is2P() then --2P
	table.insert(skin.destination, {id = "gauge", dst = {{x = 1870 , y = 120, w = -350, h = 34}}})
 else -- 1P
  table.insert(skin.destination, {id = "gauge", dst = {{x = 70, y = 120, w = 350, h = 34}}})
 end

	--ゲージの数字
 if is2P() then --2P
  table.insert(skin.destination, {id = "gauge-num", dst = {{x = 60 + geometry.play_position, y = 130, w = 29, h = 36}}})
  --小数点以下
  table.insert(skin.destination, {id = "gauge-adot-num", dst = {{x = 171 + geometry.play_position, y = 130, w = 29, h = 36}}})
  --小数点とパーセント
  table.insert(skin.destination, {id = "gauge-DnP", dst = {{x = 151 + geometry.play_position, y = 130, w = 79, h = 36}}})
  else -- 1P
   table.insert(skin.destination, {id = "gauge-num", dst = {{x = 410 + geometry.play_position, y = 130, w = 29, h = 36}}})
   --小数点以下
   table.insert(skin.destination, {id = "gauge-adot-num", dst = {{x = 521 + geometry.play_position, y = 130, w = 29, h = 36}}})
   --小数点とパーセント
   table.insert(skin.destination, {id = "gauge-DnP", dst = {{x = 506 + geometry.play_position, y = 130, w = 79, h = 36}}})
  end
 

	--ヘッダー
	table.insert(skin.destination,
	{id = "playoption_frame", dst = {
		{x = 25 + geometry.play_position, y = -35, w = 750, h = 230}
	}})



	
		

--プレイエリア
--ここまで

--スコアエリア
--ここから
	--Score
	--見出し
	table.insert(skin.destination, {id = "score-head", dst = {{x = 583 + geometry.score_position, y= 370, w = 250, h = 170}}})
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
		{x = 578 + geometry.score_position, y= 840, w = 250, h = 230}}})
   --レート・小数点以下・ドット、パーセント
   table.insert(skin.destination,
   {id = "hispeed-num", dst = {
    {x = 450 + geometry.score_position, y= 30, w = 24, h = 22}}})
   table.insert(skin.destination,
   {id = "rate-DnP1", dst = {
    {x = 475 + geometry.score_position, y= 15, w = 50, h = 50}}})
   table.insert(skin.destination,
   {id = "hispeed-adot-num", dst = {
    {x = 485 + geometry.score_position, y= 30, w = 24, h = 22}}})
 
	--EXスコア
--"lefttime"と"hispeed"の見出し
   table.insert(skin.destination,
	  {id = "timehispeed", dst = {
		  {x = 260 + geometry.score_position, y= 80, w = 340, h = 22}}})
		if is2P() then --2P
   table.insert(skin.destination,
   {id = "Score-num", dst = {
    {x = 1450 , y= 10, w = 30, h = 43}}})
		else --1P
   table.insert(skin.destination,
   {id = "Score-num", dst = {
    {x = 140, y= 10, w = 30, h = 43}}})
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
			table.insert(skin.imageset,
				{id = "score-target-tx", ref = 22, images = { id[1], id[2], id[3], id[4], id[5], id[6], id[7], id[8], id[9], id[10], id[11] }})
		end
	end
	--上で定義した奴を配置
 if is2P() then
	table.insert(skin.destination,
	{id = "targetname", dst = {
		{x = 472 + geometry.score_position, y= 555, w = 110, h = 24}}})
 else
  table.insert(skin.destination,
  {id = "targetname", dst = {
   {x = 840 + geometry.score_position, y= 555, w = 75, h = 22}}})
 end
	--ターゲットとの差
	table.insert(skin.destination,
	{id = "score-targ-dif", dst = {
		{x = 735 + geometry.score_position, y= 380, w = 18, h = 24}}})
	--自己ベストの点数
	table.insert(skin.destination,
	{id = "score-targ", dst = {
		{x = 753 + geometry.score_position, y= 350, w = 18, h = 24}}})
	
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
