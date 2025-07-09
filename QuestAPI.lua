

local _, TbdAltManagerQuests = ...;


--[[

    Breadcrumb quests, (the joy)

    This table should list any quest that acts as a breadcrumb, a situation where multiple quests exist to send the player to a specific target.
    
    At the moment the format will be [QuestID] = { breadcrumb1, breadcrumb2, }
    If the questID exists and is flagged complete the breadcrumbs can be flagged completed with the auth=addon

]]
local BreadcrumbQuests = {
    [1688] = {1685, 1715}, --Galkin summons
    [1599] = {1598}, --summon imp
    [1598] = {1599}, --summon imp
}


local ExclusiveQuests = {
    {1599, 1598}, --summon imp
    {1685, 1715}, --Galkin summons
}



local json = LibStub('JsonLua-1.0');
local QuestDataProvider = {}
local Quest = {}

function Quest:Init()
    local decodedQuestJson = json.decode(TbdAltManagerQuests.QuestData)
    for k, v in ipairs(decodedQuestJson) do
        QuestDataProvider[v.QuestID] = v;
    end
end

function Quest:CheckBreadcrumbQuests(questID)
    if BreadcrumbQuests[questID] then
       return BreadcrumbQuests[questID]
    end
end

function Quest:CheckExclusiveQuests(questID)
    for _, quests in ipairs(ExclusiveQuests) do
        if tContains(quests, questID) then
            return quests
        end
    end
end

--[[
    This function attempts to determine if quests prior in a quest series can be flagged completed (where breadcrumbs etc for example)
    
    If a quest is part of a series and is 3rd of 5 quests, and is flagged completed by blizzard then we can flag all quests before it 
    in the series as completed BUT with the flag addon in case we need to filter in the future
]]
function Quest:GetQuestSeriesCompletionData(questID)
    local questData = QuestDataProvider[questID]
    if questData then
        if #questData.Series > 1 then
            local ret = {}
            local firstQuestFlaggedCompleted
            for k, qid in ipairs(questData.Series) do
                if C_QuestLog.IsQuestFlaggedCompleted(qid) then
                    if firstQuestFlaggedCompleted == nil then 
                        firstQuestFlaggedCompleted = k
                    end
                    ret[qid] = {
                        completed = true,
                        authentication = "blizzard-api",
                    }
                else
                    ret[qid] = {
                        completed = false,
                        authentication = "none",
                    }
                end
            end
            if firstQuestFlaggedCompleted and (firstQuestFlaggedCompleted > 1) then
                for i = 1, (firstQuestFlaggedCompleted - 1) do
                    ret[questData.Series[i]] = {
                        completed = true,
                        authentication = "addon"
                    }
                end
            end
            return ret
        end
    end
end


function Quest:CanClassDoQuest(classID, questID)
    --print("class check: "..classID.. " "..questID)
    local questData = QuestDataProvider[questID]
    if questData then

        if #questData.Classes == 0 then
            return true
        end
        for k, v in ipairs(questData.Classes) do
            if v == classID then
                return true
            end
        end

        local _, className = GetClassInfo(classID)
        if questData.SubCategory == className:lower() then
            return true
        end
    end
end

function Quest:CanRaceDoQuest(raceID, questID)
    --print("race check: "..raceID.. " "..questID)
    local questData = QuestDataProvider[questID]
    if questData then
        if #questData.Races == 0 then
            return true
        end
        for k, v in ipairs(questData.Races) do
            if v == raceID then
                return true
            end
        end
    end
end

function Quest:CanFactionDoQuest(faction, questID)
    --print("faction check: "..faction.." "..questID)
    local questData = QuestDataProvider[questID]
    if questData.Faction == "Both" then
        return true
    else
        if questData.Faction == faction then
            return true
        end
    end
    return false
end

local xpReductions = {
    [6] = function(xp)
        return xp * 0.8
    end,
    [7] = function(xp)
        return xp * 0.6
    end,
    [8] = function(xp)
        return xp * 0.4
    end,
    [9] = function(xp)
        return xp * 0.2
    end,
}

function Quest:GetQuestXPForLevel(questID, unitLevel)

    local questData = QuestDataProvider[questID]
    if questData then
        
        if unitLevel <= (questData.Level + 5) then
            return questData.XP

        elseif unitLevel >= (questData.Level + 10) then
            return questData.XP * 0.1

        else
            if xpReductions[unitLevel - questData.Level] then
                return xpReductions[unitLevel - questData.Level](questData.XP)
            end
        end
    end

    return 0

end

function Quest:IsQuestRepeatable(questID)
    local questData = QuestDataProvider[questID]
    if questData then
        return questData.Repeatable
    end
    return false
end

function Quest:CanUnitDoQuest(questID, profile, ignoreLevel)
    local questData = QuestDataProvider[questID]
    if questData then
        local unitLevel, unitClass, unitRace, unitFaction = profile:GetQuestEligibilityData()

        if self:CanFactionDoQuest(unitFaction, questID) and self:CanClassDoQuest(unitClass, questData.QuestID) and self:CanRaceDoQuest(unitRace, questData.QuestID) then

            if ignoreLevel then
                return true
            else
                if unitLevel >= questData.RequiresLevel then
                    return true
                end
            end

        end
    end
    return false
end

local ImportantQuestCategories = {
    classes = true,
}

function Quest:IsQuestImportant(questID)
    local questData = QuestDataProvider[questID]
    if questData then
        if ImportantQuestCategories[questData.Category] then
            return true
        end
    end
    return false
end

function Quest:IsQuestElite(questID)
    local questData = QuestDataProvider[questID]
    if questData and questData.Type == "Elite" then
        return true
    end
    return false
end

function Quest:IterAllQuests()
    return pairs(QuestDataProvider)
end

function Quest:GetAllQuests()
    local t = {}
    for _, d in pairs(QuestDataProvider) do
        table.insert(t, d)
    end
    return t;
end

function Quest:GetQuestData(questID)
    local questData = QuestDataProvider[questID]
    if questData then
        return questData;
    end
end

function Quest:GetQuestsForMapID(mapID)
    local t = {}
    local mapName = TbdAltManagerQuests.Constants.MapZoneIdToName[mapID]
    if mapName then
        for k, questData in pairs(QuestDataProvider) do
            if questData.SubCategory == mapName then
                table.insert(t, questData)
            end
        end
    end
    return t;
end

function Quest:GetQuestsByKeyValue(key, val, partial)
    local t = {}
    for questID, questData in pairs(QuestDataProvider) do
        if partial then
            if questData[key]:find(val, nil, true) then
                table.insert(t, questData)
            end
        else
            if questData[key] == val then
                table.insert(t, questData)
            end
        end
    end
    return t;
end

function Quest:GetAllQuestsByCategory(category)
    local t = {}
    for questID, questData in pairs(QuestDataProvider) do
        if (questData.Category == category) then
            table.insert(t, questData)
        end
    end
    return t;
end

function Quest:GetAllQuestsBySubCategory(category, subCategory)
    local t = {}
    for questID, questData in pairs(QuestDataProvider) do
        if (questData.Category == category) and (questData.SubCategory == subCategory) then
            table.insert(t, questData)
        end
    end
    return t;
end

function Quest:GetClassQuests(classID)
    local _, className = GetClassInfo(classID)
    className = className:lower()

    local quests = self:GetAllQuestsBySubCategory("classes", className)
    return quests, className;
end


function Quest:BuildDungeonQuestTreeDataProvider()

    local quests = self:GetAllQuestsByCategory("dungeons")

    --DevTools_Dump(quests)

    table.sort(quests, function(a, b)
        return a.SubCategory < b.SubCategory
    end)

    local QuestDataTreeProvider = CreateTreeDataProvider()

    if (not quests) or (#quests == 0) then
        return
    end

    local playerToken = "player"
    local unitLevel, unitClass, unitRace, unitFaction = UnitLevel(playerToken), select(3, UnitClass(playerToken)), select(3, UnitRace(playerToken)), UnitFactionGroup(playerToken)

    local questsAdded = {}
    local nodes = {}

    for _, questData in ipairs(quests) do

        if (questsAdded[questData.QuestID] == nil) and self:CanClassDoQuest(unitClass, questData.QuestID) and self:CanRaceDoQuest(unitRace, questData.QuestID) and self:CanFactionDoQuest(unitFaction, questData.QuestID) then

            local dungeonName = strsplittable("-", questData.SubCategory)
            local t = {}
            for _, s in ipairs(dungeonName) do
                table.insert(t, (s:gsub("^%l", string.upper)))
            end


            if nodes[questData.SubCategory] == nil then
                nodes[questData.SubCategory] = QuestDataTreeProvider:Insert({
                    isParent = true,
                    questID = questData.QuestID,
                    header = table.concat(t, " "),
                })
                nodes[questData.SubCategory]:ToggleCollapsed()
            end

            if (#questData.Series > 0) then
                local node = nodes[questData.SubCategory]:Insert({
                    questID = questData.Series[1],
                    isParent = true,
                })
                questsAdded[questData.Series[1]] = true

                if #questData.Series > 1 then
                    for i = 1, #questData.Series do
                        node:Insert({
                            questID = questData.Series[i],
                            isSeries = true,
                        })
                        questsAdded[questData.Series[i]] = true
                    end
                end

            else
                nodes[questData.SubCategory]:Insert({
                    questID = questData.QuestID,
                    isSingleQuest = true
                })
                questsAdded[questData.QuestID] = true
            end


        end

    end

    return QuestDataTreeProvider

end


function Quest:BuildQuestSeriesTreeDataProvider(category, subCategory)

    --print(category, subCategory)

    local quests;
    if category and subCategory then
        quests = self:GetAllQuestsBySubCategory(category, subCategory)
    else
        quests = self:GetAllQuestsByCategory(category)
    end

    local questTreeDataProvider = CreateTreeDataProvider()

    if not quests then
        return questTreeDataProvider
    end

    local function SortQuests(a, b)
        return a.RequiresLevel < b.RequiresLevel;
    end

    local playerToken = "player"
    local unitLevel, unitClass, unitRace, unitFaction = UnitLevel(playerToken), select(3, UnitClass(playerToken)), select(3, UnitRace(playerToken)), UnitFactionGroup(playerToken)

    local questsAdded = {}

    table.sort(quests, SortQuests)

    if quests then

        --print("got quests for sub cat")
        --DevTools_Dump(quests)

        for _, questData in ipairs(quests) do

            if (questsAdded[questData.QuestID] == nil) and self:CanClassDoQuest(unitClass, questData.QuestID) and self:CanRaceDoQuest(unitRace, questData.QuestID) and self:CanFactionDoQuest(unitFaction, questData.QuestID) then

                --print("output", questData.QuestID)

                if (#questData.Series > 0) then
                    local node = questTreeDataProvider:Insert({
                        questID = questData.Series[1],
                        isParent = true,
                    })
                    questsAdded[questData.Series[1]] = true

                    if #questData.Series > 1 then
                        for i = 1, #questData.Series do
                            node:Insert({
                                questID = questData.Series[i],
                                isSeries = true,
                            })
                            questsAdded[questData.Series[i]] = true
                        end
                    end

                else
                    questTreeDataProvider:Insert({
                        questID = questData.QuestID,
                        isSingleQuest = true
                    })
                    questsAdded[questData.QuestID] = true
                end
            end
        end
    end

    return questTreeDataProvider;
end

Quest:Init()

TbdAltManagerQuests.Quest = Quest;