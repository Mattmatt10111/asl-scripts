state("DeadIsland-Win64-Shipping")
{
    //int       pause       : 0x798B360, 0x90, 0x10, 0x80, 0x40, 0xC0, 0x38, 0x5448;
    string20  queststring   : 0x0768BFB8, 0xD8, 0x420, 0xB8, 0x188, 0x70, 0x48, 0x81C;
    int       questtotal    : 0x076E6390, 0x8, 0x20, 0x758, 0x28, 0x30, 0x90, 0x78;
    //int       loading1    : 0x074A0810, 0x8, 0x80, 0x2E8, 0x20, 0x7D8, 0xE8, 0x2E8;
    int       loading       : 0x0749EB38, 0xC0, 0x178;
    int       inCutscene    : 0x076CE7D0, 0x30, 0xC28, 0x20, 0x600, 0x128, 0xC0, 0x48;
    //string100 mainmenu    : 0x7750628, 0x28, 0x5F0, 0x570, 0x88, 0xD8, 0xE;
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
