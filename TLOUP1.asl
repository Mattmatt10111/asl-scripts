state("tlou-i")
{ 
    int loading: "tlou-i.exe",0x60F9250;
    byte pause: "tlou-i.exe", 0x36A17DF;
    byte inCutscene: "tlou-i.exe", 0x066A2E98, 0xC9;
    int mainmenu: "tlou-i.exe", 0x3504428;
    int inGame: "tlou-i.exe", 0x3565E60;
    int fps: "tlou-i.exe", 0x64D2878;
    double IGT: "tlou-i.exe", 0x0437AD40, 0x80, 0x968;
    byte timerpaused: "tlou-i.exe", 0x60F68A8, 0x000288E9;
    byte blackscreen: "tlou-i.exe", 0x669D660;
    string13 chapter: 0x0434E2B8, 0x2C;
    // Main Game
    // Hometown
    string8 prologue: 0x0434E2B8, 0x37;
    // The Quarentine Zone
    string14 twentyyearslater: 0x0434E2B8, 0x42;
    string15 beyondthewall: 0x0434E2B8, 0x42;
    string9 theslums: 0x0434E2B8, 0x42;
    string9 thecargo: 0x0434E2B8, 0x42;
    // The Outskirts
    string7 outside: 0x0434E2B8, 0x3C;
    string8 downtown: 0x0434E2B8, 0x3C;
    string6 museum: 0x0434E2B8, 0x3C;
    string20 capitol: 0x0434E2B8, 0x3C;
    // Bill's Town
    string9 thewoods: 0x0434E2B8, 0x3A;
    string9 safehouse: 0x0434E2B8, 0x3A;
    string9 graveyard: 0x0434E2B8, 0x3A;
    string18 highschool: 0x0434E2B8, 0x3A;
    // Pittsburgh
    string18 aloneandforsaken: 0x0434E2B8, 0x39;
    string11 hotel: 0x0434E2B8, 0x39;
    string18 financial: 0x0434E2B8, 0x39;
    string15 escapethecity: 0x0434E2B8, 0x39;
    // The Suburbs
    string6 sewers: 0x0434E2B8, 0x3A;
    string7 suburbs: 0x0434E2B8, 0x3A;
    // Tommy's Dam
    string17 dam: 0x0434E2B8, 0x3A;
    string11 ranch: 0x0434E2B8, 0x3A;
    // The University
    string12 bighorns: 0x0434E2B8, 0x3D;
    string16 sciencebuilding: 0x0434E2B8, 0x3D;
    // Lakeside Resort
    string8 thehunt: 0x0434E2B8, 0x3E;
    string12 cabinresort: 0x0434E2B8, 0x3E;
    // Bus Depot
    string12 highway: 0x0434E2B8, 0x38;
    string18 tunnel: 0x0434E2B8, 0x38;
    // The Firefly Lab
    string12 hospital: 0x0434E2B8, 0x3E;
    // Jackson
    string8 epilogue: 0x0434E2B8, 0x36;
    // Left Behind
    string15 backinaflash: 0x0434E2B8, 0x3E;
    string8 mallrats: 0x0434E2B8, 0x37;
    string8 soclose: 0x0434E2B8, 0x37;
    string13 funandgames: 0x0434E2B8, 0x3C;
    string21 enemyofmyenemy: 0x0434E2B8, 0x44;
    string27 escapefromlib: 0x0434E2B8, 0x4A;
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
            "LiveSplit | The Last of Us Part 1 (PC)",
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
    timer.IsGameTimePaused = false;
}

start
{
    return
     (current.prologue == "Prologue" && current.IGT > 0 || 
     current.backinaflash == "Back in a Flash" && current.IGT > 0);
}

reset
{
    return 
     current.chapter == "New Game Data" && current.mainmenu == 0;
}

isLoading
{
    return 
      current.loading == 1 && current.timerpaused == 0 || current.blackscreen == 1 || current.inCutscene == 1
    && current.timerpaused == 1 || current.fps > 2100000000 || current.mainmenu == 1;
}

split
{
        return (
        // Left Behind
        (current.mallrats == "Mallrats" && old.backinaflash == "Back in a Flash") ||
        (current.soclose == "So Close" && old.mallrats == "Mallrats") ||
        (current.funandgames == "Fun and Games" && old.soclose == "So Close") ||
        (current.enemyofmyenemy == "The Enemy of My Enemy" && old.funandgames == "Fun and Games") ||
        (current.escapefromlib == "Escape from Liberty Gardens" && old.enemyofmyenemy == "The Enemy of My Enemy") ||
        (current.escapefromlib == "Escape from Liberty Gardens" && current.inCutscene == 1 && old.inCutscene == 0) ||
        // Main Game
        (current.twentyyearslater == "20 Years Later" && old.prologue == "Prologue") ||
        (current.beyondthewall == "Beyond The Wall" && old.twentyyearslater == "20 Years Later") ||
        (current.theslums == "The Slums" && old.beyondthewall == "Beyond The Wall") ||
        (current.thecargo == "The Cargo" && old.theslums == "The Slums") ||
        (current.outside == "Outside" && old.thecargo == "The Cargo") ||
        (current.downtown == "Downtown" && old.outside == "Outside") ||
        (current.museum == "Museum" && old.downtown == "Downtown") ||
        (current.capitol == "The Capitol Building" && old.museum == "Museum") ||
        (current.thewoods == "The Woods" && old.capitol == "The Capitol Building") ||
        (current.safehouse == "Safehouse" && old.thewoods == "The Woods") ||
        (current.graveyard == "Graveyard" && old.safehouse == "Safehouse") ||
        (current.highschool == "High School Escape" && old.graveyard == "Graveyard") ||
        (current.aloneandforsaken == "Alone and Forsaken" && old.highschool == "High School Escape") ||
        (current.hotel == "Hotel Lobby" && old.aloneandforsaken == "Alone and Forsaken") ||
        (current.financial == "Financial District" && old.hotel == "Hotel Lobby") ||
        (current.escapethecity == "Escape the City" && old.financial == "Financial District") ||
        (current.sewers == "Sewers" && old.escapethecity == "Escape the City") ||
        (current.suburbs == "Suburbs" && old.sewers == "Sewers") ||
        (current.dam == "Hydroelectric Dam" && old.suburbs == "Suburbs") ||
        (current.ranch == "Ranch House" && old.dam == "Hydroelectric Dam") ||
        (current.bighorns == "Go Big Horns" && old.ranch == "Ranch House") ||
        (current.sciencebuilding == "Science Building" && old.bighorns == "Go Big Horns") ||
        (current.thehunt == "The Hunt" && old.sciencebuilding == "Science Building") ||
        (current.cabinresort == "Cabin Resort" && old.thehunt == "The Hunt") ||
        (current.highway == "Highway Exit" && old.cabinresort == "Cabin Resort") ||
        (current.tunnel == "Underground Tunnel" && old.highway == "Highway Exit") ||
        (current.hospital == "The Hospital" && old.tunnel == "Underground Tunnel") ||
        (current.epilogue == "Epilogue" && old.hospital == "The Hospital") ||
        (current.epilogue == "Epilogue" && current.inCutscene == 1 && old.inCutscene == 0)
      );  
}

exit
{
    timer.IsGameTimePaused = true;
}
