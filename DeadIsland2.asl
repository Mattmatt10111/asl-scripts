state("DeadIsland-Win64-Shipping") //Unkown Version Number
{
    string20  queststring   : 0x0768BFB8, 0xD8, 0x420, 0xB8, 0x188, 0x70, 0x48, 0x81C;
    int       questtotal    : 0x076E6390, 0x8, 0x20, 0x758, 0x28, 0x30, 0x90, 0x78;
    int       loading       : 0x0749EB38, 0xC0, 0x178;
    int       inCutscene    : 0x076CE7D0, 0x30, 0xC28, 0x20, 0x600, 0x128, 0xC0, 0x48;
}

state("DeadIsland-Win64-Shipping", "1.1089638.0.1") //460218368 
{
    string20  queststring   : 0x07480C58, 0xD8, 0x20, 0xB8, 0x180, 0x70, 0x48, 0x81C;
    int       questtotal    : 0x074C3950, 0x190, 0x30, 0x758, 0x28, 0x30, 0x90, 0x98;
    byte      loading       : 0x072BEE90, 0xB8, 0x10, 0x2E8;
    int       inCutscene    : 0x074C3950, 0x30, 0x798, 0xD0, 0x600, 0x128, 0xC0, 0x48;
}

state("DeadIsland-Win64-Shipping", "1.1103923.0.1") //466284544 

{
    string20  queststring   : 0x0751DA28, 0xD8, 0x20, 0xB8, 0x180, 0xB0, 0x48, 0x84C;
    int       questtotal    : 0x07480A48, 0x0, 0x260, 0x2E8, 0x230, 0x100, 0x250, 0x8;
    byte      loading       : 0x0733A908, 0x20, 0x20, 0xDB0, 0x7D8, 0xE0, 0x2D8;
    int       inCutscene    : 0x07560730, 0x30, 0x600, 0x128, 0xC0, 0x48;
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
    print(modules.First().ModuleMemorySize.ToString());
    	switch (modules.First().ModuleMemorySize)
	{
        case (460218368):
			version = "1.1089638.0.1";
			break;
        case (466284544):
			version = "1.1103923.0.1";
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
