local function deleteAllTargets()
    local count = 0
    
    local function traverseAndDelete(parent)
        local children = parent:GetChildren()
        for i = #children, 1, -1 do
            local child = children[i]
            traverseAndDelete(child)
            
            if string.match(string.lower(child.Name), ".*infector.*") then
                child:Destroy()
                count = count + 1
                print("已删除Infector对象: " .. child:GetFullName())
            end
        end
    end
    
    traverseAndDelete(workspace)
    
    local function safeDestroyByPath(path)
        local parts = string.split(path, ".")
        local current = workspace
        
        local startIndex = 1
        if parts[1] == "workspace" then
            startIndex = 2
        end
        
        for i = startIndex, #parts do
            local part = parts[i]
            current = current:FindFirstChild(part)
            if not current then
                print("路径不存在: " .. table.concat(parts, ".", 1, i))
                return false
            end
        end
        
        if current then
            current:Destroy()
            print("已删除路径对象: " .. path)
            return true
        end
        return false
    end
    
    local targetPaths = {
        "Map.System.SpotlightMap.ButtonSystem.HumanStats.Spotlights",
        "Map.System.BlackHole.ButtonSystem.BlackHole",
        "Map.ConstantTerrain.EventItems",
        "Map.System.ExhaustRoom.Spinners",
        "Map.Misc.Spearer.Spear1",
        "Map.Misc.Spearer.Spear2",
        "Map.Misc.Spearer.Spear3",
        "Map.Misc.Spearer.Lava",
        -- 新增的两个强制删除目标
        "Map.ConstantTerrain.KillGateSwitcher.Gate",
        "Map.System.BlackHole.Illumination",
        -- 新添加的两个强制删除目标
        "Map.System.Water",
        "Map.System.Sewers.SewageWater"
    }
    
    for _, path in ipairs(targetPaths) do
        if safeDestroyByPath(path) then
            count = count + 1
        end
    end
    
    local function deleteConstantTerrainByIndex()
        local map = workspace:FindFirstChild("Map")
        if not map then
            print("Map不存在")
            return false
        end
        
        local constantTerrain = map:FindFirstChild("ConstantTerrain")
        if not constantTerrain then
            print("Map.ConstantTerrain不存在")
            return false
        end
        
        local children = constantTerrain:GetChildren()
        local indicesToDelete = {36, 84, 85}
        local deletedCount = 0
        
        for _, index in ipairs(indicesToDelete) do
            if index >= 1 and index <= #children then
                local child = children[index]
                child:Destroy()
                count = count + 1
                deletedCount = deletedCount + 1
                print("已删除ConstantTerrain的第" .. index .. "个子对象: " .. child.Name)
            else
                print("ConstantTerrain的子对象索引 " .. index .. " 不存在，总子对象数: " .. #children)
            end
        end
        
        return deletedCount > 0
    end
    
    deleteConstantTerrainByIndex()
    
    local function deleteExhaustRoomChild50()
        local exhaustRoom = workspace:FindFirstChild("Map")
            and workspace.Map:FindFirstChild("System")
            and workspace.Map.System:FindFirstChild("ExhaustRoom")
        
        if exhaustRoom then
            local children = exhaustRoom:GetChildren()
            if #children >= 50 then
                local child50 = children[50]
                child50:Destroy()
                count = count + 1
                print("已删除ExhaustRoom的第50个子对象: " .. child50.Name)
                return true
            else
                print("ExhaustRoom的子对象数量不足50个")
            end
        else
            print("ExhaustRoom不存在")
        end
        return false
    end
    
    deleteExhaustRoomChild50()
    
    local function deleteVolcanoPitKillParts()
        local map = workspace:FindFirstChild("Map")
        if not map then
            print("Map不存在")
            return false
        end
        
        local system = map:FindFirstChild("System")
        if not system then
            print("Map.System不存在")
            return false
        end
        
        local volcanoPit = system:FindFirstChild("Volcano Pit")
        if not volcanoPit then
            print("Map.System['Volcano Pit']不存在")
            return false
        end
        
        local killParts = volcanoPit:FindFirstChild("KillParts")
        if not killParts then
            print("Map.System['Volcano Pit'].KillParts不存在")
            return false
        end
        
        killParts:Destroy()
        count = count + 1
        print("已删除Volcano Pit的KillParts")
        return true
    end
    
    deleteVolcanoPitKillParts()
    
    local function deleteMineshaftIndustryChildren()
        local map = workspace:FindFirstChild("Map")
        if not map then
            print("Map不存在")
            return false
        end
        
        local system = map:FindFirstChild("System")
        if not system then
            print("Map.System不存在")
            return false
        end
        
        local mineshaftIndustry = system:FindFirstChild("Isolated Mineshaft Industry")
        if not mineshaftIndustry then
            print("Map.System['Isolated Mineshaft Industry']不存在")
            return false
        end
        
        local children = mineshaftIndustry:GetChildren()
        local indicesToDelete = {400, 622, 621, 620}
        local deletedCount = 0
        
        for _, index in ipairs(indicesToDelete) do
            if index >= 1 and index <= #children then
                local child = children[index]
                child:Destroy()
                count = count + 1
                deletedCount = deletedCount + 1
                print("已删除Isolated Mineshaft Industry的第" .. index .. "个子对象: " .. child.Name)
            else
                print("Isolated Mineshaft Industry的子对象索引 " .. index .. " 不存在，总子对象数: " .. #children)
            end
        end
        
        return deletedCount > 0
    end
    
    deleteMineshaftIndustryChildren()
    
    local function deleteDesolateShelterLava()
        local map = workspace:FindFirstChild("Map")
        if not map then
            print("Map不存在")
            return false
        end
        
        local system = map:FindFirstChild("System")
        if not system then
            print("Map.System不存在")
            return false
        end
        
        local desolateShelter = system:FindFirstChild("Desolate Shelter")
        if not desolateShelter then
            print("Map.System['Desolate Shelter']不存在")
            return false
        end
        
        local effectBricks = desolateShelter:FindFirstChild("EffectBricks")
        if not effectBricks then
            print("Map.System['Desolate Shelter'].EffectBricks不存在")
            return false
        end
        
        local lava = effectBricks:FindFirstChild("Lava")
        if not lava then
            print("Map.System['Desolate Shelter'].EffectBricks.Lava不存在")
            return false
        end
        
        lava:Destroy()
        count = count + 1
        print("已删除Desolate Shelter的EffectBricks.Lava")
        return true
    end
    
    deleteDesolateShelterLava()
    
    local function deleteLumbermillLava()
        local map = workspace:FindFirstChild("Map")
        if not map then
            print("Map不存在")
            return false
        end
        
        local system = map:FindFirstChild("System")
        if not system then
            print("Map.System不存在")
            return false
        end
        
        local lumbermill = system:FindFirstChild("Lumbermill")
        if not lumbermill then
            print("Map.System.Lumbermill不存在")
            return false
        end
        
        local lava = lumbermill:FindFirstChild("Lava")
        if not lava then
            print("Map.System.Lumbermill.Lava不存在")
            return false
        end
        
        lava:Destroy()
        count = count + 1
        print("已删除Lumbermill的Lava")
        return true
    end
    
    deleteLumbermillLava()
    
    local function deleteLumbermillOtherTargets()
        local map = workspace:FindFirstChild("Map")
        if not map then
            print("Map不存在")
            return false
        end
        
        local system = map:FindFirstChild("System")
        if not system then
            print("Map.System不存在")
            return false
        end
        
        local lumbermill = system:FindFirstChild("Lumbermill")
        if not lumbermill then
            print("Map.System.Lumbermill不存在")
            return false
        end
        
        local deletedCount = 0
        
        local buttonSystem = lumbermill:FindFirstChild("ButtonSystem")
        if buttonSystem then
            local spawnLogs = buttonSystem:FindFirstChild("SpawnLogs")
            if spawnLogs then
                spawnLogs:Destroy()
                count = count + 1
                deletedCount = deletedCount + 1
                print("已删除Lumbermill.ButtonSystem.SpawnLogs")
            else
                print("Lumbermill.ButtonSystem.SpawnLogs不存在")
            end
        else
            print("Lumbermill.ButtonSystem不存在")
        end
        
        local conveyors = lumbermill:FindFirstChild("Conveyors")
        if conveyors then
            local fireBrick = conveyors:FindFirstChild("FireBrick")
            if fireBrick then
                fireBrick:Destroy()
                count = count + 1
                deletedCount = deletedCount + 1
                print("已删除Lumbermill.Conveyors.FireBrick")
            else
                print("Lumbermill.Conveyors.FireBrick不存在")
            end
            
            local furnace = conveyors:FindFirstChild("Furnace")
            if furnace then
                furnace:Destroy()
                count = count + 1
                deletedCount = deletedCount + 1
                print("已删除Lumbermill.Conveyors.Furnace")
            else
                print("Lumbermill.Conveyors.Furnace不存在")
            end
        else
            print("Lumbermill.Conveyors不存在")
        end
        
        return deletedCount > 0
    end
    
    deleteLumbermillOtherTargets()
    
    print("删除操作完成，共删除了 " .. count .. " 个对象")
end

deleteAllTargets()