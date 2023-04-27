state("DeadIsland-Win64-Shipping")
{
    int       pause       : 0x798B360, 0x90, 0x10, 0x80, 0x40, 0xC0, 0x38, 0x5448;
    string20  queststring : 0x78C96B8, 0xD0, 0x60, 0xB8, 0x48, 0x30, 0x20, 0x99C;
    int       questtotal  : 0x7923DB0, 0x8, 0xD0, 0x758, 0x28, 0x30, 0x90, 0x98;
    // Thanks to TheDementedSalad for helping me out with the loading address.
    int       loading     : 0x75D88B0, 0x50;
    int       inCutscene  : 0x790C150, 0x30, 0xC48, 0x20, 0x600, 0x128, 0xC0, 0x48;
    string100 mainmenu    : 0x7750628, 0x28, 0x5F0, 0x570, 0x88, 0xD8, 0xE;
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
    return current.questtotal == old.questtotal + 1;
}

isLoading
{
    return  current.loading == 0 || current.inCutscene == 1 || current.inCutscene == 2;
}

exit
{
    timer.IsGameTimePaused = true;
}
