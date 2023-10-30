-- These overrides have no effect on old versions of Lua,
-- since there are no upvalues, so locals are discarded
-- in function calls. 
-- Newer versions though, will keep the overrides in.
local strsub = strsub or string.sub
local strlen = strlen or string.len

function pack_string(input)
  local i = 0
  local len = strlen(input)
  local counts = {}
  local order = {}
  local unique_chars = 0

  while i < len do
    local char_str = strsub(input, i, i)
    local count = counts[char_str]
    if count == nil then
      counts[char_str] = 1
      order[unique_chars] = char_str
      unique_chars = unique_chars + 1
    else
      counts[char_str] = count + 1
    end
    i = i + 1
  end

  i = 0
  local result = ""
  while i < unique_chars do
    local char_str = order[i]
    local count = counts[char_str]
    while count > 0 do
      result = result .. char_str
      count = count - 1
    end
    i = i + 1
  end

  return result
end

pack_string(INPUT)
