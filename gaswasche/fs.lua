local fs = {}
function fs.readcsv(file)

    local lines, xvalues, yvalues = {}, {}, {}

    for line in assert(io.lines(file)) do
        table.insert(lines, line)
    end

    for i, line in ipairs(lines) do
        if i > 1 then
            local s, e = line:find("%s+", 1)
            local y = tonumber(line:sub(e))
            local x = tonumber(line:sub(1, e))
            xvalues[i - 1] = x
            yvalues[i - 1] = y
        end

    end

    return xvalues, yvalues

end

function fs.split(str, pat)
    local t = {} -- NOTE: use {n = 0} in Lua-5.0
    local fpat = "(.-)" .. pat
    local last_end = 1
    local s, e, cap = str:find(fpat, 1)
    while s do
        if s ~= 1 or cap ~= "" then
            table.insert(t, cap)
        end
        last_end = e + 1
        s, e, cap = str:find(fpat, last_end)
    end
    if last_end <= #str then
        cap = str:sub(last_end)
        table.insert(t, cap)
    end
    return t
end

return fs
