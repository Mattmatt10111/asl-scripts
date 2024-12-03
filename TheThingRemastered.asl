state("amun_Shipping_Steam_x64", "Steam 1.00") //14684160 

{
    string12 level : 0xC7D6F8;
    int Loading : 0xC755FC;
}

init
{	
  print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
      case (14684160):
		version = "Steam 1.00";
		break;
	}
}

split
{
    if (current.level != old.level)
    {
        if (current.level == "gui_level6")
        {
            return old.level == "gui_level4a";
        }
        else 
        {
            return true;
        }
    }
}

start
{
    return old.level == "gui_intro" && current.level == "gui_level1";
}

isLoading
{
    return current.Loading == 0;
}
