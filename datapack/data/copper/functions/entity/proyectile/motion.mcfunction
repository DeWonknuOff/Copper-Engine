# How to use:
#
# Run this function with an storage, i recomend to use the copper:storage
# but you can use any storage, there is an example to the values:
#
# x = 1000
# y = 800
# z = 1000

$execute store result score @s copper.motion.x1 run data get entity @s Pos[0] $(x)
$execute store result score @s copper.motion.y1 run data get entity @s Pos[1] $(y)
$execute store result score @s copper.motion.z1 run data get entity @s Pos[2] $(z)

tp @s ^ ^ ^-.1

$execute store result score @s copper.motion.x2 run data get entity @s Pos[0] $(x)
$execute store result score @s copper.motion.y2 run data get entity @s Pos[1] $(y)
$execute store result score @s copper.motion.z2 run data get entity @s Pos[2] $(z)

execute store result entity @s Motion[0] double 0.01 run scoreboard players operation @s copper.motion.x1 -= @s copper.motion.x2
execute store result entity @s Motion[1] double 0.01 run scoreboard players operation @s copper.motion.y1 -= @s copper.motion.y2
execute store result entity @s Motion[2] double 0.01 run scoreboard players operation @s copper.motion.z1 -= @s copper.motion.z2