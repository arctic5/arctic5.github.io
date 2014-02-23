//time calculation code taken from gg2 source 
var currentDate;
currentDate = date_current_datetime();
global.timestamp = string(date_get_year(currentDate)) + "-";
if (date_get_month(currentDate) < 10) { global.timestamp = global.timestamp + "0"; }
global.timestamp += string(date_get_month(currentDate)) + "-";
if (date_get_day(currentDate) < 10) { global.timestamp = global.timestamp + "0"; }
global.timestamp += string(date_get_day(currentDate)) + " ";

if !variable_global_exists('chatWindow') global.chatWindow = object_add();

//dump all the stored messages in the log file when the game ends
//APPARENTLY THE CHAT PLUGIN ALREADY STORES ALL THESE DAMN MESSAGES 
//AND ALL THAT THERE IS LEFT TO DO IS TO DUMP ALL OF IT INTO A LOG FILE
//ALSO THE COLORCODING ISNT STRIPPED SO YOU HAVE TO DEAL WITH (SORTA) UGLY LOOKIN MESSAGES

object_event_add(global.chatWindow, ev_other, ev_game_end, '
    if (!directory_exists(working_directory + "\Logs")) {
        directory_create(working_directory + "\Logs");
    }
    var chatLog, i;
    chatLog = file_text_open_append(working_directory + "\Logs\" + global.timestamp + global.joinedServerName + ".log");
    for (i = 0; i < ds_list_size(global.chatLog); i += 1) {
        file_text_writeln(chatLog);
        file_text_write_string(chatLog, ds_list_find_value(global.chatLog, i));
    }
    file_text_close(chatLog);
');