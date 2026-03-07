-- Copyright GroundbreakinG

-- Licensed under the Apache License, Version 2.0 (the License);
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at

--     http://www.apache.org/licenses/LICENSE-2.0

-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an AS IS BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
local main_state = require("main_state")
local header = {
	type = 5,
	name ="GroundbreakinG Skin Ver.0.1 Select",
	w = 1920,
	h = 1080,
	fadeout = 500,
	scene = 3000,
	input = 500,
	filepath = {
		{name = "背景", path = "background/*.png"}
	}
}

local function add_option_selector_images(images, prefix, count, x, start_y, step_y, suffix)
	suffix = suffix or ""
	for i = 1, count do
		table.insert(images, {
			id = prefix .. i .. suffix,
			src = 59,
			x = x,
			y = start_y + (i - 1) * step_y,
			w = 288,
			h = 760
		})
	end
end

local function numbered_image_ids(prefix, count, suffix)
	local ids = {}
	suffix = suffix or ""
	for i = 1, count do
		ids[i] = prefix .. i .. suffix
	end
	return ids
end

local function append_entries(target, entries)
	for _, entry in ipairs(entries) do
		table.insert(target, entry)
	end
end

local function build_mode_key_images()
	local ids = {"allkeys", "5keys", "7keys", "10keys", "14keys", "9keys", "24keys", "24keysDP"}
	local entries = {}
	for i, id in ipairs(ids) do
		table.insert(entries, {
			id = id,
			src = 11,
			x = 0,
			y = (i - 1) * 48,
			w = 180,
			h = 48
		})
	end
	return entries
end

local function build_key_count_images()
	local ids = {"5keysN", "7keysN", "10keysN", "14keysN", "9keysN", "24keysN", "24keysDPN"}
	local entries = {}
	for i, id in ipairs(ids) do
		table.insert(entries, {
			id = id,
			src = 12,
			x = 1380,
			y = (i - 1) * 50,
			w = 181,
			h = 50
		})
	end
	return entries
end

local function build_lamp_image_entries(id_prefix, x, failed_width)
	local states = {
		{suffix = "noplay", y = 920},
		{suffix = "failed", y = 0, cycle = 33},
		{suffix = "assist", y = 92},
		{suffix = "lassist", y = 184},
		{suffix = "easy", y = 276},
		{suffix = "normal", y = 368},
		{suffix = "hard", y = 460},
		{suffix = "exhard", y = 552, cycle = 133},
		{suffix = "fc", y = 644, cycle = 133},
		{suffix = "perfect", y = 736, cycle = 133},
		{suffix = "max", y = 828, cycle = 133}
	}
	local entries = {}
	for _, state in ipairs(states) do
		local width = 118
		if state.suffix == "failed" then
			width = failed_width
		end
		local entry = {
			id = id_prefix .. "-" .. state.suffix,
			src = 3,
			x = x,
			y = state.y,
			w = width,
			h = 92,
			divx = 2
		}
		if state.cycle ~= nil then
			entry.cycle = state.cycle
		end
		table.insert(entries, entry)
	end
	return entries
end

local function build_rank_image_entries()
	local defs = {
		{id = "rank_aaa", y = 0},
		{id = "rank_aa", y = 170},
		{id = "rank_a", y = 335},
		{id = "rank_b", y = 505},
		{id = "rank_c", y = 675},
		{id = "rank_d", y = 840},
		{id = "rank_e", y = 1010},
		{id = "rank_f", y = 1175},
		{id = "rank_max", y = 384}
	}
	local entries = {}
	for _, def in ipairs(defs) do
		table.insert(entries, {id = def.id, src = 16, x = 0, y = def.y, w = 400, h = 165})
	end
	return entries
end

local function build_constraint_image_entries()
	local ids = {"const-random", "const-mirror", "const-nospeed", "const-nogood", "const-nogreat"}
	local entries = {}
	for i, id in ipairs(ids) do
		table.insert(entries, {id = id, src = 8, x = 0, y = (i - 1) * 62, w = 400, h = 62})
	end
	return entries
end

local function build_imageset_option_entries()
	local configs = {
		{id = "option-exjudge", ref = 301, prefix = "option-selector2", count = 2},
		{id = "option-constant", ref = 302, prefix = "option-selector2", count = 2},
		{id = "option-judgearea", ref = 303, prefix = "option-selector2", count = 2},
		{id = "option-legacy", ref = 304, prefix = "option-selector2", count = 2},
		{id = "option-marknote", ref = 305, prefix = "option-selector2", count = 2},
		{id = "option-bpmguide", ref = 306, prefix = "option-selector2", count = 2},
		{id = "option-nomine", ref = 307, prefix = "option-selector2", count = 2},
		{id = "option-random", ref = 42, prefix = "option-selector11", count = 10},
		{id = "option-gauge", ref = 40, prefix = "option-selector12", count = 6},
		{id = "option-hsfix", ref = 55, prefix = "option-selector13", count = 5},
		{id = "option-random2", ref = 43, prefix = "option-selector11", count = 10, suffix = "_2p"},
		{id = "option-dp", ref = 54, prefix = "option-selector14", count = 4},
		{id = "option-bga", ref = 72, prefix = "option-selector3", count = 3},
		{id = "option-gas", ref = 78, prefix = "option-selector4", count = 5},
		{id = "option-autoadjust", ref = 75, prefix = "option-selector2", count = 2}
	}
	local entries = {}
	for _, config in ipairs(configs) do
		table.insert(entries, {
			id = config.id,
			ref = config.ref,
			images = numbered_image_ids(config.prefix, config.count, config.suffix)
		})
	end
	return entries
end

local function build_numeric_value_entries(defs, base)
	local entries = {}
	for _, def in ipairs(defs) do
		local entry = {}
		for k, v in pairs(base) do
			entry[k] = v
		end
		for k, v in pairs(def) do
			entry[k] = v
		end
		table.insert(entries, entry)
	end
	return entries
end

local function build_score_value_entries()
	return build_numeric_value_entries({
		{id = "score_count", w = 352, divx = 11, digit = 4, ref = 171},
		{id = "max_score", w = 352, divx = 11, digit = 4, ref = 72},
		{id = "total_notes", w = 353, divx = 11, digit = 4, ref = 74},
		{id = "miss_count", w = 352, divx = 11, digit = 4, ref = 76},
		{id = "combo_count", w = 352, divx = 11, digit = 4, ref = 75},
		{id = "clear_count", w = 320, divx = 10, digit = 4, ref = 78},
		{id = "nextrank", w = 352, divx = 11, digit = 4, align = 1, ref = 154},
		{id = "play_count", w = 320, divx = 10, digit = 6, align = 1, ref = 77},
		{id = "notes_count", w = 352, divx = 11, digit = 4, ref = 74}
	}, {
		src = 6,
		x = 0,
		y = 63,
		h = 36
	})
end

local function build_time_value_entries()
	return build_numeric_value_entries({
		{id = "time_year", w = 356, digit = 4, ref = 21},
		{id = "time_month", w = 353, digit = 2, padding = 1, ref = 22},
		{id = "time_day", w = 353, digit = 2, padding = 1, ref = 23},
		{id = "time_hour", w = 353, digit = 2, padding = 1, ref = 24},
		{id = "time_minute", w = 353, digit = 2, padding = 1, ref = 25},
		{id = "time_second", w = 353, digit = 2, padding = 1, ref = 26}
	}, {
		src = 6,
		x = 360,
		y = 118,
		h = 41,
		divx = 11
	})
end

local function build_dst_frame(base, time, alpha)
	local frame = {time = time}
	for k, v in pairs(base) do
		frame[k] = v
	end
	frame.a = alpha
	return frame
end

local function add_fade_pair(destination, config)
	table.insert(destination, {
		id = config.id,
		loop = 300,
		op = {config.op},
		timer = config.timer_on,
		dst = {
			build_dst_frame(config.base, 0, 0),
			{time = 300, a = 255}
		}
	})
	table.insert(destination, {
		id = config.id,
		loop = 300,
		op = {-config.op},
		timer = config.timer_off,
		dst = {
			build_dst_frame(config.base, 0, 255),
			{time = 300, a = 0}
		}
	})
end

local function build_songlist_entries(active)
	local entries = {}
	for i = 1, 23 do
		local x = 1336
		local w = 900
		local dst = {
			x = x,
			y = 1100 - (i - 1) * 60,
			w = w,
			h = 60
		}
		if i == 8 then
			dst.x = active and 1100 or 1200
		end
		if active and i == 12 then
			dst.w = 1000
		end
		if not active and i ~= 8 then
			dst.a = 50
		end
		table.insert(entries, {id = "bar", dst = {dst}})
	end
	return entries
end

local function build_lamp_entries(ids, x, y)
	local entries = {}
	for _, id in ipairs(ids) do
		table.insert(entries, {
			id = id,
			dst = {{
				x = x,
				y = y,
				w = 49,
				h = 70
			}}
		})
	end
	return entries
end

local function build_fixed_entries(ids, dst)
	local entries = {}
	for _, id in ipairs(ids) do
		table.insert(entries, {id = id, dst = {dst}})
	end
	return entries
end

local function build_level_entries(colors)
	local entries = {}
	for _, color in ipairs(colors) do
		table.insert(entries, {
			id = "playlevel_bar",
			dst = {{
				x = 30,
				y = 10,
				w = 30,
				h = 40,
				r = color[1],
				g = color[2],
				b = color[3]
			}}
		})
	end
	return entries
end

local function build_label_entries(configs)
	local entries = {}
	for _, config in ipairs(configs) do
		table.insert(entries, {
			id = config.id,
			dst = {{
				x = config.x,
				y = config.y,
				w = config.w,
				h = config.h
			}}
		})
	end
	return entries
end

local function build_bartext_entries()
	return {
		-- bartext は「非選択: 黄寄り」+「選択中: 白」の2レイヤで描画する。
		{id = "bartext", filter = 1, dst = {{x = 150, y = 10, w = 36, h = 32, b = 0}}},
		{id = "bartext", filter = 1, dst = {{x = 150, y = 10, w = 36, h = 32}}}
	}
end

local function has_subtitle_text()
	local subtitle_text = main_state.text(11)
	return subtitle_text ~= nil and subtitle_text ~= ""
end

local function main()
	-- ヘッダ情報コピー
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	skin.source = {
		{id = 0, path = "sys.png"},
		{id = 1, path = "background/*.png"},
		{id = 2, path = "songbar3.png"},
		{id = 3, path = "lamp.png"},
		{id = 4, path = "trophy.png"},
		{id = 5, path = "clear.png"},
		{id = 6, path = "numbers3.png"},
		{id = 7, path = "rankgraph.png"},
		{id = 8, path = "constraint.png"},
		{id = 9, path = "barselect.png"},
		{id = 10, path = "info.png"},
		{id = 11, path = "sort.png"},
		{id = 12, path = "songdata2.png"},
		{id = 13, path = "rank.png"},
		{id = 14, path = "lampbar.png"},
		{id = 15, path = "sidewire.png"},
		{id = 16, path = "rank3.png"},
		{id = 30, path = "stagefile/*.png"},
		{id = 40, path = "volume3.png"},
		{id = 51, path = "panel1.png"},
		{id = 52, path = "panel2.png"},
		{id = 53, path = "panel3.png"},
		{id = 54, path = "Group 19.png"},
		{id = 55, path = "Group 1.png"},
		{id = 56, path = "Group 18.png"},
		{id = 57, path = "judge.png"},
		{id = 58, path = "logo.png"},
		{id = 59, path = "selectframe.png"},
		{id = 60, path = "sorttext.png"},
		{id = 61, path = "timing.png"},
	}
	skin.font = {
		{id = 0, path = "../fonts/RobotoMono-Medium.ttf"},
		{id = 1, path = "../fonts/bitmap/Title.fnt"},
		{id = 2, path = "../fonts/bitmap/Artist.fnt"},
		{id = 3, path = "../fonts/LINESeedJP_TTF_Bd.ttf"},
	}
	skin.image = {
		{id = "bg", src = 1, x = 0, y = 0, w = 1920, h = 1080},
		{id = "stagefile", src = 30, x = 0, y = 0, w = 1024, h = 760},
		{id = "search-bar", src = 55, x = 0, y = 0, w = 630, h = 60},
		{id = "logo", src = 58, x = 0, y = 0, w = 4172, h = 719},
		{id = "sorttext", src = 60, x = 0, y = 0, w = 1816, h = 92},

		{id = "songs_font", src = 12, x = 1078, y = 52, w = 292, h = 48},
		{id = "Notes-text", src = 12, x = 1380, y = 343, w = 181, h = 50},

		{id = "judge_veryeasy", src = 57, x = 0, y = 0, w = 135, h = 24, act = 19},
		{id = "judge_easy", src = 57, x = 0, y = 35, w = 135, h = 24, act = 19},
		{id = "judge_normal", src = 57, x = 0, y = 68, w = 135, h = 24, act = 19},
		{id = "judge_hard", src = 57, x = 0, y = 103,w = 135, h = 24, act = 19},
		{id = "judge_veryhard", src = 57, x = 0, y = 135, w = 135, h = 24, act = 19},

		{id = "music-select", src = 10, x = 0, y = 0, w = 1031, h = 114},
		{id = "navigation-guide", src = 10, x = 0, y = 127, w = 1031, h = 162},
		{id = "mods", src = 0, x = 0, y = 948, w = 2560, h = 80},

		{id = "nextrank-minus", src = 6, x = 418, y = 188, w = 18, h = 8},

		{id = "score-data", src = 54, x = 0, y = 0, w = 420, h = 180},
		{id = "rankgraph-border", src = 7, x = 0, y = 272, w = 776, h = 40},
		{id = "song-data", src = 12, x = 0, y = 343, w = 1369, h = 301},

		{id = "song_colon", src = 6, x = 362, y = 168, w = 14, h = 41},
		{id = "score_slash", src = 6, x = 282, y = 168, w = 22, h = 41},
		{id = "rate_dot", src = 6, x = 362, y = 196, w = 14, h = 12},
		{id = "bpm-dash", src = 6, x = 653, y = 212, w = 28, h = 52},
		{id = "bpm", src = 6, x = 505, y = 212, w = 141, h = 52},

  {id = "button_ir", src = 56, x = 0, y = 0, w = 80, h = 120, act = 210},
		{id = "button_autoplay", src = 56, x = 80, y = 0, w = 80, h = 120, act = 16},
  {id = "button_practice", src = 56, x = 155, y = 0, w = 90, h = 120, act = 315},
		{id = "button_conf1", src = 56, x = 328, y = 0, w = 90, h = 120, act = 13},
		-- button_conf2 は左端の余計な部分を避けるため、少し右から切り出す。
		{id = "button_conf2", src = 56, x = 423, y = 0, w = 82, h = 120, act = 14},

			{id = "zero_filler", src = 6, x = 0, y = 277, w = 128, h = 36},
			{id = "zero_filler2", src = 6, x = 96, y = 277, w = 64, h = 36},
			{id = "zero_filler3", src = 6, x = 32, y = 277, w = 96, h = 36},
			{id = "zero_filler4", src = 6, x = 96, y = 277, w = 32, h = 36},

		{id = "bar-song", src = 2, x = 0, y = 0, w = 1000, h = 80},
		{id = "bar-nograde", src = 2, x = 0, y = 160, w = 1000, h = 80},
		{id = "bar-grade", src = 2, x = 0, y = 80, w = 1000, h = 80},
		{id = "bar-nosong", src = 2, x = 0, y = 240, w = 1000, h = 80},
		{id = "bar-folder", src = 2, x = 0, y = 320, w = 1000, h = 80},
		{id = "bar-command", src = 2, x = 0, y = 480, w = 1000, h = 80},
		{id = "bar-table", src = 2, x = 0, y = 400, w = 1000, h = 80},
		{id = "bar-search", src = 2, x = 0, y = 560, w = 1000, h = 80},
		{id = "bar-select", src = 9, x = 0, y = 0, w = 1009, h = 98},

		{id = "trophy-bronze", src = 4, x = 320, y = 0, w = 32, h = 32},
		{id = "trophy-silver", src = 4, x = 352, y = 0, w = 32, h = 32},
		{id = "trophy-gold", src = 4, x = 384, y = 0, w = 32, h = 32},

		{id = "label-ln", src = 0, x = 496, y = 788, w = 44, h = 44},
		{id = "label-cn", src = 0, x = 496, y = 832, w = 44, h = 44},
		{id = "label-hcn", src = 0, x = 496, y = 876, w = 44, h = 44},
		{id = "label-random", src = 0, x = 496, y = 744, w = 44, h = 44},
		{id = "label-mine", src = 0, x = 496, y = 692, w = 51, h = 52},

		{id = "sortset", src = 11, x = 254, y = 0, w = 154, h = 384, divy = 8, len = 8, ref = 12, act = 12},

		-- 差し替えた sort.png は横幅が 619px のため、末尾の切り出しを 1px 詰める。
		{id = "lnmodeset", src = 11, x = 522, y = 0, w = 97, h = 144, divy = 3, len = 3, ref = 308, act = 308},

		{id = "state_clear", src = 5, x = 0, y = 0, w = 200, h = 341, divy = 11, len = 11, ref = 370},

		{id = "blank", src = 0, x = 8, y = 0, w = 8, h = 8},

		{id = "option-panel1", src = 51, x = 0, y = 0, w = 1300, h = 960},
		{id = "option-panel2", src = 53, x = 0, y = 0, w = 1020, h = 960},
		{id = "option-panel3", src = 52, x = 0, y = 0, w = 1020, h = 960},

		{id = "nonran", src = 0, x = 656, y = 0, w = 238, h = 40},
		{id = "mirror", src = 0, x = 656, y = 40, w = 238, h = 40},
		{id = "ran", src = 0, x = 656, y = 80, w = 238, h = 40},
		{id = "rran", src = 0, x = 656, y = 120, w = 238, h = 40},
		{id = "sran", src = 0, x = 656, y = 160, w = 238, h = 40},
		{id = "spiral", src = 0, x = 656, y = 200, w = 238, h = 40},
		{id = "hran", src = 0, x = 656, y = 240, w = 238, h = 40},
		{id = "ascr", src = 0, x = 656, y = 280, w = 238, h = 40},
		{id = "exran", src = 0, x = 656, y = 320, w = 238, h = 40},
		{id = "exsran", src = 0, x = 656, y = 360, w = 238, h = 40},

		{id = "no-hsf", src = 0, x = 1224, y = 0, w = 170, h = 40},
		{id = "start-hsf", src = 0, x = 1224, y = 40, w = 170, h = 40},
		{id = "max-hsf", src = 0, x = 1224, y = 80, w = 170, h = 40},
		{id = "main-hsf", src = 0, x = 1224, y = 120, w = 170, h = 40},
		{id = "min-hsf", src = 0, x = 1224, y = 160, w = 170, h = 40},

		{id = "no-dp", src = 0, x = 956, y = 0, w = 162, h = 40},
		{id = "dp-flip", src = 0, x = 956, y = 40, w = 162, h = 40},
		{id = "dpb", src = 0, x = 956, y = 80, w = 162, h = 40},
		{id = "dpb-as", src = 0, x = 956, y = 120, w = 162, h = 40},

		{id = "aeasy-gauge", src = 0, x = 1486, y = 0, w = 141, h = 40},
		{id = "easy-gauge", src = 0, x = 1486, y = 40, w = 141, h = 40},
		{id = "normal-gauge", src = 0, x = 1486, y = 80, w = 141, h = 40},
		{id = "hard-gauge", src = 0, x = 1486, y = 120, w = 141, h = 40},
		{id = "exh-gauge", src = 0, x = 1486, y = 160, w = 141, h = 40},
		{id = "hazard", src = 0, x = 1486, y = 200, w = 141, h = 40},

		{id = "mainbpm", src = 0, x = 130, y = 550, w = 62, h = 13},

		{id = "sidebar", src = 0, x = 0, y = 0, w = 110, h = 920},
		{id = "skinsel", src = 0, x = 120, y = 10, w = 90, h = 120, act = 14},
		-- keyconfig と skinconfig の境界を少し空けて、隣の文字が見切れないようにする。
		{id = "keyconfig", src = 0, x = 120, y = 140, w = 32, h = 120, act = 13},
		{id = "skinconfig", src = 0, x = 178, y = 140, w = 82, h = 120, act = 13},
		{id = "irlink", src = 0, x = 120, y = 270, w = 90, h = 120, act = 210},
		{id = "readme", src = 0, x = 120, y = 400, w = 90, h = 120, act = 17},
			{id = "player-info", src = 0, x = 120, y = 530, w = 90, h = 120, act = 17},
			{id = "volume", src = 0, x = 120, y = 660, w = 90, h = 120, act = 900},
			{id = "help", src = 0, x = 120, y = 790, w = 90, h = 120, act = 17},

		{id = "volumeslider_bg",	src = 40, x = 0, y = 0, w = 330, h = 500},

		{id = "scrollbar", src = 0, x = 456, y = 0, w = 40, h = 920},
  {id = "sideframe", src = 15, x = 1, y = 0, w = 733, h = 1018}
	}
		append_entries(skin.image, build_mode_key_images())
		append_entries(skin.image, build_key_count_images())
		append_entries(skin.image, build_lamp_image_entries("lamp", 0, 1))
		append_entries(skin.image, build_lamp_image_entries("player-lamp", 118, 118))
		append_entries(skin.image, build_lamp_image_entries("rival-lamp", 236, 118))
		append_entries(skin.image, build_rank_image_entries())
		append_entries(skin.image, build_constraint_image_entries())
		table.insert(skin.image, {id = "option-selector101", src = 59, x = 320, y = 375, w = 288, h = 760})
		add_option_selector_images(skin.image, "option-selector11", 10, 320, 375, -50)
		add_option_selector_images(skin.image, "option-selector11", 10, 320, 375, -50, "_2p")
		add_option_selector_images(skin.image, "option-selector12", 6, 320, 375, -50)
		add_option_selector_images(skin.image, "option-selector13", 5, 320, 375, -50)
		add_option_selector_images(skin.image, "option-selector14", 4, 320, 375, -50)
		add_option_selector_images(skin.image, "option-selector2", 2, 365, 293, -53)
		add_option_selector_images(skin.image, "option-selector3", 3, 320, 293, -50)
		add_option_selector_images(skin.image, "option-selector4", 5, 320, 293, -50)

		skin.slider = {
		{id = "scroll", src = 0, x = 500, y = 0, w = 32, h = 52, range = -876, type = 1},
		{id = "volumeslider_master",	src = 40, x = 468, y = 358,  w = 26,  h = 44, angle = 1, range = 200, type = 17},
		{id = "volumeslider_key",	src = 40, x = 468, y = 358,  w = 26,  h = 44, angle = 1, range = 190, type = 18},
		{id = "volumeslider_bgm",	src = 40, x = 468, y = 358, w = 26,   h = 44, angle = 1, range = 190, type = 19}
	}
	skin.imageset = {
		{id = "bar", images = {"bar-song","bar-folder","bar-table","bar-grade","bar-nograde","bar-command","bar-search","bar-nosong"}},
		{id = "modeset", ref = 11, images = {"allkeys","5keys","7keys","10keys","14keys","9keys","24keys","24keysDP"}, act = 11},

		{id = "note-mod", ref = 42, images = {"nonran","mirror","ran","rran","sran","spiral","hran","ascr","exran","exsran"}},
		{id = "note-mod2", ref = 43, images = {"nonran","mirror","ran","rran","sran","spiral","hran","ascr","exran","exsran"}},
		{id = "hsfix", ref = 55, images = {"no-hsf","start-hsf","max-hsf","main-hsf","min-hsf"}},
		{id = "dp", ref = 54, images = {"no-dp","dp-flip","dpb", "dpb-as"}},
		{id = "gaugemod", ref = 40, images = {"aeasy-gauge","easy-gauge","normal-gauge","hard-gauge","exh-gauge","hazard"}}
	}
	append_entries(skin.imageset, build_imageset_option_entries())

		skin.value = {
			{id = "maxbpm", src = 6, x = 0, y = 212, w = 440, h = 54, divx = 10, digit = 3, align = 1, ref = 90},
			{id = "minbpm", src = 6, x = 0, y = 212, w = 440, h = 54, divx = 10, digit = 3, align = 0, ref = 91},
			{id = "playlevel_bar", src = 6, x = 0, y = 0, w = 440, h = 54, divx = 10, align = 2, digit = 2},
			{id = "duration", src = 6, x = 0, y = 63, w = 320, h = 36, divx = 10, digit = 4, align = 0, ref = 313},
			{id = "duration-ms", src = 6, x = 0, y = 63, w = 320, h = 36, divx = 10, digit = 4, align = 0, ref = 312},
			{id = "judgetiming", src = 61, x = -3, y = 0, w = 275, h = 56, divx = 12, divy = 2, digit = 3, ref = 12},
			{id = "mainbpm-num", src = 6, x = 0, y = 212, w = 440, h = 54, divx = 10, align = 1, digit = 3, ref = 92},
		}
		append_entries(skin.value, build_score_value_entries())
		append_entries(skin.value, build_time_value_entries())
	skin.text = {
			{id = "dir", font = 3, size = 24, overflow = 1, align = 0, ref = 1000},
			{id = "artist", font = 3, size = 24, overflow = 1, align = 0, ref = 16},
			{id = "genre", font = 3, size = 24, overflow = 1, align = 0, ref = 13},
			{id = "subtitle", font = 3, size = 20, overflow = 1, align = 0, ref = 11},
			{id = "course1", font = 3, size = 36, overflow = 1, align = 0, ref = 150},
			{id = "course2", font = 3, size = 36, overflow = 1, align = 0, ref = 151},
			{id = "course3", font = 3, size = 36, overflow = 1, align = 0, ref = 152},
			{id = "course4", font = 3, size = 36, overflow = 1, align = 0, ref = 153},
	  
			{id = "bigtitle", font = 1, size = -72, overflow = 1, align = 0, ref = 10},

			{id = "bartext", font = 3, size = 24},
			{id = "search", font = 3, size = 24, ref = 30},
	}
	skin.graph = {
		{id = "graph-lamp", src = 14, x = 0, y = 330, w = 11, h = 30, divx = 11, divy = 2, cycle = 100, type = -1},

		{id = "graph_score_aaa", src = 7, x = 0, y = 0, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_aa", src = 7, x = 0, y = 34, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_a", src = 7, x = 0, y = 68, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_b", src = 7, x = 0, y = 735, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_c", src = 7, x = 0, y = 136, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_d", src = 7, x = 0, y = 170, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_e", src = 7, x = 0, y = 204, w = 776, h = 34, type = 111, angle = 0},
		{id = "graph_score_f", src = 7, x = 0, y = 238, w = 776, h = 34, type = 111, angle = 0}
	}

	local lamp_ids = {
		"lamp-noplay",
		"lamp-failed",
		"lamp-assist",
		"lamp-lassist",
		"lamp-easy",
		"lamp-normal",
		"lamp-hard",
		"lamp-exhard",
		"lamp-fc",
		"lamp-perfect",
		"lamp-max"
	}
	local player_lamp_ids = {
		"player-lamp-noplay",
		"player-lamp-failed",
		"player-lamp-assist",
		"player-lamp-lassist",
		"player-lamp-easy",
		"player-lamp-normal",
		"player-lamp-hard",
		"player-lamp-exhard",
		"player-lamp-fc",
		"player-lamp-perfect",
		"player-lamp-max"
	}
	local rival_lamp_ids = {
		"rival-lamp-noplay",
		"rival-lamp-failed",
		"rival-lamp-assist",
		"rival-lamp-lassist",
		"rival-lamp-easy",
		"rival-lamp-normal",
		"rival-lamp-hard",
		"rival-lamp-exhard",
		"rival-lamp-fc",
		"rival-lamp-perfect",
		"rival-lamp-max"
	}
	local trophy_ids = {"trophy-bronze", "trophy-silver", "trophy-gold"}
	local label_configs = {
		{id = "label-ln", x = -50, y = 21, w = 35, h = 35},
		{id = "label-random", x = -50, y = 21, w = 35, h = 35},
		{id = "label-mine", x = 880, y = 21, w = 35, h = 35},
		{id = "label-cn", x = -50, y = 21, w = 35, h = 35},
		{id = "label-hcn", x = -50, y = 21, w = 35, h = 35}
	}
	local level_colors = {
		{255, 20, 255},
		{140, 248, 110},
		{110, 216, 248},
		{244, 228, 40},
		{254, 12, 12},
		{215, 124, 232},
		{128, 128, 128}
	}
	local graph_entry = {id = "graph-lamp", dst = {{x = 44, y = 4, w = 916, h = 11}}}
	local notes_graph_entry = {{id = "notes-graph", type = 0}}
	local bpm_graph_entry = {{id = "bpmgraph"}}

	-- songlist はヘルパーで組み立て、配置仕様は既存値を維持する。
	skin.songlist = {
		id = "songlist",
		center = 7,
		clickable = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18},
		listoff = build_songlist_entries(false),
		liston = build_songlist_entries(true),
		text = build_bartext_entries(),
		level = build_level_entries(level_colors),
		lamp = build_lamp_entries(lamp_ids, -5, -7),
		playerlamp = build_lamp_entries(player_lamp_ids, 0, -7),
		rivallamp = build_lamp_entries(rival_lamp_ids, 0, -7),
		trophy = build_fixed_entries(trophy_ids, {x = 72, y = 12, w = 64, h = 64}),
		label = build_label_entries(label_configs),
		graph = graph_entry,
		judgegraph = notes_graph_entry,
		bpmgraph = bpm_graph_entry
	}

	skin.destination = {
		{id = "bg", dst = {
			{x = 0, y = 0, w = 2560, h = 1440}
		}},
		{id = "songs_font", op = {1}, dst = {
			{x = 1060, y = 1172, w = 292, h = 48}
		}},
		{id = "songs_count", op = {1}, dst = {
			{x = 1380, y = 1180, w = 32, h = 41}
		}},

		-- dir は表示枠を詰めて、引き伸ばしによるにじみを抑える。
		{id = "dir", dst = {{x = 200, y = 940, w = 1070, h = 24, r = 200, g = 200, b = 200}}},
		{id = "genre", filter = 1, dst = {{x = 200, y = 890, w = 600, h = 40}}},
		-- subtitle がある時だけ表示し、title 周りの重なりを防ぐ。
		{id = "subtitle", filter = 1, draw = has_subtitle_text, dst = {{x = 200, y = 855, w = 600, h = 24, r = 153, g = 229, b = 255}}},
		{id = "bigtitle", filter = 1, draw = has_subtitle_text, dst = {{x = 200, y = 772, w = 600, h = 118}}},
		{id = "bigtitle", filter = 1, draw = function()
			return not has_subtitle_text()
		end, dst = {{x = 200, y = 820, w = 600, h = 118}}},
		{id = "artist", filter = 1, draw = has_subtitle_text, dst = {{x = 200, y = 702, w = 600, h = 40}}},
		{id = "artist", filter = 1, draw = function()
			return not has_subtitle_text()
		end, dst = {{x = 200, y = 750, w = 600, h = 40}}},

		{id = "course1", dst = {{x = 200, y = 944, w = 1300, h = 48}}},
		{id = "course2", dst = {{x = 200, y = 888, w = 1300, h = 48}}},
		{id = "course3", dst = {{x = 200, y = 832, w = 1300, h = 48}}},
		{id = "course4", dst = {{x = 200, y = 776, w = 1300, h = 48}}},

		{id = "const-random", op = {1004}, dst = {{x = 200, y = 464, w = 400, h = 62}}},
		{id = "const-mirror", op = {1003}, dst = {{x = 200, y = 464, w = 400, h = 62}}},
		{id = "const-nospeed", op = {1005}, dst = {{x = 200, y = 404, w = 400, h = 62}}},
		{id = "const-nogood", op = {1006}, dst = {{x = 200, y = 336, w = 400, h = 62}}},
		{id = "const-nogreat", op = {1007}, dst = {{x = 200, y = 336, w = 400, h = 62}}},
		{id = "songlist"},

		{id = "bar-select", dst = {
			{time = 0, x = 1090, y = 670, w = 1009, h = 75, a = 255},
			{time = 700, a = 100},
			{time = 1400, a = 255}
		}},

		{id = "volumeslider_bg", op = {2,5}, dst = {
			-- volumeslider は旧 button_ir の位置へ移して、右側のボタン列と入れ替える。
			{x = 905, y = 835, w = 205, h = 235}
		}},
		{id = "scrollbar", dst = {
			{x = 1882, y =135, w = 40, h = 890}
		}},
		{id = "scroll", filter = 1, dst = {
			{x = 1886, y = 980, w = 32, h = 40, acc = 2}
		}},
		{id = "volumeslider_master", filter = 1, op = {2,5}, dst = {
			-- 3本のつまみは背景パネルの中に収まる位置へ揃える。
			{x = 911, y = 1015, w = 24, h = 30, acc = 2}
		}},
		{id = "volumeslider_key", filter = 1, op = {2,5}, dst = {
			{x = 911, y = 965, w = 24, h = 30, acc = 0}
		}},
		{id = "volumeslider_bgm", filter = 1, op = {2,5}, dst = {
			{x = 911, y = 910, w = 24, h = 30, acc = 2}
		}},

			{id = "volumemenu", dst = {
			{x = 0, y = 0, w = 1000, h = 1000,a = 50}
			}},





			-- {id = "song-data", op = {2, 5}, dst = {
			-- 	{x = 1130, y = 90, w = 1369, h = 301}
			-- }},
		{id = "search", dst = {
			{x = 1300, y = 1035, w = 700, h = 30}
		}},
		-- search-bar は元画像サイズで描画して、横方向のつぶれを防ぐ。
		{id = "search-bar", dst = {
			{x = 1290, y = 1020, w = 630, h = 60}
		}},
		{id = "total_value", op = {2,5}, dst = {
			{x = 200, y = 276, w = 32, h = 41}
		}},
		{id = "song_min", op = {2,5}, dst = {
			{x = 200, y = 220, w = 32, h = 41}
		}},
		{id = "7keysN", op = {160,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},
		{id = "14keysN", op = {162,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},
		{id = "9keysN", op = {164,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},
		{id = "5keysN", op = {161,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},
		{id = "10keysN", op = {163,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},
		{id = "24keysN", op = {1160,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},
		{id = "24keysDPN", op = {1161,5}, dst = {
			{x = 550, y = 550, w = 181, h = 50}
		}},


		{id = "judge_veryeasy", op = {184,5}, dst = {
			{x = 200, y = 555, w = 225, h = 40}
		}},
		{id = "judge_easy", op = {183,5}, dst = {
			{x = 200, y = 555,  w = 225, h = 40}
		}},
		{id = "judge_normal", op = {182,5}, dst = {
			{x = 200, y = 555, w = 225, h = 40}
		}},
		{id = "judge_hard", op = {181,5}, dst = {
			{x = 200, y = 555, w = 225, h = 40}
		}},
		{id = "judge_veryhard", op = {180,5}, dst = {
			{x = 200, y = 555, w = 225, h = 40}
		}},

		{id = "notes_count", op = {2}, dst = {
			{x = 200, y = 603, w = 32, h = 40}
		}},
  		{id = "Notes-text", op = {2}, dst = {
			{x = 350, y = 600, w = 181, h = 50}
		}},
		{id = "-100", filter = 2, stretch = 1, dst = {
			{x = 200, y = 110, w = 550, h = 408}
		}},
		{id = "stagefile", filter = 2, stretch = 1, op = {2,5,190}, dst = {
			{x = 200, y = 110, w = 550, h = 408}
		}},

		{id = "minbpm", dst = {
			{x = 375, y = 645, w = 44, h = 54}
		}},
		{id = "bpm-dash", op = {2}, dst = {
			{x = 510, y = 649, w = 28, h = 52}
		}},
		{id = "maxbpm", dst = {
			{x = 550, y = 645, w = 44, h = 54}
		}},
		{id = "bpm", op = {2}, dst = {
			{x = 200, y = 645, w = 141, h = 52}
		}},
		{id = "score-data", op = {-1, -1030}, dst = {
			{x = 770, y = 130, w = 500, h = 230,a = 200}
		}},
	

		{id = "state_clear", dst = {{x = 900, y = 400, w = 200, h = 31}}},

		{id = "rank_aaa", op = {2,200}, dst = {
			{x = 900, y = 450, w = 200, h = 100}
		}},
		{id = "rank_aa", op = {2,201}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},
		{id = "rank_a", op = {2,202}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},
		{id = "rank_b", op = {2,203}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},
		{id = "rank_c", op = {2,204}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},
		{id = "rank_d", op = {2,205}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},
		{id = "rank_e", op = {2,206}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},
		{id = "rank_f", op = {2,207}, dst = {
			{x = 950, y = 450, w = 200, h = 100}
		}},

		{id = "zero_filler", op = {2, 113}, dst = {
			{x = 968, y = 297, w = 152, h = 42}
		}},
		{id = "score_count", dst = {
			{x = 960, y = 300, w = 32, h = 36}
		}},
		{id = "score_slash", op = {2}, dst = {
			{x = 1090, y = 300, w = 22, h = 41}
		}},
		{id = "max_score", op = {2}, dst = {
			{x = 1125, y = 300, w = 32, h = 36}
		}},

		{id = "zero_filler", op = {2, 113}, dst = {
			{x = 1088, y = 147, w = 152, h = 42}
		}},
		{id = "combo_count", dst = {
			{x = 960, y = 250, w = 32, h = 36}
		}},
		{id = "score_slash", op = {2}, dst = {
			{x = 1090, y = 250, w = 22, h = 41}
		}},
		{id = "total_notes", op = {2}, dst = {
			{x = 1125, y = 250, w = 32, h = 36}
		}},

		{id = "zero_filler", op = {2, 113}, dst = {
			{x = 1288, y = 97, w = 152, h = 42}
		}},
		{id = "miss_count", dst = {
			{x = 1125, y = 200, w = 32, h = 36}
		}},

		{id = "play_count", dst = {
			{x = 1125, y = 150, w = 32, h = 36}
		}},

		-- ボタン群は縦横比を保ったまま同じ高さにそろえる。
		{id = "button_ir", op = {5, -1, -1030}, dst = {
			{x = 262, y = 930, w = 87, h = 130}
		}},
		{id = "button_autoplay", op = {5, -1, -1030}, dst = {
			{x = 367, y = 930, w = 87, h = 130}
		}},
		{id = "button_practice", op = {5, -1, -1030}, dst = {
			{x = 473, y = 930, w = 98, h = 130}
		}},
		{id = "button_conf1", op = {5, -1, -1030}, dst = {
			{x = 658, y = 930, w = 98, h = 130}
		}},
		{id = "button_conf2", op = {5, -1, -1030}, dst = {
			{x = 775, y = 930, w = 89, h = 130}
		}},
		{id = "button_replay", op = {1205, -1030}, dst = {
			{time = 0, x = 1000, y = 930, w = 70, h =100, a = 255},
			{time = 450, a = 0},
			{time = 900, a = 255}
		}},
		-- sideframe は元画像比率に近づけて、横方向のつぶれを防ぐ。
		{id = "sideframe", dst = {
			{x = 0, y = 100, w = 702, h = 975}
		}},

		{id = "notes-graph", op = {2,5}, dst = {
			{x = 910, y = 160, w = 700, h = 136}
		}},

		{id = "bpmgraph", op = {177,-1177,5}, dst = {
			{x = 910, y = 160, w = 700, h = 136}
		}},

		{id = "bpmgraph", op = {1177,5}, dst = {
			{x = 910, y = 160, w = 700, h = 136}
		}},

  		{id = "-110", dst = {{x = 1350, y = 0, w = 570, h = 140}}},
		{id = "sorttext", dst = {{x = 1360, y = 100, w = 544, h = 28}}},
		-- 上部の選択 UI は高さをそろえつつ、元画像比率に近づける。
		{id = "modeset", dst = {{x = 1360, y = 25, w = 169, h = 45}}},
		{id = "sortset", dst = {{x = 1585, y = 25, w = 144, h = 45}}},
		{id = "lnmodeset", dst = {{x = 1805, y = 25, w = 92, h = 45}}},

		-- 差し替えた logo.png の比率を保ったまま、上部 UI に収まるサイズで描画する。
		{id = "logo", dst = {{x = 0, y = 8, w = 300, h = 52}}},
		-- 下部の時刻表示は縦横比を寄せつつ、高さを少し増やして下端の見切れを防ぐ。
		{id = "time_year", dst = {{x = 550, y = 31, w = 18, h = 22}}},
		{id = "score_slash", filter = 1, dst = {{x = 620, y = 31, w = 12, h = 22}}},
		{id = "time_month", dst = {{x = 638, y = 31, w = 18, h = 22}}},
		{id = "score_slash", filter = 1, dst = {{x = 674, y = 31, w = 12, h = 22}}},
		{id = "time_day", dst = {{x = 692, y = 31, w = 18, h = 22}}},
  

		{id = "time_hour", dst = {{x = 752, y = 31, w = 18, h = 22}}},
		{id = "song_colon", dst = {{x = 788, y = 31, w = 8, h = 22}}},
		{id = "time_minute", dst = {{x = 802, y = 31, w = 18, h = 22}}},
		{id = "song_colon", dst = {{x = 838, y = 31, w = 8, h = 22}}},
		{id = "time_second", dst = {{x = 852, y = 31, w = 18, h = 22}}},
		 {id = "bottombar", dst = {{x = 905, y = 5, w = 1000, h = 50}}}
		}
		-- option-panel 背面に不透明の下地を敷いて、元画像の透けを抑える。
		add_fade_pair(skin.destination, {id = "blank", op = 21, timer_on = 21, timer_off = 31, base = {x = 310, y = 100, w = 1300, h = 960, r = 10, g = 10, b = 10}})
		add_fade_pair(skin.destination, {id = "option-panel1", op = 21, timer_on = 21, timer_off = 31, base = {x = 310, y = 100, w = 1300, h = 960}})
		add_fade_pair(skin.destination, {id = "option-pacemaker", op = 21, timer_on = 21, timer_off = 31, base = {x = 342, y = 0, w = 288, h = 760}})
		add_fade_pair(skin.destination, {id = "option-random", op = 21, timer_on = 21, timer_off = 31, base = {x = 605, y = 0, w = 288, h = 757}})
		add_fade_pair(skin.destination, {id = "option-gauge", op = 21, timer_on = 21, timer_off = 31, base = {x = 792, y = 0, w = 288, h = 760}})
		add_fade_pair(skin.destination, {id = "option-dp", op = 21, timer_on = 21, timer_off = 31, base = {x = 972, y = 0, w = 288, h = 760}})
		add_fade_pair(skin.destination, {id = "option-hsfix", op = 21, timer_on = 21, timer_off = 31, base = {x = 1157, y = 0, w = 288, h = 760}})
		add_fade_pair(skin.destination, {id = "option-random2", op = 21, timer_on = 21, timer_off = 31, base = {x = 1337, y = 0, w = 288, h = 760}})
		add_fade_pair(skin.destination, {id = "blank", op = 22, timer_on = 22, timer_off = 32, base = {x = 450, y = 100, w = 1020, h = 960, r = 10, g = 10, b = 10}})
		add_fade_pair(skin.destination, {id = "option-panel2", op = 22, timer_on = 22, timer_off = 32, base = {x = 450, y = 100, w = 1020, h = 960}})
		-- option-panel2 の中身は、見た目の中心に寄るように少し上へ補正する。
		add_fade_pair(skin.destination, {id = "option-exjudge", op = 22, timer_on = 22, timer_off = 32, base = {x = 517, y = -227, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "option-constant", op = 22, timer_on = 22, timer_off = 32, base = {x = 637, y = 290, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "option-judgearea", op = 22, timer_on = 22, timer_off = 32, base = {x = 757, y = -227, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "option-legacy", op = 22, timer_on = 22, timer_off = 32, base = {x = 877, y = 290, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "option-marknote", op = 22, timer_on = 22, timer_off = 32, base = {x = 997, y = -227, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "option-bpmguide", op = 22, timer_on = 22, timer_off = 32, base = {x = 1117, y = 290, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "option-nomine", op = 22, timer_on = 22, timer_off = 32, base = {x = 1237, y = -227, w = 280, h = 680}})
		add_fade_pair(skin.destination, {id = "blank", op = 23, timer_on = 23, timer_off = 33, base = {x = 450, y = 100, w = 1020, h = 960, r = 10, g = 10, b = 10}})
		add_fade_pair(skin.destination, {id = "option-panel3", op = 23, timer_on = 23, timer_off = 33, base = {x = 450, y = 100, w = 1020, h = 960}})
		-- option-panel3 の中身も、見た目の中心に寄るように少し上へ補正する。
		add_fade_pair(skin.destination, {id = "option-gas", op = 23, timer_on = 23, timer_off = 33, base = {x = 435, y = 295, w = 480, h = 760}})
		add_fade_pair(skin.destination, {id = "option-bga", op = 23, timer_on = 23, timer_off = 33, base = {x = 460, y = -322, w = 288, h = 760}})
		add_fade_pair(skin.destination, {id = "option-autoadjust", op = 23, timer_on = 23, timer_off = 33, base = {x = 790, y = -301, w = 260, h = 740}})
		-- 数字セルの縮尺をそろえて、duration/judgetiming のにじみを抑える。
		add_fade_pair(skin.destination, {id = "duration", op = 23, timer_on = 23, timer_off = 33, base = {x = 1075, y = 725, w = 24, h = 27, r = 20, g = 255, b = 20}})
		add_fade_pair(skin.destination, {id = "duration-ms", op = 23, timer_on = 23, timer_off = 33, base = {x = 950, y = 725, w = 24, h = 27}})
		add_fade_pair(skin.destination, {id = "judgetiming", op = 23, timer_on = 23, timer_off = 33, base = {x = 1195, y = 269, w = 23, h = 28}})

  
  local function createTarget()
   -- option-panel1 を中央へ寄せた分だけ、選択文字も同じ量だけ右へずらす。
   local X = 372
   local Y = 420
   for i = 204, 209 do
    table.insert(skin.text, { id = "option-selector" .. i, font = 3, size = 15, overflow = 1, ref = i })
    table.insert(skin.destination, { id = "option-selector" .. i,loop = 300, op = { 21 }, timer = 21, dst = {
     {time = 0, x = X + 28, y = Y - 7 + (i - 209 - 1) * 48, w = 150, h = 20, a = 0},
     {time = 300, a = 200 + 30*(i-210) }
    } })
    table.insert(skin.destination, { id = "option-selector" .. i, loop = 300,op = { -21 }, timer = 31, dst = {
     {time = 0, x = X + 28, y = Y - 7 + (i - 209 - 1) * 48, w = 150, h = 20 , a = 200 + 30*(i-210) },
     {time = 300, a = 0}
    } })
   end
   for i = 210, 214 do
    table.insert(skin.text, { id = "option-selector" .. i, font = 3, size = 15, overflow = 1, ref = i })
    table.insert(skin.destination, { id = "option-selector" .. i, loop = 300,op = { 21 }, timer = 21, dst = {
     {time = 0, x = X + 28, y = Y + 6 + (i - 210+ 1) * 48, w = 150, h = 20 , a = 0},
     {time = 300, a = 200 - 30*(i-210) }
    } })
    table.insert(skin.destination, { id = "option-selector" .. i, loop = 300,op = { -21 }, timer = 31, dst = {
     {time = 0, x = X + 28, y = Y + 6 + (i - 210+ 1) * 48, w = 150, h = 20 , a = 200 - 30*(i-210) },
     {time = 300, a = 0}
    } })
   end
   table.insert(skin.text, { id = "option-selector", font = 3, size = 15, overflow = 1, ref = 3 })
   table.insert(skin.destination, { id = "option-selector", loop = 300,op = { 21 }, timer = 21, dst = {
    {time = 0,x = X+ 28, y = Y, w = 150, h = 20, a = 0},
    {time=300, a = 255}
   } })
   table.insert(skin.destination, { id = "option-selector", loop = 300,op = { -21 }, timer = 31, dst = {
    {time = 0,x = X+ 28, y = Y, w = 150, h = 20, a = 255},
    {time=300, a = 0}
   } })
  end
  
  createTarget()

return skin
end

return {
    header = header,
    main = main
}
