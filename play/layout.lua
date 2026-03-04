local M = {}

function M.copy_header(header)
	local skin = {}

	for key, value in pairs(header) do
		skin[key] = value
	end

	return skin
end

function M.build_geometry(options)
	local geometry = {
		play_position = options.play_position,
		score_position = options.score_position,
		gauge_width = options.gauge_width,
		info_position = options.info_position,
		lane_x = 60,
		lane_y = 350,
		lane_w = 519,
		lane_h = 853,
		lane_line_width = 3,
		lane_line_src = options.is_scratch_right and 950 or 900,
		judge_x = 140,
		judge_y = 430,
		bga_y = 510,
		bga_w = 800,
		bga_h = 650,
	}

	local notes_info = {
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

	return geometry, notes_info
end

function M.apply_note_geometry(skin, geometry, notes_info, is_scratch_right)
	skin.note.dst = {}

	geometry.notes_x = {}
	geometry.notes_w = {}

	geometry.notes_w[8] = notes_info.Sc_width
	geometry.notes_w[1] = notes_info.Wh_width

	if is_scratch_right then
		geometry.notes_x[1] = geometry.lane_x + geometry.lane_line_width
		geometry.notes_x[8] = geometry.lane_x + geometry.lane_w - geometry.lane_line_width - geometry.notes_w[8]
	else
		geometry.notes_x[8] = geometry.lane_x + geometry.lane_line_width
		geometry.notes_x[1] = geometry.notes_x[8] + geometry.notes_w[8] + geometry.lane_line_width
	end

	for i = 2, 7 do
		if i % 2 == 0 then
			geometry.notes_x[i] = geometry.notes_x[i - 1] + notes_info.Wh_width + geometry.lane_line_width
			geometry.notes_w[i] = notes_info.Bl_width
		else
			geometry.notes_x[i] = geometry.notes_x[i - 1] + notes_info.Bl_width + geometry.lane_line_width
			geometry.notes_w[i] = notes_info.Wh_width
		end
	end

	for i = 1, 8 do
		skin.note.dst[i] = {
			x = geometry.notes_x[i] + geometry.play_position,
			y = geometry.lane_y + geometry.lane_line_width,
			w = geometry.notes_w[i],
			h = geometry.lane_h,
		}
	end
end

return M
