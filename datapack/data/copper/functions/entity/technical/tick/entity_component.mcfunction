scoreboard players operation #search copper.id = @s copper.id
execute as @e[tag=copper.living_entity] run function copper:entity/technical/check_id

execute at @e[tag=copper.owner] run tp @s[tag=!copper.no_tp] ~ ~ ~ ~ ~

tag @e remove copper.owner