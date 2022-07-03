-- How to specify it programmatically (start and end of the range)?
local special_symbols = {
  -- Mathematical Alphanumeric Symbols (Range: 1D400—1D7FF).
  A = '𝐀',
  B = '𝐁',
  C = '𝐂',
  D = '𝐃',
  E = '𝐄',
  F = '𝐅',
  G = '𝐆',
  H = '𝐇',
  I = '𝐈',
  J = '𝐉',
  K = '𝐊',
  L = '𝐋',
  M = '𝐌',
  N = '𝐍',
  O = '𝐎',
  P = '𝐏',
  Q = '𝐐',
  R = '𝐑',
  S = '𝐒',
  T = '𝐓',
  U = '𝐔',
  V = '𝐕',
  W = '𝐖',
  X = '𝐗',
  Y = '𝐘',
  Z = '𝐙'
}

-- pos - index of a char to replace,
-- str - string we want to modify,
-- r - replacement char (char to replace).
local function replace_char(pos, str, r)
  -- Checking for nil pos (kind of ternary operator). 
  return not pos and str or str:sub(1, pos-1) .. r .. str:sub(pos+1)
end

-- TODO: use <https://github.com/delphinus/artify.nvim> 'artify.nvim'
-- Formats first found character according to dictionary of a special symbols.
-- str - string to format,
-- char - character to find.
local function format(str, char) 
  -- - Checking for nil str and characters that will be interpreted wrong (as regex?).
  if (not str or char == '.') then
    return str
  end

  -- - Case insensitive search because we have only capitals in dictionary.
  return replace_char(str:upper():find(char), str, special_symbols[char])
end

-- TOFIX: Prefer uppercase letters.
-- Iterates through mappings, applying `format` function.
local function format_mappings_names(mappings, group_mapping_key)
  local formatted_mappings = {} 

  -- If we get key like: '<space>gd' we will get an error, so get only last
  --   char.
  local group_mapping_key_char = group_mapping_key:sub(-1):upper();

  for key, mapping in pairs(mappings) do
    if (key == 'name') then
      -- Now have only capitals in dictionary so uppercasing.
      formatted_mappings[key] = format(mapping, group_mapping_key_char)
    else
      -- Analogous to group_mapping_key_char.
      local key_char = key:sub(-1):upper();

      -- Mapping group.
      if (mapping.name) then
        formatted_mappings[key] = format_mappings_names(mapping, key_char)
      else
        local mapping_name = mapping[2]

        -- Now have only capitals in dictionary so uppercasing.
        mapping[2] = format(mapping_name, key_char)
        formatted_mappings[key] = mapping
      end
    end
  end

  return formatted_mappings
end

return {
  format_mappings_names = format_mappings_names,
};
