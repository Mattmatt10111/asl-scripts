state("Game")

{
    int loading : 0x009BC090, 0x10, 0xC;
    int mission : "GameLogic.dll", 0x678C54;
    int mainmenu: "GameLogic.dll", 0x5CC228;
}

init
{	
    print(modules.First().ModuleMemorySize.ToString());
}

start
{
    return current.mainmenu == 0 && current.loading == 0 && old.loading == 1;
}

split
{
   return current.mission == old.mission + 1;
}

isLoading
{
    return current.loading == 1;
}
