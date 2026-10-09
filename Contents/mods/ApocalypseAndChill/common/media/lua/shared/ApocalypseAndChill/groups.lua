-- Groups: lists of items, with a default price for each.
-- Keys are global across every mod, so prefix them with your mod's name.
return {
    apocalypseandchill_vhs = {
        defaults = {
            -- A price band from PhunMart/defaults/prices ($2.50 to $6.00).
            price = "currency_low",
            offer = {
                weight = 1.0
            }
        },
        items = {"Base.VHS_Retail", "Base.VHS_Home"}
    }
}
