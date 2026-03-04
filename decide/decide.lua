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
			dst = {
				{time = 0, x = 820, y = 890, w = 320, h = 60, a = 0},
				{time = 1500, x = 820, y = 940, w = 320, h = 60, a = 255},
				{time = 3500, x = 820, y = 890, w = 320, h = 60, a = 255}
			}
		})
		table.insert(destinations, {
			id = "n_" .. difficulty.id,
			op = {difficulty.op},
			dst = {
				{time = 0, x = 1200, y = 1150, w = 95, h = 124, a = 0},
				{time = 1500, x = 1200, y = 1150, w = 95, h = 124, a = 255},
				{time = 3500, x = 1200, y = 1150, w = 95, h = 124, a = 255}
			}
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
		{id = "logo", dst = {{x = 785, y = 250, w = 1036, h = 1074, a = 190}}},
		{id = "genre", dst = {
			{time = 0, x = 960, y = 450, w = 1300, h = 58, a = 0},
			{time = 1500, x = 960, y = 500, w = 1300, h = 58, a = 255},
			{time = 3500, x = 960, y = 450, w = 1300, h = 58, a = 255},
		}},
		{id = "title", dst = {
			{time = 0, acc = 1, x = 960, y = 900, w = 1720, h = 40, a = 0},
			{time = 1500, acc = 1, x = 960, y = 950, w = 1720, h = 40, a = 255},
			{time = 3500, acc = 1, x = 960, y = 900, w = 1720, h = 40, a = 255},
		}},
		{id = "artist", dst = {
			{time = 0, acc = 1, x = 960, y = 650, w = 1720, h = 40, a = 0},
			{time = 1500, acc = 1, x = 960, y = 700, w = 1720, h = 40, a = 255},
			{time = 3500, acc = 1, x = 960, y = 650, w = 1720, h = 40, a = 255},
		}},
	}
	append_difficulty_destinations(skin.destination, difficulties)

	return skin
end

return {
	header = header,
	main = main,
}
