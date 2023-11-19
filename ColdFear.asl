state("coldfear_retail", "Steam") //5070848 

{
    int loading    : "coldfear_retail.exe", 0x47BBF4;
    int saveprompt : "coldfear_retail.exe", 0x419D19;
    int cutscene   : "binkw32.dll", 0x54AB4;
}

state("coldfear_retail", "Ubisoft") //5066752 


{
    int loading    : "coldfear_retail.exe", 0x47BBF4;
    int saveprompt : "coldfear_retail.exe", 0x419D19;
    int cutscene   : "binkw32.dll", 0x54AB4;
}

startup
{
        if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads from Cold Fear requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Cold Fear",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question);
        
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

init
{
    print(modules.First().ModuleMemorySize.ToString());
        switch (modules.First().ModuleMemorySize)
	{
        case (5070848):
			version = "Steam";
			break;
        case (5066752):
			version = "Ubisoft";
			break;
	}
}

start
{
    return current.cutscene == 1;
}

split
{
    return current.saveprompt == 1 && old.saveprompt == 0;
}

isLoading
{
    return current.loading == 1;
}
