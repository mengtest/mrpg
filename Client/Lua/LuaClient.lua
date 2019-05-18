---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2018/6/11 0:11
---

local LuaClient = {}


function LuaClient.Start()
    LuaClient.RequireGlobalDefines()

    setmetatable(_G,{
        __newindex = function(_, name, value)
            error("禁止使用全局变量")
        end
    })

    LuaClient.GameStart()
end

--加载全局定义
function LuaClient.RequireGlobalDefines()
    require "Betel.init"
    require "Game.Core.init"
    require "Game.Config.init"
    require "Game.Manager.init"
    require "Game.Core.Launch"
end


--开始游戏
function LuaClient.GameStart()
    print("GameStart...")
    require "Game.Core.Launch"
    --local timer = Timer.New(LuaClient.DoTestCo, 2, 1)
    --timer:Start()
end

--启动测试代码
function LuaClient.DoTestCo()
    print("Timer" .. Time.time)
    local prefab = Res.LoadPrefab("Prefabs/UI/Login/LoginWnd.prefab");
    local go = GameObject.Instantiate(prefab);
    log("测试日志{0}","Info")
    logWarn("测试日志{0}","Warn")
    logError("测试日志{0}","Error")
end

return LuaClient

