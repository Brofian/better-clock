# Update the scoreboard
execute store result score TIME_TICK more_info run time query daytime
scoreboard players operation TIME_TICK more_info += TICKS_OFFSET more_info
scoreboard players operation TIME_TICK more_info %= TICK_PER_DAY more_info

# Update hour
scoreboard players operation TIME_HOUR more_info = TIME_TICK more_info
scoreboard players operation TIME_HOUR more_info /= TICK_PER_HOUR more_info 

# Update minute
scoreboard players operation TIME_MINUTE more_info = TIME_TICK more_info
scoreboard players operation TIME_MINUTE more_info %= TICK_PER_HOUR more_info
scoreboard players operation TIME_MINUTE more_info *= MINS_PER_HOUR more_info
scoreboard players operation TIME_MINUTE more_info /= TICK_PER_HOUR more_info

