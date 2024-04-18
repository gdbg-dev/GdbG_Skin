-- // Copyright GroundbreakinG

-- // Licensed under the Apache License, Version 2.0 (the License);
-- // you may not use this file except in compliance with the License.
-- // You may obtain a copy of the License at

-- //     http = //www.apache.org/licenses/LICENSE-2.0

-- // Unless required by applicable law or agreed to in writing, software
-- // distributed under the License is distributed on an AS IS BASIS,
-- // WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- // See the License for the specific language governing permissions and
-- // limitations under the License.
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

 local function main()
  -- ヘッダ情報コピー
  local skin = {}
  for k, v in pairs(header) do
      skin[k] = v
  end

	skin.source =  {
		{id = "0", path = "sys.png"},
		{id = "1", path = "background/*.png"},
		{id = "2", path = "songbar3.png"},
		{id = "3", path = "lamp.png"},
		{id = "4", path = "trophy.png"},
		{id = "5", path = "clear.png"},
		{id = "6", path = "numbers3.png"},
		{id = "7", path = "rankgraph.png"},
		{id = "8", path = "constraint.png"},
		{id = "9", path = "barselect.png"},
		{id = "10", path = "info.png"},
		{id = "11", path = "sort.png"},
		{id = "12", path = "songdata2.png"},
		{id = "13", path = "rank.png"},
		{id = "14", path = "lampbar.png"},
  {id = "15", path = "sidewire.png"},
  {id = "16", path = "rank3.png"},
		{id = "30", path = "stagefile/*.png"},
		{id = "40", path = "volume3.png"},
		{id = "51", path = "panel1.png"},
		{id = "52", path = "panel2.png"},
		{id = "53", path = "panel3.png"},
  {id = "54", path = "Group 19.png"},
  {id = "55", path = "Group 1.png"},
  {id = "56", path = "Group 18.png"},
  {id = "57", path = "judge.png"},
  {id = "58", path = "logo.png"},
  {id = "59", path = "selectframe.png"},
  {id = "60", path = "sorttext.png"},
  {id = "61", path = "timing.png"}
	}
	skin.font =  {
		{id = "0", path = "../fonts/RobotoMono-Medium.ttf"},
		{id = "1", path = "../fonts/bitmap/Title.fnt"},
		{id = "2", path = "../fonts/bitmap/Artist.fnt"},
  {id = "3", path = "../fonts/bitmap/LINEFONT.fnt",type = 1}
	}
	skin.image = {
		{id = "bg", src = 1, x = 0, y = 0, w = 1920, h = 1080},
		{id = "stagefile", src = 30, x = 0, y = 0, w = 1024, h = 760},
  {id = "search-bar", src = 55, x = 0, y = 0, w = 630, h = 60},
  {id = "logo", src = 58, x = 0, y = 0, w = 200, h = 31},
  {id = "sorttext", src = 60, x = 0, y = 0, w = 454, h = 23},

		{id = "songs_font", src = 12, x = 1078, y = 52, w = 292, h = 48},
		{id = "allkeys", src = 11, x = 0, y = 0, w = 180, h = 48},
		{id = "5keys", src = 11, x = 0, y = 48, w = 180, h = 48},
		{id = "7keys", src = 11, x = 0, y = 96, w = 180, h = 48},
		{id = "10keys", src = 11, x = 0, y = 144, w = 180, h = 48},
		{id = "14keys", src = 11, x = 0, y = 192, w = 180, h = 48},
		{id = "9keys", src = 11, x = 0, y = 240, w = 180, h = 48},
		{id = "24keys", src = 11, x = 0, y = 288, w = 180, h = 48},
		{id = "24keysDP", src = 11, x = 0, y = 336, w = 180, h = 48},

		{id = "5keysN", src = 12, x = 1380, y = 0, w = 181, h = 50},
		{id = "7keysN", src = 12, x = 1380, y = 50, w = 181, h = 50},
		{id = "10keysN", src = 12, x = 1380, y = 100, w = 181, h = 50},
		{id = "14keysN", src = 12, x = 1380, y = 150, w = 181, h = 50},
		{id = "9keysN", src = 12, x = 1380, y = 200, w = 181, h = 50},
		{id = "24keysN", src = 12, x = 1380, y = 250, w = 181, h = 50},
		{id = "24keysDPN", src = 12, x = 1380, y = 300, w = 181, h = 50},
  {id = "Notes-text", src = 12, x = 1380, y = 343, w = 181, h = 50},

		{id = "judge_veryeasy", src = 57, x = 0, y = 0, w = 135, h = 24, act = 19},
		{id = "judge_easy", src = 57, x = 0, y = 35, w = 135, h = 24, act = 19},
		{id = "judge_normal", src = 57, x = 0, y = 68, w = 135, h = 24, act = 19},
		{id = "judge_hard", src = 57, x = 0, y = 103,w = 135, h = 24, act = 19},
		{id = "judge_veryhard", src = 57, x = 0, y = 135, w = 135, h = 24, act = 19},

		{id = "music-select", src = 10, x = 0, y = 0, w = 1031, h = 114},
		{id = "navigation-guide", src = 10, x = 0, y = 127, w = 1031, h = 162},
		{id = "mods", src = 0, x = 0, y = 948, w = 2560, h = 80},

		{id = "nextrank-minus", src = "6", x = 418, y = 188, w = 18, h = 8},

		{id = "score-data", src = 54, x = 0, y = 0, w = 420, h = 180},
		{id = "rankgraph-border", src = 7, x = 0, y = 272, w = 776, h = 40},
		{id = "song-data", src = 12, x = 0, y = 343, w = 1369, h = 301},

  {id = "song_colon", src = "6", x = 362, y = 168, w = 14, h = 41},
		{id = "score_slash", src = "6", x = 282, y = 168, w = 22, h = 41},
		{id = "rate_dot", src = "6", x = 362, y = 196, w = 14, h = 12},
		{id = "bpm-dash", src = "6", x = 653, y = 212, w = 28, h = 52},
		{id = "bpm", src = "6", x = 505, y = 212, w = 141, h = 52},

		{id = "rank_aaa", src = 16, x = 0, y = 0, w = 400, h = 165},
		{id = "rank_aa", src = 16, x = 0, y = 170, w = 400, h = 165},
		{id = "rank_a", src = 16, x = 0, y = 335, w = 400, h = 165},
		{id = "rank_b", src = 16, x = 0, y = 505, w = 400, h = 165},
		{id = "rank_c", src = 16, x = 0, y = 675, w = 400, h = 165},
		{id = "rank_d", src = 16, x = 0, y = 840, w = 400, h = 165},
		{id = "rank_e", src = 16, x = 0, y = 1010, w = 400, h = 165},
		{id = "rank_f", src = 16, x = 0, y = 1175, w = 400, h = 165},
		{id = "rank_max", src = 16, x = 0, y = 384, w = 400, h = 165},

  {id = "button_ir", src = 56, x = 0, y = 0, w = 80, h = 120, act = 210},
		{id = "button_autoplay", src = 56, x = 80, y = 0, w = 80, h = 120, act = 16},
  {id = "button_practice", src = 56, x = 155, y = 0, w = 90, h = 120, act = 315},
  {id = "button_conf1", src = 56, x = 328, y = 0, w = 90, h = 120, act = 13},
  {id = "button_conf2", src = 56, x = 415, y = 0, w = 90, h = 120, act = 14},

		{id = "zero_filler", src = "6", x = 0, y = 277, w = 128, h = 36},
		{id = "zero_filler2", src = "6", x = 96, y = 277, w = 64, h = 36},
		{id = "zero_filler3", src = "6", x = 32, y = 277, w = 96, h = 36},
		{id = "zero_filler4", src = "6", x = 96, y = 277, w = 32, h = 36},

		{id = "bar-song", src = 2, x = 0, y = 0, w = 1000, h = 80},
		{id = "bar-nograde", src = 2, x = 0, y = 160, w = 1000, h = 80},
		{id = "bar-grade", src = 2, x = 0, y = 80, w = 1000, h = 80},
		{id = "bar-nosong", src = 2, x = 0, y = 240, w = 1000, h = 80},
		{id = "bar-folder", src = 2, x = 0, y = 320, w = 1000, h = 80},
		{id = "bar-command", src = 2, x = 0, y = 480, w = 1000, h = 80},
		{id = "bar-table", src = 2, x = 0, y = 400, w = 1000, h = 80},
		{id = "bar-search", src = 2, x = 0, y = 560, w = 1000, h = 80},
		{id = "bar-select", src = 9, x = 0, y = 0, w = 1009, h = 98},

		{id = "lamp-noplay", src = 3, x = 0, y = 920, w = 118, h = 92, divx = 2},
		{id = "lamp-failed", src = 3, x = 0, y = 0, w = 1, h = 92, divx = 2, cycle = 33},
		{id = "lamp-assist", src = 3, x = 0, y = 92, w = 118, h = 92, divx = 2},
		{id = "lamp-lassist", src = 3, x = 0, y = 184, w = 118, h = 92, divx = 2},
		{id = "lamp-easy", src = 3, x = 0, y = 276, w = 118, h = 92, divx = 2},
		{id = "lamp-normal", src = 3, x = 0, y = 368, w = 118, h = 92, divx = 2},
		{id = "lamp-hard", src = 3, x = 0, y = 460, w = 118, h = 92, divx = 2},
		{id = "lamp-exhard", src = 3, x = 0, y = 552, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "lamp-fc", src = 3, x = 0, y = 644, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "lamp-perfect", src = 3, x = 0, y = 736, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "lamp-max", src = 3, x = 0, y = 828, w = 118, h = 92, divx = 2, cycle = 133},

		{id = "player-lamp-noplay", src = 3, x = 118, y = 920, w = 118, h = 92, divx = 2},
		{id = "player-lamp-failed", src = 3, x = 118, y = 0, w = 118, h = 92, divx = 2, cycle = 33},
		{id = "player-lamp-assist", src = 3, x = 118, y = 92, w = 118, h = 92, divx = 2},
		{id = "player-lamp-lassist", src = 3, x = 118, y = 184, w = 118, h = 92, divx = 2},
		{id = "player-lamp-easy", src = 3, x = 118, y = 276, w = 118, h = 92, divx = 2},
		{id = "player-lamp-normal", src = 3, x = 118, y = 368, w = 118, h = 92, divx = 2},
		{id = "player-lamp-hard", src = 3, x = 118, y = 460, w = 118, h = 92, divx = 2},
		{id = "player-lamp-exhard", src = 3, x = 118, y = 552, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "player-lamp-fc", src = 3, x = 118, y = 644, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "player-lamp-perfect", src = 3, x = 118, y = 736, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "player-lamp-max", src = 3, x = 118, y = 828, w = 118, h = 92, divx = 2, cycle = 133},

		{id = "rival-lamp-noplay", src = 3, x = 236, y = 920, w = 118, h = 92, divx = 2},
		{id = "rival-lamp-failed", src = 3, x = 236, y = 0, w = 118, h = 92, divx = 2, cycle = 33},
		{id = "rival-lamp-assist", src = 3, x = 236, y = 92, w = 118, h = 92, divx = 2},
		{id = "rival-lamp-lassist", src = 3, x = 236, y = 184, w = 118, h = 92, divx = 2},
		{id = "rival-lamp-easy", src = 3, x = 236, y = 276, w = 118, h = 92, divx = 2},
		{id = "rival-lamp-normal", src = 3, x = 236, y = 368, w = 118, h = 92, divx = 2},
		{id = "rival-lamp-hard", src = 3, x = 236, y = 460, w = 118, h = 92, divx = 2},
		{id = "rival-lamp-exhard", src = 3, x = 236, y = 552, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "rival-lamp-fc", src = 3, x = 236, y = 644, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "rival-lamp-perfect", src = 3, x = 236, y = 736, w = 118, h = 92, divx = 2, cycle = 133},
		{id = "rival-lamp-max", src = 3, x = 236, y = 828, w = 118, h = 92, divx = 2, cycle = 133},

		{id = "trophy-bronze", src = 4, x = 320, y = 0, w = 32, h = 32},
		{id = "trophy-silver", src = 4, x = 352, y = 0, w = 32, h = 32},
		{id = "trophy-gold", src = 4, x = 384, y = 0, w = 32, h = 32},

		{id = "label-ln", src = 0, x = 496, y = 788, w = 44, h = 44},
		{id = "label-cn", src = 0, x = 496, y = 832, w = 44, h = 44},
		{id = "label-hcn", src = 0, x = 496, y = 876, w = 44, h = 44},
		{id = "label-random", src = 0, x = 496, y = 744, w = 44, h = 44},
		{id = "label-mine", src = 0, x = 496, y = 692, w = 51, h = 52},

		{id = "sortset", src = 11, x = 254, y = 0, w = 154, h = 384, divy = 8, len = 8, ref = 12, act = 12},

		{id = "lnmodeset", src = 11, x = 522, y = 0, w = 98, h = 144, divy = 3, len = 3, ref = 308, act = 308},

		{id = "state_clear", src = 5, x = 0, y = 0, w = 200, h = 341, divy = 11, len = 11, ref = 370},

		{id = "blank", src = 0, x = 8, y = 0, w = 8, h = 8},

		{id = "option-panel1", src = 51, x = 0, y = 0, w = 1300, h = 960},
		{id = "option-panel2", src = 53, x = 0, y = 0, w = 1020, h = 960},
		{id = "option-panel3", src = 52, x = 0, y = 0, w = 1020, h = 960},

		
		{id = "option-selector101", src = 59, x = 320, y = 375, w = 288, h = 760},

		{id = "option-selector111", src = 59, x = 320, y = 375, w = 288, h = 760},
		{id = "option-selector112", src = 59, x = 320, y = 325, w = 288, h = 760},
		{id = "option-selector113", src = 59, x = 320, y = 275, w = 288, h = 760},
		{id = "option-selector114", src = 59, x = 320, y = 225, w = 288, h = 760},
		{id = "option-selector115", src = 59, x = 320, y = 175, w = 288, h = 760},
		{id = "option-selector116", src = 59, x = 320, y = 125, w = 288, h = 760},
		{id = "option-selector117", src = 59, x = 320, y = 75, w = 288, h = 760},
  {id = "option-selector118", src = 59, x = 320, y = 25, w = 288, h = 760},
		{id = "option-selector119", src = 59, x = 320, y = -25, w = 288, h = 760},
		{id = "option-selector1110",src = 59, x = 320, y = -75, w = 288, h = 760},

		{id = "option-selector111_2p", src = 59, x = 320, y = 375, w = 288, h = 760},
		{id = "option-selector112_2p", src = 59, x = 320, y = 325, w = 288, h = 760},
		{id = "option-selector113_2p", src = 59, x = 320, y = 275, w = 288, h = 760},
		{id = "option-selector114_2p", src = 59, x = 320, y = 225, w = 288, h = 760},
		{id = "option-selector115_2p", src = 59, x = 320, y = 175, w = 288, h = 760},
		{id = "option-selector116_2p", src = 59, x = 320, y = 125, w = 288, h = 760},
		{id = "option-selector117_2p", src = 59, x = 320, y = 75, w = 288, h = 760},
  {id = "option-selector118_2p", src = 59, x = 320, y = 25, w = 288, h = 760},
		{id = "option-selector119_2p", src = 59, x = 320, y = -25, w = 288, h = 760},
		{id = "option-selector1110_2p",src = 59, x = 320, y = -75, w = 288, h = 760},

		{id = "option-selector121", src = 59,x = 320, y = 375, w = 288, h = 760},
		{id = "option-selector122", src = 59, x = 320, y = 325, w = 288, h = 760},
		{id = "option-selector123", src = 59, x = 320, y = 275,w = 288, h = 760},
		{id = "option-selector124", src = 59, x = 320, y = 225, w = 288, h = 760},
		{id = "option-selector125", src = 59, x = 320, y = 175, w = 288, h = 760},
		{id = "option-selector126", src = 59, x = 320, y = 125, w = 288, h = 760},


		{id = "option-selector131", src = 59,x = 320, y = 375, w = 288, h = 760},
		{id = "option-selector132", src = 59, x = 320, y = 325, w = 288, h = 760},
		{id = "option-selector133", src = 59, x = 320, y = 275,w = 288, h = 760},
		{id = "option-selector134", src = 59, x = 320, y = 225, w = 288, h = 760},
		{id = "option-selector135", src = 59, x = 320, y = 175, w = 288, h = 760},


	
		{id = "option-selector141", src = 59,x = 320, y = 375, w = 288, h = 760},
		{id = "option-selector142", src = 59, x = 320, y = 325, w = 288, h = 760},
		{id = "option-selector143", src = 59, x = 320, y = 275,w = 288, h = 760},
		{id = "option-selector144", src = 59, x = 320, y = 225, w = 288, h = 760},

		
		{id = "option-selector21", src = 59, x = 365, y = 293, w = 288, h = 760},
		{id = "option-selector22", src = 59, x = 365, y = 240, w = 288, h = 760},


		{id = "option-selector31", src = 59, x = 320, y = 293, w = 288, h = 760},
		{id = "option-selector32", src = 59, x = 320, y = 243, w = 288, h = 760},
		{id = "option-selector33", src = 59, x = 320, y = 193, w = 288, h = 760},

		{id = "option-selector41", src = 59, x = 320, y = 293, w = 288, h = 760},
		{id = "option-selector42", src = 59, x = 320, y = 243, w = 288, h = 760},
		{id = "option-selector43", src = 59, x = 320, y = 193, w = 288, h = 760},
		{id = "option-selector44", src = 59, x = 320, y = 143, w = 288, h = 760},
		{id = "option-selector45", src = 59, x = 320, y = 93, w = 288, h = 760},

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

		{id = "const-random", src = 8, x = 0, y = 0, w = 400, h = 62},
		{id = "const-mirror", src = 8, x = 0, y = 62, w = 400, h = 62},
		{id = "const-nospeed", src = 8, x = 0, y = 124, w = 400, h = 62},
		{id = "const-nogood", src = 8, x = 0, y = 186, w = 400, h = 62},
		{id = "const-nogreat", src = 8, x = 0, y = 248, w = 400, h = 62},

		{id = "mainbpm", src = 0, x = 130, y = 550, w = 62, h = 13},

		{id = "sidebar", src = 0, x = 0, y = 0, w = 110, h = 920},
		{id = "skinsel", src = 0, x = 120, y = 10, w = 90, h = 120, act = 14},
		{id = "keyconfig", src = 0, x = 120, y = 140, w = 90, h = 120, act = 13},
  {id = "skinconfig", src = 0, x = 160, y = 140, w = 90, h = 120, act = 13},
		{id = "irlink", src = 0, x = 120, y = 270, w = 90, h = 120, act = 210},
		{id = "readme", src = 0, x = 120, y = 400, w = 90, h = 120, act = 17},
		{id = "player-info", src = 0, x = 120, y = 530, w = 90, h = 120, act = 17},		{id = "volume", src = 0, x = 120, y = 660, w = 90, h = 120, act = 900},{id = "help", src = 0, x = 120, y = 790, w = 90, h = 120, act = 17},

		{id = "volumeslider_bg",	src = 40, x = 0, y = 0, w = 330, h = 500},

		{id = "scrollbar", src = 0, x = 456, y = 0, w = 40, h = 920},
  {id = "sideframe", src = 15, x = 1, y = 0, w = 733, h = 1018}
	}
	skin.slider = {
		{id = "scroll", src = 0, x = 500, y = 0, w = 32, h = 52, range = -876, type = 1},
		{id = "volumeslider_master",	src = 40, x = 468, y = 358,  w = 26,  h = 44, angle = 1, range = 280, type = 17},
		{id = "volumeslider_key",	src = 40, x = 468, y = 358,  w = 26,  h = 44, angle = 1, range = 280, type = 18},
		{id = "volumeslider_bgm",	src = 40, x = 468, y = 358, w = 26,   h = 44, angle = 1, range = 280, type = 19}
	}
	skin.imageset = {
		{id = "bar", images = {"bar-song","bar-folder","bar-table","bar-grade","bar-nograde","bar-command","bar-search","bar-nosong"}},
		{id = "modeset", ref = 11, images = {"allkeys","5keys","7keys","10keys","14keys","9keys","24keys","24keysDP"}, act = 11},


		{id = "option-exjudge", ref = 301, images = {"option-selector21","option-selector22"}},
		{id = "option-constant", ref = 302, images = {"option-selector21","option-selector22"}},
		{id = "option-judgearea", ref = 303, images = {"option-selector21","option-selector22"}},
		{id = "option-legacy", ref = 304, images = {"option-selector21","option-selector22"}},
		{id = "option-marknote", ref = 305, images = {"option-selector21","option-selector22"}},
		{id = "option-bpmguide", ref = 306, images = {"option-selector21","option-selector22"}},
		{id = "option-nomine", ref = 307, images = {"option-selector21","option-selector22"}},

		{id = "option-random", ref = 42, images = {"option-selector111","option-selector112","option-selector113",
		"option-selector114","option-selector115","option-selector116","option-selector117","option-selector118",
		"option-selector119","option-selector1110"}},
		{id = "option-gauge", ref = 40, images = {"option-selector121","option-selector122","option-selector123",
			"option-selector124","option-selector125","option-selector126"}},
		{id = "option-hsfix", ref = 55, images = {"option-selector131","option-selector132","option-selector133",
			"option-selector134","option-selector135"}},
		{id = "option-random2", ref = 43, images = {"option-selector111_2p","option-selector112_2p","option-selector113_2p",
		"option-selector114_2p","option-selector115_2p","option-selector116_2p","option-selector117_2p","option-selector118_2p",
		"option-selector119_2p","option-selector1110_2p"}},
		{id = "option-dp", ref = 54, images = {"option-selector141","option-selector142","option-selector143", "option-selector144"}},


		{id = "option-bga", ref = 72, images = {"option-selector31","option-selector32","option-selector33"}},
		{id = "option-gas", ref = 78, images = {"option-selector41","option-selector42","option-selector43","option-selector44","option-selector45"}},
		{id = "option-autoadjust", ref = 75, images = {"option-selector21","option-selector22"}},

		{id = "note-mod", ref = 42, images = {"nonran","mirror","ran","rran","sran","spiral","hran","ascr","exran","exsran"}},
		{id = "note-mod2", ref = 43, images = {"nonran","mirror","ran","rran","sran","spiral","hran","ascr","exran","exsran"}},
		{id = "hsfix", ref = 55, images = {"no-hsf","start-hsf","max-hsf","main-hsf","min-hsf"}},
		{id = "dp", ref = 54, images = {"no-dp","dp-flip","dpb", "dpb-as"}},
		{id = "gaugemod", ref = 40, images = {"aeasy-gauge","easy-gauge","normal-gauge","hard-gauge","exh-gauge","hazard"}}
	}

	skin.value = {
		{id = "maxbpm", src = "6", x = 0, y = 212, w = 440, h = 54, divx = 10, digit = 3, align = 1, ref = 90},
		{id = "minbpm", src = "6", x = 0, y = 212, w = 440, h = 54, divx = 10, digit = 3, align = 0, ref = 91},

  {id = "score_count", src = "6", x = 0, y = 63, w = 352, h = 36, divx = 11, digit = 4, ref = 171},
		{id = "max_score", src = "6", x = 0, y = 63, w = 352, h = 36, divx = 11, digit = 4, ref = 72},
		{id = "total_notes", src = "6", x = 0, y = 63, w = 353, h = 36, divx = 11, digit = 4, ref = 74},
		{id = "miss_count", src = "6", x = 0, y = 63, w = 352, h = 36, divx = 11, digit = 4, ref = 76},
		{id = "combo_count", src = "6", x = 0, y = 63, w = 352, h = 36, divx = 11, digit = 4, ref = 75},
		{id = "clear_count", src = "6", x = 0, y = 63, w = 320, h = 36, divx = 10, digit = 4, ref = 78},
		{id = "nextrank", src = "6", x = 0, y = 63, w = 352, h = 36, align = 1, divx = 11, digit = 4, ref = 154},
		{id = "play_count", src = "6", x = 0, y = 63, w = 320, h = 36, align = 1, divx = 10, digit = 6, ref = 77},

		{id = "notes_count", src = "6", x = 0, y = 63, w = 352, h = 36, divx = 11, digit = 4, ref = 74},

		{id = "playlevel_bar", src = "6", x = 0, y = 0, w = 440, h = 54, divx = 10, align = 2, digit = 2},

		{id = "time_year", src = "6", x = 360, y = 118, w = 356, h = 41, divx = 11, digit = 4, ref = 21},
		{id = "time_month", src = "6", x = 360, y = 118, w = 353, h = 41, divx = 11, digit = 2, padding = 1, ref = 22},
		{id = "time_day", src = "6", x = 360, y = 118, w = 353, h = 41, divx = 11, digit = 2, padding = 1, ref = 23},
		{id = "time_hour", src = "6", x = 360, y = 118, w = 353, h = 41, divx = 11, digit = 2, padding = 1, ref = 24},
		{id = "time_minute", src = "6", x = 360, y = 118, w = 353, h = 41, divx = 11, digit = 2, padding = 1, ref = 25},
		{id = "time_second", src = "6", x = 360, y = 118, w = 353, h = 41, divx = 11, digit = 2, padding = 1, ref = 26},

		{id = "duration", src = "6", x = 0, y = 63, w = 320, h = 36, divx = 10, digit = 4, align = 0, ref = 313},
		{id = "duration-ms", src = "6", x = 0, y = 63, w = 320, h = 36, divx = 10, digit = 4, align = 0, ref = 312},
		{id = "judgetiming", src = 61, x = -3, y = 0, w = 275, h = 56, divx = 12, divy = 2, digit = 3, ref = 12},

		{id = "mainbpm-num", src = "6", x = 0, y = 212, w = 440, h = 54, divx = 10, align = 1, digit = 3, ref = 92}
	}
	skin.text = {
		{id = "dir", font = "3", size = 24, overflow = 1, align = 0, ref = 1000},
		{id = "artist", font = "3", size = 24, overflow = 1, align = 0, ref = 16},
		{id = "genre", font = "3", size = 36, overflow = 1, align = 0, ref = 13},
		{id = "subtitle", font = "3", size = 32, overflow = 1, align = 0, ref = 11},
		{id = "course1", font = "3", size = 36, overflow = 1, align = 0, ref = 150},
		{id = "course2", font = "3", size = 36, overflow = 1, align = 0, ref = 151},
		{id = "course3", font = "3", size = 36, overflow = 1, align = 0, ref = 152},
		{id = "course4", font = "3", size = 36, overflow = 1, align = 0, ref = 153},
  
		{id = "bigtitle", font = "1", size = -72, overflow = 1, align = 0, ref = 10},

		{id = "bartext", font = "3", size = 36},
		{id = "search", font = "3", size = 24, ref = 30}
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
  skin.songlist = {
		id = "songlist",
		center = 7,
		clickable = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18},
		listoff = {
   {id = "bar", dst = {
    {x = 1336, y = 1100, w = 900, h = 60,a = 50}
    }},
			{id = "bar", dst = {
			{x = 1336, y = 1040, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 980, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 920, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 860, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 800, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 740, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1200, y = 680, w = 900, h = 60}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 620, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 560, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 500, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 440, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 380, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 320, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 260, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 200, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 140, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 80, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = 20, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = -40, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = -100, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = -160, w = 900, h = 60,a = 50}
			}},
			{id = "bar", dst = {
			{x = 1336, y = -220, w = 900, h = 60,a = 50}
			}}
		},
		liston = {
   {id = "bar", dst = {
    {x = 1336, y = 1100, w = 900, h = 60}
    }},
			{id = "bar", dst = {
    {x = 1336, y = 1040, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 980, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 920, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 860, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 800, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 740, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1100, y = 680, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 620, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 560, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 500, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 440, w = 1000, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 380, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 320, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 260, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 200, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 140, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 80, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = 20, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = -40, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = -100, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = -160, w = 900, h = 60}
    }},
    {id = "bar", dst = {
    {x = 1336, y = -220, w = 900, h = 60}
    }}
		},
		text = {
			{id = "bartext", filter = 1, dst = {
				{x = 150, y = 0, w = 36, h = 48, b = 0}
			}},
   {id = "bartext", filter = 1, dst = {
				{x = 150, y = 0, w = 36, h = 48}
			}}
		},
		level = {
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 255, g = 20, b = 255}
			}},
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 140, g = 248, b = 110}
			}},
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 110, g = 216, b = 248}
			}},
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 244, g = 228, b = 40}
			}},
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 254, g = 12, b = 12}
			}},
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 215, g = 124, b = 232}
			}},
			{id = "playlevel_bar", dst = {
				{x = 30, y = 10, w = 30, h = 40, r = 128, g = 128, b = 128}
			}}
		},
		lamp = {
			{id = "lamp-noplay", dst = {
				{x = -5, y = -7, w = 49, h = 70}
			}},
			{id = "lamp-failed", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-assist", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-lassist", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-easy", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-normal", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-hard", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-exhard", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-fc", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-perfect", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}},
			{id = "lamp-max", dst = {
				{x = -5, y = -7, w = 49,  h = 70}
			}}
		},
		playerlamp = {
			{id = "player-lamp-noplay", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-failed", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-assist", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-lassist", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-easy", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-normal", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-hard", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-exhard", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-fc", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-perfect", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "player-lamp-max", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}}
		},
		rivallamp = {
			{id = "rival-lamp-noplay", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-failed", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-assist", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-lassist", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-easy", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-normal", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-hard", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-exhard", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-fc", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-perfect", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}},
			{id = "rival-lamp-max", dst = {
				{x = 0, y = -7, w = 49,  h = 70}
			}}
		},
	 trophy = {
			{id = "trophy-bronze", dst = {
				{x = 72, y = 12, w = 64, h = 64}
			}},
			{id = "trophy-silver", dst = {
				{x = 72, y = 12, w = 64, h = 64}
			}},
			{id = "trophy-gold", dst = {
				{x = 72, y = 12, w = 64, h = 64}
			}}
		},
		label = {
			{id = "label-ln", dst = {
				{x = -50, y = 21, w = 35, h = 35}
			}},
			{id = "label-random", dst = {
				{x = -50, y = 21, w = 35, h = 35}
			}},
			{id = "label-mine", dst = {
				{x = 880, y = 21, w = 35, h = 35}
			}},
			{id = "label-cn", dst = {
				{x = -50, y = 21, w = 35, h = 35}
			}},
			{id = "label-hcn", dst = {
				{x = -50, y = 21, w = 35, h = 35}
			}}
		},
		graph =  {id = "graph-lamp", dst = {
				{x = 44, y = 4, w = 916, h = 11}
			}},

	judgegraph =  {
		{id = "notes-graph", type  =  0}
	},
	bpmgraph =  {
		{id = "bpmgraph"}
	}}

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

		{id = "dir", dst = {{x = 200, y = 910, w = 1070, h = 48, r = 200, g = 200, b = 200}}},
		{id = "genre", filter = 1, dst = {{x = 200, y = 890, w = 600, h = 40}}},
		{id = "subtitle", filter = 1, dst = {{x = 200, y = 855, w = 600, h = 40, r = 153, g = 229, b = 255}}},
		{id = "bigtitle", filter = 1, dst = {{x = 200, y = 800, w = 600, h = 118}}},
		{id = "artist", filter = 1, dst = {{x = 200, y =730, w = 600, h = 40}}},

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

		{id = "volumeslider_bg,op = {2,5}", dst = {
			{x = 1300, y = 775, w = 300, h = 350}
		}},
		{id = "scrollbar", dst = {
			{x = 1882, y =135, w = 40, h = 890}
		}},
		{id = "scroll", filter = 1, dst = {
			{x = 1886, y = 980, w = 32, h = 40, acc = 2}
		}},
		{id = "volumeslider_master", filter = 1, op = {2,5}, dst = {
			{x = 320, y = 1350, w = 32,  h = 40, acc = 2}
		}},
		{id = "volumeslider_key,filter = 1", op = {2,5}, dst = {
			{x = 320, y = 1270, w = 32,  h = 40, acc = 0}
		}},
		{id = "volumeslider_bgm", filter = 1, op = {2,5}, dst = {
			{x = 320, y = 1190,w = 32,  h = 40, acc = 2}
		}},

			{id = "volumemenu", dst = {
			{x = 0, y = 0, w = 1000, h = 1000,a = 50}
			}},





		-- // {id = "song-data", op = {2,5}, dst = {
		-- // 	{x = 1130, y = 90, w = 1369, h = 301}
		-- // }},
  {id = "search", dst = {
			{x = 1358, y = 1030, w = 700, h = 30}
		}},
		{id = "search-bar", dst = {
			{x = 1350, y = 1020, w = 570, h = 60}
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
			{x = 200, y = 555, w = 300, h = 50}
		}},
		{id = "judge_easy", op = {183,5}, dst = {
			{x = 200, y = 555,  w = 300, h = 50}
		}},
		{id = "judge_normal", op = {182,5}, dst = {
			{x = 200, y = 555, w = 300, h = 50}
		}},
		{id = "judge_hard", op = {181,5}, dst = {
			{x = 200, y = 555, w = 300, h = 50}
		}},
		{id = "judge_veryhard", op = {180,5}, dst = {
			{x = 200, y = 555, w = 300, h = 50}
		}},

		{id = "notes_count", op = {2}, dst = {
			{x = 200, y = 610, w = 32, h = 36}
		}},
  {id = "Notes-text", op = {2}, dst = {
			{x = 350, y = 600, w = 181, h = 50}
		}},
		{id = "-100", filter = 2, stretch = 1, dst = {
			{x = 200, y = 50, w = 550, h = 550}
		}},
		{id = "stagefile", filter = 2, stretch = 1, op = {2,5,190}, dst = {
			{x = 200, y = 110, w = 680, h = 550}
		}},

		{id = "minbpm", dst = {
			{x = 375, y = 645, w = 44, h = 54}
		}},
		{id = "bpm-dash", op = {2}, dst = {
			{x = 510, y = 655, w = 28, h = 52}
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
			{x = 980, y = 300, w = 128, h = 36}
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
			{x = 1100, y = 150, w = 128, h = 36}
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
			{x = 1300, y = 100, w = 128, h = 36}
		}},
		{id = "miss_count", dst = {
			{x = 1125, y = 200, w = 32, h = 36}
		}},

		{id = "play_count", dst = {
			{x = 1125, y = 150, w = 32, h = 36}
		}},

  {id = "button_ir", op = {5, -1, -1030}, dst = {
			{x = 700, y = 915, w = 110, h = 150}
		}},
		{id = "button_autoplay", op = {5, -1, -1030}, dst = {
			{x = 800, y = 915, w = 110, h = 150}
		}},
  {id = "button_practice", op = {5, -1, -1030}, dst = {
			{x = 900, y = 915, w = 110, h = 150}
		}},
  {id = "button_conf1", op = {5, -1, -1030}, dst = {
			{x = 1000, y = 915, w = 120, h = 150}
		}},
  {id = "button_conf2", op = {5, -1, -1030}, dst = {
			{x = 1100, y = 915, w = 120, h = 150}
		}},
		{id = "button_replay", op = {1205, -1030}, dst = {
			{time = 0, x = 1000, y = 915, w = 70, h =100, a = 255},
			{time = 450, a = 0},
			{time = 900, a = 255}
		}},
  {id = "sideframe", dst = {
			{x = 15, y = 100, w = 500, h = 975}
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
  {id = "sorttext", dst = {{x = 1360, y = 100, w = 555, h = 30}}},
  {id = "modeset", dst = {{x = 1360, y = 15, w = 120, h = 45}}},
		{id = "sortset", dst = {{x = 1610, y = 15, w = 100, h = 45}}},
		{id = "lnmodeset", dst = {{x = 1845, y = 15, w = 70, h = 45}}},

		{id = "logo", dst = {{x = 10, y = 10, w = 400, h = 62}}},
		{id = "time_year", dst = {{x = 550, y = 30, w = 20, h = 20}}},
		{id = "score_slash", filter = 1, dst = {{x = 630, y = 28, w = 20, h = 20}}},
		{id = "time_month", dst = {{x = 650, y = 30, w = 20, h = 20}}},
		{id = "score_slash", filter = 1, dst = {{x = 685, y = 28, w = 20, h = 20}}},
		{id = "time_day", dst = {{x = 705, y = 30, w = 20, h = 20}}},
  

		{id = "time_hour", dst = {{x = 760, y = 30, w = 20, h = 20}}},
		{id = "song_colon", dst = {{x = 800, y = 30, w = 10, h = 20}}},
		{id = "time_minute", dst = {{x = 810, y = 30, w = 20, h = 20}}},
		{id = "song_colon", dst = {{x = 850, y = 30, w = 10, h = 20}}},
		{id = "time_second", dst = {{x = 860, y = 30, w = 20, h = 20}}},
  {id = "bottombar", dst = {{x = 905, y = 5, w = 1000, h = 50}}},

		{id = "option-panel1", loop = 300, op = {21}, timer = 21,  dst = {
			{time = 0, x = 268, y = 100, w = 1300, h = 960, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-panel1", loop = 300, op = {-21}, timer = 31,  dst = {
			{time = 0, x = 268, y = 100, w = 1300, h = 960, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-pacemaker", loop = 300, op = {21}, timer = 21,  dst = {
			{time = 0, x = 300, y = 0, w = 288, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-pacemaker", loop = 300, op = {-21}, timer = 31,  dst = {
			{time = 0, x = 300, y = 0, w = 288, h = 760, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-random", loop = 300, op = {21}, timer = 21,   dst = {
			{time = 0, x = 563, y = 0,  w = 288, h = 757, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-random", loop = 300, op = {-21}, timer = 31,   dst = {
			{time = 0, x = 563, y = 0, w = 288, h = 757, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-gauge", loop = 300, op = {21}, timer = 21,  dst = {
			{time = 0, x = 750, y = 0, w = 288, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-gauge", loop = 300, op = {-21}, timer = 31,  dst = {
			{time = 0, x = 750, y = 0, w = 288, h = 760, a = 255},
			{time = 300, a = 0}
		}},
  {id = "option-dp", loop = 300, op = {21}, timer = 21,  dst = {
			{time = 0, x = 930, y = 0, w = 288, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-dp", loop = 300, op = {-21}, timer = 31,  dst = {
			{time = 0, x = 930, y = 0, w = 288, h = 760, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-hsfix", loop = 300, op = {21}, timer = 21,  dst = {
			{time = 0, x = 1115, y = 0, w = 288, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-hsfix", loop = 300, op = {-21}, timer = 31,  dst = {
			{time = 0, x = 1115, y = 0, w = 288, h = 760, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-random2", loop = 300, op = {21}, timer = 21,  dst = {
			{time = 0, x = 1295,y = 0, w = 288, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-random2", loop = 300, op = {-21}, timer = 31,  dst = {
			{time = 0, x = 1295,y = 0, w = 288, h = 760, a = 255},
			{time = 300, a = 0}
		}},

		{id = "option-panel2", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0,x = 468, y = 100, w = 1020, h = 960, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-panel2", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 468, y = 100, w = 1020, h = 960, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-exjudge", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0, x = 535, y = -227, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-exjudge", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 535, y = -227, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-constant", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0,x = 655, y = 290, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-constant", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 655, y = 290, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-judgearea", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0, x = 775, y = -227, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-judgearea", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 775, y = -227, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-legacy", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0, x = 895, y = 290, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-legacy", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 895, y = 290, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-marknote", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0, x = 1015, y = -227, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-marknote", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 1015, y = -227, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-bpmguide", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0, x = 1135, y = 290, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-bpmguide", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 1135, y = 290, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-nomine", loop = 300, op = {22}, timer = 22, dst = {
			{time = 0, x = 1255, y = -227, w = 280, h = 680, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-nomine", loop = 300, op = {-22}, timer = 32, dst = {
			{time = 0, x = 1255, y = -227, w = 280, h = 680, a = 255},
			{time = 300, a = 0}
		}},

		{id = "option-panel3", loop = 300, op = {23}, timer = 23, dst = {
			{time = 0, x = 450, y = 100, w = 1020, h = 960, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-panel3", loop = 300, op = {-23}, timer = 33, dst = {
			{time = 0, x = 450, y = 100, w = 1020, h = 960, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-gas", loop = 300, op = {23}, timer = 23, dst = {
			{time = 0, x = 435, y = 295, w = 480, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-gas", loop = 300, op = {-23}, timer = 33, dst = {
			{time = 0, x = 435, y = 295, w = 480, h = 760, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-bga", loop = 300, op = {23}, timer = 23, dst = {
			{time = 0, x = 460, y = -322, w = 288, h = 760, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-bga", loop = 300, op = {-23}, timer = 33, dst = {
			{time = 0, x = 460, y = -322, w = 288, h = 760, a = 255},
			{time = 300, a = 0}
		}},
		{id = "option-autoadjust", loop = 300, op = {23}, timer = 23, dst = {
			{time = 0, x = 790, y = -255, w = 260, h = 740, a = 0},
			{time = 300, a = 255}
		}},
		{id = "option-autoadjust", loop = 300, op = {-23}, timer = 33, dst = {
			{time = 0, x = 790, y = -255, w = 260, h = 740, a = 255},
			{time = 300, a = 0}
		}},
		{id = "duration", loop = 300, op = {23}, timer = 23, dst = {
			{time = 0, x = 1075, y = 725, w = 23, h = 27, r = 20, g = 255, b = 20, a = 0},
			{time = 300, a = 255}
		}},
		{id = "duration", loop = 300, op = {-23}, timer = 33, dst = {
			{time = 0, x = 1075, y = 725, w = 23, h = 27, r = 20, g = 255, b = 20, a = 255},
			{time = 300, a = 0}
		}},
		{id = "duration-ms", loop = 300, op = {23}, timer = 23, dst = {
			{time = 0, x = 950, y = 725, w = 23, h = 27, a = 0},
			{time = 300, a = 255}
		}},
		{id = "duration-ms", loop = 300, op = {-23}, timer = 33, dst = {
			{time = 0, x = 950, y = 725, w = 23, h = 27, a = 255},
			{time = 300, a = 0}
		}},
		{id = "judgetiming", loop = 300, op = {23}, timer = 23,  dst = {
			{time = 0, x = 1180, y = 273, w = 23, h = 27, a = 0},
			{time = 300, a = 255}
		}},
		{id = "judgetiming", loop = 300, op = {-23}, timer = 33,  dst = {
			{time = 0, x = 1180, y = 273, w = 23, h = 27, a = 255},
			{time = 300, a = 0}
		}}}

  
  local function createTarget()
   local X = 330
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