x = 0;
while( sound_exists(x) )
{
	if file_exists("Plugins/Resources/Sounds/" + sound_get_name(x) + ".wav")
	{
		sound_replace(x,"Plugins/Resources/Sounds/" + sound_get_name(x) + ".wav",0,true);
	}
	x += 1;
}