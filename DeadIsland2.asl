state("DeadIsland-Win64-Shipping")
{
    int pause: "DeadIsland-Win64-Shipping.exe", 0x0798B360, 0x90, 0x10, 0x80, 0x40, 0xC0, 0x38, 0x5448;
    int loading: "DeadIsland-Win64-Shipping.exe", 0x6FDBA70;
}

startup
{
    		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | Dead Island 2",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
    refreshRate = 30;
}

init
{
    timer.IsGameTimePaused = false;
}

isLoading
{
    return current.pause > 0 || current.loading == 1;
}

exit
{
    timer.IsGameTimePaused = true;
}
