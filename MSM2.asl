state("Spider-Man2", "1.318.1.0") //216711168

{
    byte loading:    "Spider-Man2.exe", 0xBA4ECD5;
    //int levelpopup: "Spider-Man2.exe", 0x09F04310, 0x747C;
    string100 mission: "Spider-Man2.exe", 0x0AF34D18, 0x11788;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Marvel's Spider-Man 2",
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
        case (216711168):
			version = "1.318.1.0";
			break;
	}
}

start
{
    return current.mission == "Surface Tension";
}

isLoading
{
    return current.loading == 1;
}
