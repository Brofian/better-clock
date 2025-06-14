function more_info:update/time


# check weather only so often
scoreboard players operation WEATHER_TICK more_info = TIME_TICK more_info
scoreboard players operation WEATHER_TICK more_info %= WEATHER_CHECK_TIME more_info
execute if score WEATHER_TICK more_info matches 0..10 run function more_info:update/weather


function more_info:update/bossbar
