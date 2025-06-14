# 0 - Sunny
# 1 - Rain
# 2 - Thunderstorm

scoreboard players set WEATHER more_info 0

# use the health of the rain detector as an indicator for the weather
scoreboard players set RAIN_DETECTOR_HEALTH more_info 0
execute store result score RAIN_DETECTOR_HEALTH more_info run data get entity @e[tag=rain_detector,limit=1] Health
# if the rain detector has lost health, then we have at least rain
execute if score RAIN_DETECTOR_HEALTH more_info matches ..99 run scoreboard players set WEATHER more_info 1


# respawn the rain detector with these properties
#	NoGravity
#	Silent
#	NoAI
#	Persistent
#	NoPumpkin
# 	Empty DeathLootTable
# 	100 Health
kill @e[tag=rain_detector,type=minecraft:snow_golem]
execute at @p run summon snow_golem ~ ~300 ~ {NoGravity:1b,Silent:1b,PersistenceRequired:1b,NoAI:1b,Pumpkin:0b,Tags:["rain_detector"], DeathLootTable:"/",Health:100f,attributes:[{id:"minecraft:max_health",base:100}]}


# if the storm timer is active and we detected rain, it is still stormy
execute if score WEATHER_STORM more_info matches 1.. if score WEATHER more_info matches 1.. run scoreboard players set WEATHER more_info 2


execute if score WEATHER more_info matches 0 run data modify storage more_info WeatherLabel set value "☀ Sunny"
execute if score WEATHER more_info matches 1 run data modify storage more_info WeatherLabel set value "🌧 Rainy"
execute if score WEATHER more_info matches 2 run data modify storage more_info WeatherLabel set value "⛈ Thunder"

