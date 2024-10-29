state("RDR", "1.00") //1516099072 


{
    int loading: "RDR.exe", 0x02C36700, 0x68;
}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (1516099072):
		version = "1.00";
		break;
	}
}


start
{

}


split
{

}


isLoading
{
    return current.loading == 1;
}

    
