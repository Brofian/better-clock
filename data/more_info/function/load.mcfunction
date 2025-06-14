# Create initial bossbar
bossbar add more_info_bb MoreInfo
bossbar set more_info_bb max 24000

# Create scoreboards
scoreboard objectives add more_info dummy
scoreboard players set TICK_PER_DAY more_info 24000
scoreboard players set TICK_PER_HOUR more_info 1000
scoreboard players set MINS_PER_HOUR more_info 60
scoreboard players set TICKS_OFFSET more_info 6000
scoreboard players set WEATHER_CHECK_TIME more_info 50
scoreboard players set WEATHER more_info 0


# kickstart tick function
function more_info:loop
function more_info:player_check

tellraw @a {"text": "Additional Info Datapack enabled!", "color": "green"}
