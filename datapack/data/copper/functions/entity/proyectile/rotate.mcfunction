scoreboard players add @s copper.dummy 25
execute unless score @s copper.dummy matches 0 store result entity @s Pose.Head[2] float -1 run scoreboard players get @s copper.dummy
execute if score @s copper.dummy matches 360.. run scoreboard players set @s copper.dummy 0