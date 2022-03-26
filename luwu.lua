-- work in progress be gentle

local function fileExists(fileName)
    local file = io.open(fileName, "rb")
    if file then file:close() return true else print("You gotta input an actual file BOZO") return false end
end

local function readLines(file)
    if not fileExists(file) then return {} end
    local luwuChunk = ""
    for line in io.lines(file) do
        luwuChunk = luwuChunk..line..'\n'
    end
    if luwuChunk == "" then return nil end
    return luwuChunk
end

for k, filename in ipairs(arg) do
    local currFileLines = readLines(filename)
    if not currFileLines then error("you need to input actual files") end
    local res = currFileLines   :gsub("fow", "for")
                                :gsub("duwu", "do")
                                :gsub("pwint", "print")
    io.open(filename:sub(1, -6)..".lua", "w"):write(res)
end
