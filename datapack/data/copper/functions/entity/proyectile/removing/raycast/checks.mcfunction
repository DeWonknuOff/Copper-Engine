scoreboard players set #reps copper.dummy 0
execute rotated 0 90 positioned ~ ~-1 ~ run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy

scoreboard players set #reps copper.dummy 0
execute rotated 0 -90 positioned ~ ~1 ~ run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy

scoreboard players set #reps copper.dummy 0
execute rotated 90 0 positioned ~-1 ~ ~ run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy

scoreboard players set #reps copper.dummy 0
execute rotated 0 0 positioned ~ ~ ~1 run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy

scoreboard players set #reps copper.dummy 0
execute rotated -90 0 positioned ~1 ~ ~ run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy

scoreboard players set #reps copper.dummy 0
execute rotated -180 0 positioned ~ ~ ~-1 run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy

scoreboard players set #reps copper.dummy 0
execute rotated as @s run function copper:entity/proyectile/removing/raycast/cast
execute unless score #reps copper.dummy matches 4.. run function #copper:entity/event/proyectiles/destroy