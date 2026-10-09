-- Tells PhunMart about this mod's definitions. This is the only contact
-- between the two mods.
--
-- PhunMart compiles its definitions long after every mod's shared Lua has
-- loaded, so adding our files to its lists here is enough for the shop to be
-- compiled, placed in the world and offered in the admin tools like any of
-- PhunMart's own.

if not PhunMart then
    print("[ApocalypseAndChill] PhunMart 2 is not loaded. This mod does nothing without it.")
    return
end

-- This file can run twice in one session, so never add the same path twice.
local function registerOnce(list, value)
    for _, existing in ipairs(list) do
        if existing == value then
            return
        end
    end
    table.insert(list, value)
end

registerOnce(PhunMart.defaultPaths.groups, "ApocalypseAndChill/groups")
registerOnce(PhunMart.defaultPaths.pools, "ApocalypseAndChill/pools")
registerOnce(PhunMart.defaultPaths.shops, "ApocalypseAndChill/shops")
