local module = {}

module.image = {
  { id = "stagefile", src = "stagefile", x = 0, y = 0, w = 1024, h = 768 },
  { id = "bg_aaa",    src = "bg_aaa",    x = 0, y = 0, w = 1920, h = 1080 },
  { id = "bg_aa",     src = "bg_aa",     x = 0, y = 0, w = 1920, h = 1080 },
  { id = "bg_a",      src = "bg_a",      x = 0, y = 0, w = 1920, h = 1080 },
  { id = "bg_c",      src = "bg_c",      x = 0, y = 0, w = 1920, h = 1080 },
  { id = "bg_f",      src = "bg_f",      x = 0, y = 0, w = 1920, h = 1080 },

  -- {id = "random-mod", src = parts, x = 2560, y = 0, w = 340, h = 480, divy = 10, len = 10, ref = 42},
  -- {id = "random-mod-2p", src = parts, x = 2560, y = 0, w = 340, h = 192, divy = 4, len = 4, ref = 43},
  -- {id = "random-mod-dp", src = parts, x = 2560, y = 0, w = 340, h = 192, divy = 4, len = 4, ref = 54},

  {
    id = "clear",
    src = "parts",
    x = 0,
    y = 0,
    w = 202,
    h = 341,
    divy = 11,
    len = 11,
    ref = 370
  }, {
  id = "bestclear",
  src = "parts",
  x = 0,
  y = 0,
  w = 202,
  h = 341,
  divy = 11,
  len = 11,
  ref = 371
},

  { id = "scoreframe",   src = "scoreframe", x = 0,    y = 0,   w = 1323, h = 1004 },

  { id = "ratepercent",  src = "parts",      x = 974,  y = 870, w = 21,   h = 19 },
  { id = "rateperiod",   src = "parts",      x = 964,  y = 870, w = 10,   h = 18 },

  { id = "gaugeperiod",  src = "parts",      x = 1206, y = 60,  w = 10,   h = 38 },
  { id = "gaugepercent", src = "parts",      x = 1162, y = 60,  w = 38,   h = 38 },

  { id = "ir_slash",     src = "parts",      x = 1004, y = 98,  w = 14,   h = 19 }
}

for i = 0, 7 do
  table.insert(module.image, {
    id = "gradesmall" .. i,
    src = "parts",
    x = 420,
    y = 0 + 48 * i,
    w = 101,
    h = 38
  })
  table.insert(module.image, {
    id = "gradelarge" .. i,
    src = "grade",
    x = 0,
    y = 0 + 170 * i,
    w = 400,
    h = 170
  })
end

return module
