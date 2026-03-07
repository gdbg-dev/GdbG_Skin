local M = {}

function M.append_intro_destinations(skin, geometry, helpers)
	local add = function(entry)
		table.insert(skin.destination, entry)
	end
	local is_2p = helpers.is_2p
	local main_state = helpers.main_state
	local bga_x = (is_2p() and -780 or 980) + geometry.info_position
	local bga_center_x = math.floor(bga_x + (geometry.bga_w / 2) + 0.5)

	add({id = "bg", stretch = 1, dst = {
		{x = 0, y = 0, w = 1920, h = 1080},
	}})

	if is_2p() then
		add({id = "bga", filter = 1, dst = {{x = bga_x, y = 200, w = geometry.bga_w, h = geometry.bga_h}}})
		add({id = "bga_soundonly", stretch = 1, draw = function()
			if main_state.option(40) or main_state.option(170) then
				return true
			end
		end, timer = 41, loop = 800, dst = {
			{time = 0, x = bga_x, y = 200, w = geometry.bga_w - 1, h = geometry.bga_h, a = 0},
			{time = 500},
			{time = 800, a = 255},
		}})
		add({id = -110, timer = 41, offset = 55, dst = {
			{x = bga_x, y = geometry.bga_y, w = geometry.bga_w - 1, h = geometry.bga_h, a = 0},
		}})
	else
		add({id = "bga", filter = 1, dst = {{x = bga_x, y = 200, w = geometry.bga_w, h = geometry.bga_h}}})
		add({id = "bga_soundonly", stretch = 1, draw = function()
			if main_state.option(40) or main_state.option(170) then
				return true
			end
		end, timer = 41, loop = 800, dst = {
			{time = 0, x = bga_x, y = 200, w = geometry.bga_w - 1, h = geometry.bga_h, a = 0},
			{time = 500},
			{time = 800, a = 255},
		}})
		add({id = -110, timer = 41, offset = 55, dst = {
			{x = bga_x, y = geometry.bga_y, w = geometry.bga_w - 1, h = geometry.bga_h, a = 0},
		}})
	end

	if is_2p() then
		add({id = "title", filter = 1, dst = {{x = bga_center_x, y = 970, w = geometry.bga_w, h = 30}}})
		add({id = "tablename", filter = 1, dst = {{x = 400, y = 1050, w = 575, h = 26}}})
	else
		add({id = "title", filter = 1, dst = {{x = bga_center_x, y = 970, w = geometry.bga_w, h = 30}}})
		add({id = "tablename", filter = 1, dst = {{x = 1230, y = 1050, w = 575, h = 26}}})
	end

	add({id = "notes-head", dst = {{x = 585 + geometry.score_position, y = 300, w = 95, h = 21}}})
	add({id = "note", dst = {{x = 790 + geometry.score_position, y = 280, w = 14, h = 18}}})

	if is_2p() then
		add({id = "song-left-m", dst = {{x = 720, y = 30, w = 24, h = 22}}})
		add({id = "song-left-s", dst = {{x = 780, y = 30, w = 24, h = 22}}})
		add({id = "song-time-colon", dst = {{x = 762, y = 30, w = 50, h = 50}}})
		add({id = "song-progress-bar", dst = {{x = 1870, y = 0, w = 70, h = 1080}}})
		add({id = "song-progress", dst = {{x = 1892, y = 1015, w = 10, h = 20}}})
	else
		add({id = "song-left-m", dst = {{x = 250, y = 30, w = 24, h = 22}}})
		add({id = "song-left-s", dst = {{x = 310, y = 30, w = 24, h = 22}}})
		add({id = "song-time-colon", dst = {{x = 292, y = 30, w = 50, h = 50}}})
		add({id = "song-progress-bar", dst = {{x = 0 - geometry.info_position, y = 0, w = 70, h = 1080}}})
		add({id = "song-progress", dst = {{x = 21 - geometry.info_position, y = 1007, w = 10, h = 20}}})
	end

	add({id = "BPM-head", dst = {{x = 52 + geometry.info_position, y = 255, w = 250, h = 60}}})
	add({id = "BPM-bar", dst = {
		-- BPMバーは原寸(1027x39)に近づけ、縮小ぼけを抑える。
		{x = 862 - geometry.info_position, y = 80, w = 1027, h = 39},
	}})
	add({id = "BPM-now", dst = {
		{x = 1270 - geometry.info_position, y = 133, w = 44, h = 54},
	}})
	add({id = "BPM-max", op = {177}, dst = {
		{x = 1458 - geometry.info_position, y = 125, w = 13, h = 17},
	}})
	add({id = "BPM-min", op = {177}, dst = {
		{x = 1272 - geometry.info_position, y = 125, w = 13, h = 17},
	}})
	add({id = "BPM-no-change", op = {176}, dst = {
		{x = 1450 - geometry.info_position, y = 125, w = 80, h = 41},
	}})
	add({id = "BPM-no-change", op = {176}, dst = {
		{x = 1250 - geometry.info_position, y = 125, w = 80, h = 41},
	}})
end

return M
