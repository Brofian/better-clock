# 0 - Sunny
# 1 - Rain
# 2 - Thunderstorm

scoreboard players set WEATHER more_info 1

# use the health of the rain detector as an indicator for the weather
scoreboard players set RAIN_DETECTOR_HEALTH more_info 0
execute store result score RAIN_DETECTOR_HEALTH more_info run data get entity @e[tag=rain_detector,limit=1] Health
# if the rain detector has lost health, then we have at least rain
execute if score RAIN_DETECTOR_HEALTH more_info matches 100 run scoreboard players set WEATHER more_info 0


# respawn the rain detector with these properties
#	NoGravity
#	Silent
#	NoAI
#	Persistent
#	Empty DeathLootTable
# 	100 Health
# 	invisible
kill @e[tag=rain_detector,type=minecraft:blaze]
execute at @p run summon minecraft:blaze ~ 450 ~ {NoGravity:1b,Silent:1b,PersistenceRequired:1b,NoAI:1b,Pumpkin:0b,Tags:["rain_detector"], DeathLootTable:"/",Health:100f,attributes:[{id:"minecraft:max_health",base:100}], active_effects:[{id:"minecraft:invisibility",amplifier:1,duration:2000,show_particles:0b}]}


# if the storm timer is active and we detected rain, it is still stormy
execute if score WEATHER_STORM more_info matches 1.. if score WEATHER more_info matches 1.. run scoreboard players set WEATHER more_info 2


execute if score WEATHER more_info matches 0 run data modify storage more_info WeatherLabel set value "☀ Sunny"
execute if score WEATHER more_info matches 1 run data modify storage more_info WeatherLabel set value "🌧 Rainy"
execute if score WEATHER more_info matches 2 run data modify storage more_info WeatherLabel set value "⛈ Thunder"

