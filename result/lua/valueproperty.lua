local module = {}

module.value = {
  { id = "bestscore",      src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 170 },
  { id = "currentscore",   src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 71 },
  { id = "diffscore",      src = "parts", x = 749, y = 871, w = 192,   h = 36, divx = 12, divy = 2,  digit = 5,       zeropadding = 5, ref = 152 },
  { id = "bestcombo",      src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 173 },
  { id = "currentcombo",   src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 75 },
  { id = "diffcombo",      src = "parts", x = 749, y = 871, w = 192,   h = 36, divx = 12, divy = 2,  digit = 5,       zeropadding = 5, ref = 175 },
  { id = "bestmiss",       src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, zeropadding = 5, ref = 176 },
  { id = "currentmiss",    src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 76 },
  { id = "diffmiss",       src = "parts", x = 749, y = 906, w = 192,   h = 36, divx = 12, divy = 2,  digit = 5,       zeropadding = 5, ref = 178 },
  { id = "target",         src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 151 },
  { id = "difftarget",     src = "parts", x = 749, y = 805, w = 384,   h = 74, divx = 12, divy = 2,  digit = 5,       zeropadding = 5, ref = 153 },

  { id = "bestrate",       src = "parts", x = 749, y = 871, w = 176,   h = 18, divx = 11, digit = 3, zeropadding = 3, ref = 183 },
  { id = "bestratedec",    src = "parts", x = 950, y = 924, w = 176,   h = 18, divx = 11, digit = 2, ref = 184 },
  { id = "currentrate",    src = "parts", x = 749, y = 871, w = 176,   h = 18, divx = 11, digit = 3, zeropadding = 3, ref = 102 },
  { id = "currentratedec", src = "parts", x = 950, y = 924, w = 176,   h = 18, divx = 11, digit = 2, ref = 103 },

  { id = "gauge",          src = "parts", x = 816, y = 60,  w = 341,   h = 40, divx = 11, digit = 3, zeropadding = 3, ref = 107 },
  { id = "gauge_dec",      src = "parts", x = 816, y = 60,  w = 310,   h = 40, divx = 10, digit = 1, ref = 407 },

  { id = "ir_rank",        src = "parts", x = 816, y = 98,  w = 176,   h = 19, divx = 11, digit = 4, zeropadding = 4, ref = 179 },
  { id = "ir_total",       src = "parts", x = 816, y = 98,  w = 176,   h = 19, divx = 11, digit = 4, zeropadding = 4, ref = 180 },

  { id = "ep",             src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 420 },
  { id = "epf",            src = "parts", x = 749, y = 755, w = 352,   h = 40, divx = 11, digit = 4, ref = 421 },
  { id = "eps",            src = "parts", x = 749, y = 829, w = 352,   h = 40, divx = 11, digit = 4, ref = 422 },
  { id = "fast",           src = "parts", x = 749, y = 750, w = 352,   h = 40, divx = 11, digit = 4, ref = 423 },
  { id = "slow",           src = "parts", x = 749, y = 868, w = 352,   h = 40, divx = 11, digit = 4, ref = 424 },
  { id = "cb",             src = "parts", x = 749, y = 805, w = 352,   h = 40, divx = 11, digit = 4, ref = 425 },
}

for i = 0, 4 do
  table.insert(module.value,
    { id = "jg" .. i, src = "parts", x = 749, y = 805, w = 352, h = 40, divx = 11, digit = 4, ref = 110 + 1 * i })
  table.insert(module.value,
    { id = "jgf" .. i, src = "parts", x = 749, y = 753, w = 352, h = 40, divx = 11, digit = 4, ref = 410 + 2 * i })
  table.insert(module.value,
    { id = "jgs" .. i, src = "parts", x = 749, y = 829, w = 352, h = 40, divx = 11, digit = 4, ref = 411 + 2 * i })
end
table.insert(module.value,
  { id = "miss", src = "parts", x = 749, y = 805, w = 352, h = 40, divx = 11, digit = 4, ref = 420 })
return module
