state("tlou-ii", "v1.1.10411.0746") //161869824 

{
    double IGT: "tlou-ii.exe", 0x09395260, 0x80, 0xBA8;
    string18 chapter: "tlou-ii.exe", 0x09341A30, 0x2C;
    string15 chapterreset: "tlou-ii.exe", 0x09341A30, 0x2C;

}

startup
{
    vars.totalGameTime = 0;
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
// Asks user to change to game time if LiveSplit is currently set to Real Time.
    {        
        var timingMessage = MessageBox.Show (
            "This game uses Time without Loads (Game Time) as the main timing method.\n"+
            "LiveSplit is currently set to show Real Time (RTA).\n"+
            "Would you like to set the timing method to Game Time?",
            "LiveSplit | The Last of Us Part II Remastered",
            MessageBoxButtons.YesNo,MessageBoxIcon.Question
        );
        
        if (timingMessage == DialogResult.Yes)
        {
            timer.CurrentTimingMethod = TimingMethod.GameTime;
        }
    }
    refreshRate = 60;
}

init
{
    print(modules.First().ModuleMemorySize.ToString());
    timer.IsGameTimePaused = false;
    switch (modules.First().ModuleMemorySize)
	{
        case (161869824 ):
			version = "v1.1.10411.0746";
			break;
	}
}

update
{
    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
	vars.totalGameTime = 0;
    }
}

start
{
    return current.chapter == "Jackson - Prologue" && current.IGT != 0 
    || current.chapter == "The Park - Trackin" && current.IGT != 0;
}

split
{
    return current.chapter != old.chapter;
}

reset
{
    return current.chapterreset == "NEW MANUAL SAVE";
}

exit
{
    timer.IsGameTimePaused = true;
}

isLoading
{
    return true;
}

gameTime
{
    if (current.IGT > old.IGT)
    {
        return TimeSpan.FromSeconds(vars.totalGameTime + current.IGT);
    }

    if (current.IGT == 0 && old.IGT > 0)
    {
        vars.totalGameTime += old.IGT;
        return TimeSpan.FromSeconds(vars.totalGameTime + current.IGT);
    }
}
