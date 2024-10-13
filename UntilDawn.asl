state("Bates-Win64-Shipping", "1.00") //153677824

{
    int InChoice: "Bates-Win64-Shipping.exe", 0x0890E4C8, 0x40, 0x840;
    int PRCutscene: "Bates-Win64-Shipping.exe", 0x898A70C;

}

state("Bates-Win64-Shipping", "1.05") //153956352

{
    int InChoice: "Bates-Win64-Shipping.exe", 0x08961400, 0x2A0, 0x270;
    int PRCutscene: "Bates-Win64-Shipping.exe", 0x899888C;

}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (153677824):
			version = "1.00";
			break;
        case (153956352):
			version = "1.05";
			break;
	}
}


start
{
    return current.PRCutscene == 0 && old.PRCutscene == 1;
}

split
{
    return current.InChoice == 1 && old.InChoice == 0;
}

isLoading
{
    
}

    
