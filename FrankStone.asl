state("CastingFrankStone-Win64-Shipping", "1.00") //157724672 

{
    //int mainmenu: 0x08A5E2D0, 0x28, 0x140, 0xD8;
    string22 chapter: 0x08DE66A0, 0x8, 0xD0, 0x380, 0x0;
}

state("CastingFrankStone-Win64-Shipping", "1.01") //157814784 


{
    //int mainmenu: 0x08A5E2D0, 0x28, 0x140, 0xD8;
    string22 chapter: 0x08A75158, 0x78, 0x98, 0x380, 0x0;
}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (157724672):
			version = "1.00";
			break;
        case (157814784):
			version = "1.01";
			break;
	}
}

start
{
    return current.chapter == "The Burning";
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
    
}

    
