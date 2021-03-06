---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2018/6/10 20:56
---

---UnityEngine

---Framework
gameMgr = Framework.GameManager.GetGameManager()
sceneMgr = Framework.GameManager.GetSceneManager()
netMgr = Framework.GameManager.GetNetworkManager()
monoMgr = Framework.GameManager.GetMonoBehaviourManager()

ticker = Framework.Ticker.Launch()
LuaHelper = Framework.LuaHelper
Hud = Framework.Hud
--- Data Config
Action          = require("Game.Config.Action")
AvatarConfig    = require("Game.Config.AvatarConfig") ---@type AvatarConfig


---Game
Tools3D = require("Game.Core.Utils.Tools3D")
UITools = require("Game.Core.Utils.UITools")
AStarTools = require("Game.Core.Utils.AStarTools")
Alert = require("Game.Modules.Common.View.Alert")
Tips = require("Game.Modules.Common.View.Tips")
NetModal = require("Game.Modules.Common.View.NetModal")
ImageHelper = require("Game.Modules.Common.View.ImageHelper")
BattleEvent  = require("Game.Modules.Battle.Events.BattleEvent")

World = require("Game.Modules.World.World")
