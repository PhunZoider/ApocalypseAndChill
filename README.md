# Apocalypse & Chill

A minimal Project Zomboid (B42) mod that adds one new vending machine to
[PhunMart 2](https://steamcommunity.com/sharedfiles/filedetails/?id=3689006725). The machine
sells VHS tapes.

It also works as a template. Copy it, rename things, and you have your own PhunMart shop
without touching PhunMart itself.

> **Requires:** PhunMart 2. This mod does nothing on its own.

## Do you need a mod at all?

Maybe not. Admins can create shops, groups and pools in game from PhunMart's admin window,
with no mod.

What the admin window cannot do is add art. Every texture a machine can wear has to ship
inside a mod. So if your shop needs a look of its own, it needs to be a mod, and this is the
smallest one that works.

## What's in it

```
Contents/mods/ApocalypseAndChill/common/
├── mod.info                              require=phunmart2
└── media/
    ├── lua/shared/ApocalypseAndChill.lua the group, the pool and the shop
    └── textures/phunmart/
        └── apocalypse-and-chill.png      the machine's look
```

The three definitions in the Lua file chain together:

```
shop   ApocalypseAndChill       ──poolSets──▶  pool_apocalypseandchill
pool   pool_apocalypseandchill  ──groups────▶  apocalypseandchill_vhs
group  apocalypseandchill_vhs   ──items─────▶  Base.VHS_Retail, Base.VHS_Home
```

## Making your own shop from this

1. Copy the folder and rename `ApocalypseAndChill` everywhere: the folder names, the Lua
   file, the `id` in `mod.info`, and `MOD` in `deploy.cmd`.
2. In the Lua file, list your items in the group. Use full item IDs (`Base.Axe`), or swap
   `items` for `categories = {"Food"}` to sell a whole display category.
3. Set the shop's `title` and `texture`.
4. Replace the texture PNG. PhunMart's
   [Machine Art Reference](https://github.com/PhunZoider/PhunMart/blob/main/Docs/MACHINE_ART.md)
   has the layout and an overlay to paint over.
5. Run `deploy.cmd`, enable both mods, and start a game.

Keep your keys prefixed with your mod name. Group, pool and shop keys are shared with
PhunMart and every other mod that extends it.

## Deploying

`deploy.cmd` copies the mod to `%USERPROFILE%\Zomboid\mods` to play, and stages
`%USERPROFILE%\Zomboid\Workshop\ApocalypseAndChill` to upload. The Workshop upload also
needs a `preview.png` (256x256) next to `workshop.txt`.

In VS Code, install the recommended **Run on Save** extension and it runs `deploy.cmd` every
time you save.

## Testing it

Machines appear in newly explored areas. To see one right away, open PhunMart's admin
window, go to the **Shops** tab, pick **Apocalypse & Chill** and use **Spawn Shop**.

## Going further

PhunMart's [extension guide](https://github.com/PhunZoider/PhunMart/blob/main/Docs/GUIDE_EXTENDING.md)
covers the rest: custom 2D tiles, keeping your own flags, shop window modes and admin tabs.
