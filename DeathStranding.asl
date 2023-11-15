state("ds", "Original 1.08") //128704512 

{
     int  loading: "ds.exe", 0x07551338, 0x268, 0x18;
     int  results: "ds.exe", 0x07551338, 0x228, 0x18;
     int mainmenu: "ds.exe", 0x490A29C;
}

state("ds", "Directors Cut 1.003") //136011776

{
     int  loading: "ds.exe", 0x07C00128, 0x2C8, 0x18;
     int  results: "ds.exe", 0x07C00128, 0x288, 0x18;
     int mainmenu: "ds.exe", 0x4F73E7C;
}

state("DeathStranding", "Epic") //128704512 // Version - 2742586.206.1

{
     int  loading: "DeathStranding.exe", 0x075520A8, 0x268, 0x18;
     int  results: "DeathStranding.exe", 0x075520A8, 0x228, 0x18;
     int mainmenu: "DeathStranding.exe", 0x490B15C;
}

init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (128704512):
			version = "Original 1.08";
			break;
		case (136011776):
			version = "Directors Cut 1.003";
			break;
	}
}

startup //Asks user to switch to game time.
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads from Death Stranding requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | Death Stranding",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question);
        
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

start
{
    return current.mainmenu == 12 && old.mainmenu == 0 || 
    current.mainmenu == 12 && old.mainmenu == 6 || current.mainmenu == 7
    && old.mainmenu == 4;
}

split
{
    return current.results == 1 && old.results == 0;
}

isLoading
{
    return current.loading == 1;
}

    
