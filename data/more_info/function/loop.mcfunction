# count the number of online players
scoreboard players set ACTIVE_PLAYERS more_info 0
execute as @a run scoreboard players add ACTIVE_PLAYERS more_info 1


# only update the data, if a player is online
execute if score ACTIVE_PLAYERS more_info matches 1.. run function more_info:update/all


# if a player is online: execute this function every 10 ticks (0.5 seconds)
execute if score ACTIVE_PLAYERS more_info matches 1.. run schedule function more_info:loop 10t

# if no player is online: execute this function every minute
execute if score ACTIVE_PLAYERS more_info matches 0 run schedule function more_info:loop 60s
