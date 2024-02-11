execute unless block ~ ~-1 ~ #copper:air run return 0
scoreboard players add #reps copper.dummy 1
execute positioned ^ ^ ^.5 if score #reps copper.dummy matches 1..5 run function copper:entity/proyectile/removing/raycast/cast