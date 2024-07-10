local ai = require("mini.ai")
local operators = require("mini.operators")
local pairs = require("mini.pairs")
local surround = require("mini.surround")

-- local completion = require("mini.completion")
local bracketed = require("mini.bracketed")
local animate = require("mini.animate")

ai.setup()
operators.setup()
pairs.setup()
surround.setup()

bracketed.setup()
animate.setup()
