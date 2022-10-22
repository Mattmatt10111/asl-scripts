state("tll")
{
	float IGT: "tll.exe", 0x691AEBC;
	int chapter: "tll.exe", 0x03723AF8, 0x450;
	int menu: "tll.exe", 0x3F25568;
}

start
{
	return current.IGT > 0 && current.IGT < 0.5
	&& current.chapter == 1 && current.menu == 0;
}

split
{
    return current.chapter > old.chapter;
}

isLoading
{
	return true;
}

gameTime
{
	return TimeSpan.FromSeconds(current.IGT);
}