state("SplitFiction", "1.00 Steam") //283611136 

{
    string100 chapter: "SplitFiction.exe", 0x0FB6D720, 0x60C8, 0x0;
    int loading: "SplitFiction.exe", 0xFAD0888;
    string100 mainmenu: "tier0_s64.dll", 0x000611B0, 0x1F;
    int finalprompt: "SplitFiction.exe", 0x0FC1E888, 0x720, 0x20, 0x220;
    byte inCutscene: "SplitFiction.exe", 0x0FB2AF00, 0x388, 0x1A0;
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
    return current.chapter == "Freedom Fighters" && old.mainmenu == "MainMenu";
}

split
{
    return( 
        (current.chapter == "Rush Hour" && old.chapter != current.chapter) ||
        (current.chapter == "The Underlands" && old.chapter != current.chapter) ||
        (current.chapter == "The Dropship" && old.chapter != current.chapter) ||
        (current.chapter == "A Serpentine Path" && old.chapter != current.chapter) ||
        (current.chapter == "Prison Ship" && old.chapter != current.chapter) ||
        (current.chapter == "An Ominous Welcome" && old.chapter != current.chapter) ||
        (current.chapter == "Split Up" && old.chapter != current.chapter) ||
        (current.chapter == "Final Showdown" && current.finalprompt == 0 
        && old.finalprompt == 1 && current.inCutscene == 1)
        );
}

isLoading
{
    return current.loading == 1;
}
