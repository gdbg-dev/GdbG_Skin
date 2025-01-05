local module = {}

module.property = {
	{
		name = "ステージファイル",
		item = {
			{ name = "ON",  op = 910 },
			{ name = "OFF", op = 911 }
		}
	},
	{
		name = "ネットワーク情報",
		item = {
			{ name = "On",  op = 922 },
			{ name = "Off", op = 923 } --WIP
		}
	},
}

return module
