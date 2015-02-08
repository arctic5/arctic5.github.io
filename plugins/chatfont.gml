ini_open("gg2.ini");
global.newFont = ini_read_string("Plugins","chat_font","Lucida Console");
global.newSize = ini_read_real("Plugins","chat_font_size",8);
global.newbold = ini_read_real("Plugins","chat_font_bold",false);
global.newitalic = ini_read_real("Plugins","chat_font_italic",false);
ini_close();

//make a new menu for plugin options
if !variable_global_exists("pluginOptions") {
    global.pluginOptions = object_add();
    object_set_parent(global.pluginOptions,OptionsController);  
    object_set_depth(global.pluginOptions,-130000); 
    object_event_add(global.pluginOptions,ev_create,0,'   
        menu_create(40, 140, 300, 200, 30);
    
        if room != Options {
            menu_setdimmed();
        }
        
        menu_addback("Back", "
            instance_destroy();
            if(room == Options)
                instance_create(0,0,MainMenuController);
            else
                instance_create(0,0,InGameMenuController);
        ");
    ');
    object_event_add(InGameMenuController,ev_create,0,'
        menu_addlink("Plugin Options", "
            instance_destroy();
            instance_create(0,0,global.pluginOptions);
        ");
    ');
} 

object_event_add(global.pluginOptions,ev_create,0,'
    menu_addedit_text("Chat Font:", "global.newFont", "font_replace(global.consoleFont,global.newFont,global.newSize,global.newbold,global.newitalic,32,127);"); 
    menu_addedit_num("Size:", "global.newSize", "font_replace(global.consoleFont,global.newFont,global.newSize,global.newbold,global.newitalic,32,127);");
    menu_addedit_boolean("Bold:", "global.newbold", "font_replace(global.consoleFont,global.newFont,global.newSize,global.newbold,global.newitalic,32,127);");
    menu_addedit_boolean("Italic:", "global.newitalic", "font_replace(global.consoleFont,global.newFont,global.newSize,global.newbold,global.newitalic,32,127);");
');

object_event_add(global.pluginOptions,ev_destroy,0,'
    ini_open("gg2.ini");
    ini_write_string("Plugins","chat_font",global.newFont);
    ini_write_real("Plugins","chat_font_size",global.newSize);
    ini_write_real("Plugins","chat_font_bold",global.newbold);
    ini_write_real("Plugins","chat_font_italic",global.newitalic);
    ini_close();
');
if !variable_global_exists('chatWindow') global.chatWindow = object_add();
object_event_add(global.chatWindow,ev_create,0,'font_replace(global.consoleFont,global.newFont,global.newSize,global.newbold,global.newitalic,32,127);');