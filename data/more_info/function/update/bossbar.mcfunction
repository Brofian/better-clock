# update bossbar name (fill zeros)
#	Case A: hour and minute both have two digits
execute if score TIME_HOUR more_info matches 10.. if score TIME_MINUTE more_info matches 10.. run bossbar set minecraft:more_info_bb name [{text:"🕘 "},{score:{name:"TIME_HOUR",objective:"more_info"}},{text:":"},{score:{name:"TIME_MINUTE",objective:"more_info"}},{text: "          "},{nbt:"WeatherLabel",storage:"more_info"}]
#	Case B: hour has two digits, minute only one
execute if score TIME_HOUR more_info matches 10.. unless score TIME_MINUTE more_info matches 10.. run bossbar set minecraft:more_info_bb name [{text:"🕘 "},{score:{name:"TIME_HOUR",objective:"more_info"}},{text:":0"},{score:{name:"TIME_MINUTE",objective:"more_info"}},{text: "          "},{nbt:"WeatherLabel",storage:"more_info"}]
#	Case C: minute has two digits, hour only one
execute unless score TIME_HOUR more_info matches 10.. if score TIME_MINUTE more_info matches 10.. run bossbar set minecraft:more_info_bb name [{text:"🕘 "},{text:"0"},{score:{name:"TIME_HOUR",objective:"more_info"}},{text:":"},{score:{name:"TIME_MINUTE",objective:"more_info"}},{text: "          "},{nbt:"WeatherLabel",storage:"more_info"}]
#	Case C: neither hour nor minute has two digits
execute unless score TIME_HOUR more_info matches 10.. unless score TIME_MINUTE more_info matches 10.. run bossbar set minecraft:more_info_bb name [{text:"🕘 "},{text:"0"},{score:{name:"TIME_HOUR",objective:"more_info"}},{text:":0"},{score:{name:"TIME_MINUTE",objective:"more_info"}},{text: "          "},{nbt:"WeatherLabel",storage:"more_info"}]



# Update value to display in the bossbar 
execute store result bossbar minecraft:more_info_bb value run scoreboard players get TIME_TICK more_info

# if we hit a new hour, update cosmetics!
execute if score TIME_MINUTE more_info matches 0..1 run function more_info:update/bossbar_cosmetic
