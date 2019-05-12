---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/3/11 23:06
--- 一手牌 -- 牌的集合
---

local CardEvent = require("Game.Modules.Common.Events.CardEvent")
local Card = require("Game.Modules.Common.View.Card")
local LuaMonoBehaviour = require("Betel.LuaMonoBehaviour")
---@class Game.Modules.Common.Utils.CardSlot : Betel.LuaMonoBehaviour
---@field public New function<deskPosObj:UnityEngine.GameObject, cards:table<number, Game.Modules.Room.Vo.CardVo>, showFront:boolean, selectable:boolean>
---@field public cards table<number, Game.Modules.Room.Vo.CardVo>
---@field public deskPosObj UnityEngine.GameObject
---@field public showFront boolean
---@field public cardList Betel.List
---@field public eventDispatcher Betel.Events.EventDispatcher
---@field public cardItemList table<number, Game.Modules.Common.View.Card>
local CardSlot = class("CardSlot",LuaMonoBehaviour)

local Offset = 0.032
local Gap = 0
local ZRot = -0.001
local CardWidth = 0.031

---@param deskPosObj UnityEngine.GameObject
---@param cards table<number, Game.Modules.Room.Vo.CardVo>
---@param showFront boolean
function CardSlot:Ctor(deskPosObj, cards, showFront, selectable)
    CardSlot.super.Ctor(self, deskPosObj)
    self.cards = cards
    self.showFront = showFront
    self.selectable = selectable

    self.cardList = List.New(cards)
    self.cardItemList = List.New()
    self.selectCardList = List.New()
    self.cardPrefab = Res.LoadPrefab("Prefabs/Scene/Cards/Prefabs/Card.prefab")

    self:CreateCardSlot()
    self:Reposition()

    if self.selectable then
        self:AddGlobalEventListener(CardEvent.CancelAllSelect, self.OnCancelAllSelect)
    end
end

function CardSlot:CreateCardSlot()
    self.cardList:Sort(function (c1, c2)
        if c1.faceValue > c2.faceValue then
            return true
        elseif c1.faceValue < c2.faceValue then
            return false
        else
            return CardSuitValue[c1.suit] > CardSuitValue[c2.suit]
        end
    end)
    for i = 1, self.cardList:Size() do
        local card = Card.New(Instantiate(self.cardPrefab,self.gameObject.transform), self.cards[i], self.selectable)
        card.slot = self
        self.cardItemList:Add(card)
    end

    self:AddGlobalEventListener(CardEvent.Click, self.OnCardClick)
end

---@param card Game.Modules.Common.View.Card
function CardSlot:OnCardClick(card)
    if card.isSelected then
        self.selectCardList:Add(card)
    else
        self.selectCardList:Remove(card)
    end
end

---@param card Game.Modules.Common.View.Card
function CardSlot:OnCancelAllSelect(card)
    for i = 1, self.cardItemList:Size() do
        local card = self.cardItemList[i]
        if card.isSelected then
            card:UpdateSelected()
        end
    end
end

function CardSlot:Reposition()
    local cardNum = self.cardItemList:Size()
    local startX = -(cardNum * CardWidth + (cardNum - 1) * Gap) / 2 + CardWidth / 2 + CardWidth * 1
    for i = 1, self.cardItemList:Size() do
        local card = self.cardItemList[i]
        card.gameObject.transform.localPosition = Vector3.New(startX + (i - 1) * (CardWidth + Gap), 0, 0)
        card.gameObject.transform.localEulerAngles = Vector3.New(0, 0, i * ZRot)
        card:UpdateOrg()
    end
end

---@param c1 Game.Modules.Room.Vo.CardVo
---@param c2 Game.Modules.Room.Vo.CardVo
function CardSlot:CardComp(c1, c2)
    if c1.faceValue > c2.faceValue then
        return true
    elseif c1.faceValue < c2.faceValue then
        return false
    else
        return CardSuitValue[c1.suit] > CardSuitValue[c2.suit]
    end
end

function CardSlot:Destroy()
    CardSlot.super.Destroy(self)
end

return CardSlot