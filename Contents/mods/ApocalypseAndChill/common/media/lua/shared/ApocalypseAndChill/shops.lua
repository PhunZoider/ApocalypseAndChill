-- Shops: one entry per machine, keyed by shop name.
return {
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
        -- Stock everything in its pools. For a bigger pool, use
        -- {mode = "weighted", count = {min = 4, max = 6}} to pick a few each restock.
        roll = {
            mode = "all"
        },
        poolSets = {{
            price = "currency_low",
            keys = {{
                key = "pool_apocalypseandchill",
                weight = 1.0
            }}
        }}
    }
}
