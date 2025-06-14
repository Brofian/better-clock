tag @a[nbt={Inventory:[{id:"minecraft:clock"}]}] add more_info_has_clock

# set the bossbar to be visible to all players with a clock in their inventory
bossbar set minecraft:more_info_bb players @a[tag=more_info_has_clock]

tag @a remove more_info_has_clock



# if a player is online: execute this function every 5 seconds
execute if score ACTIVE_PLAYERS more_info matches 1.. run schedule function more_info:player_check 5s
# if no player is online: execute this function every minute
execute if score ACTIVE_PLAYERS more_info matches 0 run schedule function more_info:player_check 60s
