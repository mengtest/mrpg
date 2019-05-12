---
--- Generated by Tools
--- Created by zheng.
--- DateTime: 2018-08-12-23:28:07
---

---@class Game.Modules.Login.View.RoleSelectMdr : Game.Core.Ioc.BaseMediator
local BaseMediator = require("Game.Core.Ioc.BaseMediator")
local RoleSelectMdr = class("RoleSelectMdr",BaseMediator)

function RoleSelectMdr:OnInit()
    self:InitRoleItemList()
end

function RoleSelectMdr:RegisterListeners()

end

function RoleSelectMdr:InitRoleItemList()
    self.roleItemList = UITools.CreateVScrollList(self.gameObject,"ScrollList",
            function(index, item)
                local roleInfo = self.loginModel.roleList[index + 1]
                local itemObj = item.gameObject
                itemObj:SetText("Text", roleInfo.roleName)
                self:RegisterClick(itemObj:FindChild("BtnEnter"),function ()
                    self.loginService:SelectRoleEnterGame(index, handler(self,self.OnEnterGame))
                end)
            end
    )
    self.roleItemList.ChildCount = #self.loginModel.roleList
end

function RoleSelectMdr:On_Click_BtnToCreate()
    --切换到创建角色
    vmgr:UnloadView(ViewConfig.RoleSelect)
    vmgr:LoadView(ViewConfig.RoleCreate)--创建角色
end

function RoleSelectMdr:OnEnterGame(data)
    --log("角色进入游戏:"..data.roleInfo.roleName)
    World.EnterScene(WorldConfig.Lobby)
    --World.EnterScene(WorldConfig.GuideScene)
end

return RoleSelectMdr
