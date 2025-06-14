# midnight to sunrise
execute if score TIME_HOUR more_info matches ..5 run bossbar set more_info_bb color purple

# sunrise to sunset 
execute if score TIME_HOUR more_info matches 6..18 run bossbar set more_info_bb color blue

# sunset to midnight 
execute if score TIME_HOUR more_info matches 19.. run bossbar set more_info_bb color purple

