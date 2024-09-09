state("CastingFrankStone-Win64-Shipping", "1.00") //157724672 

{
    //int loading1: 0x08E07098, 0x0, 0xE88, 0xC70;
    //int loading2: "CastingFrankStone-Win64-Shipping.exe", 0x8A61AF0;
    int mainmenu: 0x08A5E2D0, 0x28, 0x140, 0xD8;
    //int credits: 0x08B1A628, 0x48, 0x224;
    string22 chapter: 0x08DE66A0, 0x8, 0xD0, 0x380, 0x0;
}

init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (157724672 ):
			version = "1.00";
			break;
	}
}

start
{
    return current.mainmenu == 0 && current.chapter == "The Burning";
}

split
{
   return (
          (current.chapter == "In The Hous" && old.chapter == "The Burning") ||
          (current.chapter == "A Curiosity" && old.chapter == "In The Hous") ||
          (current.chapter == "These Walls" && old.chapter == "A Curiosity") ||
          (current.chapter == "The Phantom" && old.chapter == "These Walls") ||
          (current.chapter == "Beyond The " && old.chapter == "The Phantom") ||
          (current.chapter == "A Perilous " && old.chapter == "Beyond The ") ||
          (current.chapter == "Mystery Man" && old.chapter == "A Perilous ") ||
          (current.chapter == "Hunting Gro" && old.chapter == "Mystery Man") ||
          (current.chapter == "In The Hous" && old.chapter == "Hunting Gro") ||
          (current.chapter == "All Paths M" && old.chapter == "In The Hous") ||
          (current.chapter == "Closing The" && old.chapter == "All Paths M") ||
          (current.chapter == "Murder Mill" && old.chapter == "Closing The") ||
          (current.chapter == "The Massacr" && old.chapter == "Murder Mill")
          );
}

isLoading
{
    //return current.loading1 == 1 || current.loading2 == 1;
}

    
