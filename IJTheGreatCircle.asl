state("TheGreatCircle", "Update 1") //120745984 


{
    string4 level: "TheGreatCircle.exe", 0x4ACF4C8;
    byte mainmenu: "TheGreatCircle.exe", 0x4AD26E7;
    string22 objective: "TheGreatCircle.exe", 0x048240E8, 0x28, 0x558, 0x1F0, 0xC0;
    string100 cutsceneid: "TheGreatCircle.exe", 0x04ABD800, 0x0;
    int InCutscene: "TheGreatCircle.exe", 0x650AFB8;
}

startup
{
    
}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (120745984):
		version = "Update 1";
		break;
	}
}


start
{
    return current.level == "peru" && current.mainmenu == 0 && current.cutsceneid == "cs/peru/ch00_intro01_cm"
    && current.InCutscene == 0 && old.InCutscene == 1;
}


split
{
       return (
          (current.level == "coll" && old.level == "peru") ||
          (current.level == "vati" && old.level == "coll") ||
          (current.level == "gize" && old.level == "vati") ||
          (current.level == "nepa" && old.level == "gize") ||
          (current.level == "shan" && old.level == "nepa") ||
          (current.level == "sukh" && old.level == "shan") ||
          (current.level == "iraq" && old.level == "sukh") ||
          (current.level == "iraq" && current.cutsceneid == "cs/iraq/ch06se02_washedover01_cm" && current.InCutscene == 1)
          );
}


isLoading
{
    
}  
