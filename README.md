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

- #minecraft:tick
- #minecraft:load

make sure that in the #minecraft:tick your datapack tick function is AFTER the copper engine tick function.

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

![image](https://github.com/DeWonknuOff/Copper-Engine/assets/118708839/d75d910d-49e3-4c4f-9f81-ebfa94e6825e)

then, export your model and think about an entity that may be the base-entity for our custom entity and add it to copper\tags\entity_types\scheduled\tick.json.

i will use the husk for my custom entity so i make a new function in my workspace to summon it and add it to the entity type.

```json
{
    "values": [
        "minecraft:husk"
    ]
}
```

the needed tags for living mobs (custom entities) are "copper.entity", "copper.living_entity" and "copper.new" this last is for put an new ID.

```mcfunction
# Use the fake player #global_entity for the ID because i used #global for player ID

summon husk ~ ~ ~ {Tags:["copper.entity","copper.living_entity","copper.new","foo.entity","foo.clown"]}
execute as @e[tag=copper.new] store result score @s copper.id run scoreboard players add #global_entity copper.id 1

function animated_java:<aj_project_name>/summon

tag @e remove copper.new

```

in the function tag "animated_java\tags\functions\ <aj_project_name>\on_summon\as_root.json" of your animated java model add a function of your workspace (foo:entity/technical/aj/initiate).

```json
{
	"replace": false,
	"values": [
		"foo:entity/technical/aj/initiate"
	]
}
```

add the function.

```mcfunction
scoreboard players operation @s copper.id = #global_entity copper.id

```

at this point you must configured the function tags to your workspace:

- #copper:event/aj/idle
- #copper:event/aj/moving

i recommend something like foo:entity/technical/aj/tick/idle & foo:entity/technical/aj/tick/moving for this.

make some other functions for run the animations correctly, "foo:entity/clown/animations/idle" "foo:entity/clown/animations/moving"
