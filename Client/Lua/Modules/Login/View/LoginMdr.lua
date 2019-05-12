---
--- Generated by Tools
--- Created by zheng.
--- DateTime: 2018-06-19-00:17:42
---


local BaseMediator = require("Game.Core.Ioc.BaseMediator")
---@class Game.Modules.Login.View.LoginMdr : Game.Core.Ioc.BaseMediator
---@field loginService Game.Modules.Login.Service.LoginService
---@field loginModel Game.Modules.Login.Model.LoginModel
local LoginMdr = class("LoginMdr",BaseMediator)

local USERNAME = "username"
local PASSWORD = "password"
local AID = "aid"
local TOKEN = "token"

function LoginMdr:Ctor()
    LoginMdr.super.Ctor(self)
end

function LoginMdr:OnInit()
    --vmgr:LoadView(ViewConfig.Notice)
    self.username = SystemUtils.GetPlayerPrefsString(USERNAME)
    self.password = SystemUtils.GetPlayerPrefsString(PASSWORD)
    self.gameObject:GetInputField("V/H1/InputField").text = self.username
    self.gameObject:GetInputField("V/H2/InputField").text = self.password
end

function LoginMdr:fetchInput()
    self.username = self.gameObject:GetInputField("V/H1/InputField").text
    self.password = self.gameObject:GetInputField("V/H2/InputField").text
end

function LoginMdr:saveInput()
    SystemUtils.SavePlayerPrefsString(USERNAME, self.username)
    SystemUtils.SavePlayerPrefsString(PASSWORD, self.password)
end

--输入有效性
function LoginMdr:validityInput(callback)
    self:fetchInput()
    if string.isNullOrEmpty(self.username) or string.isNullOrEmpty(self.password) then
        print("Please input id and pw")
    else
        callback()
    end
end

function LoginMdr:On_Click_BtnRegister()
    self:validityInput(function()
        self.loginService:HttpRegister(self.username, self.password, handler(self,self.OnHttpRegister))
    end)
    --Alert.Show("AlertAlertAlert",function ()
    --    Tips.Show("TipsTipsTips")
    --end)
    --NetModal.Show()
    --coroutine.start(function ()
    --    coroutine.wait(1)
    --    NetModal.Hide()
    --end)
end

function LoginMdr:On_Click_BtnLogin()
    self:validityInput(function()
        self.loginService:HttpLogin(self.username, self.password, handler(self,self.OnHttpLogin))
    end)
    self:fetchInput()
end

function LoginMdr:OnHttpRegister(data)
    Tips.Show(data.msg)
    self:saveInput()
end

function LoginMdr:OnHttpLogin(data)
    self:saveInput()
    log("aid:{0} token:{1}", data.aid, data.token)
    vmgr:UnloadView(ViewConfig.Login)
    vmgr:LoadView(ViewConfig.ServerList)
    --vmgr:LoadView(ViewConfig.Notice)
end

return LoginMdr
