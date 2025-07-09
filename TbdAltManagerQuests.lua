

local addonName, TbdAltManagerQuests = ...;

local Quest =TbdAltManagerQuests.Quest;





























local Zones = {
    Misc = {
        { atlas = "groupfinder-background-dungeons", name = "Dungeons", fKeyCategory = "dungeons"}
    },
    Capitals = {
        { fileID = 135763, name = "Stormwind", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "stormwind-city" },
        { fileID = 135757, name = "Ironforge", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "ironforge" },
        { fileID = 135755, name = "Darnassus", fKeyCategory = "kalimdor", fKeySubCategory = "darnassus" },

        { fileID = 135759, name = "Orgrimmar", fKeyCategory = "kalimdor", fKeySubCategory = "orgrimmar" },
        { fileID = 135766, name = "Undercity", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "undercity" },
        { fileID = 135765, name = "Thunder Bluff", fKeyCategory = "kalimdor", fKeySubCategory = "thunder-bluff" },
    },
    Classic = {
        { atlas = "warboard-zone-classic-Azshara", name = "Azshara", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        { atlas = "warboard-zone-classic-Ashenvale", name = "Ashenvale", fKeyCategory = "kalimdor", fKeySubCategory = "ashenvale", },
        --{ atlas = "warboard-zone-classic-AzuremystIsle", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        --{ atlas = "warboard-zone-classic-BloodmystIsle", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        { atlas = "warboard-zone-classic-Darkshore", name = "Darkshore", fKeyCategory = "kalimdor", fKeySubCategory = "darkshore", },
        { atlas = "warboard-zone-classic-DunMorogh", name = "Dun Morogh", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "dun-morogh", },
        { atlas = "warboard-zone-classic-Durotar", name = "Durotar", fKeyCategory = "kalimdor", fKeySubCategory = "durotar", },
        { atlas = "warboard-zone-classic-ElwynnForest", name = "Elwynn Forest", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "elwynn-forest", },
        --{ atlas = "warboard-zone-classic-EversongWoods", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        --{ atlas = "warboard-zone-classic-Ghostlands", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        --{ atlas = "warboard-zone-classic-Gilneas", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        { atlas = "warboard-zone-classic-HillsbradFoothills", name = "Hillsbrad Foothills", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "hillsbrad-foothills", },
        { atlas = "warboard-zone-classic-LochModan", name = "Loch Modan", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "loch-modan", },
        --{ atlas = "warboard-zone-classic-LostIsles", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "azshara", },
        { atlas = "warboard-zone-classic-Mulgore", name = "Mulgore", fKeyCategory = "kalimdor", fKeySubCategory = "mulgore", },
        { atlas = "warboard-zone-classic-NorthernBarrens", name = "The Barrens", fKeyCategory = "kalimdor", fKeySubCategory = "the-barrens", },
        { atlas = "warboard-zone-classic-RedridgeMountains", name = "Redridge Mountains", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "redridge-mountains", },
        { atlas = "warboard-zone-classic-SilverpineForest", name = "Silverpine Forest", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "silverpine-forest", },
        --{ atlas = "warboard-zone-classic-SouthernBarrens", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "the-barrens", },
        { atlas = "warboard-zone-classic-Teldrassil", name = "Teldrassil", fKeyCategory = "kalimdor", fKeySubCategory = "teldrassil", },
        { atlas = "warboard-zone-classic-TirisfalGlades", name = "Tirisfal Glades", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "tirisfal-glades", },
        --{ atlas = "warboard-zone-classic-WanderingIsle", name = "", fKeyCategory = "kalimdor", fKeySubCategory = "wandering-isle", },
        { atlas = "warboard-zone-classic-Westfall", name = "Westfall", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "westfall", },
        { atlas = "warboard-zone-classic-ArathiHighlands", name = "Arathi Highlands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "arathi-highlands", },
        { atlas = "warboard-zone-classic-Badlands", name = "Badlands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "badlands", },
        { atlas = "warboard-zone-classic-BlastedLands", name = "Blasted Lands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "blasted-lands", },
        { atlas = "warboard-zone-classic-BurningSteppes", name = "Burning Steppes", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "burning-steppes", },
        --{ atlas = "warboard-zone-classic-CapeofStranglethorn", name = "", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "stranglethorn-vale", },
        { atlas = "warboard-zone-classic-Desolace", name = "Desolace", fKeyCategory = "kalimdor", fKeySubCategory = "desolace", },
        { atlas = "warboard-zone-classic-Duskwood", name = "Duskwood", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "duskwood", },
        { atlas = "warboard-zone-classic-DustwallowMarsh", name = "Dustwallow Marsh", fKeyCategory = "kalimdor", fKeySubCategory = "dustwallow-marsh", },
        { atlas = "warboard-zone-classic-EasternPlaguelands", name = "Eastern Plaguelands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "eastern-plaguelands", },
        { atlas = "warboard-zone-classic-Felwood", name = "Felwood", fKeyCategory = "kalimdor", fKeySubCategory = "felwood", },
        { atlas = "warboard-zone-classic-Feralas", name = "Feralas", fKeyCategory = "kalimdor", fKeySubCategory = "feralas", },
        { atlas = "warboard-zone-classic-Hinterlands", name = "Hinterlands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "hinterlands", },
        { atlas = "warboard-zone-classic-NorthernStranglethorn", name = "Stranglethorn Vale", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "stranglethorn-vale", },
        { atlas = "warboard-zone-classic-SearingGorge", name = "Searing Gorge", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "searing-gorge", },
        { atlas = "warboard-zone-classic-Silithus", name = "Silithus", fKeyCategory = "kalimdor", fKeySubCategory = "silithus", },
        { atlas = "warboard-zone-classic-StonetalonMountains", name = "Stonetalon Mountains", fKeyCategory = "kalimdor", fKeySubCategory = "stonetalon-mountains", },
        { atlas = "warboard-zone-classic-SwampofSorrows", name = "Swamp of Sorrows", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "swamp-of-sorrows", },
        { atlas = "warboard-zone-classic-Tanaris", name = "Tanaris", fKeyCategory = "kalimdor", fKeySubCategory = "tanaris", },
        { atlas = "warboard-zone-classic-ThousandNeedles", name = "Thousand Needles", fKeyCategory = "kalimdor", fKeySubCategory = "thousand-needls", },
        { atlas = "warboard-zone-classic-UngoroCrater", name = "Un'goro Crater", fKeyCategory = "kalimdor", fKeySubCategory = "ungoro-crater", },
        { atlas = "warboard-zone-classic-WesternPlaguelands", name = "Western Plaguelands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "western-plaguelands", },
        { atlas = "warboard-zone-classic-Wetlands", name = "Wetlands", fKeyCategory = "eastern-kingdoms", fKeySubCategory = "wetlands", },
        { atlas = "warboard-zone-classic-Winterspring", name = "Winterspring", fKeyCategory = "kalimdor", fKeySubCategory = "winterspring", },
    },
}
















TbdAltManagerQuestsZoneSelectButtonMixin = {}
function TbdAltManagerQuestsZoneSelectButtonMixin:OnLoad()
    
end



















local ItemQualityAtlas_Overlay = {
    [2] = "bags-glow-green",
    [3] = "bags-glow-blue",
    [4] = "bags-glow-purple",
    [5] = "bags-glow-orange",

    -- [2] = "loottab-set-itemborder-green",
    -- [3] = "loottab-set-itemborder-blue",
    -- [4] = "loottab-set-itemborder-purple",
    -- [5] = "loottab-set-itemborder-orange",
}

local ItemQualityAtlas_Borders = {
    [2] = "loottab-set-itemborder-green",
    [3] = "loottab-set-itemborder-blue",
    [4] = "loottab-set-itemborder-purple",
    [5] = "loottab-set-itemborder-orange",

    ["ff1eff00"] = "loottoast-itemborder-green",
    ["ff0070dd"] = "loottoast-itemborder-blue",
    ["ffa335ee"] = "loottoast-itemborder-purple",
    ["ffff8000"] = "loottoast-itemborder-orange",
}

TbdAltManagerQuestsItemButtonMixin = {}
function TbdAltManagerQuestsItemButtonMixin:SetItemByID(itemID)
    self.itemID = nil
    self.link = nil

    --xp reward spells
    if (itemID == 364063) or (itemID == 364064) or (itemID == 364060) or (itemID == 364062) then
        return
    end
    --print("SetItemByID", itemID)
    if type(itemID) == "number" then
        local _itemID, itemType, itemSubType, itemEquipLoc, icon, classID, subClassID = C_Item.GetItemInfoInstant(itemID)
        if icon and classID then
            local item = Item:CreateFromItemID(itemID)
            if not item:IsItemEmpty() then
                item:ContinueOnItemLoad(function()
                    if item.itemID then
                        self.Icon:SetTexture(item:GetItemIcon())
                        local quality = item:GetItemQuality()
                        if quality > 1 then
                            self.Border:SetAtlas(ItemQualityAtlas_Borders[quality])
                            self.Border:Show()
                        else
                            self.Border:Hide()
                        end
                        self.itemID = itemID
                        self.link = item:GetItemLink()

                    end
                end)
            end
        end
    end
end

function TbdAltManagerQuestsItemButtonMixin:OnLoad()
    self:SetScript("OnEnter", function()
        if self.itemID then
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetItemByID(self.itemID)
            GameTooltip:Show()
        end
    end)
    self:SetScript("OnClick", function()
        if self.link then
            HandleModifiedItemClick(self.link)
        end
    end)
end

function TbdAltManagerQuestsItemButtonMixin:OnLeave()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
end






































StaticPopupDialogs.WowheadQuestDialog = {
    text = "wowhead quest link",
    button1 = "OK",
    --button2 = 'Cancel',
    OnAccept = function(self)

    end,
    OnShow = function(self, data)
        self.editBox:SetText(string.format("https://www.wowhead.com/classic/quest=%d", data.questID))
        self.editBox:HighlightText()
    end,
    hasEditBox = true,
    timeout = 0,
    whileDead = true,
    hideOnEscape = false,
    preferredIndex = 3,
    showAlert = 1,
}


TbdAltManagerQuestsTreeviewItemTemplateMixin = {}
function TbdAltManagerQuestsTreeviewItemTemplateMixin:OnLoad()
    self.ChoiceRewardButtons = CreateFramePool("Button", self.ChoiceRewardsFrame, "TbdAltManagerQuestsItemButtonTemplate", function(_, but)
        but.Icon:SetTexture(nil)
        but.Border:SetTexture(nil)
        but:Hide()
        but:ClearAllPoints()
        but.itemID = nil
    end)
    self.RewardButtons = CreateFramePool("Button", self.RewardsFrame, "TbdAltManagerQuestsItemButtonTemplate", function(_, but)
        but.Icon:SetTexture(nil)
        but.Border:SetTexture(nil)
        but:Hide()
        but:ClearAllPoints()
        but.itemID = nil
    end)
    self.GoldRewardsFrame.Icon:SetTexture(133784)
    self.XpRewardsFrame.Icon:SetTexture(894556)
end

function TbdAltManagerQuestsTreeviewItemTemplateMixin:UpdateToggledState()
    if self:IsCollapsed() then
        self.parentRight:SetAtlas("Options_ListExpand_Right")
    else
        self.parentRight:SetAtlas("Options_ListExpand_Right_Expanded")
    end
end

function TbdAltManagerQuestsTreeviewItemTemplateMixin:OnClick(button)
    if not self.isParent then
        if button == "RightButton" then
            StaticPopup_Show("WowheadQuestDialog", nil, nil, { questID = self.questID})
        end
    end
end


function TbdAltManagerQuestsTreeviewItemTemplateMixin:SetDataBinding(binding)

    self.questID = binding.questID
    self.isParent = binding.isParent
    self.isSeries = binding.isSeries
    self.header = binding.header

    if binding.isParent == true then
        self.parentLeft:Show()
        self.parentRight:Show()
        self.parentMiddle:Show()

        self.label:SetFontObject(GameFontNormal)

        if binding.header then
            self.label:SetText(binding.header)
            self.label:SetFontObject(GameFontNormalLarge)
        else
            self.label:SetFontObject(GameFontNormal)
        end

        self.highlight:SetTexture(nil)
    
    else
        self.parentLeft:Hide()
        self.parentRight:Hide()
        self.parentMiddle:Hide()

        self.highlight:SetAtlas("search-highlight")

        if binding.isSingleQuest then
            self.label:SetFontObject(GameFontNormal)
        else
            self.label:SetFontObject(GameFontWhite)
        end

    end

    self:UpdateToggledState()
    
    self:OnQuestsChanged()
end



function TbdAltManagerQuestsTreeviewItemTemplateMixin:UpdateLabels()
    local questData = Quest:GetQuestData(self.questID)
    if questData then
        local title = questData.Title
        if Quest:IsQuestElite(self.questID) then
            title = string.format("%s %s", CreateAtlasMarkup("nameplates-icon-elite-gold", 16, 16), title)
        end

        if self.isSeries then
            self.label:SetText(string.format("%s %s", CreateAtlasMarkup("common-icon-rotateright", 12, 12), title))
        else
            self.label:SetText(title)
        end

        local completed = C_QuestLog.IsQuestFlaggedCompleted(self.questID)
        if completed then
            self.labelRight:SetText(CreateAtlasMarkup("common-icon-checkmark", 20, 20))
        end

        local readyForTurnIn = IsQuestComplete(self.questID)
        if readyForTurnIn then

        end

        local isOnQuest = C_QuestLog.IsOnQuest(self.questID)
        if isOnQuest then
            self.labelRight:SetText(CreateAtlasMarkup("QuestNormal", 20, 20))
            return
        end


        self.ChoiceRewardButtons:ReleaseAll()
        self.RewardButtons:ReleaseAll()
        local lastButton;
        if #questData.Rewards > 0 then
            for _, itemID in ipairs(questData.Rewards) do
                if (itemID == 364063) or (itemID == 364064) or (itemID == 364060) or (itemID == 364062) then
                    break
                end
                local button = self.RewardButtons:Acquire()
                button:SetItemByID(itemID)
                if not lastButton then
                    button:SetPoint("RIGHT", 0, 0)
                    lastButton = button;
                else
                    button:SetPoint("RIGHT", lastButton, "LEFT", -2, 0)
                    lastButton = button;
                end
                button:Show()
            end
            self.RewardsFrame:SetSize((#questData.Rewards * 24) + 2, 28)
            --self.RewardsFrame:Show()

        else
            self.RewardsFrame:SetSize(1, 28)
        end

        lastButton = nil;
        if #questData.ChoiceRewards > 0 then
            for _, itemID in ipairs(questData.ChoiceRewards) do
                if (itemID == 364063) or (itemID == 364064) or (itemID == 364060) or (itemID == 364062) then
                    break
                end
                local button = self.ChoiceRewardButtons:Acquire()
                button:SetItemByID(itemID)
                if not lastButton then
                    button:SetPoint("LEFT", 0, 0)
                    lastButton = button;
                else
                    button:SetPoint("LEFT", lastButton, "RIGHT", 2, 0)
                    lastButton = button;
                end
                button:Show()
            end
            self.ChoiceRewardsFrame:SetSize((#questData.ChoiceRewards * 24) + 2, 28)
            --self.ChoiceRewardsFrame:Show()
        else
            self.ChoiceRewardsFrame:SetSize(1, 28)
        end

        if questData.XP > 0 then
            local xp = Quest:GetQuestXPForLevel(self.questID, UnitLevel("player"))
            self.XpRewardsFrame.Label:SetText(xp)

            self.XpRewardsFrame:Show()
            self.GoldRewardsFrame:ClearAllPoints()
            self.GoldRewardsFrame:SetPoint("RIGHT", self.XpRewardsFrame, "LEFT", -2, 0)
        else
            self.XpRewardsFrame:Hide()

            self.GoldRewardsFrame:ClearAllPoints()
            self.GoldRewardsFrame:SetPoint("RIGHT", 0, 0)
        end

        if questData.Copper > 0 then
            self.GoldRewardsFrame.Label:SetText(C_CurrencyInfo.GetCoinTextureString(questData.Copper, 11))
            self.GoldRewardsFrame:Show()
        else
            self.GoldRewardsFrame:Hide()
        end

    end
end

function TbdAltManagerQuestsTreeviewItemTemplateMixin:OnQuestsChanged()
    if self.questID then
        if not self.isParent then
            self:UpdateLabels()
        else
            self.ChoiceRewardButtons:ReleaseAll()
            self.RewardButtons:ReleaseAll()
            self.GoldRewardsFrame:Hide()
            self.XpRewardsFrame:Hide()
            local questData = Quest:GetQuestData(self.questID)
            if questData then
                self.label:SetText(questData.Title)
            end
            if self.header then
                self.label:SetText(self.header)
            end
        end
    end
end

function TbdAltManagerQuestsTreeviewItemTemplateMixin:ResetDataBinding()
    self.parentLeft:Hide()
    self.parentRight:Hide()
    self.parentMiddle:Hide()

    self.label:SetText("")
    self.labelRight:SetText("")

    self.questID = nil;
    self.isParent = nil;
    self.isSeries = nil;

    self.GoldRewardsFrame.Label:SetText("")
    self.GoldRewardsFrame:Hide()
    self.XpRewardsFrame.Label:SetText("")
    self.XpRewardsFrame:Hide()

    self:SetScript("OnMouseUp", nil)
end

function TbdAltManagerQuestsTreeviewItemTemplateMixin:OnEnter()
    if self.questID and not self.isParent then

        local data = Quest:GetQuestData(self.questID)
        if data then

            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:SetHyperlink(string.format("|Hquest:%d", self.questID))

            if UnitLevel("player") < data.RequiresLevel then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine(RED_FONT_COLOR:WrapTextInColorCode(string.format("Requires level %d", data.RequiresLevel)))
            end

            if data.RequiredQuests and (#data.RequiredQuests > 0) then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine("Requires")
                for _, qid in ipairs(data.RequiredQuests) do
                    GameTooltip:AddLine(C_QuestLog.GetQuestInfo(qid), 1,1,1)
                end
            end


            if data.ReputationGains and next(data.ReputationGains) then
                GameTooltip:AddLine(" ")
                GameTooltip:AddLine(REPUTATION)
                for factionID, gain in pairs(data.ReputationGains) do
                    local factionName = GetFactionInfoByID(tonumber(factionID))
                    if factionName then
                        GameTooltip:AddDoubleLine(factionName, gain, 1,1,1)
                    end
                end
            end


            GameTooltip:AddLine(" ")
            GameTooltip:AddLine(BIND_TRADE_TOOLTIP_COLOR:WrapTextInColorCode(string.format("QuestID: %d", self.questID)))
            GameTooltip:Show()

        end
    end
end

function TbdAltManagerQuestsTreeviewItemTemplateMixin:OnLeave()
    GameTooltip_SetDefaultAnchor(GameTooltip, UIParent)
end

















--need to just keep a ref to the button to set a script later
local MenuEntryToggleButton;

TbdAltManagerQuestsMixin = {
    name = "Quests",
    menuEntry = {
        height = 40,
        template = "TbdAltManagerSideBarListviewItemTemplate",
        initializer = function(frame)
            frame.Label:SetText("Quests")
            frame.Icon:SetAtlas("QuestNormal")
            frame:SetScript("OnMouseUp", function()
                TbdAltsManager.Api.SelectModule("Quests")
            end)
            --MenuEntryToggleButton = frame.ToggleButton
            TbdAltsManager.Api.SetupSideMenuItem(frame, true, false)
        end,
    }
}
function TbdAltManagerQuestsMixin:OnLoad()
    TbdAltsManager.Api.RegisterModule(self)
    
    self.GridScrollBox = CreateFrame("Frame", "TbdAltManagerQuestGridScrollBox", self, "WowScrollBoxList")
    self.GridScrollBox:SetPoint("TOPLEFT", self, "TOPLEFT", 0, 0)
    self.GridScrollBox:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0)
    
    self.ScrollBox = CreateFrame("Frame", "TbdAltManagerQuestScrollBox", self, "WowScrollBoxList")
    self.ScrollBox:SetPoint("TOPLEFT", self, "TOPLEFT", 0, -30)
    self.ScrollBox:SetPoint("BOTTOMRIGHT", self, "BOTTOMRIGHT", 0, 0)
    self.ScrollBox:Hide()

    self.GridScrollBar = CreateFrame("EventFrame", "TbdAltManagerQuestsGridScrollBar", self, "MinimalScrollBar")
    self.GridScrollBar:SetPoint("TOPRIGHT", -8, -4)
    self.GridScrollBar:SetPoint("BOTTOMRIGHT", -8, 4)

    self.ScrollBar = CreateFrame("EventFrame", "TbdAltManagerQuestsScrollBar", self, "MinimalScrollBar")
    self.ScrollBar:SetPoint("TOPRIGHT", -8, -4)
    self.ScrollBar:SetPoint("BOTTOMRIGHT", -8, 4)
    self.ScrollBar:Hide()

    self:LoadZoneGridview()

    self.Back:Hide()
    self.Back:SetScript("OnClick", function()
        self.GridScrollBox:Show()
        self.GridScrollBar:Show()
        self.ScrollBox:Hide()
        self.ScrollBar:Hide()
        self.Back:Hide()
    end)

end

function TbdAltManagerQuestsMixin:LoadZoneGridview()

    local DataProvider = CreateDataProvider();
    local ScrollView = CreateScrollBoxListGridView(5, 0, 0, 0, 0, 5, 5)
    ScrollView:SetDataProvider(DataProvider);

    local function OnElementInitialize(elementFrame, elementData, isNew)
        if type(elementData.atlas) == "string" then
            elementFrame.Background:SetAtlas(elementData.atlas)
            elementFrame.Background:ClearAllPoints()
            elementFrame.Background:SetPoint("TOPLEFT", 6, -6)
            elementFrame.Background:SetPoint("BOTTOMRIGHT", -6, 6)

        elseif type(elementData.fileID) == "number" then
            elementFrame.Background:SetTexture(elementData.fileID)
            elementFrame.Background:ClearAllPoints()
            elementFrame.Background:SetPoint("CENTER", 0, 10)
            elementFrame.Background:SetSize(44, 44)

        end

        elementFrame.Label:SetText(elementData.name)

        elementFrame:HookScript("OnMouseUp", function()
            self:LoadZone(elementData)
        end)
    end

    local function OnElementReset(elementFrame)

    end

    ScrollView:SetElementInitializer("TbdAltManagerQuestsZoneSelectButtonTemplate", GenerateClosure(OnElementInitialize));
    ScrollView:SetElementResetter(GenerateClosure(OnElementReset));

    ScrollView:SetPadding(1, 1, 1, 1, 1);

    ScrollUtil.InitScrollBoxListWithScrollBar(self.GridScrollBox, self.GridScrollBar, ScrollView);

    local AnchorsWithBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 1, 0),
        CreateAnchor("BOTTOMRIGHT", self.GridScrollBar, "BOTTOMLEFT", -3, 1),
    };
    local AnchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 1, 0),
        CreateAnchor("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, 1),
    };
    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.GridScrollBox, self.GridScrollBar, AnchorsWithBar, AnchorsWithoutBar);

    table.sort(Zones.Classic, function(a, b)
        return a.atlas < b.atlas
    end)

    for _, zone in ipairs(Zones.Classic) do
        DataProvider:Insert(zone)
    end

    for _, zone in ipairs(Zones.Capitals) do
        DataProvider:Insert(zone)
    end

    for _, zone in ipairs(Zones.Misc) do
        DataProvider:Insert(zone)
    end

end

function TbdAltManagerQuestsMixin:LoadZone(zone)

    self.GridScrollBox:Hide()
    self.GridScrollBar:Hide()
    self.ScrollBox:Show()
    self.ScrollBar:Show()
    self.Back:Show()

    local DataProvider = CreateTreeDataProvider();
    local indent = 10;
	local padLeft = 0;
	local pad = 5;
	local spacing = 1;
    local ScrollView = CreateScrollBoxListTreeListView(indent, pad, pad, padLeft, pad, spacing);
    --ScrollView:SetDataProvider(DataProvider);

    ScrollView:SetElementExtent(28)

    local function OnElementInitialize(elementFrame, node)
        elementFrame:SetDataBinding(node:GetData())

        if node:GetData().isParent and node:GetData().header then
            elementFrame:HookScript("OnMouseUp", function()
                node:ToggleCollapsed()
                elementFrame:UpdateToggledState()
            end)
        else
            elementFrame:HookScript("OnMouseUp", function()

            end)
        end
    end

    local function OnElementReset(elementFrame)
        elementFrame:ResetDataBinding()
    end

    ScrollView:SetElementInitializer("TbdAltManagerQuestsTreeviewTemplate", OnElementInitialize);
    ScrollView:SetElementResetter(GenerateClosure(OnElementReset));

    ScrollView:SetPadding(1, 1, 1, 1, 1);

    ScrollUtil.InitScrollBoxListWithScrollBar(self.ScrollBox, self.ScrollBar, ScrollView);

    local AnchorsWithBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 1, -30),
        CreateAnchor("BOTTOMRIGHT", self.ScrollBar, "BOTTOMLEFT", -3, 1),
    };
    local AnchorsWithoutBar = {
        CreateAnchor("TOPLEFT", self, "TOPLEFT", 1, -30),
        CreateAnchor("BOTTOMRIGHT", self, "BOTTOMRIGHT", -1, 1),
    };
    ScrollUtil.AddManagedScrollBarVisibilityBehavior(self.ScrollBox, self.ScrollBar, AnchorsWithBar, AnchorsWithoutBar);


    if zone.fKeyCategory == "dungeons" then
        local dp = Quest:BuildDungeonQuestTreeDataProvider()
        ScrollView:SetDataProvider(dp);
        return
    end

    local dp = Quest:BuildQuestSeriesTreeDataProvider(zone.fKeyCategory, zone.fKeySubCategory)
    ScrollView:SetDataProvider(dp);

end