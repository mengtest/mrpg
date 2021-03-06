---
--- Generated by Tools
--- Created by zheng.
--- DateTime: 2019-05-18-23:23:09
---

--场景单位信息
---@class SceneItemInfo
---@field id string|number
---@field prefabUrl string
---@field scale string

--技能
---@class SkillInfo
---@field animName string
---@field accounts table<number, AccountInfo>

--结算
---@class AccountInfo
---@field percent number
---@field shakeCamera ShakeCamera
---@field baseAttr BaseAttribute

--相机震动
---@class ShakeCamera
---@field delay number

--基础属性
---@class BaseAttribute
---@field hpMax number
---@field hpMin number
---@field atkMax number
---@field atkMin number
---@field defMax number
---@field defMin number
---@field critMax number
---@field critMin number

--动态属性
---@class Attribute
---@field hpMax number
---@field hp number
---@field atk number
---@field def number
---@field crit number

--Avatar基础属性
---@class AvatarInfo : SceneItemInfo
---@field name string
---@field moveSpeed number
---@field animBorn string
---@field animIdle string
---@field animAtkIdle string
---@field animWalk string
---@field animRun string
---@field baseAttr BaseAttribute
---@field attr Attribute
---@field skills table<number, AccountInfo>

---@class HeroInfo : AvatarInfo
---@field heroName string

---@class MonsterInfo : AvatarInfo
---@field quality string


---@class BattlePoolInfo
---@field avatarName string
---@field init number


---@class AreaInfo
---@field bornPos number
---@field rangeX number
---@field rangeY number
---@field waves table<number, WaveInfo>

---@class WaveInfo
---@field delay string
---@field borns table<number, BornInfo>

---@class BornInfo
---@field avatarName string
---@field numMin number
---@field numMax number

---@class BattleInfo
---@field pools table<number, BattleInfo>
---@field areas table<number, AreaInfo>

---@class AroundNode
---@field node AStar.Node
---@field ownerId number


local BaseModel = require("Game.Core.Ioc.BaseModel")
---@class Game.Modules.Battle.Model.BattleModel : Game.Core.Ioc.BaseModel
---@field battleService Game.Modules.Battle.Service.BattleService
local BattleModel = class("BattleModel",BaseModel)

function BattleModel:Ctor()
    
end

return BattleModel
