-- Apocalypse & Chill: a PhunMart 2 vending machine that sells VHS tapes.
--
-- This one file is the whole mod. It hands PhunMart three tables:
--
--   group  apocalypseandchill_vhs    the items for sale, and their price
--   pool   pool_apocalypseandchill   which groups a shop draws its stock from
--   shop   ApocalypseAndChill        the machine itself
--
-- PhunMart compiles its definitions long after every mod's shared Lua has
-- loaded, so adding to its lists here is enough for the shop to be placed in
-- the world and to show up in the admin tools like any of PhunMart's own.
--
-- Keys are shared with PhunMart and every other mod that extends it, so
-- prefix yours with your mod's name.

if not PhunMart then
    print("[ApocalypseAndChill] PhunMart 2 is not loaded. This mod does nothing without it.")
    return
end

-- Groups: lists of items, with a default price for each.
table.insert(PhunMart.defaultPaths.groups, {
    apocalypseandchill_vhs = {
        defaults = {
            -- A price band from PhunMart/defaults/prices ($2.50 to $6.00).
            price = "currency_low",
            offer = {
                weight = 1.0
            }
        },
        -- Full item IDs. Or use categories = {"Entertainment"} to sell a whole
        -- display category.
        items = {"Base.VHS_Retail", "Base.VHS_Home"},
        -- A tape is one item with the movie attached afterwards. This sells
        -- every title as its own offer, and the tapes that teach a skill cost
        -- more. Leave it out for groups of ordinary items.
        recordings = {
            skill = {
                price = "currency_mid"
            }
        }
    }
})

-- Pools: what a shop draws its stock from, built out of one or more groups.
table.insert(PhunMart.defaultPaths.pools, {
    pool_apocalypseandchill = {
        sources = {
            groups = {"apocalypseandchill_vhs"}
        }
    }
})

-- Shops: one entry per machine, keyed by shop name.
table.insert(PhunMart.defaultPaths.shops, {
    ApocalypseAndChill = {
        -- Shown on screen. Without it the shop is labelled by its key.
        title = "Apocalypse & Chill",
        -- How often it appears compared to other shops (most use 15). 0 means
        -- admins place it by hand only.
        probability = 10,
        category = "Entertainment",
        -- media/textures/phunmart/apocalypse-and-chill.png, without the folder
        -- or extension. No sprites are given, so the machine stands on
        -- PhunMart's generic tiles and needs no tile pack.
        texture = "apocalypse-and-chill",
        -- Open the shop window as a list rather than a grid of icons. Every
        -- VHS shares one icon, so names read better than pictures.
        defaultView = "list",
        -- There are around 280 tapes, so show a handful each restock.
        roll = {
            mode = "weighted",
            count = {
                min = 12,
                max = 18
            }
        },
        poolSets = {{
            price = "currency_low",
            keys = {{
                key = "pool_apocalypseandchill",
                weight = 1.0
            }}
        }}
    }
})
