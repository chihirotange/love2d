table.removeItem = function(tbl, item)
    if not tbl or not item then
        return
    end
    for k, v in ipairs(tbl) do
        if v == item then
            table.remove(tbl, k)
        end
    end
end

table.clear = function(tbl)
    for k in pairs(tbl) do
        tbl[k] = nil
    end
end

table.shuffle = function(tbl)
    local len = #tbl
    local r, tmp
    math.randomseed(os.time())
    for i = 1, len do
        r = math.random(1, len)
        tmp = tbl[i]
        tbl[i] = tbl[r]
        tbl[r] = tmp
    end
end

table.pop = function(tbl)
    if not tbl then return end
    if #tbl == 0 then return end
    local item = tbl[#tbl]
    tbl[#tbl] = nil
    return item
end