---
--- Generated by Tools
--- Created by zheng.
--- DateTime: 2019-05-18-23:22:49
---

local BaseMediator = require("Game.Core.Ioc.BaseMediator")
---@class Game.Modules.Battle.View.BattleMdr : Game.Core.Ioc.BaseMediator
---@field battleModel Game.Modules.Battle.Model.BattleModel
---@field battleService Game.Modules.Battle.Service.BattleService
local BattleMdr = class("BattleMdr",BaseMediator)

function BattleMdr:OnInit()
    
end

return BattleMdr
