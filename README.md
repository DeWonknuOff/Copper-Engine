# Copper-Engine
Datapack Library to my Youtuber-Related Datapacks

Helps to handle ticking and make custom projectiles

![icon](https://github.com/DeWonknuOff/Copper-Engine/assets/118708839/be3f6bf2-641f-44e2-937f-2673d89763e1)

# Usage

for start, set up the tag functions:

- #copper:scheduled/player/tick -> Player Tick.
- #copper:scheduled/player/clock_second -> Player Clock Second.
- #copper:event/proyectiles/destroy -> Function when a projectile will explode.
- #copper:event/aj/idle -> Tick for Animated Java models when their base mob is idle.
- #copper:event/aj/moving -> Tick for Animated Java models when their base mob is moving.
- #copper:item/warped_fungus_on_a_stick -> Function when used a Warped Fungus On A Stick on Main Hand (Useful for right-click items)

then you should add what its your datapack in a new function in your workspace

set up the tag function
- #copper:install_message

and add a function with a tellraw, you can just put the version on the tellraw or put it into a storage like [Manic](https://github.com/VisiVersa/Manic) of [VisiVersa](https://github.com/VisiVersa)

- foo:technical/first_load/install_message

```mcfunction
    tellraw @s {"text":"Tutorial Datapack yeei :D v.1.5","color":"gold"}
```

## Custom Entities

i don't will longer support objmc for Optifine compatibility, youtubers love a lot this mod.

first, make your model in Animated Java with two animations: idle & walk.

