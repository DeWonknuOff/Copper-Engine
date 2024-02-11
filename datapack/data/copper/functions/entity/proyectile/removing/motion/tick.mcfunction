execute if score @s copper.dummy2 matches 1 store result score @s copper.pos.x1 run data get entity @s Pos[0] 1
execute if score @s copper.dummy2 matches 1 store result score @s copper.pos.z1 run data get entity @s Pos[2] 1

execute if score @s copper.dummy2 matches 1 store result score @s copper.pos.y1 run data get entity @s Pos[1] 1

execute if score @s copper.dummy2 matches 2 store result score @s copper.pos.x2 run data get entity @s Pos[0] 1
execute if score @s copper.dummy2 matches 2 store result score @s copper.pos.z2 run data get entity @s Pos[2] 1

execute if score @s copper.dummy2 matches 2 store result score @s copper.pos.y2 run data get entity @s Pos[1] 1

execute if score @s copper.dummy2 matches 2 if score @s copper.pos.x1 = @s copper.pos.x2 if score @s copper.pos.z1 = @s copper.pos.z2 run function #copper:entity/event/proyectiles/destroy
execute if score @s copper.dummy2 matches 2 if score @s copper.pos.y1 = @s copper.pos.y2 run function #copper:entity/event/proyectiles/destroy

scoreboard players add @s copper.dummy2 1

execute if score @s copper.dummy2 matches 3.. run scoreboard players set @s copper.dummy2 1