---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/5/24 22:11
---

local BornWave = require("Game.Modules.Battle.Behaviors.BornWave")
local Monster = require("Game.Modules.Battle.Items.Monster")
local BaseBehavior = require('Game.Modules.Common.Behavior.BaseBehavior')

---@class Game.Modules.Battle.Behaviors.BornArea : Game.Modules.Common.Behavior.BaseBehavior
---@field areaInfo AreaInfo
---@field points table<number, UnityEngine.Vector3>
---@field waves table<number, Game.Modules.Battle.Behaviors.BornWave>
local BornArea = class("Game.Modules.Battle.Behaviors.BornWave",BaseBehavior)

---@param areaInfo AreaInfo
---@param points table<number, UnityEngine.Vector3>
function BornArea:Ctor(areaInfo, points)
    self.areaInfo = areaInfo
    self.points = points
    self.waves = {}
end

function BornArea:Refresh()
    for i = 1, #self.areaInfo.waves do
        local wave = BornWave.New(self.areaInfo, self.areaInfo.waves[i], self.points)
        table.insert(self.waves, wave)
        wave:Refresh()
    end
end

function BornArea:Active()
    for i = 1, #self.waves do
        local wave = self.waves[i]
        wave:Refresh()
    end
end


return BornArea