scoreboard players operation #search copper.id = @s copper.id
execute as @e[tag=aj.rig_root] run function copper:entity/technical/check_id

execute if predicate copper:entity/moving run scoreboard players add @s copper.step 1

execute if predicate copper:entity/moving as @e[tag=copper.owner,tag=!copper.animating] run function copper:entity/aj/tick/moving
execute unless predicate copper:entity/moving as @e[tag=copper.owner,tag=!copper.animating] run function copper:entity/aj/tick/idle

tag @e remove copper.owner
