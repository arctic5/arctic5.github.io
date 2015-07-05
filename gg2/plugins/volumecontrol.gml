//write settings to ini
ini_open("gg2.ini");
global.masterVolume = ini_read_real("Settings", "Master Volume", 100);
ini_write_real("Settings", "Master Volume", global.masterVolume);
ini_close();
x = global.masterVolume;
sound_global_volume((x/100));

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

//main stuff here
object_event_add(global.pluginOptions,ev_create,0,'
//"cheating" the code
_settings = "Settings";
Master_Volume = "Master Volume";
//lorgan points out that I am stupid
    menu_addedit_num("Master Volume:", "global.masterVolume", "
        gg2_write_ini(_settings, Master_Volume, argument0);
        x = argument0
        sound_global_volume((x/100))
    ", 100); 
');