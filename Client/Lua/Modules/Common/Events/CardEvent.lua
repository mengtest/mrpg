---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/3/13 23:57
---

---@class Game.Modules.Common.Events.CardEvent
local CardEvent = class("Betel.UI.ListViewEvent")

CardEvent.Click = "CardClick"
CardEvent.CancelAllSelect = "CardCancelAllSelect"
function CardEvent:Ctor()

end

return CardEvent