state("RDR", "v40_PC-49078035") //1516099072 


{
    int loading: "RDR.exe", 0x02C36700, 0x68;
    //string100 UNautosave: "RDR.exe", 0x02B02FB0, 0x3262;
    byte otherload: "RDR.exe", 0x02AB3A18, 0x3071;
    int duel: "RDR.exe", 0x02AB38A0, 0x6748;
    int firstcutscene: "RDR.exe", 0x02AFE170, 0x215D4;
    int failed: "RDR.exe", 0x02AFE170, 0x11CCC;
    int onmission: "RDR.exe", 0x02AB38A0, 0x677C;
}

startup
{
    refreshRate = 120;
}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (1516099072):
		version = "v40_PC-49078035";
		break;
	}
}


start
{
    return current.firstcutscene == 0 && old.firstcutscene == 1 && current.loading == 1 && current.onmission == 1;
}


isLoading
{
    return current.loading == 1 || current.otherload == 1;
}  
