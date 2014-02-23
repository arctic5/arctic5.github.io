// Endround Plugin by Arctic
// Updated by TehEnForce

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

// menu script

object_event_add(global.pluginOptions, ev_create, 0, '
    if(global.isHost) 
    {
        menu_addlink("End Round", "
            global.winners = TEAM_SPECTATOR
        ");
        menu_addlink("End Blu", "
            global.winners = TEAM_RED;
        ");
        menu_addlink("End Red", "
            global.winners = TEAM_BLUE;
        ");
    }
');