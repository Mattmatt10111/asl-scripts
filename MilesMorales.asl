state("MilesMorales", "2.1012.0.0") //151027712 

{
    int loading: "MilesMorales.exe", 0x7A34264;
    int levelpopup: "MilesMorales.exe", 0x0877B4F8, 0x90, 0x1A0, 0x58, 0x50, 0x770, 0x458;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Marvel's Spider-Man: Miles Morales",
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
        case (151027712):
			version = "2.1012.0.0";
			break;
	}
}

start
{
    
}

split
{
    return current.levelpopup == 1 && old.levelpopup == 0;
}

isLoading
{
    return current.loading == 1;
}
