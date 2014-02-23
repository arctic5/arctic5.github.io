//time calculation code taken from gg2 source 
var currentDate;
currentDate = date_current_datetime();
global.timestamp = string(date_get_year(currentDate)) + "-";
if (date_get_month(currentDate) < 10) { global.timestamp = global.timestamp + "0"; }
global.timestamp += string(date_get_month(currentDate)) + "-";
if (date_get_day(currentDate) < 10) { global.timestamp = global.timestamp + "0"; }
global.timestamp += string(date_get_day(currentDate)) + " ";


if !variable_global_exists('chatWindow') global.chatWindow = object_add();

object_event_add(global.chatWindow,ev_other,ev_user1,'
    if (!directory_exists(working_directory + "\Logs")) {
        directory_create(working_directory + "\Logs");
    }
    _loggedmessage = _player.name+": "+_message;
    chatlog = file_text_open_append(working_directory + "\Logs\" + global.timestamp + global.joinedServerName + ".log");
    file_text_writeln(chatlog)
    file_text_write_string(chatlog, _loggedmessage);
    file_text_close(chatlog);
');