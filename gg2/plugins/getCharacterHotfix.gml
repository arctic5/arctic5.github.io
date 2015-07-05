var redTeam, blueTeam;
redTeam = ds_map_find_value(global.teamMap, TEAM_RED);
blueTeam = ds_map_find_value(global.teamMap, TEAM_BLUE);

for (i = ds_map_size(redTeam) + 1; i < 255; i += 1)
    ds_map_add(redTeam, i, -1);
for (i = ds_map_size(blueTeam) + 1; i < 255; i += 1)
    ds_map_add(blueTeam, i, -1);