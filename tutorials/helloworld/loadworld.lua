--[[ template: load a game world via dialog or function, it also contains the world database
author: [your name], original template by LiXizhi
date: 
Parameters:
Loadworld: it needs to be a valid name, such as "Loadworld"
use the lib:
------------------------------------------------------------
NPL.load("(gl)script/tutorials/helloworld/loadworld.lua");
NPL.activate("(gl)script/tutorials/helloworld/loadworld.lua","");
------------------------------------------------------------
]]
--requires
NPL.load("(gl)script/ide/gui_helper.lua");
NPL.load("(gl)script/ide/FileDialog.lua");

if(not Loadworld_db) then Loadworld_db={}; end

if(not LoadworldUI) then LoadworldUI={}; end
LoadworldUI.DefaultLoadWorld = "worlds/demo";

-- load a world immediately without doing any error checking or report. This is usually called by ParaIDE from the Load world menu. 
-- @param worldpath: string world path, such as "sample","worlds/demo"
function LoadworldUI.LoadWorldImmediate(worldpath)
	Loadworld_db.world.name = worldpath;
	Loadworld_db.UseDefaultFileMapping();
	if(LoadworldUI.LoadWorld() == true) then
		return true;
	else
		log("failed loading world"..worldpath);
	end
end

-- reset the scene
function LoadworldUI.reset()
	ParaScene.Reset();
	ParaUI.ResetUI();
	ParaAsset.GarbageCollect();
	ParaGlobal.SetGameStatus("disable");
	if(_AI~=nil and _AI.temp_memory~=nil) then
		_AI.temp_memory = {}
	end
	collectgarbage();
	log("scene has been reset\n");
end

-- clear the scene and load the world using the settings in the Loadworld_db, return false if failed.
function LoadworldUI.LoadWorld()
	-- clear the scene
	LoadworldUI.reset();
	
	if(Loadworld_db.world.sConfigFile ~= "") then
		-- disable the game 
		ParaScene.EnableScene(false);
		NPL.load("(gl)script/ide/LoaderUI.lua");
		CommonCtrl.LoaderUI.Start(100);
		CommonCtrl.LoaderUI.SetProgress(10);
		
		-- open archives
		--ParaAsset.OpenArchive ("xmodels/ParaWorldDemo.zip"); 
		
		--ParaAudio.PlayBGMusic("Loadworld_BG");
		CommonCtrl.LoaderUI.SetProgress(20);
		
		-- create world
		ParaScene.CreateWorld("", 32000, Loadworld_db.world.sConfigFile); 
		CommonCtrl.LoaderUI.SetProgress(30);
		
		-- load from database
		Loadworld_db.LoadWorldFromDB();
		CommonCtrl.LoaderUI.SetProgress(30);
		
		
		-- load game UI for different applications
		-- NPL.activate("(gl)script/templates/ui/LoadMainGameUI.lua");
		
		CommonCtrl.LoaderUI.SetProgress(100);
		-- we have built the scene, now we can enable the game
		ParaScene.EnableScene(true);
		CommonCtrl.LoaderUI.End();
		
		-- call the onload script for the given world
		local sOnLoadScript = ParaWorld.GetWorldDirectory().."onload.lua";
		if(ParaIO.DoesFileExist(sOnLoadScript)==true)then
			NPL.activate("(gl)"..sOnLoadScript);
		end

		return true;
	else
		return false;
	end
end
function LoadworldUI.LoadWorld_OnOK()
	-- load the world
	local tmp = ParaUI.GetUIObject("LoadWorld_name_txt");
	if(tmp:IsValid() == true) then 
		local sName = tmp.text;
		if(sName == "") then
			_guihelper.MessageBox("world name can not be empty");
		else
			Loadworld_db.world.name = sName;
			Loadworld_db.UseDefaultFileMapping();
			if(ParaIO.DoesFileExist(Loadworld_db.world.sConfigFile, true) == true) then
				if(LoadworldUI.LoadWorld() == true) then
						
				else
					_guihelper.MessageBox(Loadworld_db.world.name.."failed loading the world.");
					NPL.activate("(gl)script/tutorials/helloworld/loadworld.lua","");
				end
			else
				_guihelper.MessageBox(Loadworld_db.world.name.." world does not exist");
			end
		end
	end
end

function LoadworldUI.LoadWorld_OnCancel()
	ParaUI.Destroy("loadworld_cont");
	-- TODO: show last screen
	ParaGlobal.ExitApp();
end

function LoadworldUI.LoadWorld_OnWorldListSelect()
	local tmp = ParaUI.GetUIObject("listbox_worldnames");
	if(tmp:IsValid() == true) then 
		local sName = tmp.text;
		tmp = ParaUI.GetUIObject("LoadWorld_name_txt");
		if(tmp:IsValid() == true) then 
			tmp.text = Loadworld_db.worlddir..sName;
		end
	end
end

local function activate()
	local _this,_parent;
	_this = ParaUI.GetUIObject("loadworld_cont");
	if(_this:IsValid() == false) then 

		_this=ParaUI.CreateUIObject("container","loadworld_cont", "_ct",-195,-210,400,512);
		_this:AttachToRoot();
		_parent=_this;
		
		local left, top, width, height = 35, 80, 110, 25;
		--load world
		_this=ParaUI.CreateUIObject("text","s", "_lt",left, top, width, height);
		_parent:AddChild(_this);
		_this.text = "World Name";
		
		left, width = 145, 200
		_this=ParaUI.CreateUIObject("imeeditbox","LoadWorld_name_txt", "_lt",left, top,width,height);
		_parent:AddChild(_this);
		_this.text=LoadworldUI.DefaultLoadWorld;
		top = top+height+5;
		
		left = 32;
		width,height = 315,300;
		_this=ParaUI.CreateUIObject("listbox","listbox_worldnames", "_lt",left, top,width,height);
		_parent:AddChild(_this);
		_this.scrollable=true;
		
		_this.itemheight=15;
		_this.wordbreak=false;
		_this.onselect=";LoadworldUI.LoadWorld_OnWorldListSelect();";
		_this.ondoubleclick=";LoadworldUI.LoadWorld_OnOK();";
		_this.font="System;11;norm";
		_this.scrollbarwidth=20;
		
		-- list all sub directories in the User directory.
		CommonCtrl.InitFileDialog(ParaIO.GetCurDirectory(0)..Loadworld_db.worlddir,"*.", 0, 150, _this);
		top = top+height+10;
		
		width,height = 121,59
		--OK
		_this=ParaUI.CreateUIObject("button","ok", "_lt",35,top,width,height);
		_parent:AddChild(_this);
		_this.text = "OK";
		_this.onclick=[[;LoadworldUI.LoadWorld_OnOK();]];

		--cancel
		_this=ParaUI.CreateUIObject("button","cance", "_lt",235,top,width,height);
		_parent:AddChild(_this);
		_this.text = "cancel";
		_this.onclick=";LoadworldUI.LoadWorld_OnCancel();";
	end	
end
NPL.this(activate);

----------------------------------------------------------
-- Loadworld_db
----------------------------------------------------------
-- world settings
if(not Loadworld_db.world) then Loadworld_db.world = {}; end
Loadworld_db.dbfile = "database/Loadworld.db";
Loadworld_db.defaultskymesh = CommonCtrl.Locale("IDE")("asset_defaultSkyboxModel");--the snow sky box
Loadworld_db.worlddir = "worlds/";
Loadworld_db.items = {};
Loadworld_db.world.name = "_noname";
Loadworld_db.world.shortname = "_noname";
Loadworld_db.world.sConfigFile = "";
Loadworld_db.world.sNpcDbFile = "";
Loadworld_db.world.sAttributeDbFile = "";
Loadworld_db.world.sBaseWorldCfgFile = "_emptyworld/_emptyworld.worldconfig.txt";
Loadworld_db.world.sBaseWorldAttFile = "_emptyworld/_emptyworld.attribute.db"
Loadworld_db.world.createtime = "2006-1-26";
Loadworld_db.world.author = "ParaEngine";
Loadworld_db.world.desc = "create world description";
Loadworld_db.world.terrain = {type=0, basetex=0, commontex=0};
Loadworld_db.world.env_set = 0;
Loadworld_db.world.sky = 0;
-- the default player position if the player has never been here before.
Loadworld_db.world.defaultPos = {x=255,y=255};--{x=130,y=95};
if(not Loadworld_db.world) then Loadworld_db.world = {}; end

-- player settings
if(not Loadworld_db.player) then Loadworld_db.player = {}; end
Loadworld_db.player.name = tostring(ParaNetwork.GetLocalNerveCenterName()); -- TODO: used to be "girlPC"
Loadworld_db.player.level = 0;

--[[ populate Loadworld_db.world struct from database 
if (name,password)==(_init_, paraengine), then the default world settings will be loaded from database.
we can also reserve some other world settings accounts.
]]
function Loadworld_db.LoadWorldFromDB(name, password)

	-- use default sky and fog
	ParaScene.CreateSkyBox ("MySkyBox", ParaAsset.LoadStaticMesh ("", Loadworld_db.defaultskymesh), 160,160,160, 0);
	ParaScene.SetFog(true, "0.7 0.7 1.0", 40.0, 120.0, 0.7);
	
	-- load last player location
	local db = ParaWorld.GetAttributeProvider();
	db:SetTableName("WorldInfo");
	local x,y,z;
	x = db:GetAttribute("PlayerX", Loadworld_db.world.defaultPos.x);
	y = db:GetAttribute("PlayerY", 0);
	z = db:GetAttribute("PlayerZ", Loadworld_db.world.defaultPos.y);
	
	-- ocean level
	local OceanEnabled = db:GetAttribute("OceanEnabled", false);
	local OceanLevel = db:GetAttribute("OceanLevel", 0);
	ParaScene.SetGlobalWater(OceanEnabled, OceanLevel);
	att = ParaScene.GetAttributeObjectOcean();
	att:SetField("OceanColor", {db:GetAttribute("OceanColor_R", 0.2), db:GetAttribute("OceanColor_G", 0.3), db:GetAttribute("OceanColor_B", 0.3)});
	
	-- load sky
	att = ParaScene.GetAttributeObjectSky();
	att:SetField("SkyMeshFile", db:GetAttribute("SkyMeshFile", Loadworld_db.defaultskymesh));
	att:SetField("SkyColor", {db:GetAttribute("SkyColor_R", 1), db:GetAttribute("SkyColor_G", 1), db:GetAttribute("SkyColor_B", 1)});
	att:SetField("SkyFogAngleFrom", db:GetAttribute("SkyFogAngleFrom", -0.05));
	att:SetField("SkyFogAngleTo", db:GetAttribute("SkyFogAngleTo", 0.6));
	
	-- load fog 
	att = ParaScene.GetAttributeObject();
	att:SetField("FogEnd", db:GetAttribute("FogEnd", 120));
	att:SetField("FogStart", db:GetAttribute("FogStart", 40));
	att:SetField("FogDensity", db:GetAttribute("FogDensity", 0.69));
	att:SetField("FogColor", {db:GetAttribute("FogColor_R", 1), db:GetAttribute("FogColor_G", 1), db:GetAttribute("FogColor_B", 1)});
	
	-- load camera settings
	att = ParaCamera.GetAttributeObject();
	att:SetField("FarPlane", db:GetAttribute("CameraFarPlane", 120));
	att:SetField("NearPlane", db:GetAttribute("CameraNearPlane", 0.5));
	att:SetField("FieldOfView", db:GetAttribute("FieldOfView", 1.0472));
	
	-- create the default player
	local PlayerAsset = db:GetAttribute("PlayerAsset", CommonCtrl.Locale("IDE")("asset_defaultPlayerModel"));
	local asset = ParaAsset.LoadParaX("", PlayerAsset);
	
	local player;
	local playerChar;
	player = ParaScene.CreateCharacter (Loadworld_db.player.name, asset, "", true, 0.35, 3.9, 1.0);
	player:SetPosition(x, y, z);
	player:SnapToTerrainSurface(0);
	player:GetAttributeObject():SetField("SentientField", 65535);--senses everybody including its own kind.
	-- set movable region: it will apply to all characters in this concise version.
	-- player:SetMovableRegion(16000,0,16000, 16000,16000,16000);
	ParaScene.Attach(player);
	playerChar = player:ToCharacter();
	playerChar:LoadStoredModel(213);
	playerChar:SetFocus();
	ParaCamera.FirstPerson(0, 5,0.4);
end

function Loadworld_db.SaveWorldToDB(name, password)
	local att, color;
	
	-- save last player location
	local db = ParaWorld.GetAttributeProvider();
	db:SetTableName("WorldInfo");
	local x,y,z = ParaScene.GetPlayer():GetPosition();
	db:UpdateAttribute("PlayerAsset", ParaScene.GetPlayer():GetPrimaryAsset():GetKeyName());
	db:UpdateAttribute("PlayerX", x);
	db:UpdateAttribute("PlayerY", y);
	db:UpdateAttribute("PlayerZ", z);
	--save ocean level.
	db:UpdateAttribute("OceanEnabled", ParaScene.IsGlobalWaterEnabled());
	db:UpdateAttribute("OceanLevel", ParaScene.GetGlobalWaterLevel());
	att = ParaScene.GetAttributeObjectOcean();
	color = att:GetField("OceanColor", {1, 1, 1});
	db:UpdateAttribute("OceanColor_R", color[1]);
	db:UpdateAttribute("OceanColor_G", color[2]);
	db:UpdateAttribute("OceanColor_B", color[3]);
	
	-- save sky
	att = ParaScene.GetAttributeObjectSky();
	local str = att:GetField("SkyMeshFile", Loadworld_db.defaultskymesh);
	db:UpdateAttribute("SkyMeshFile", str);
	color = att:GetField("SkyColor", {1, 1, 1});
	db:UpdateAttribute("SkyColor_R", color[1]);
	db:UpdateAttribute("SkyColor_G", color[2]);
	db:UpdateAttribute("SkyColor_B", color[3]);
	db:UpdateAttribute("SkyFogAngleFrom", att:GetField("SkyFogAngleFrom", -0.05));
	db:UpdateAttribute("SkyFogAngleTo", att:GetField("SkyFogAngleTo", 0.6));
	
	-- save fog 
	att = ParaScene.GetAttributeObject();
	db:UpdateAttribute("FogEnd", att:GetField("FogEnd", 120));
	db:UpdateAttribute("FogStart", att:GetField("FogStart", 40));
	db:UpdateAttribute("FogDensity", att:GetField("FogDensity", 0.69));
	color = att:GetField("FogColor", {1, 1, 1});
	db:UpdateAttribute("FogColor_R", color[1]);
	db:UpdateAttribute("FogColor_G", color[2]);
	db:UpdateAttribute("FogColor_B", color[3]);
	
	-- save camera settings
	att = ParaCamera.GetAttributeObject();
	db:UpdateAttribute("CameraFarPlane", att:GetField("FarPlane", 120));
	db:UpdateAttribute("CameraNearPlane", att:GetField("NearPlane", 0.5));
	db:UpdateAttribute("FieldOfView", att:GetField("FieldOfView", 1.0472));
end

-- populate Loadworld_db.player struct from database 
-- we may need to save player position in each world it visits.
function Loadworld_db.LoadPlayerFromDB(name, password)
	--TODO
end

--[[set the world name from which a new world is derived
@param name: a world name or "". if "" the "_emptyworld" is used and will be created if not exists.
@return : true if succeeded, nil if not.]]
function Loadworld_db.SetBaseWorldName(name)
	if(name == "") then
		name = "_emptyworld";
		-- if the empty world does not exist, the empty world will be created and used as the base world
		Loadworld_db.world.sBaseWorldCfgFile = ParaWorld.NewEmptyWorld("_emptyworld", 533.3333, 64);
		log(Loadworld_db.world.sBaseWorldCfgFile.."\n does not exist. _emptyworld is created and used as the base world to create the new world;\n");
	end
	local sWorldConfigName = Loadworld_db.GetDefaultWorldConfigName(name);
	local sWorldAttName = Loadworld_db.GetDefaultAttributeDatabaseName(name);
	
	if(ParaIO.DoesFileExist(sWorldAttName, false)) then	
		Loadworld_db.world.sBaseWorldAttFile = sWorldAttName;
	else	
		Loadworld_db.world.sBaseWorldAttFile = nil;
	end
	
	if(ParaIO.DoesFileExist(sWorldConfigName, true) == true) then	
		Loadworld_db.world.sBaseWorldCfgFile = sWorldConfigName;
		return true;
	end
end

function Loadworld_db.SetDefaultFileMapping(name)
	if(not name)then
		name = Loadworld_db.world.name;
	end
	Loadworld_db.world.sConfigFile = Loadworld_db.GetDefaultWorldConfigName(name);
	Loadworld_db.world.sNpcDbFile = Loadworld_db.GetDefaultNPCDatabaseName(name);
	Loadworld_db.world.sAttributeDbFile = Loadworld_db.GetDefaultAttributeDatabaseName(name);
end

-- use default world config name, npc db and attribute db.
function Loadworld_db.UseDefaultFileMapping()
	Loadworld_db.UseDefaultWorldConfigName();
	Loadworld_db.UseDefaultNPCDatabase();
	Loadworld_db.UseDefaultAttributeDatabase();
end

-- update world config file name from the world name
function Loadworld_db.UseDefaultWorldConfigName()
	if(Loadworld_db.world.name == "") then
		Loadworld_db.world.sConfigFile = "";
	else
		local name = Loadworld_db.world.name;
		Loadworld_db.world.sConfigFile = name.."/"..ParaIO.GetFileName(name)..".worldconfig.txt";
	end
end

--@param name: world directory name. such as "world/demo"
function Loadworld_db.GetDefaultWorldConfigName(name)
	return name.."/"..ParaIO.GetFileName(name)..".worldconfig.txt";
end

-- update npc database file name from the world name
function Loadworld_db.UseDefaultNPCDatabase()
	if(Loadworld_db.world.name == "") then
		Loadworld_db.world.sNpcDbFile = "";
	else
		local name = Loadworld_db.world.name;
		Loadworld_db.world.sNpcDbFile = name.."/"..ParaIO.GetFileName(name)..".NPC.db";
		ParaWorld.SetNpcDB(Loadworld_db.world.sNpcDbFile);
	end
end

--@param name: world directory name. such as "world/demo"
function Loadworld_db.GetDefaultNPCDatabaseName(name)
	return name.."/"..ParaIO.GetFileName(name)..".NPC.db";
end
-- update attribute database file name from the world name
function Loadworld_db.UseDefaultAttributeDatabase()
	if(Loadworld_db.world.name == "") then
		Loadworld_db.world.sAttributeDbFile = "";
	else
		local name = Loadworld_db.world.name;
		Loadworld_db.world.sAttributeDbFile = name.."/"..ParaIO.GetFileName(name)..".attribute.db";
		ParaWorld.SetAttributeProvider(Loadworld_db.world.sAttributeDbFile);
	end
end

--@param name: world directory name. such as "world/demo"
function Loadworld_db.GetDefaultAttributeDatabaseName(name)
	return name.."/"..ParaIO.GetFileName(name)..".attribute.db";
end

