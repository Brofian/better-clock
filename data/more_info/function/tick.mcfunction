# This file will be executed every tick


# if any lightning_bolt hits, mark the weather as stormy for a short time (60sec)
execute as @e[type=minecraft:lightning_bolt] run scoreboard players set WEATHER_STORM more_info 1200
execute if score WEATHER_STORM more_info matches 1.. run scoreboard players remove WEATHER_STORM more_info 1
