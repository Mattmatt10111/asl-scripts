state("DeadIsland-Win64-Shipping")
{
    int pause: "DeadIsland-Win64-Shipping.exe", 0x0798B360, 0x90, 0x10, 0x80, 0x40, 0xC0, 0x38, 0x5448;
    string20 queststring: "DeadIsland-Win64-Shipping.exe", 0x078C96B8, 0xD0, 0x60, 0xB8, 0x48, 0x30, 0x20, 0x099C;
    int questtotal: "DeadIsland-Win64-Shipping.exe", 0x07923DB0, 0x8, 0xD0, 0x758, 0x28, 0x30, 0x90, 0x98;
    // Thanks to TheDementedSalad for helping me out with the loading address.
    int loading: "DeadIsland-Win64-Shipping.exe", 0x075D88B0, 0x50;
    int inCutscene: "DeadIsland-Win64-Shipping.exe", 0x0790C150, 0x30, 0xC48, 0x20, 0x600, 0x128, 0xC0, 0x48;
    string100 mainmenu: "DeadIsland-Win64-Shipping.exe", 0x07750628, 0x28, 0x5F0, 0x570, 0x88, 0xD8, 0xE;
}

startup
{
    		if (timer.CurrentTimingMethod == TimingMethod.RealTime)
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

start
{
    return 
     current.questtotal == 0 && current.queststring == "FLIGHT OF THE DAMNED" && current.inCutscene == 0;
}

isLoading
{
    return 
     current.loading == 0 || current.inCutscene == 1 || current.inCutscene == 2;
}

split
{
        return (
        // It will split after every time you complete a quest, added enough to also support the side quests.
        (current.questtotal == 1 && old.questtotal == 0) ||
        (current.questtotal == 2 && old.questtotal == 1) ||
        (current.questtotal == 3 && old.questtotal == 2) ||
        (current.questtotal == 4 && old.questtotal == 3) ||
        (current.questtotal == 5 && old.questtotal == 4) ||
        (current.questtotal == 6 && old.questtotal == 5) ||
        (current.questtotal == 7 && old.questtotal == 6) ||
        (current.questtotal == 8 && old.questtotal == 7) ||
        (current.questtotal == 9 && old.questtotal == 8) ||
        (current.questtotal == 10 && old.questtotal == 9) ||
        (current.questtotal == 11 && old.questtotal == 10) ||
        (current.questtotal == 12 && old.questtotal == 11) ||
        (current.questtotal == 13 && old.questtotal == 12) ||
        (current.questtotal == 14 && old.questtotal == 13) ||
        (current.questtotal == 15 && old.questtotal == 14) ||
        (current.questtotal == 16 && old.questtotal == 15) ||
        (current.questtotal == 17 && old.questtotal == 16) ||
        (current.questtotal == 18 && old.questtotal == 17) ||
        (current.questtotal == 19 && old.questtotal == 18) ||
        (current.questtotal == 20 && old.questtotal == 19) ||
        (current.questtotal == 21 && old.questtotal == 20) ||
        (current.questtotal == 22 && old.questtotal == 21) ||
        (current.questtotal == 23 && old.questtotal == 22) ||
        (current.questtotal == 24 && old.questtotal == 23) ||
        (current.questtotal == 25 && old.questtotal == 24) ||
        (current.questtotal == 26 && old.questtotal == 25) ||
        (current.questtotal == 27 && old.questtotal == 26) ||
        (current.questtotal == 28 && old.questtotal == 27) ||
        (current.questtotal == 29 && old.questtotal == 28) ||
        (current.questtotal == 30 && old.questtotal == 29) ||
        (current.questtotal == 31 && old.questtotal == 30) ||
        (current.questtotal == 32 && old.questtotal == 31) ||
        (current.questtotal == 33 && old.questtotal == 32) ||
        (current.questtotal == 34 && old.questtotal == 33) ||
        (current.questtotal == 35 && old.questtotal == 34) ||
        (current.questtotal == 36 && old.questtotal == 35) ||
        (current.questtotal == 37 && old.questtotal == 36) ||
        (current.questtotal == 38 && old.questtotal == 37) ||
        (current.questtotal == 39 && old.questtotal == 38) ||
        (current.questtotal == 40 && old.questtotal == 39) ||
        (current.questtotal == 41 && old.questtotal == 40) ||
        (current.questtotal == 42 && old.questtotal == 41) ||
        (current.questtotal == 43 && old.questtotal == 42) ||
        (current.questtotal == 44 && old.questtotal == 43) ||
        (current.questtotal == 45 && old.questtotal == 44) ||
        (current.questtotal == 46 && old.questtotal == 45) ||
        (current.questtotal == 47 && old.questtotal == 46) ||
        (current.questtotal == 48 && old.questtotal == 47) ||
        (current.questtotal == 49 && old.questtotal == 48) ||
        (current.questtotal == 50 && old.questtotal == 49) ||
        (current.questtotal == 51 && old.questtotal == 50) ||
        (current.questtotal == 52 && old.questtotal == 51) ||
        (current.questtotal == 53 && old.questtotal == 52) ||
        (current.questtotal == 54 && old.questtotal == 53) ||
        (current.questtotal == 55 && old.questtotal == 54) ||
        (current.questtotal == 56 && old.questtotal == 55) ||
        (current.questtotal == 57 && old.questtotal == 56)
      );  
}

exit
{
    timer.IsGameTimePaused = true;
}
