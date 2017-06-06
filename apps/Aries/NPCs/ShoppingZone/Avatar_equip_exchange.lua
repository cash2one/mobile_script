--[[
Title: code behind for Avatar_equip_exchange.lua
Author(s): WD
Date: 2011/09/24

use the lib:
------------------------------------------------------------
purpose:equipment exchange for teen version

NPL.load("(gl)script/apps/Aries/DefaultTheme.teen.lua");
MyCompany.Aries.Theme.Default:Load();
NPL.load("(gl)script/apps/Aries/NPCs/ShoppingZone/Avatar_equip_exchange.lua");
local Avatar_equip_exchange = commonlib.gettable("MyCompany.Aries.NPCs.ShoppingZone.Avatar_equip_exchange");
Avatar_equip_exchange.ShowPage();
------------------------------------------------------------
--]]

local ItemManager = Map3DSystem.Item.ItemManager;
local GetItemByID = ItemManager.GetGlobalStoreItemInMemory;
local GetItemsCount = ItemManager.GetItemCountInBag;
local GetItemsInBag = ItemManager.GetItemsInBag;
local hasGSItem = ItemManager.IfOwnGSItem;
local ExtendedCost2 = ItemManager.ExtendedCost2;
local GetExtTemp = ItemManager.GetExtendedCostTemplateInMemory;
local GetExtendedCostTemplateFromItemCount = ItemManager.GetExtendedCostTemplateFromItemCount;
local getEquippedItem = ItemManager.GetEquippedItem;

local MSG = _guihelper.MessageBox;
local echo = commonlib.echo;

--[[
	@param text:text passed to trim.
	@param char_set:character sets to be filter,e.g [,"b@!]
	@return:trimmed text is returned.
]]
function string_trim(text,char_set)
	if(not text or #text == 0)then return "" end
	if(not char_set)then return text end;

	local str_len1,str_len2 = #text,#char_set;
	local new_str = "";
	local bytecode1,bytecode2;
	local i1,i2;
	local opcode= {};
	local tochar = string.char;
	local tobyte = string.byte;
	
	for i1=1,str_len1 do
		bytecode1 = tobyte(text,i1);
		
		if(not opcode[bytecode1])then
			for i2=1,str_len2 do
				bytecode2 = tobyte(char_set,i2);
				if(bytecode1 == bytecode2)then
					opcode[bytecode1] = 0;
					break;
				end
			end
		end
		
		if(not opcode[bytecode1])then
			new_str = new_str .. tochar(bytecode1);
		end
		
	end
	return new_str;
end

NPL.load("(gl)script/apps/Aries/NPCs/ShoppingZone/Avatar_equipment_subpage.lua");

local Avatar_equip_exchange = commonlib.gettable("MyCompany.Aries.NPCs.ShoppingZone.Avatar_equip_exchange");
local Avatar_equipment_subpage = commonlib.gettable("MyCompany.Aries.NPCs.ShoppingZone.Avatar_equipment_subpage")

Avatar_equip_exchange._DEBUG = Avatar_equip_exchange._DEBUG or false;
function Avatar_equip_exchange:LOG(caption,obj)
	if(self._DEBUG)then
		echo(caption);
		echo(obj);
	end
end

Avatar_equip_exchange.RockGSID = 17144;
Avatar_equip_exchange.CostMoney_FACTOR = 500;
Avatar_equip_exchange.ExchangeExtra = {};
Avatar_equip_exchange.CostQidou = 0;
Avatar_equip_exchange.HighEquipTable = {{value="-- 请选择换购装备 --",selected = true,},};
Avatar_equip_exchange.DesiredEquip = {gsid= -999,guid=-999,name=""};
Avatar_equip_exchange.DesiredEquipTable = {};
--Avatar_equip_exchange.ExchangableEquipTable = {};
Avatar_equip_exchange.EquipRange = {1001,8999};
Avatar_equip_exchange.ExchangeRules = {};
Avatar_equip_exchange.PageSize = 6;
Avatar_equip_exchange.HasHighEquip = Avatar_equip_exchange.HasHighEquip or {}
--specify cfg file for equip exchange
Avatar_equip_exchange.file_path = "config/Aries/Others/equip_exchange.csv";

--avaiable equip gsid on range between [1001,8999]

function Avatar_equip_exchange:Init()
	self.page = document:GetPageCtrl();
	Avatar_equip_exchange:UpdateExtraMaterials()

	if(Avatar_equipment_subpage and Avatar_equipment_subpage.IncomingEquip.guid) then
		self.page:SetValue("IncomingEquipGuid",Avatar_equipment_subpage.IncomingEquip.guid or -999);
		self.DesiredEquip.gsid = self.DesiredEquipTable[Avatar_equipment_subpage.IncomingEquip.gsid];

	end

	if(self.DesiredEquip.gsid)then
		self.page:SetValue("DesiredEquipGsid",self.DesiredEquip.gsid or -999);
		local mcmlNode = self.page:GetNode("DesiredEquipGsid");
		if(mcmlNode)then
			mcmlNode:SetAttribute("tooltip", self:GetDesiredEquipInfo());
		end
	end

	if(Avatar_equipment_subpage.filter ~= 0) then
		self.page:SetValue("tabsEquipments",tostring(Avatar_equipment_subpage.filter));
	end

		--if(Avatar_equipment_subpage.IncomingEquip.qty >= 3)then
		if(self.lastSelectedGuid ~= Avatar_equipment_subpage.IncomingEquip.guid)then
			self.lastSelectedGuid = Avatar_equipment_subpage.IncomingEquip.guid
			--self:ResetStates();
			--self.HighEquipTable = {{value="-- 请选择换购装备 --",selected = true,},};
			--avaiable
			--get all desired equip 
			--self:SetHighEquipTable();
			self.OnSelectEquip(true);
			--self.page:SetValue("DesiredEquipGsid",self.DesiredEquip.gsid or -999);
		end
	--else
		--[[if(#self.HighEquipTable == 1)then
			self.HighEquipTable = {{value="-- 没有可换购装备 --",selected = true,},};
			self.lastSelectedGuid =nil;
			self:ResetStates();
		end
		]]
	--end

end

function Avatar_equip_exchange.GetHoldRocks()
	local _, __, ___, copies = hasGSItem(Avatar_equip_exchange.RockGSID)
	return copies or 0;
end

function Avatar_equip_exchange.GetItemUnits(gsid)
	local has, _, _, copies = hasGSItem(gsid);
	return copies or 0;
end


function Avatar_equip_exchange:UpdateExtraMaterials()
	if(#Avatar_equip_exchange.ExchangeExtra > 0)then
		local i,v,copies
		for i,v in ipairs(Avatar_equip_exchange.ExchangeExtra)do
			copies = Avatar_equip_exchange.GetItemUnits(v.gsid)
			if(v.hold_cnt ~= copies)then
				v.hold_cnt = copies;
			end
		end
	end
end

--check one equip is defined in config
function Avatar_equip_exchange:IsExchangableEquip(gsid)
	local i,v;
	for i,v in ipairs(self.ExchangeRules)do
		if(v.gsid == gsid)then
			return true;
		end
	end
	return false;
end
--display desired equip tooltip
function Avatar_equip_exchange:GetDesiredEquipInfo()
    return "page://script/apps/Aries/Desktop/GenericTooltip_InOne.html?gsid="..MyCompany.Aries.NPCs.ShoppingZone.Avatar_equip_exchange.DesiredEquip.gsid.."&guid="..MyCompany.Aries.NPCs.ShoppingZone.Avatar_equip_exchange.DesiredEquip.guid .."&hdr=" .. "将要换购的装备";
end

function Avatar_equip_exchange:IsDesiredEquip(item)
	if(Avatar_equipment_subpage.IncomingEquip.subclass == (item.template.subclass or 0) and 
				(item.template.stats[221] or -1) >= Avatar_equipment_subpage.IncomingEquip.qty and
				(item.template.stats[138] or 1) > Avatar_equipment_subpage.IncomingEquip.level)then
		return true;
	end
	return false;
end

--load exchangeable equip rules
function Avatar_equip_exchange:LoadData()
	if(#self.ExchangeRules > 0)then return end
	local file = ParaIO.open(self.file_path, "r");
	
	if(file and file:IsValid())then
		local strValue = file:readline();
		while(strValue)do
			local new_table = {gsid,exid_list={}};
			local numb;
			for numb in string.gmatch(strValue,"(%d+)[%,]?") do
				if(not new_table.gsid)then
					new_table.gsid = tonumber(numb);
				else
					table.insert(new_table.exid_list,tonumber(numb));	
				end
			end
			
			table.insert(self.ExchangeRules,new_table);
			strValue = file:readline();
		end
		file:close();
	end

	self:LOG("self.ExchangeRules",self.ExchangeRules)
end

function Avatar_equip_exchange.GetCostQidou()
	if(Avatar_equip_exchange.CostQidou == 0)then
		return ""
	end
	return Avatar_equip_exchange.CostQidou
end

function Avatar_equip_exchange.GetHoldQidou()
	return MyCompany.Aries.Player.GetMyJoybeanCount() or 0
end

function Avatar_equip_exchange.ShowPage()
	local self = Avatar_equip_exchange;

	--load equip exchange config rules
	self:LoadData();

	Avatar_equipment_subpage:BindParent("EquipExchange",self);
	local width,height = 758,470;

	local params = {
			url = "script/apps/Aries/NPCs/ShoppingZone/Avatar_equip_exchange.html", 
			name = "Avatar_equip_exchange.ShowPage", 
			app_key=MyCompany.Aries.app.app_key, 
			isShowTitleBar = false,
			DestroyOnClose = true, -- prevent many ViewProfile pages staying in memory
			enable_esc_key = true,
			style = CommonCtrl.WindowFrame.ContainerStyle,
			allowDrag = true,
			directPosition = true,
			align = "_ct",
			x = -width * .5,
			y = -height * .5,
			width = width,
			height = height,}
	System.App.Commands.Call("File.MCMLWindowFrame", params);
	if(params._page)then
		params._page.OnClose = self.Clean;
	end
	Avatar_equipment_subpage:Update();
end

function Avatar_equip_exchange:Clean()
	Avatar_equipment_subpage:ResetStates(1);
	Avatar_equip_exchange:ResetStates();
end
function Avatar_equip_exchange:CloseWindow()
	self.page:CloseWindow();
end

function Avatar_equip_exchange:Refresh(delta)
	self.page:Refresh(delta or 0.1);
end

--load all upvalue equip of current equip,and fill to table for selection.
function Avatar_equip_exchange:SetHighEquipTable(gsid)
	local idx;
	gsid = gsid or Avatar_equipment_subpage.IncomingEquip.gsid
	local i,v;
	for i,v in ipairs(self.ExchangeRules)do
	if(v.gsid == gsid)then
		
		local exid_list = v.exid_list;
		if(exid_list)then
			local i2,v2;
			for i2,v2 in ipairs(exid_list)do
				local temp = GetExtTemp(v2);
				
				if(temp)then
					local tos = temp.tos;
					--echo(temp.tos);
						if(tos)then
							local i3,v3;
							for i3,v3 in ipairs(tos)do
								if(v3.key)then
									local item = GetItemByID(v3.key);
									--echo(item);
									if(item )then
										local equip = { value= item.template.name,selected = false,};
										table.insert(self.HighEquipTable,equip);
										if(not self.DesiredEquipTable[tostring(item.template.name)])then--build name/gsid table for look up.
											self.DesiredEquipTable[gsid] = item.gsid;
										end
									end
									local h = hasGSItem(v3.key)
									self.HasHighEquip[v.gsid] = if_else(h,true,false);
								end
							end
						end
					end
				end	
			end
		end
	end
	echo(self.HasHighEquip);
	if(Avatar_equip_exchange._DEBUG)then
	echo("self.HighEquipTable");
	echo(self.HighEquipTable);
	echo("self.DesiredEquipTable")
	echo(self.DesiredEquipTable);
	end
end

function Avatar_equip_exchange.GetHighEquipTable()
	local self = Avatar_equip_exchange;
	return self.HighEquipTable;
end

function Avatar_equip_exchange.OnSelectEquip(norefresh)
	local self = Avatar_equip_exchange;
	--local ddlDestEquipList = self.page:FindControl("ddlDestEquipList");
	self.ExchangeExtra = {};

	--[[if(ddlDestEquipList and ddlDestEquipList.GetValue)then
		if( "" == ddlDestEquipList:GetValue())then
			if(self.HighEquipTable and self.HighEquipTable[2] and self.HighEquipTable[2].value)then
				self.DesiredEquip.name = self.HighEquipTable[2].value
			else
				return;
			end
		elseif(ddlDestEquipList:GetValue() == "-- 请选择换购装备 --")then
			self.DesiredEquip.gsid = -999;
			self.DesiredEquip.name = "";
			local i,size = 1,#self.HighEquipTable;
			for i = 1,size do
				if(i > 1)then
					self.HighEquipTable[i].selected = false;
				else
					self.HighEquipTable[i].selected = true;					
				end
			end
		
			self:Refresh();
			return;
		else
			self.DesiredEquip.name = ddlDestEquipList:GetValue();
		end

		if(self.DesiredEquip.name and self.DesiredEquip.name ~= ""  and self.DesiredEquip.name ~= "-- 请选择换购装备 --" )then
			self.DesiredEquip.gsid = self.DesiredEquipTable[self.DesiredEquip.name];
		else
			self.DesiredEquip.name = "";
			return;
		end
		]]
		--if( self.DesiredEquip.gsid ==0)then 
			--self.lastSelectedGuid = 0; 
			--if(not norefresh)then 
				--self:Refresh(); 
			--end 
			--return; 
		--end;

		local i,v;
		--[[for i,v in ipairs(self.HighEquipTable)do
			if(v.value == self.DesiredEquip.name)then
				v.selected = true;
			else
				v.selected = false;
			end
		end
		]]
		for i,v in ipairs(self.ExchangeRules)do
			if(v.gsid == Avatar_equipment_subpage.IncomingEquip.gsid)then
				local exid_list = v.exid_list;
				self:LOG("exid_list",exid_list)
				
				if(exid_list)then
					local i2,v2;
					for i2,v2 in ipairs(exid_list)do
						self:LOG("exid",exid)
						local temp = GetExtTemp(v2);

						if(temp)then
							self:LOG("temp",temp)

							local tos = temp.tos;
							if(tos)then
								local i3,v3;
								for i3,v3 in ipairs(tos)do
									if(v3.key == self.DesiredEquip.gsid)then
										self.ExchangeId = v2;	

										local i4,v4;
										local froms = temp.froms;

										self:LOG("froms",froms)				

										for i4,v4 in ipairs(froms)do
											if(v4.key ~= v.gsid)then
												local hold_cnt = Avatar_equip_exchange.GetItemUnits(v4.key);
												table.insert(self.ExchangeExtra,{gsid = v4.key,count = v4.value;hold_cnt = hold_cnt});
											end
										end

										break;
									end
								end
								if(self.ExchangeId)then
									break;
								end
							end		
						end
					end
				end
				break;
			end
		end

		self:LOG("self.ExchangeExtra",self.ExchangeExtra)
		self:Refresh();
	--end
end

function Avatar_equip_exchange:ResetStates()
	self.DesiredEquip = {gsid=-999,guid=-999,name=""};
	--self.lastSelectedGuid = nil;
	self.ExchangeExtra = {};
	self.ExchangeId = nil;
end


function Avatar_equip_exchange:GetExchangeExtra(gsid)
	local i,v;
	local count = "";
	gsid = gsid or self.RockGSID;

	for i,v in ipairs(self.ExchangeExtra)do
		if(v.gsid == gsid)then
			count = v.count;
			break;
		end
	end
	return count;
end

function Avatar_equip_exchange:OnClickItem(arg)
	if(arg == "to")then
		
		local i,v;
		for i,v in ipairs(self.HighEquipTable)do
			if(i == 1)then
				v.selected = true;
			else
				v.selected = false;
			end
		end
		self:ResetStates();
		self:Refresh()
		return;
	end
	Avatar_equipment_subpage:ZeroIncomingEquip();
	self:ResetStates();
	self.lastSelectedGuid = nil;
	Avatar_equipment_subpage:Update(function() 
						self:Refresh(); 
					end);
end

function Avatar_equip_exchange:GetExtraMaterialsDataSource(index)
	self:LOG("self.ExchangeExtra",self.ExchangeExtra);
	local i;
	if(#self.ExchangeExtra == 0)then
		local size = 0;
		if(self.ExchangeExtra)then
			size = #self.ExchangeExtra;
		end
		local displaycount = math.ceil(size / self.PageSize) * self.PageSize;
		if(displaycount == 0)then
			displaycount = self.PageSize;
		end

		for i = size + 1,displaycount do
			self.ExchangeExtra[i] = { gsid = -999,count = -999, hold_cnt = 0};
		end
	end


	if(index == nil) then
		return #(self.ExchangeExtra);
	else
		return self.ExchangeExtra[index];
	end
end


function Avatar_equip_exchange.GetDesiredEquipGsid()
	local self = Avatar_equip_exchange;
	return (self.DesiredEquip.gsid or -999);
end
--[[
	open purchase window
--]]
function Avatar_equip_exchange.ShowPurchasePage()


end

function Avatar_equip_exchange:Check()
	if(Avatar_equipment_subpage and  Avatar_equipment_subpage.IncomingEquip.guid == -999) then
		return "请先选择一件装备再兑换！"
	end

	if(#self.HighEquipTable == 1)then return "该装备没有可兑换的装备！"  end
	if(not self.ExchangeId)then return "你还没有选择你想要的装备！" end
	if(Avatar_equipment_subpage.ContainsEquip)then
		if(Avatar_equipment_subpage:ContainsEquip(self.GetDesiredEquipGsid()))then return "你已经拥有该装备！";end
	end

	local i,v 
	for i,v in ipairs(self.ExchangeExtra)do
		if(v.count>v.hold_cnt)then
			return "兑换需要的材料不足了。"
		end
	end

	local item = GetItemByID(self.DesiredEquip.gsid);
	local equipped_item, isEquipped = getEquippedItem(item);
	if(isEquipped)then
		return "你已经拥有" .. (item.template.name or "该装备.")		
	end

end

--[[
	equip exchange
--]]
function Avatar_equip_exchange.EquipExchange(arg)
	local err = Avatar_equip_exchange:Check();
	if(err)then MSG(err) return end;
	local self = Avatar_equip_exchange

	if(self.ExchangeId and ExtendedCost2 and type(ExtendedCost2) == "function") then
		ExtendedCost2(self.ExchangeId,1,nil,nil,function(msg)
			if(msg) then
				if(msg.issuccess) then
					MSG("恭喜你，兑换装备成功！");
					Avatar_equipment_subpage:ZeroIncomingEquip();
					self:ResetStates();
					ItemManager.GetItemsInBag( 0, "0", function(msg)
					ItemManager.GetItemsInBag( 1, "0", function(msg)
					Avatar_equipment_subpage:Update();
					end,"access plus 0 seconds");
					end,"access plus 0 seconds");
					
				else
					MSG("装备兑换失败！");
					echo("EquipExchange is failed.");
				end
				self.ExchangeId = nil;
			end
		end,function(msg) end,function(msg) end);

	else
		echo("EquipExchange is not a valid function!");
	end
end