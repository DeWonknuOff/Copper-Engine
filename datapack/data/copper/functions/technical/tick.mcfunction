execute as @a at @s run function #copper:entity/scheduled/player/tick

execute as @e[tag=copper.entity,limit=25,sort=random,type=#copper:scheduled/tick] at @s run function #copper:entity/scheduled/tick
execute as @e[tag=aj.root] run function copper:entity/technical/tick/entity_component