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

local header = {
	type = 6,
	name ="GroundbreakinG Skin Ver.0.1 Decide",
	w = 1920,
	h = 1080,
	fadeout = 500,
	scene = 2500,
	input = 500,
}

local function build_slide_fade_frames(x, y_start, y_end, w, h, extra)
	local base = extra or {}
	return {
		{time = 0, acc = 1, x = x, y = y_start, w = w, h = h, a = 0, r = base.r, g = base.g, b = base.b},
		{time = 1500, acc = 1, x = x, y = y_end, w = w, h = h, a = 255, r = base.r, g = base.g, b = base.b},
		{time = 3500, acc = 1, x = x, y = y_start, w = w, h = h, a = 255, r = base.r, g = base.g, b = base.b}
	}
end

local function append_difficulty_images(images, difficulties)
	for i, difficulty in ipairs(difficulties) do
		table.insert(images, {
			id = difficulty.id,
			src = 3,
			x = 0,
			y = 744 + (i - 1) * 60,
			w = 450,
			h = 60
		})
	end
end

local function append_difficulty_values(values, difficulties)
	for i, difficulty in ipairs(difficulties) do
		table.insert(values, {
			id = "n_" .. difficulty.id,
			src = 3,
			x = 0,
			y = (i - 1) * 124,
			w = 950,
			h = 124,
			ref = 96,
			divx = 10,
			digit = 2,
			align = 2
		})
	end
end

local function append_difficulty_destinations(destinations, difficulties)
	for _, difficulty in ipairs(difficulties) do
		table.insert(destinations, {
			id = difficulty.id,
			op = {difficulty.op},
			dst = build_slide_fade_frames(820, 890, 940, 320, 60)
		})
		table.insert(destinations, {
			id = "n_" .. difficulty.id,
			op = {difficulty.op},
			dst = build_slide_fade_frames(1200, 1100, 1150, 95, 124)
		})
	end
end

local function main()
	-- ヘッダ情報コピー
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	local difficulties = {
		{id = "beginner", op = 151},
		{id = "normal", op = 152},
		{id = "hyper", op = 153},
		{id = "another", op = 154},
		{id = "insane", op = 155},
		{id = "unknown", op = 150}
	}

	skin.source = {
		{id = 0, path = "back1.png"},
		{id = 1, path = "back2.png"},
		{id = 2, path = "logo 1.png"},
		{id = 3, path = "parts.png"},
	}

	skin.font = {
		{id = 0, path = "../fonts/LINESeedJP_TTF_Bd.ttf"},
		{id = 1, path = "../fonts/bitmap/Title.fnt"},
		{id = 2, path = "../fonts/bitmap/Artist.fnt"},
	}

	skin.text = {
		{id = "genre", font = 1, size = -48, overflow = 1, align = 1, ref = 13},
		{id = "table", font = 1, size = -58, ref = 1003, overflow = 1, align = 1},
		{id = "title", font = 1, size = -118, ref = 10, overflow = 1, align = 1},
		{id = "fulltitle", font = 1, size = -58, ref = 12, overflow = 1, align = 1},
		{id = "artist", font = 1, size = -58, ref = 14, overflow = 1, align = 1},
	}

	skin.image = {
		{id = "bg1", src = 0, x = 0, y = 0, w = 1920, h = 1080},
		{id = "bg2", src = 1, x = 0, y = 0, w = 1920, h = 1080},
		{id = "logo", src = 2, x = 0, y = 0, w = 1036, h = 1074},
	}
	append_difficulty_images(skin.image, difficulties)

	skin.value = {}
	append_difficulty_values(skin.value, difficulties)

	skin.destination = {
		{id = "bg1", dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
		{id = "bg2", dst = {{x = 0, y = 0, w = 1920, h = 1080, a = 80}}},
		-- ロゴは画面中央に配置する。
		{id = "logo", dst = {{x = 442, y = 3, w = 1036, h = 1074, a = 190}}},
		{id = "genre",
			-- テキストと難易度は同じ easing / 移動量でそろえて、見た目のテンポを統一する。
			dst = build_slide_fade_frames(960, 450, 500, 1300, 58)
		},
		{id = "title", dst = build_slide_fade_frames(960, 900, 950, 1720, 40)},
		{id = "artist", dst = build_slide_fade_frames(960, 650, 700, 1720, 40)},
	}
	append_difficulty_destinations(skin.destination, difficulties)

	return skin
end

return {
	header = header,
	main = main,
}
