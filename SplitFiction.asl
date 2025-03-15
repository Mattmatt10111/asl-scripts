state("SplitFiction", "1.00 Steam") //283611136 

{
    string100 chapter: "SplitFiction.exe", 0x0FB6D720, 0x60C8, 0x0;
    int loading: "SplitFiction.exe", 0xFAD0888;
    //string100 mainmenu: "SplitFiction.exe", 0x0F5B22F8, 0x11818, 0x9F;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Split Fiction",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question);
        
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

init
{
    print(modules.First().ModuleMemorySize.ToString());
    timer.IsGameTimePaused = false;

    	switch (modules.First().ModuleMemorySize)
	{
        case (283611136):
			version = "1.00 Steam";
			break;
	}
}

start
{
    return current.chapter == "Freedom Fighters";
}

split
{
    return old.chapter != current.chapter;
}

isLoading
{
    return current.loading == 1;
}
