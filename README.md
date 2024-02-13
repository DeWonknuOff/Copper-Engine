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
### Visuals

| Disclaimer |
i don't will longer support objmc for Optifine compatibility, youtubers love a lot this mod.

first, make your model in Animated Java with two animations: idle & moving.

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

summon husk ~ ~ ~ {Tags:["copper.entity","copper.living_entity","copper.new","foo.entity","foo.clown"],Silent:1b,DeathLootTable:"foo:entities/clown"}
execute as @e[tag=copper.new] store result score @s copper.id run scoreboard players add #global_entity copper.id 1

effect give @e[tag=copper.new] invisibility infinite 0 true

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
```mcfunction
function animated_java:clown/animations/pause_all
function animated_java:clown/animations/idle/play
```
```mcfunction
function animated_java:clown/animations/pause_all
function animated_java:clown/animations/walk/play
```
And, in your moving & idle tick functions put execute if entity @s with two tags, if and unless, there is an example
```mcfunction
execute if entity @s[tag=aj.clown.root,tag=!aj.clown.animation.idle] run function fat:entity/clown/animations/idle
```
```mcfunction
execute if entity @s[tag=aj.clown.root,tag=!aj.clown.animation.walk] run function fat:entity/clown/animations/walk
```
the tags work in this way : " aj. < animated java project name > .root " and "aj. < animated java project name > .animation. < animation name > ". The first tag is for all the rig roots and the second tag is for all rig root that are running the animation

now check if the entity is working fine.

![image](https://github.com/DeWonknuOff/Copper-Engine/assets/118708839/bc7db531-7966-47f8-ae6e-c15a650e39fb)

### Sounds
#### Ambient
add a function for filter all entities in their respective tick function (foo:entity/technical/tick)

```mcfunction
execute if entity @s[tag=fat.clown] run function fat:entity/clown/tick
```

make another function to handle the tick of your custom entity in your workspace (foo:entity/clown/tick)
and add it to "\copper\tags\functions\entity\scheduled\tick.json"

```json
{
    "values": [
        "copper:entity/technical/tick/main",
	"foo:entity/technical/tick"
    ]
}
```

and put inside it a predicate that plays a sound.

```mcfunction
execute if predicate copper:chance/0.01 run playsound minecraft:entity.chicken.ambient master @a ~ ~ ~ 1 0

```

#### Hurt
in your entity tick function add a execute if entity that detects if your custom entity has taken damage
```mcfunction
execute if predicate copper:chance/0.01 run playsound minecraft:entity.chicken.ambient master @a ~ ~ ~ 1 0
execute if entity @s[nbt={HurtTime:10s}] run playsound minecraft:entity.chicken.hurt master @a ~ ~ ~ 1 0

```
#### Death
add your entity loot table, i recommend use a jigsaw with custommodeldata in 999000 or your animated java item with custommodeldata in 1 (that items are invisible) and with a custom tag for the sound.

```json
{
  "pools": [
    {
      "rolls": 1,
      "entries": [
        {
          "type": "minecraft:item",
          "name": "minecraft:jigsaw",
          "functions": [
            {
              "function": "minecraft:set_nbt",
              "tag": "{CustomModelData:999000,foo:{entity:\"clown\"},copper:{id:\"death_item\"}}"
            }
          ]
        }
      ]
    }
  ]
}
```

and in your main tick function add a check for this drop that runs a function to play the sound & kills the item entity.
```mcfunction
execute as @e[type=item,nbt={Item:{tag:{copper:{id:"death_item"}}}}] at @s run function foo:entity/technical/sounds
```
```mcfunction
# > foo:entity/technical/sounds
execute if data entity @s {Item:{tag:{foo:{entity:"clown"}}}} run playsound minecraft:entity.chicken.death master @a ~ ~ ~ 1 0

kill @s
```

With this, finally we finished our custom entity. Trust me when i tell you that its easier than it seems.

## Right-Click Items and Projectiles

| Disclaimer |
because nonsense, i write "proyectile" instead of "projectile" so sorry for that big mistake, now the tutorial.

first, config the tag function "copper\tags\functions\item\warped_fungus_on_a_stick.json" with an function in your workspace :

```json
{
    "values": [
        "foo:item/warped_fungus_on_a_stick"
    ]
}
```
in the function, make a execute if data entity for detect if its an custom item and what item it is.

```mcfunction
execute if data entity @s SelectedItem{tag:{foo:{id:"potato_canon"}}} run function foo:item/potato_canon/click
```
make another json for get your item, in "foo\loot_tables\items\potato_canon"
```json
{
    "pools": [
      {
        "rolls": 1,
        "entries": [
          {
            "type": "minecraft:item",
            "name": "minecraft:warped_fungus_on_a_stick",
            "functions": [
              {
                "function": "minecraft:set_nbt",
                "tag": "{CustomModelData:1,fat:{id:\"potato_canon\"}}"
              }
            ]
          }
        ]
      }
    ]
  }
```
