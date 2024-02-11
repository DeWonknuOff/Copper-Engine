execute if entity @s[tag=copper.raycast_removing] run function copper:entity/proyectile/removing/raycast/checks
execute if entity @s[tag=copper.motion_removing] run function copper:entity/proyectile/removing/motion/tick
execute if entity @s[nbt={OnGround:1b}] run function #copper:entity/event/proyectiles/destroy

execute if entity @s[tag=copper.mob_killer] if entity @e[nbt=!{Invulnerable:1b},distance=..3,type=!#copper:preset/inanimate,tag=!copper.proyectile,type=!player] run function #copper:entity/event/proyectiles/destroy

execute if entity @s[tag=copper.rotates] run function copper:entity/proyectile/rotate