---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by zheng.
--- DateTime: 2019/3/14 23:06
---

--牌的花色
CardSuit =
{
    None        = "None",       --大王小王没有花色
    Diamond     = "Diamond",    -- ♦
    Club        = "Club",       -- ♣
    Heart       = "Heart",      -- ♥
    Spade       = "Spade"       -- ♠
}

--牌的花色对于的值
ChineseCardSuit =
{
    None        = "NONE",       --大王小王没有花色
    Diamond     = "方片",    -- ♦
    Club        = "梅花",       -- ♣
    Heart       = "红桃",      -- ♥
    Spade       = "黑桃"       -- ♠
}
--牌的花色对于的值
CardSuitValue =
{
    None        = 0,       --大王小王没有花色
    Diamond     = 1,    -- ♦
    Club        = 2,       -- ♣
    Heart       = 3,      -- ♥
    Spade       = 4       -- ♠
}

--红尖游戏牌型
---@class HongJianCardGroupType
HongJianCardGroupType =
{
    --基本牌型,没有权值
    Unknown             = "Unknown",    --没有牌型
    Single              = "Single",     --单张
    DuiZi               = "DuiZi",      --对
    ShunZi              = "ShunZi",    --顺子
    SanDaiN             = "SanDaiN",     --三带N
    SiDaiN              = "SiDaiN",     --四带N
    --特殊牌型,权值从小到大
    WuShiK              = "WuShiK", --五十K:不同花色
    WuShiK_Zheng        = "WuShiK_Zheng", --正五十K：相同花色
    SiZha               = "SiZha", --四炸：相同比大小
    TongHuaShun         = "TongHuaShun", --同花顺：相同花色的顺子，优先比大小，再比花色
    PaiZha              = "PaiZha", --排炸：N连对 相等长度时比大小 N >= 4
    DiZha               = "DiZha", --地炸：双黑A （前提你要有双红A，有天才有地）
    TianZha             = "TianZha", --天炸：双红A
}

--红尖游戏排型的权值
---@class HongJianCardGroupWeight
HongJianCardGroupWeight =
{
    --基本牌型,没有权值
    Unknown             = -1,    --没有牌型
    Single              = 0,     --单张
    DuiZi               = 0,      --对
    ShunZi             = 0,    --顺子 单顺
    SanDaiN             = 0,     --三带N
    SiDaiN              = 0,     --四带N
    --特殊牌型,权值从小到大
    WuShiK              = 1, --五十K:不同花色
    WuShiK_Zheng        = 2, --正五十K：相同花色
    SiZha               = 3, --四炸：相同比大小
    TongHuaShun         = 4, --同花顺：相同花色的顺子，优先比大小，再比花色
    PaiZha              = 5, --排炸：N连对 相等长度时比大小 N >= 4
    DiZha               = 6, --地炸：双黑A （前提你要有双红A，有天才有地）
    TianZha             = 7, --天炸：双红A
}


--牌的花色对于的值
HongJianCardGroupChinese =
{
    --基本牌型,没有权值
    Unknown             = "无牌型",    --没有牌型
    Single              = "一张",     --单张
    DuiZi               = "一对",      --对
    ShunZi1             = "单顺",    --顺子 单顺
    ShunZi2             = "连对",    --顺子 双顺
    ShunZi3             = "飞机",    --顺子 三顺
    ShunZi4             = "大飞机",    --顺子 四顺
    SanDaiN             = "三带N",     --三带N
    SiDaiN              = "四带N",     --四带N
    --特殊牌型,权值从小到大
    WuShiK              = "五十K", --五十K:不同花色
    WuShiK_Zheng        = "正五十K", --正五十K：相同花色
    SiZha               = "四炸", --四炸：相同比大小
    TongHuaShun         = "同花顺", --同花顺：相同花色的顺子，优先比大小，再比花色
    PaiZha              = "排炸", --排炸：N连对 相等长度时比大小 N >= 4
    DiZha               = "地炸", --地炸：双黑A （前提你要有双红A，有天才有地）
    TianZha             = "天炸", --天炸：双红A
}