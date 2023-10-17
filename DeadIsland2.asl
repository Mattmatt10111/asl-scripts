state("DeadIsland-Win64-Shipping")
{
    string20  queststring   : 0x0768BFB8, 0xD8, 0x420, 0xB8, 0x188, 0x70, 0x48, 0x81C;
    int       questtotal    : 0x076E6390, 0x8, 0x20, 0x758, 0x28, 0x30, 0x90, 0x78;
    int       loading       : 0x0749EB38, 0xC0, 0x178;
    int       inCutscene    : 0x076CE7D0, 0x30, 0xC28, 0x20, 0x600, 0x128, 0xC0, 0x48;
}

state("DeadIsland-Win64-Shipping", "2.0") //460218368 
{
    string20  queststring   : 0x06C48868, 0x218, 0x158, 0xB0, 0x48, 0x8, 0x70, 0x7BC;
    int       questtotal    : 0x074DB550, 0x8, 0x20, 0x758, 0x28, 0x30, 0x90, 0x78;
    int       loading       : 0x07293878, 0xC0, 0x178;
    int       inCutscene    : 0x074C3950, 0x30, 0x798, 0xD0, 0x600, 0x128, 0xC0, 0x48;
}

startup
{
    refreshRate = 30;

    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads from Dead Island 2 requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Dead Island 2",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question);
        
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

init
{
    timer.IsGameTimePaused = false;

    	switch (modules.First().ModuleMemorySize)
	{
        case (460218368):
			version = "2.0";
			break;
	}
}

start
{
    return 
     current.questtotal == 0 && current.queststring == "FLIGHT OF THE DAMNED" && current.inCutscene == 0;
}

split
{
    return
     current.questtotal == old.questtotal + 1;
}

isLoading
{
    return
     current.loading == 0 || current.inCutscene == 1 || current.inCutscene == 2;
}

exit
{
    timer.IsGameTimePaused = true;
}
