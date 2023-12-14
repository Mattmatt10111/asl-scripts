state("AbzuGame-Win64-Shipping", "Steam") //47570944 

{
    int loading: "AbzuGame-Win64-Shipping.exe", 0x29020F4;
}

state("AbzuGame-Win64-Shipping", "Epic") //47501312 


{
    int loading: "AbzuGame-Win64-Shipping.exe", 0x28EA104;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Removing loads ABZÛ requires comparing against Game Time.\nWould you like to switch to it?",
            "LiveSplit | ABZÛ",
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
        case (47570944):
			version = "Steam";
			break;
        case (47501312):
			version = "Epic";
			break;
	}
}

isLoading
{
    return current.loading == 1;
}

split
{
    return current.loading == 1 && old.loading == 0;
}
