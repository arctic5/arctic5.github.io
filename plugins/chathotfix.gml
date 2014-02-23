if !variable_global_exists('chatWindow') global.chatWindow = object_add();

if !variable_global_exists("commandMap") {  //all server commands go here
    global.commandMap = ds_map_create();
}
ds_map_add(global.commandMap,"help","
    playerId = 255;
    _team = 0;
    if ds_list_size(argument0) == 1 {
        var previous, i;
        previous = ds_map_find_first(global.commandMap);
        _message = 'OAvailable server commands: '+previous;
        for(i=1;i<ds_map_size(global.commandMap)-1;i+=1) {
            previous = ds_map_find_next(global.commandMap,previous);
            _message += ', '+previous;
        }
        _message += ' and ' + string(ds_map_find_next(global.commandMap,previous));
        _team = 0;
        target = _player;
        if target != global.myself event_user(2); 
        else event_user(4);
    } else if ds_map_exists(global.helpMap,string_lower(ds_list_find_value(argument0,1))) {
        _message = 'O'+ds_map_find_value(global.helpMap,string_lower(ds_list_find_value(argument0,1)));
        target = _player;
        if target != global.myself event_user(2); 
        else event_user(4);
    } else if ds_list_find_value(argument0,1) == 'me miku!' {
        if(hasReward(_player, 'GS')) || _player.hasMiku = 0 {   //only oldfags may have miku's help, so even if you (probably) can read code you can't use it :3
            _player.hasMiku = true;
            write_ubyte(global.chatSendBuffer,202);
            write_ubyte(global.chatSendBuffer,ds_list_find_index(global.players,_player));
            with(Player) {
                if hasChat = true PluginPacketSendTo(global.chatPacketID,global.chatSendBuffer, id);
            }
            buffer_clear(global.chatSendBuffer);
        } else {
            _message = 'OEven though you know the secret command, you are still not cool enough for miku'+chr(39)+'s help!';
            playerId = 255;
            _team = 0;
            target = _player;
            if target != global.myself event_user(2); 
            else event_user(4);
        }
    } else {
        _message = 'OThis command does not have a help message or does not exist.';
        target = _player;
        if target != global.myself event_user(2); 
        else event_user(4);
    }
");

object_event_add(global.chatWindow,ev_create,0," global.currentMapIndex = -1;");
