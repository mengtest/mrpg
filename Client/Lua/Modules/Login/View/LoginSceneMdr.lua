---
--- Generated by Tools
--- Created by zheng.
--- DateTime: 2018-07-20-22:45:39
---

---@class Game.Modules.Login.View.LoginSceneMdr : Game.Core.Ioc.BaseMediator
local BaseMediator = require("Game.Core.Ioc.BaseMediator")
local LoginSceneMdr = class("LoginSceneMdr",BaseMediator)

function LoginSceneMdr:OnInit()
    vmgr:LoadView(ViewConfig.Login)
end

return LoginSceneMdr
