state("AWayOut", "Current Patch") //75763712 

{
    byte loading: "AWayOut.exe", 0x440C505;
    string100 level: "AWayOut.exe", 0x04181490, 0x20, 0x0;
    int finalQTEleo: "AWayOut.exe", 0x0441C608, 0x128, 0x4D0, 0x190, 0x498;
    int finalQTEvin: "AWayOut.exe", 0x0441C608, 0x128, 0x4D0, 0x190, 0xB88;
}

startup
{
    
}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (75763712 ):
		version = "Current Patch";
		break;
	}
}


start
{
    return current.level == "Beginnings";
}


split
{
   return (
          (current.level == "The Yard" && old.level != current.level) ||
          (current.level == "Canteen Brawl" && old.level != current.level) ||
          (current.level == "Helping Hand" && old.level != current.level) ||
          (current.level == "Work Detail" && old.level != current.level) ||
          (current.level == "Cell Breach" && old.level != current.level) ||
          (current.level == "Laundry Smuggle" && old.level != current.level) ||
          (current.level == "The Way Out" && old.level != current.level) ||
          (current.level == "Wrench Relay" && old.level != current.level) ||
          (current.level == "Prison Escape" && old.level != current.level) ||
          (current.level == "On The Run" && old.level != current.level) ||
          (current.level == "Bridge Crossing" && old.level != current.level) ||
          (current.level == "Breather" && old.level != current.level) ||
          (current.level == "The Farmstead" && old.level != current.level) ||
          (current.level == "The Getaway" && old.level != current.level) ||
          (current.level == "River Run" && old.level != current.level) ||
          (current.level == "Reunion" && old.level != current.level) ||
          (current.level == "Bonds" && old.level != current.level) ||
          (current.level == "Hazardous Hunt" && old.level != current.level) ||
          (current.level == "Violent Questioning" && old.level != current.level) ||
          (current.level == "Stick Up" && old.level != current.level) ||
          (current.level == "Gun Runner" && old.level != current.level) ||
          (current.level == "The Call" && old.level != current.level) ||
          (current.level == "The Assassin" && old.level != current.level) ||
          (current.level == "A New Life" && old.level != current.level) ||
          (current.level == "Against All Odds" && old.level != current.level) ||
          (current.level == "Lift Off" && old.level != current.level) ||
          (current.level == "Free Fall" && old.level != current.level) ||
          (current.level == "The Trek" && old.level != current.level) ||
          (current.level == "Ambush" && old.level != current.level) ||
          (current.level == "Covering Fire" && old.level != current.level) ||
          (current.level == "The Mansion" && old.level != current.level) ||
          (current.level == "Jungle Road" && old.level != current.level) ||
          (current.level == "Answers" && old.level != current.level) ||
          (current.level == "Canal Chase" && old.level != current.level) ||
          (current.level == "Face Off" && old.level != current.level) ||
          (current.level == "A Way Out" && old.level != current.level) ||
          (current.level == "A Way Out" && current.finalQTEleo == 0 && old.finalQTEleo == 1) ||
          (current.level == "A Way Out" && current.finalQTEvin == 0 && old.finalQTEvin == 1)
          );
}


isLoading
{
    return current.loading == 1;
}  
