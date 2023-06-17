state("Game")
{ 
    int      loading:     "GameLogic.dll", 0x65235C;
    byte     inGame:      "Game.exe", 0x5BB9F5;
    byte     mainmenu:    "Game.exe", 0x5DAB53;
    byte     pause:       "Game.exe", 0x593D08;
    byte     endlevel:    "Game.exe", 0x0059BDAC, 0x40, 0x11C, 0x0, 0x0, 0x0, 0x4, 0xC90;
    float    xcoord:      "Game.exe", 0x00017734, 0x14C;
    float    ycoord:      "Game.exe", 0x00017734, 0x154;
    float    zcoord:      "Game.exe", 0x00017734, 0x150;
    string10 intro:       "Game.exe", 0x005E0E64, 0x2AA;
    string10 finaleintro: "Game.exe", 0x005E0E64, 0x2AA;
    string7  carnage:     "Game.exe", 0x005E0E64, 0x2AA;
    string10 finalsplit:  "Game.exe", 0x005E0E64, 0x2AA;
}

startup
{
    if (timer.CurrentTimingMethod == TimingMethod.RealTime)
    {        
        var timingMessage = MessageBox.Show (
            "Spider-Man: Shattered Dimensions on PC is timed without loads.\nWould you like to switch to Game Time to remove loads?",
            "LiveSplit | Spider-Man: Shattered Dimensions",
            MessageBoxButtons.YesNo,
            MessageBoxIcon.Question);
        
        if (timingMessage == DialogResult.Yes)
            timer.CurrentTimingMethod = TimingMethod.GameTime;
    }
}

start
{
    return current.ycoord > -25 && current.intro == "man_A_Game" && current.inGame == 1
    && current.mainmenu == 0;
}

reset
{

}


isLoading
{
    return current.loading == 1;
}

split
{
        return (
      (current.endlevel == 1 && old.endlevel == 0 && current.loading == 0) ||
      (current.finalsplit == "man_F_Game" && old.carnage == "Carnage") ||
      (current.finalsplit == "man_F_Game" && old.finaleintro == "man_E_Intr")
      );  
}
