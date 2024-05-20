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