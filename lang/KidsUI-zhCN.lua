-- 2006.11.24 translation done by Li,Xizhi
NPL.load("(gl)script/ide/Locale.lua");
local L = CommonCtrl.Locale("KidsUI");
L:RegisterTranslations("zhCN", function() return {
	-- Web services & web page
	["RegProduct.asmx"] = "http://www.minixyz.com/RegProduct.asmx",
	["AuthUser.asmx"] = "http://www.minixyz.com/AuthUser.asmx",
	["SubmitArticle.asmx"] = "http://www.minixyz.com/SubmitArticle.asmx",
	["SubmitEBook.asmx"] = "http://www.minixyz.com/SubmitEBook.asmx",
	["UploadUserFile.asmx"] = "http://www.minixyz.com/UploadUserFile.asmx",
	["Register.aspx"] = "http://www.minixyz.com/cn/Register.aspx",
	["community.aspx"] = "http://www.minixyz.com/cn/community.aspx",
	["login domain table"] = {"www.minixyz.com", "www.kids3dmovie.com", "www.paraengine.com", },
	["CheckVersion.asmx"] = "http://www.minixyz.com/CheckVersion.asmx",
	["http://www.kids3dmovie.com"] = "http://www.minixyz.com",
	
	-- common
	["OK"] = "确定",
	["Cancel"] = "取消",
	["Close"] = "关闭",
	["Save"] = "保存",
	["Network is not available, please try again later"] = "网络暂时无法连通，请稍候再试",
	["Press Any Key to Continue"] = "按任意键继续",	
	["Function is not available in this edition."] = "此功能暂时没有开放",
	["Function is only available to community edition users."] = "网络社区功能目前只向社区版内测用户提供，您希望登陆我们的社区网站了解更多的内容么?",
	["Product Customer Service"] = "客户服务: support@kids3dmovie.com",
	["Kids Movie Platform Version"] = "动漫创作平台 V 1.1.0",
	["Copyright@2004-2007 ParaEngine Tech Studio"] = true,
	-- the help book
	["Book of Help"] = "电子书教程.zip",
	-- the deafult book
	["Default Book"] = "新手指南.zip",
	-- 显示在首页的图书
	["FrontPage Books"] = {
		{name = "新手指南", path = "新手指南.zip", tooltip = "教你基本控制和世界创建"},
		{name = "KM高手", path = "KM高手.zip", tooltip = "一些小任务等你来完成，你需要熟悉前面的教程"},
		{name = "巴里岛(视频教程)", path = "巴里岛.zip", tooltip = "教你制作卡通世界与人物行为"},
	},
	["LoaderImage"] = "Texture/kidui/explorer/logo_cn.png",
	
	-- common folders
	["Shared Media Folder"] = "Texture/sharedmedia/",
	["Advertisement Folder"] = "Texture/advertisement/",
	["Internet Folder"] = "Texture/internet/",
	["Audio Folder"] = "Audio/",
	
	-- Intro
	["KidsUI_StartScreen_button_tips_1"] = "点击 <<开始探索>>, 这里有许多3D电子书，电子书的每一页都有一个魔法门，带你进入书中的3D世界。\n\n在这里，你也可以创建并发行你自己的3D电子书",
	["KidsUI_StartScreen_button_tips_2"] = "点击 <<读取世界>>, 您可以访问您本地计算机中的3D世界；这里所有的世界都是其他小朋友和开发者使用本软件制作的。\n\n您也可以开创自己的<新世界>。在这里您可以发挥想象力创作出你的梦境",
	["KidsUI_StartScreen_button_tips_3"] = "点击 <<网络世界>>, 您将加入我们的创作社区，这里您可以同好朋友分享创作的乐趣。\n\n网络世界的功能将逐步向用户开放，欢迎大家的参与。\n\n更多内容请访问: \nhttp://www.minixyz.com",
	["KidsUI_StartScreen_button_tips_4"] = "点击 <<系统设置>>, 您可以随时根据您的计算机性能，调整3D显示画质。\n\n如果您的程序运行缓慢，请将<图形>模式调到\"简\"; \n\n高级用户也可以按F2键调整分辨率.",
	["Go to official website"] = "打开官方网站",
	["You are running demo version."] = "您运行的是DEMO演示版，很多功能、资源、教程没有开放，请访问我们的官方网站了解如何获得完整版。",
	["Your product is not registered. If you have license code, please click OK button and then enter license code."] = "您的产品还没有注册，如果您已经有产品序列号，请点击确定，在左侧的窗口中输入您的序列号。",
	["You are running demo version. Many functions, assets and tutorials are disabled. Do you want to visit our website for how to obtain the full version?"] = "您运行的是DEMO演示版，很多功能、资源、教程没有开放。您是否希望现在访问我们的官方网站了解如何获得完整版？",
	["IntroText"] = [[KidsMovie动漫创作平台
	- 帕拉巫小宇宙之卡通工坊

创造你的虚拟世界	
创造你的卡通电影
创造你的3D游戏
	
(a)点击读取世界，浏览其他小朋友和开发者制作的世界
(b)点击教程，我们将教你如何创造世界

访问:
http://www.minixyz.com

全面提高小孩的创造力，想象力，导演能力，表达能力，等等。越来越多的儿童掌握了创造的工

具。本软件也是儿童学习与认识电脑的最佳选择（老少皆宜）。

我们每个季度都会发布新的系列版本。
]],
	["Team"] = [[
将全世界的网上力量和资源团结起来，共同创建属于每一个人的游戏世界。
        - ParaEngine 宗旨
 
          制作成员
    监制:
          李西峙, 李黎轩
    程序:
          李西峙
          刘伟力, 王  田
          孙凌峰
    策划: 
          李  宇, 谈正品
          刘  赫
    美术:
          张  瑜
          张惠祥, 马天宇 
          张  祥, 黄有贤
          潘  挺, 王  凌
          刘  琦
    市场:
          许怀澄  
    顾问:
          Lu Yang
          Jaalin Cheng
          Zhang Gang
          Sunny Cheung
          

关于 ParaEngine 工作室

  《儿童游戏动漫创造平台》由ParaEngine工作室开发完成。请访问我们的网站
  
http://www.paraengine.com

ParaEngine引擎中使用了Ageia PhysX. ParaEngine和NPL是ParaEngine工作室在中国大陆的注册商标。产品中其他商标属于他们各自的所有者。
]],
		
	-- UI_Startup
	["StartupImage"] = "Texture/kidui/startup_seq_cn/static_startup.swf",
	["StartupVideo"] = "video/KidsMovieStart_V1.wmv",
	["StartupTexSeq"] = "Texture/kidui/startup_seq_cn/11_a045.dds",
	["tutorial1"] = {name = "教程1", path = "worlds/教程2", tooltip = "教你基本控制和世界创建"},
	["tutorial2"] = {name = "教程2", path = "worlds/教程3", tooltip = "教你高级世界创建和人物行为创建"},
	["tutorial3"] = {name = "教程3", path = "worlds/教程4", tooltip = "教你制作卡通电影。你需要熟悉前面的教程。"},

	["Texture/kidui/main/title.png"] = true,
	["Texture/kidui/main/create.png"] = "Texture/kidui/main/create.png;0 0 192 80",
	["Texture/kidui/main/load.png"] = "Texture/kidui/main/load.png;0 0 192 80",
	["Texture/kidui/main/network.png"] = "Texture/kidui/main/network.png;0 0 192 80",
	["Texture/kidui/main/setting.png"] = "Texture/kidui/main/setting.png;0 0 192 80",
	["Texture/kidui/main/exit.png"] = "Texture/kidui/main/exit.png;0 0 192 80",
	["Texture/kidui/main/team.png"] = "Texture/kidui/main/team.png;0 0 112 55",

    ["Texture/kidui/main/about.png"] = "Texture/kidui/main/about_cn.png", 
	["Texture/kidui/main/tutorial.png"] = "Texture/kidui/main/tutorial_cn.png",
	["Texture/kidui/main/intro.png"] = "Texture/kidui/main/intro_cn.png",
	["Texture/kidui/main/tutorials.png"] = "Texture/kidui/main/tutorials_cn.png;0 0 174 42",
	["Texture/kidui/main/tczpx.png"] = "Texture/kidui/main/tczpx.png;0 0 174 42",

	["Product is unregistered.\r\nEnter license code below"] = "产品未注册\r\n请在下面输入序列号",
	["Kids Movie Platform\n- 2007 New Year Edition"] = "儿童动漫创作平台\n - 帕拉巫小宇宙之卡通工坊",
	["Product is registered."] = "产品已注册",
	["Tutorials:"] = "教程:",
	["Thank you very much for purchasing our product!"] = "序列号正确！十分感谢购买我们的产品\n\n点击确定按钮到我们的网站激活您的产品。",
	["Your license code is incorrect. Please enter code like below \n1234-1234-1234-1234"] = "您的序列号不正确。请安下列格式输入\n1234-1234-1234-1234",
	["register"] = "注册",
	["Your product is already register. You can submit or update your registration info with us. Do you want to do it now?"] = "您的产品已经注册；您可以随时提交或更新您的注册信息。您是否要继续?",
	["You have not activated your product on our community website. Do you want to activate now?"] = "您还没有在我们的社区网上激活您的产品，您是否希望现在激活？\n\n成为社区的成员，您可以获得免费的产品更新、大礼包；并同成千上万的用户分享您的动漫作品。",

	["UserWorkShow_Tooltips"] = "优秀作品飙风对撼！\n获得你的全国排名与荣誉！\n赢得Para提供的丰厚网络礼品！\n热情参与请点击我要参加！",
	["Random pick"] = "手气不错",
	["Randomly download a user submitted 3D world"] = "随机获得一套优秀参赛作品！",
	["Participate"] = "我要参加",
	["Click me! More surprises waiting for you!"] = "点我！点我！\n丰厚的礼品等着你！",
	["User work show: random pick"] = "天才作品秀:随机选取",
	
	-- welcome screen
	["Always display this screen"] = "启动时总是显示",
	["WelcomeWorldWindowMedia"] = "Texture/Help.swf",
	["StartupWelcomeWindow"] = "Texture/Help.swf",
	
	-- product_logo
	["Texture/ParaEngineLogo.png"] = "Texture/ParaEngineLogo_cn.swf",
	["Texture/productcover.png"] = "Texture/productcover_cn.png",
	["Texture/product_exitpage.png"] = "Texture/productcover_exit_cn.png",
				
	-- help
	["Quick Help"] = "快速帮助",
	["Texture/KeysHelp.png"] = "Texture/KeysHelp.png",
	["Texture/MainHelp.png"] = "Texture/MainHelp.png",
	["tips of the day"] = "小技巧",
	["Texture/kidui/main/tipsofday.png"] = "Texture/kidui/main/tipsofday_cn.png;0 0 190 41",
	["Texture/kidui/main/startgame.png"] = "Texture/kidui/main/startgame_cn.png;0 0 128 64",
	
	-- esc pannel	
	["Texture/demo/b_quit.png"] = "Texture/kidui/main/restart_cn.png;0 0 197 75",
	["Texture/demo/b_load.png"] = "Texture/kidui/main/load_cn.png;0 0 197 75",
	["Texture/demo/b_save.png"] = "Texture/kidui/main/save_cn.png;0 0 197 75",
	["Texture/demo/b_net.png"] = "Texture/kidui/main/network_cn.png;0 0 197 75",
	["Texture/demo/b_altf4.png"] = "Texture/kidui/main/exit_cn.png;0 0 197 75",
	
	-- right pannel
	["Do you wish to exit the game?"] = "您希望结束游戏么？",
	["Do you wish to restart the game?"] = "您希望重新开始游戏么？",
	["Texture/kidui/right/btn_return.png"] = true,

	-- modify
	["Texture/kidui/middle/modify/btn_here.png"] = "Texture/kidui/middle/modify/btn_here.png",
	["Texture/kidui/middle/modify/btn_reset.png"] = "Texture/kidui/middle/modify/btn_reset.png",

	--terrain
	["Texture/kidui/middle/terrain/btn_range_bg1.png"] = true,
	["Texture/kidui/middle/terrain/btn_range_bg2.png"] = true,

	-- event_handlers.lua
	["Successfully logged in!"] = "登陆成功！",
	["Log in failed. User does not exist"] = "登陆失败。用户不存在",
	["Connection with server is broken:"] = "同服务器连接中断：",
	["Connection with the following user is broken:"] = "同下面用户的连接中断：",
	
	-- kids_db.lua
	["create world description"] = [[将创建新世界（缺省派生自空白世界）， 在程序的安装目录下将创建一个与世界同名的目录，里面包含世界资源。 世界名称只能为英文，不能有空格。]],
	["unnamed"] = "没有名字",
	["You do not have permission to do this action in this world\n"] = "您在这个世界中没有权限进行这个操作\n",
	
	
	-- load world, new world and save world
	["World Name"] = "世界名称",
	["Author Name"] = "作者",
	["Derived from"] = "派生自",
	["world name can not be empty"] = "世界名称不能为空",
	[" failed loading the world."] = "世界载入失败了。",
	[" world does not exist"] = "世界不存在",
	["scene has been saved to:\n"] = "场景被存盘至:\n",
	["scene has been saved.\n"] = "场景被存盘\n",
	["scene is not modified"] = "场景没有被更改过",
	["Do you want to save your current world?"] = "您希望保存当前世界么？",
	
	["_emptyworld presents an empty world. Please use another name."] = "_emptyworld是系统隐含世界，它代表一个空世界。请使用其他名字创建世界",
	["world with the same name already exist. To use the name, please manually delete the folder ./"] = "世界已经存在了，如想重新创建，请手工删除文件夹./",
	["Failed creating the world"] = "世界创建失败了。",
	["The base world does not exist"] = "被派生的世界不存在。",
	[" Failed loading the world."] = "世界载入失败了。",
	["Texture/kidui/main/ok.png"] = "Texture/kidui/main/ok.png;0 0 121 59",
	["Texture/kidui/main/cancel.png"] = "Texture/kidui/main/cancel.png;0 0 121 59",
	["Texture/kidui/main/instructions.png"] = "Texture/kidui/main/instructions_cn.png;0 0 174 42",
	["Texture/kidui/main/congratulations.png"] = "Texture/kidui/main/congratulations_cn.png;0 0 721 205",
	["This world is ready-only, you can not save it."] = "当前世界是只读的，您不能保存它",
	["%d loaded characters in the scene are saved. All visible world near the current player are saved."] = "共有%d个已加载的人物被保存，当前人物周围所有的地形、地表、物体等都被保存了。",
	["Save only modified content (fast)"] = "只保存修改过的内容(快!)",
	["Save Full"] = "完全保存",
	["Save everything in the scene (slow)"] = "保存当前人物周围所有的内容, 尽管他们从未被修改过。\r\n可能需要几分钟完成。",
	["snapshot"] = "拍照留影",
	["Upload my screen shot"] = "上传作品截图到我的小宇宙",
	["publish"] = "发布",
	["Upload my 3D world to community site"] = "发布我的动漫世界到<帕拉巫小宇宙>社区",
	["world is successfully packed to %s and ready for publication."] = "世界已经成功的压缩到%s, 可以发行了",
	["Click the save button to save your current world"] = "点击保存按钮，保存你的当前世界",
	["You do not have permission to save the world"] = "您没有保存这个世界的权限",
	
	["new world instructions"] = [[
(1)输入新世界的名称
(2)从列表框中选择一个世界模版。如果不选择，将会创建空世界。
(3)点击确定按钮

注意: 新世界将继承世界模版的全部内容，人物除外。
]],
	["load world instructions"] = [[
(1) 从列表框中选择一个世界
(2) 点击确定按钮
]],

	["Do you know that you can upload screen shot of your 3d world to our community website? Please click the flashing button on the left bottom of the screen."] = "你知道么？你可以上传3D作品截图到我们的社区网站。\n\n请按住鼠标左键不放，拖动鼠标，找到一个好的镜头后，点击左下角指示的按钮\n";
	
	-- left_container
	["l_sky"] = "",
	["l_sky_tips"] = "天空",
	["l_ocean"] = "",
	["l_ocean_tips"] = "水",
	["l_terrain"] = "",
	["l_terrain_tips"] = "地面",
	["l_Impersonate"] = "",
	["l_Impersonate_tips"] = "附身",
	["l_modify"] = "",
	["l_modify_tips"] = "修改",
	["l_property"] = "",
	["l_property_tips"] = "属性",
	["l_delete"] = "",
	["l_delete_tips"] = "删除",
	["You can not delete other player"] = "你不能删除其他玩家",
	["You can not take control of this character"] = "你不能操纵我",
	["Are you sure you want to delete the selected character?"] = "您确定要删除当前选择的人物么?",
	
	-- left_container.filters
	["l_object"] = "",
	["l_light"] = "",
	["l_explore"] = "",
	["select object only"] = "选择物体",
	["explore the scene"] = "选择漫游",
	["select light only"] = "选择灯光",
	["bk_light"] = "Texture/kidui/left/btn_light.png",
	["bk_object"] = "Texture/kidui/left/btn_object.png",
	["bk_explore"] = "Texture/kidui/left/btn_explore.png",
	
	-- middle_container
	["player"] = "玩家",
	["NPC"] = "NPC",
	["actor"] = "演员",
	["dummy"] = "木头人",
	["custom"] = "自定义",
	["I can see every one"] = "可以看到任何人",
	["I can see players"] = "可以看到玩家",
	["I can see both NPC and players"] = "可以看到NPC和玩家",
	["I can not see anyone"] = "看不见任何人",
	["other character types"] = "其他类型的人物",
	["bla bla bla"] = "自言自语",
	["random walk"] = "随机走动",
	["follower"] = "跟屁虫",
	["shopkeeper"] = "饭馆老板",
	["groceryman"] = "菜市场老板",
	["No IQ"] = "没有IQ",
	["switch to main player"] = "切换到主角",
	["go home automatically"] = "自动回家",
	["switch to the nearest character\r\nshortcut key <Left Shift>"] = "切换到附近人物\r\n快捷键Left Shift",
	["lighting:"] = "光照：",
	["sky background:"] = "天空背景",
	["sky color:"] = "天空颜色",
	["fog color:"] = "雾的颜色",
	["water level:"] = "水面高度",
	["down 2 meters"] = "降低2米",
	["down 1 meter"] = "降低1米",
	["To current player's feet"] = "当前人物高度",
	["up 1 meter"] = "增高1米",
	["up 2 meters"] = "增高2米",
	["no water"] = "没水",
	["water color:"] = "水体颜色",
	["height:"] = "高度：",
	["Reset"] = "重置",
	["smooth"] = "平滑",
	["Roughen"] = "锐化",
	["Raise terrain"] = "增加地面高度",
	["Lower terrain"] = "降低地面高度",
	["Flatten terrain"] = "铲平地面",
	["Left click to paint\nRight click to erase"] = "鼠标左键绘制\n鼠标右键擦除",
	["Texture:"] = "贴图：",
	["base"] = "基层",
	["Name"] = "我叫",
	["change"] = "改名",
	["appearance"] = "外表",
	["change appearance or skin"] = "改变外表或皮肤",
	["save to disk"] = "保存到磁盘",
	["I am"] = "我是",
	["behavior"] = "行为",
	["only character can be given a type"] = "人物才能被赋予类型。",
	["I become a "] = "我变成了",
	["I can not be changed to a dummy completely, since you are controlling me now."] = "我没有能彻底成为木头人，因为你还在操纵我。",
	["Custom character is not available now."] = "自定人人物还没有...",
	["Only character can have behaviors."] = "人物才能被赋予动作。",
	["I am about to bla bla bla"] = "我要自言自语了..",
	["Let me wander near here."] = "我要闲逛了...",
	["I am a piggy now."] = "我是跟屁虫..",
	["I am a shopkeeper"] = "我要开张了...",
	["I want to sell."] = "我要卖菜了...",
	["Ah, I am a dummy now."] = "啊, 我没IQ了...",
	["the terrain brush size can only be within (0.1, 100)"] = "地表贴图刷子的大小只能在[0.1, 100]之间",
	["the height field brush size can only be within (5, 250)"] = "地形刷子的大小只能在[5, 250]之间",
	["I will go home now."] = "回家喽!!!",
	["I am already near my home."] = "我已经在家附近了!!!",
	["My home is right here."] = "我的家就在这里!!!",
	["Donot you see me? I am here!"] = "我在这, 你看不见我么!!!",
	["I can not change skin"] = "我不能更换皮肤\r\n",
	["rename failed: you can only change the name of a character, when you are not controlling it, and that the name should be identical."] = "改名失败：你只能为没有附身的人物改名，并且名字不能重复。",
	["character has been saved"] = "人物已保存",
	["I am not an NPC in this world, so I can not be saved."] = "我不是这个世界的NPC，所以不能被保存。",
	["When you click on me, I will speak:\n%s"] = "当你点击我时,我会说:\n%q",
	["Do you want to delete old drawing at \n%s?"] = "你是否要删除上次的图画\n%s?",
	["open file dialog: texture file extensions"] = {"全部 (*.jpg; *.png; *.dds; *.swf; *.flv)", "图片 (*.jpg; *.png; *.dds)", "动画 (*.swf; *.flv)", },
	["My work"] = "我的创作",
	["Media lib"] = "媒体库",
	["Advertisement"] = "广告",
	["Internet"] = "互联网",
	["Reset image"] = "清除图片",
	["Draw by myself"] = "我来自己画",
	["Open file..."] = "打开文件...",
	["Random images:"] = "随机图片:",
		
	-- right_container
	["Do you wish to restart the game?"] = "您希望重新开始游戏么？",
	["Do you wish to end the game?"] = "您希望结束游戏么？",
	["save current world"] = "保存当前世界",
	["system settings"] = "系统设置",
	["back one level\npress ESC key"] = "返回上一级\n按ESC键",
	["exit application"] = "退出程序",
	
	-- itembar
	["need a license to use"] = "您需要购买并注册本产品才能创建本物品。更多信息，请访问\n http://www.minixyz.com";
	
	-- settings
	["Display Mode"] = "显示方式",
	["FullScreen"] = "全屏显示",
	["Windowed"] = "窗口模式",
	["Graphics"] = "图形",
	["poor"] = "简",
	["low"] = "低",
	["med"] = "中",
	["high"] = "高",
	["super"] = "超",
	["Mouse"] = "鼠标",
	["Inverse Mouse"] = "反转鼠标",
	["View Distance"] = "可视距离",
	["Music Volume"] = "音量",
	["settings have been saved"] = "设置已经保存",
	-- world info control
	["world creator"] = "世界创建者",
	["world date"] = "日期",
	["world copyright"] = "版权声明",
	["world description"] = "世界描述",
	
	-- db_assets
	["asset_icon_building"] = "Texture/kidui/right/btn_bg1.png",
	["asset_text_building"] = "",
	["asset_tooltip_building"] = "建筑",
	
	["asset_icon_furniture"] = "Texture/kidui/right/btn_bg2.png",
	["asset_text_furniture"] = "",
	["asset_tooltip_furniture"] = "家具",
	
	["asset_icon_everyday"] = "Texture/kidui/right/btn_bg3.png",
	["asset_text_everyday"] = "",
	["asset_tooltip_everyday"] = "生活",
	
	["asset_icon_makeup"] = "Texture/kidui/right/btn_bg4.png",
	["asset_text_makeup"] = "",
	["asset_tooltip_makeup"] = "装饰",
	
	["asset_icon_grass"] = "Texture/kidui/right/btn_bg5.png",
	["asset_text_grass"] = "",
	["asset_tooltip_grass"] = "花草",
	
	["asset_icon_props"] = "Texture/kidui/right/btn_bg6.png",
	["asset_text_props"] = "",
	["asset_tooltip_props"] = "杂物",
	
	["asset_icon_character"] = "Texture/kidui/right/btn_bg7.png",
	["asset_text_character"] = "",
	["asset_tooltip_character"] = "人物",
	
	["asset_icon_trees"] = "Texture/kidui/right/btn_bg8.png",
	["asset_text_trees"] = "",
	["asset_tooltip_trees"] = "树木",
		
	-- tips of day
	["Texture/Tips/Tip1.png"] = "Texture/Tips/Tip1.png;0 0 403 256",
	["Texture/Tips/Tip2.png"] = "Texture/Tips/Tip2.png;0 0 403 256",
	["Texture/Tips/Tip3.png"] = "Texture/Tips/Tip3.png;0 0 403 256",
	["Texture/Tips/Tip4.png"] = "Texture/Tips/Tip4.png;0 0 403 256",
	["Texture/Tips/Tip5.png"] = "Texture/Tips/Tip5.png;0 0 403 256",
	["Texture/Tips/Tip6.png"] = "Texture/Tips/Tip6.png;0 0 403 256",
	["Texture/Tips/Tip7.png"] = "Texture/Tips/Tip7.png;0 0 403 256",
	["Texture/Tips/Tip8.png"] = "Texture/Tips/Tip8.png;0 0 403 256",
	["Texture/Tips/Tip9.png"] = "Texture/Tips/Tip9.png;0 0 403 256",
	["Texture/Tips/Tip10.png"] = "Texture/Tips/Tip10.png;0 0 403 256",
	["Texture/Tips/Tip11.png"] = "Texture/Tips/Tip11.png;0 0 403 256",
	["Texture/Tips/Tip12.png"] = "Texture/Tips/Tip12.png;0 0 403 256",
	["Texture/Tips/Tip13.png"] = "Texture/Tips/Tip13.png;0 0 403 256",
	["Texture/Tips/Tip14.png"] = "Texture/Tips/Tip14.png;0 0 403 256",
	["Texture/Tips/Tip15.png"] = "Texture/Tips/Tip15.png;0 0 403 256",
	["Texture/Tips/Tip16.png"] = "Texture/Tips/Tip16.png;0 0 403 256",
	["Texture/Tips/Tip17.png"] = "Texture/Tips/Tip17.png;0 0 403 256",
	["Texture/Tips/Tip18.png"] = "Texture/Tips/Tip18.png;0 0 403 256",
	["Texture/Tips/Tip19.png"] = "Texture/Tips/Tip19.png;0 0 403 256",
	["Texture/Tips/Tip20.png"] = "Texture/Tips/Tip20.png;0 0 403 256",
	["Texture/Tips/Tip21.png"] = "Texture/Tips/Tip21.png;0 0 403 256",
	["Texture/Tips/Tip22.png"] = "Texture/Tips/Tip22.png;0 0 403 256",
	["Texture/Tips/Tip23.png"] = "Texture/Tips/Tip23.png;0 0 403 256",
	["Texture/Tips/Tip24.png"] = "Texture/Tips/Tip24.png;0 0 403 256",
	["Texture/Tips/Tip25.png"] = "Texture/Tips/Tip25.png;0 0 403 256",
	["Texture/Tips/Tip26.png"] = "Texture/Tips/Tip26.png;0 0 403 256",
	["Texture/Tips/Tip27.png"] = "Texture/Tips/Tip27.png;0 0 403 256",
	["Texture/Tips/Tip28.png"] = "Texture/Tips/Tip28.png;0 0 403 256",
	["Texture/Tips/Tip29.png"] = "Texture/Tips/Tip29.png;0 0 403 256",
	["Texture/Tips/Tip30.png"] = "Texture/Tips/Tip30.png;0 0 403 256",
	["Texture/Tips/Tip31.png"] = "Texture/Tips/Tip31.png;0 0 403 256",
	["Texture/Tips/Tip32.png"] = "Texture/Tips/Tip32.png;0 0 403 256",
	["Texture/Tips/Tip33.png"] = "Texture/Tips/Tip33.png;0 0 403 256",
	["Texture/Tips/Tip34.png"] = "Texture/Tips/Tip34.png;0 0 403 256",
	["Texture/Tips/Tip35.png"] = "Texture/Tips/Tip35.png;0 0 403 256",
	["Texture/Tips/Tip36.png"] = "Texture/Tips/Tip36.png;0 0 403 256",
	["Texture/Tips/Tip37.png"] = "Texture/Tips/Tip37.png;0 0 403 256",
	["Texture/Tips/Tip38.png"] = "Texture/Tips/Tip38.png;0 0 403 256",
	["Texture/Tips/Tip39.png"] = "Texture/Tips/Tip39.png;0 0 403 256",
	["Texture/Tips/Tip40.png"] = "Texture/Tips/Tip40.png;0 0 403 256",
	
	-- Database
	["床"] = true,
	["椅子"] = true,
	["柜子"] = true,
	["架子"] = true,
	["屏风"] = true,
	["小床"] = true,
	["桌子"] = true,
	["石凳"] = true,
	["信箱"] = true,
	["小舟"] = true,
	["海盗船"] = true,
	["船浆"] = true,
	["帆船"] = true,
	["木笼"] = true,
	["桶"] = true,
	["瓶子"] = true,
	["盘子"] = true,
	["碗"] = true,
	["箱子"] = true,
	["绳子"] = true,
	["罐子"] = true,
	["花盆"] = true,
	["火堆"] = "篝火",
	["篝火"] = true,
	["烤鸡"] = true,
	["烤羊"] = true,
	["铁砧"] = true,
	["水车"] = true,
	["木桶"] = true,
	["水井"] = true,
	["箱子"] = true,
	["地毯"] = true,
	["竹篮"] = true,
	["鼓"] = true,
	["气球"] = true,
	["稻草人"] = true,
	["鸟巢"] = true,
	["艳丽小花"] = "小花",
	["花草"] = true,
	["花草群"] = "花草丛",
	["芦苇"] = true,
	["草"] = "小草",
	["仙人掌"] = true,
	["蘑菇"] = true,
	["大蘑菇"] = true,
	["大围栏石"] = true,
	["小围栏石"] = true,
	["草垛"] = true,
	["马车拖车"] = true,
	["巨大荆棘"] = true,
	["圆木堆"] = true,
	["宝箱"] = true,
	["石头"] = true,
	["围栏"] = true,
	["栅栏"] = true,
	["岩石"] = true,
	["CCTV"] = true,
	["男孩"] = true,
	["小狗"] = "狗狗",
	["女孩"] = "小姑娘",
	["海盗"] = true,
	["国王"] = true,
	["小牛"] = true,
	["小猪"] = true,
	["阿拉伯士兵"] = true,
	["卡丁车"] = true,
	["小猫"] = true,
	["小鱼"] = true,
	["海星"] = true,
	["直升机"] = true,
	["蝴蝶"] = true,
	["蝴蝶(动态)"] = true,
	["海鸥"] = true,
	["兔子"] = true,
	["树"] = true,
	["枫树"] = true,
	["松树"] = true,
	["竹林"] = true,
	["灌木林"] = "灌木丛",
	["绿色灌木"] = "灌木",
	["城镇中心"] = "礼堂",
	["市场"] = true,
	["杂货铺"] = true,
	["树屋"] = true,
	["民房"] = true,
	["售货车"] = true,
	["码头"] = true,
	["药店"] = true,
	["酒馆"] = true,
	["马棚"] = true,
	["高脚屋"] = true,
	["木桥"] = true,
	["宠物屋"] = "宠物房",
	["茅草亭"] = true,
	["路灯"] = true,
	["市场(空)"] = true,
	["shuiche"] = "水车",
	["computer"] = "电脑",	
	["Eva"] = "艾娃",
	["Baru"] = "巴鲁",
	["Dog"] = "小狗",
	["Fighter"] = "战士",	
	["椰子树"] = "椰子树",	
	["民房1"] = "民房",
	["民房2"] = "民房",	
	["长椅"] = true,	
	["垃圾桶"] = true,	
	["青蛙"] = true,	
	["蛇"] = true,	
	["松鼠"] = true,	
	["蜗牛"] = true,	
	["蝎子"] = true,	
	["蜘蛛"] = true,	
	["柳树"] = true,	
	["银行"] = true,	
	["教堂"] = true,	
	["医院"] = true,	
	["中学"] = true,	
	["草房"] = true,	
	["风车"] = true,	
	["喷泉"] = true,	
	["圣诞老人"] = true,	
	["龙"] = true,
	["皮特"] = true,
	["丹尼"] = true,
	["baru"] = "布尔",
	["古老银行"] = "银行",
	["鹿车"] = true,
	["玛丽亚"] = true,
	["城堡"] = true,
	["计算机"] = true,
	["旗子"] = true,
	["秋千"] = true,
	["电视机"] = true,
	["方向牌"] = true,
	["传送站"] = true,
	["灯笼"] = true,
	["哨塔"] = true,
	["微波炉"] = true,
	["云彩"] = true,
	
	
	-- ebook_db.lua
	["standard"] = "标准",
	["an empty book"] = "空白的书",
	["In this edition, you can only create books with no more than %d pages."] = "在本版中，您只能创建最多%d页的书",
	["Please enter a valid book name with letters only."] = "请输入一个有效的书名，书名只能由普通文字与字母组成",
	["Unable to create the book, perhaps you do not have access right to the disk directory."] = "无法创建图书，也许您没有足够的计算机权限。",
	["book already exist, please use a different book name."] = "这本书已经存在，请用一个不同的书名",
	["invalid zip file"] = "无效的图书文件",
	["This book is read only. It can not be saved."] = "这本书是只读的。它不能被保存。",
	["This book is read only. Page save is ignored."] = "这本书是只读的。页中内容的保存被忽略了。",
	["Failed saving file to "] = "保存到文件失败了，也许文件是只读的 ",
	["Successfully uploaded page %d: %s\n\n"] = "成功上传了第%d页：%s\n\n",
	["Your current account can not upload 3D EBook with page media extension %s\n"] = "您目前的帐户不能上传扩展名为%s的电子书插图\n",
	["Uploading ebook, please wait patiently...\n"] = "正在上传电子书，请耐心等待...\n",
	["This book is read-only. You can only publish a book which is editable."] = "这本书是只读的。您只能发布可以编辑的电子书。",
	["The EBook file %s already exists. Do you want to overwrite it?"] = "电子书%s已经存在，您是否希望覆盖它？",
	["The EBook %s is successfully generated and ready for publication. Do you want to open its folder with windows explorer?"] = "可以发行的电子书%s已经保存成功。是否用Windows浏览器打开图书所在目录?",
	
	-- ebook.lua
	["standard"] = "标准",
	["delux"] = "豪华",
	["simple"] = "简单",
	["default book does not exist "] = "缺省的图书不存在 ",
	["Enter your text here..."] = "文字",
	["Chapter %d"] = "第 %d 章",
	["Invalid texture path"] = "图片没有找到",
	["Click to enter the world of:\r\n%s"] = "点击进入世界:\r\n%s",
	["Texture/EBook/nextpage.png"] = true,
	["Texture/EBook/lastpage.png"] = true,
	["Open Help Book"] = "打开帮助图书",
	["Texture/EBook/ebook_bg.png"] = "Texture/EBook/ebook_bg.png;0 0 932 698",
	["Texture/EBook/menu_mybooks.png"] = true,
	["Texture/EBook/menu_newbook.png"] = true,
	["Texture/EBook/menu_downbook.png"] = true,
	["Texture/EBook/menu_publish.png"] = true,
	["Texture/EBook/menu_savebook.png"] = true,
	["Texture/EBook/menu_back.png"] = true,
	["Texture/EBook/menu_drawing.png"] = true,
	["Texture/EBook/menu_files.png"] = true,
	["Texture/EBook/menu_networking.png"] = true,
	["Texture/EBook/menu_audio.png"] = true,
	["Texture/EBook/menu_3dworlds.png"] = true,
	["Edit page title"] = "编辑页面标题",
	["Edit page content"] = "编辑页面内容",
	["Create a new page"] = "创建新的一页",
	["Delete current page"] = "删除当前页",
	["Lock/Unlock book"] = "锁定/解锁本书",
	["Do you want to save the screen shot of the current world to the book?\r\nCurrent book chapter is %s"] = "您希望将当前画面保存到书中么？\r\n当前的章节名为 %s",
	["Save(No GUI)"] = "保存(无界面)",
	["Save screen shot without 2D graphic user interface"] = "保存当前画面(但不包含2D界面)",
	["Save screen shot with everything"] = "保存当前画面(包含全部界面)",
	["Are you sure you want to delete the current page %s ?"] = "你确定要删除当前页(%s)么？",
	
	-- MainMenu.lua and mediamenu.lua
	["Delete"] = "删除",
	["Open"] = "打开",
	["Book Name"] = "书名",
	["Upload to web"] = "上传到网络",
	["Print"] = "打印",
	["Export Zip File"] = "导出Zip文件",
	["Chapter 1"] = "第 1 章",
	["Book successfully created. You can now edit the book."] = "成功的创建了图书。您可以编辑您的图书了。",
	["Please select a world from the list first"] = "请先从列表中选择一个世界",
	["World Path"] = "世界目录",
	["Create a world based on an existing world"] = "根据已有世界创建一个新世界",
	["Create an empty world"] = "创建一个空白的世界",
	["Use scene objects in the base world"] = "使用已有世界中的物体",
	["Use characters in the base world"] = "使用已有世界中的人物",
	["Start World"] = "开始世界",
	["Congratulations!"] = "恭喜！",
	["Screen Shot"] = "截图",
	["Movies"] = "电影",
	["All"] = "全部",
	["Clear"] = "清除",
	["Media Path"] = "媒体路径",
	["Maintain Aspect Ratio"] = "保持长宽比",
	["- Embed some body else's world in your book"] = "- 将朋友的世界收藏于书中",
	["- Corperatively build 3D world with others"] = "- 和朋友共同创建世界",
	["- Invite friends to help building your world"] = "- 邀请朋友访问你的世界",
	["Function is now in alpha test"] = "此功能正在Alpha测试阶段",
	["I want to participate!"] = "我要参加！",
	["Record"] = "录制",
	["Play"] = "播放",
	["Stop"] = "暂停",
	["Play my own voice (need a microphone)"] = "播放我的录音(需要麦克风)",
	["Play sound from a file"] = "播放文件",
	["sec"] = "秒",
	["Loop music"] = "循环播放",
	["the file specified does not exist."] = "指定的文件不存在。",
	["You are not able to record sound. Please make sure you have a microphone installed on your computer. And that you have write permission on system disk."] = "您无法录音: 也许你的计算机没安装麦克风，或者您没有磁盘访问权限。",
	["Your voice is now being recorded. Please speak in front of your microphone"] = "您的声音正在被录制； 请对着麦克风讲话。",
	["Auto save player position"] = "自动保存玩家位置",
	["Select a book below and click open button"] = "从列表中选择一本书，然后点击打开",
	["Enter book name and click OK button"] = "输入书名，然后点击确定按钮",
	["Download books from our web site"] = "从互联网上下载图书:",
	["Total Number of Books:"] = "图书总数:",
	["Most recent books:"] = "最近的书:",
	["%s(readonly)"] = "%s(只读)",
	["invalid book file"] = "无法打开",
	["return to book"] = "返回到图书\r\n右键点击保存并返回",
	["Are you sure you want to remove the associated world %s from this page?"] = "您确定要取消3D世界%s同这一页的连接么?",
	
	-- worldmanager.lua
	["Load World"] = "加载世界",
	["Load"] = "打开",
	["New World"] = "新建世界",
	["Select world from the list below and click Load button"] = "从下面列表中选择一个世界，然后点击打开按钮",
	["World Path"] = "世界路径",
	["Enter world name and click OK button"] = "输入世界名称，然后点击确定按钮",
	["You have successfully created a new world at:"] = "您成功的创建了一个新世界",
	["Are you sure you want to delete %s?\n Deleted files will be moved to %s."] = "您确定要删除%s么？\n删除后的文件将被移动到%s",
	["Unable to delete. Perhaps you do not have enough access rights"] = "无法删除，可能您没有足够的权限.",

	
	-- kids/ui\loadmaingameui.lua
	["Open or close movie box"] = "打开|关闭电影盒子",
	["Upload your work"] = "上传您的作品到我们的社区网站",
	["In order to upload your work, you need to login to our community web site"] = "您需要先登录我们的社区网站，才能上传作品",
	["Show or hide auto tips"] = "显示|隐藏 操作提示",
	
	
	-- kids/ui/registerproduct
	["In order to activate your product, you need to login to our community web site"] = "您需要注册并登陆我们的社区网站，才能激活您的产品.",
	["User name"] = "用户名",
	["Age"] = "年龄",
	["For better customer services, please also provide:"] = "为了更好的服务您，请填写：",
	["Please help us fill following required customer info"] = "请帮助我们填写下面必须的客户信息",
	["Country"] = "国家",
	["Product Key"] = "激活码",
	["Email"] = "电子邮件",
	["Where you heard of this product?"] = "您从哪里知道我们的产品的?",
	["RegProduct_WhereHeardOfCombo"] = {"从朋友", "从搜索引擎", "从网络论坛", "从下载网站", "从别人的文字或视频博客", "从学校", },
	["I would like to receive product news and updates"] = "我希望收到产品新闻与更新",
	["Your product registration information is submitted."] = "您的注册信息已经提交",
	["Thank you very much. We have received your product registration information."] = "十分感谢!我们已经收到了您的注册信息",
	["We have received your product registration information. But there is an error during processing."] = "我们已经收到了您的注册信息.但是我们在处理时遇到了问题，可能是您的输入有误",
	["Please fill in all required fields."] = "请填写所有必须的信息",
	
	-- SimpleNPCTalkEditor.lua
	["Copy"] = "复制",
	["Copy the dialog of this character to be applied on other characters"] = "将这个人物的对话复制下来，将来可以用于其他人物",
	["Paste"] = "粘贴",
	["Apply the last copied dialog on this character"] = "将上一次复制的对话，用于这个人物身上",
	["NPC Event Table"] = {"当你点击我时，我会说:", "当你走近我时，我会说:", "当你离开我时，我会说:", "当我发现你时，我会说:", "我每时每刻都会说:", },
	["Tips: Enter dialog text on the edit boxes, each paragraph on a single line, then click OK button."] = "提示: 在横线上输入对话文字，每行一段话，然后点击确定",
	["Insert Media..."] = "插入媒体...",
	["Wear !"] = "头戴！",
	["Whether to display a ! mark on the head of the character"] = "是否在人物头顶显示一个感叹号！",
	["Wear ?"] = "头戴？",
	["Whether to display a ? mark on the head of the character"] = "是否在人物头顶显示一个问号？",
	["Sound and image file extensions table"] = {"声音(*.wav)", "图像(*.png; *.jpg; *.dds)", "动画(*.swf; *.flv)", "全部(*.wav; *.png; *.jpg; *.dds; *.swf; *.flv)", },
	["Sound Lib"] = "声音库",
	
	-- UploadArtwork.lua
	["Open history files..."] = "打开历史文件...",
	["All my works"] = "我的全部作品",
	["Upload my screenshot"] = "上传我的作品截图",
	["History..."] = "历史...",
	["Upload"] = "上传",
	["Title:"] = "作品标题:",
	["Abstract:"] = "作品说明:",
	["Category:"] = "作品类别:",
	["Upload arkwork category table"] = {"科幻", "游戏", "美术", "电影", "体育", "音乐", "英语", "历史",  "其他", },
	["My screenshot"] = "我的作品截图",
	["Please wait until the last transmission is finished."] = "请等待上一个作品传输完毕",
	["Uploading your work to the community web, please wait..."] = "正在上传您的作品到社区网,请耐心等待..",
	["Unable to upload your work, your local file does not exist"] = "您的作品暂时无法上传到社区网; 本地文件不存在",
	["Screen shot successfully uploaded\n%s\nSending article, please wait...\n\n"] = "作品截图成功上传到了社区网:\n%s\n正在提交作品到社区, 请耐心等待...\n\n",
	["Unable to upload your work\n"] = "您的作品暂时无法上传到社区网\n",
	["We are unable to upload your work to the community website\n"] = "您的作品暂时无法上传到社区网\n",
	["Work successfully uploaded:\nURL is %s\nDo you want to view it in a web browser?\n\n"] = "作品成功上传到了社区网:\n作品地址为%s\n是否现在用浏览器打开?\n\n",
	
	-- KM_WorldDownloader.lua 
	["Synchronizing:"] = "正在同步世界:",
	["Hide download"] = "后台下载",
	["Enter world"] = "进入世界",
	["Successfully synchronized world, click enter world!"] = "成功同步了世界，请点击进入世界按钮",
	["Please wait. It may take a few minutes."] = "请耐心等待，首次下载时间会较长",
	["Download is terminated"] = "下载过程终止了",
	["Server connection is not found or broken"] = "无法连接远程的服务器或与之连接中断了",
	["Connecting remote server, please wait..."] = "正在连接服务器，请稍候...",
	["Successfully retrieved IP; now sync with the 3D space server..."] = "成功的从服务器获得了IP信息, 正在同步3D空间数据...",
	["This user does not have any public 3D world"] = "此用户没有提供可浏览的3D世界",
	["Space server type is not supported"] = "不支持用户的空间服务器类型",
	["The user does not have a space server"] = "此用户没有开通3D空间服务，您不能访问它的个人世界",
	["3D world file is 100% synchronized!"] = "世界文件100%同步了！",
	["Download is terminated"] = "下载中断了",
	["Now synchronizing 3D space data: %d/%d bytes"] = "正在同步3D空间数据: %d/%d 字节",
	["Now downloading today's recommended 3D world"] = "正在下载今天推荐的3D世界...",
	["No 3D world to download today"] = "今天没有推荐的3D世界可下载",
	["Connecting to "] = "正在连接:",
	
	-- KM_WorldUploader.lua
	["Publishing:"] = "发布世界:",
	["visit my web space"] = "访问我的小宇宙",
	["successfully uploaded your 3D world"] = "成功的发布了您的3D世界",
	["Upload is broken"] = "上传被中断了",
	["world format is not correct"] = "世界格式不对",
	["Your service of 3D space server is not open."] = "您没有申请开通在线3D空间服务",
	["Your world is too big; you need to apply to the administrators."] = "您的世界太大了，需要向管理员申请才能上传",
	["Uploading to %s; Total file size %d KB"] = "正在上传您的世界到 %s; 文件大小 %d KB",
	["Upload complete!"] = "上传完成了",
	
	-- auto tips
	["Tips:"] = "提示:",
	["press Ctrl key to sit!"] = "按Ctrl键坐在座位上",
	["press Ctrl key to change the building block!"] = "请用鼠标点击或按Ctrl键改变建筑模块!",
	["press Ctrl key to talk to it!"] = "按Ctrl键和人物对话",
	["press Shift key to mount on it!"] = "按Shift键驾驶",
	["press Space key to get off!"] = "按Space键可以跳下来",
	["press Shift key to switch to it!"] = "按Shift键切换人物",
	["press Esc key to cancel selection!"] = "按Esc键取消选择",
	["press Shift key and then Space key to get off!"] = "按Shift键,然后按Space键跳下来",
	["autotips"] = {
		[1] = "按住鼠标右键不放移动鼠标,同时按住W,A,S或D键可以控制人物",
		[2] = "按住鼠标左键不放移动鼠标,可以改变视角",
		[3] = "反复的按Space键,可以跳得更高",
		[4] = "按Esc键取消选择",
		[5] = "请经常保存您的世界",
		[6] = "您可以上传截图作品到社区网站,点击左下角的礼盒图标",
	},
} end);
