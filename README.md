# Apocalypse & Chill

A minimal Project Zomboid (B42) mod that adds one new vending machine to
[PhunMart 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3689006725). The machine
sells VHS tapes.

It also works as a template. Copy it, rename things, and you have your own PhunMart shop
without touching PhunMart itself.

> **Requires:** PhunMart 2. This mod does nothing on its own.

## What's in it

```
Contents/mods/ApocalypseAndChill/common/
├── mod.info                                  require=phunmart2
└── media/
    ├── lua/shared/ApocalypseAndChill/
    │   ├── register.lua                      adds the three files below to PhunMart
    │   ├── groups.lua                        the items for sale, and their price
    │   ├── pools.lua                         which groups the shop draws from
    │   └── shops.lua                         the machine itself
    └── textures/phunmart/
        └── apocalypse-and-chill.png          the machine's look
```

How the pieces connect:

```
shops.lua      ApocalypseAndChill  ──poolSets──▶  pool_apocalypseandchill
pools.lua      pool_apocalypseandchill  ──groups──▶  apocalypseandchill_vhs
groups.lua     apocalypseandchill_vhs  ──items──▶  Base.VHS_Retail, Base.VHS_Home
```

## Making your own shop from this

1. Copy the folder and rename `ApocalypseAndChill` everywhere: the folder names, the `id` in
   `mod.info`, and the module paths in `register.lua`.
2. In `groups.lua`, list your items. Use full item IDs (`Base.Axe`), or swap `items` for
   `categories = {"Food"}` to sell a whole display category.
3. In `shops.lua`, set the `title` and `texture`.
4. Replace the texture PNG. PhunMart's
   [Machine Art Reference](https://github.com/PhunZoider/PhunMart/blob/main/Docs/MACHINE_ART.md)
   has the layout and an overlay to paint over.
5. Run `deploy.cmd`, enable both mods, and start a game.

Keep your keys prefixed with your mod name. Group, pool and shop keys are shared with
PhunMart and every other mod that extends it.

## Testing it

Machines appear in newly explored areas. To see one right away, open PhunMart's admin
window, go to the **Shops** tab, pick **Apocalypse & Chill** and use **Spawn Shop**.

## Going further

PhunMart's [extension guide](https://github.com/PhunZoider/PhunMart/blob/main/Docs/GUIDE_EXTENDING.md)
covers the rest: custom 2D tiles, keeping your own flags, shop window modes and admin tabs.
