state("Bates-Win64-Shipping", "1.00") //153677824 
{
    int InChoice: "Bates-Win64-Shipping.exe", 0x0890E4C8, 0x40, 0x840;
    int PRCutscene: "Bates-Win64-Shipping.exe", 0x898A70C;

}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (153677824):
			version = "1.00";
			break;
	}
}


start
{
    return current.PRCutscene == 1 && old.PRCutscene == 0;
}

split
{
    return current.InChoice == 1 && old.InChoice == 0;
}

isLoading
{
    
}

    
