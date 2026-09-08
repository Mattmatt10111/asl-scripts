state("Spider-Man2", "1.318.1.0") //216711168
{
    byte loading: 0xBA4ECD5;
    string100 mission: 0x0AF34D18, 0x11788;
}

state("Spider-Man2", "2.810.0.0") //218533888
{
    int SaveIconLoad: 0xBB8DA9C; // goes to 1 during loading screens typically with a save icon but also restart checkpoints, 0 for the rest
    //int BlackScreenLoad: 0xC505B84; // 2 during cutscene and loads it seems like and 1 for regular gameplay no idea when its 0
    int BlackScreenLoad: 0xBB8AFB8; // 0 during loading 1 when not
    //int playerold: 0x9B2473C; // 256 when you are the player 243 in pause menu
    int player: 0xBB8AB70; // 256/257 during load 1 during gameplay 0 idk
    int playerbackup: 0xBC0B674; // 1 when not loading 257 when loading 0 idk
    int Loading: "Spider-Man2", 0xC31F368; // 1 and 256 when loading 0 when not
    int cityLoad: 0xB0CBFF0; // 1 during a city load 0 when not
    int photoMode: 0xA164484; // 1 when in photo mode 0 when not
    bool mainMenu: 0xB3E2608; // 1 in the main menu of the game 0 when not
    uint Objective1: 0xB8B28C8; // 0 until after u defeat marko then its 1967938939 goes to 3987438430 after u use the spidey drone thingy with miles, 3757259262 when the app gets updated, 979019534 mission after marko crystal, 3892465476 completed one thing at a time
    uint Objective2: 0x9B27358; //gonna keep for now
    uint Objective3: 0xBF595F4; // idk if this is actually objective but a consistent value for some stuff look at if statement for autostart
    float XCoord: 0xB0F16E0; // current x of the player
    float YCoord: 0xB0F16E4; // current y of the player
    float ZCoord: 0xB0F16E8; // current z of the player
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

    vars.Version = "";

    settings.Add("Debug", false);
    settings.Add("Splits", false);
    settings.Add("1", false, "Act 1", "Splits");
    settings.Add("2", false, "Act 2", "Splits");
    settings.Add("3", false, "Act 3", "Splits");
    timer.Run.Metadata.SetCustomVariable("Auto Splitter Version", vars.AutoSplitterVersion);
    
    vars.CompletedSplits = new List<string>();
    vars.splits = new Dictionary<string, List<uint>>() {
    // item 1 is the old objective value, item 2 is the new objective value, item 3 is which act the mission is in
    // Act 1
    {"Surface Tension", new List<uint>{0, 1967938939, 1}}, {"One Thing at a Time", new List<uint>{979019534, 3892465476, 1}},
    {"Show Me New York", new List<uint>{3892465476, 3870183316, 1}}, {"Explore the city 1", new List<uint>{3870183316, 2522814277, 1}},
    {"Roll Like We Used To", new List<uint>{2522814277, 4026644600, 1}}, {"Wind Tunnel Tutorial", new List<uint>{4026644600, 2737954596, 1}},
    {"Not On My Watch", new List<uint>{2737954596, 4088340205, 1}}, {"Amends", new List<uint>{4088340205, 1764935638, 1}},
    {"Exploring the City 2", new List<uint>{3031784656, 1078867104, 1}}, {"Healing the World", new List<uint>{1078867104, 533377092, 1}},
    {"Bad Guys On The Block", new List<uint>{2537665686, 3928076501, 1}}, {"Make Your Own Choices", new List<uint>{3806338787, 2556680393, 1}},
    {"Master Illusionist", new List<uint>{3266269643, 1476160670, 1}}, {"A Second Chance", new List<uint>{1476160670, 2148492753, 1}},
    {"Science Buddy", new List<uint>{2148492753, 4084871207, 1}}, {"Spider-Spy?", new List<uint>{4084871207, 1828497674, 1}},
    {"Hunt to Live, Live to Hunt", new List<uint>{312407824, 1189333442, 1}}, {"Funky", new List<uint>{1189333442, 3214288615, 1}},
    {"Good Men", new List<uint>{3214288615, 2509898144, 1}},
    // Act 2
    {"The Flames Have Been Lit", new List<uint> {2509898144, 3753432255, 2}}, {"Stay Positive", new List<uint>{3753432255, 700445570, 2}}, 
    {"Wings Of My Own", new List<uint>{700445570, 2784478118, 2}}, {"New Threads", new List<uint>{2784478118, 4040188978, 2}}, 
    {"It Chose You", new List<uint>{4040188978, 235004882, 2}}, {"MJ Call", new List<uint>{235004882, 590263408, 2}}, 
    {"Wake Up", new List<uint>{590263408, 2390893245, 2}}, {"Im the Hero Here", new List<uint>{2390893245, 2234996119, 2}}, 
    {"No Escape", new List<uint>{2234996119, 1576947106, 2}}, {"Anything Can Be Broken", new List<uint>{1576947106, 2003553996, 2}}, 
    {"Connors Call", new List<uint>{2003553996, 364252122, 2}}, {"Dont be Scared", new List<uint>{364252122, 2991192832, 2}},
    // Act 3
    {"Trouble With Harry", new List<uint>{2991192832, 4026310577, 3}}, {"This Isnt You", new List<uint>{4026310577, 1511121387, 3}},
    {"Set Things Right", new List<uint>{1511121387, 1116059359, 3}}, {"Mj Call", new List<uint>{1116059359, 2612449282, 3}},
    {"It's All Connected", new List<uint>{2612449282, 2069918651, 3}}, {"Hivemind", new List<uint>{2069918651, 4227503461, 3}},
    {"Finally Free", new List<uint>{4227503461, 3594681202, 3}}, {"Together", new List<uint>{3594681202, 694094915, 3}},
    /* {"", new List<uint>{,,}}, so i dont have to create this multiply times
    extra numbers
    2489002695
    */
    };

    foreach (var split in vars.splits)
    {
        settings.Add(split.Key, false, split.Key, split.Value[2].ToString());
        if (split.Key == "Together")
        {
            settings.SetToolTip(split.Key, "This will not split where time is suppose to end but a little bit before it.");
        }
        settings.SetToolTip(split.Key, "This will split after completing " + split.Key);
    }
}

init
{
    
    //timer.IsGameTimePaused = false;

    switch (modules.First().ModuleMemorySize)
	{
        case (216711168):
			version = "1.318.1.0";
            vars.Version = "1.318.1.0";
			break;
        case (218533888):
			version = "2.810.0.0";
            vars.Version = "2.810.0.0";
			break;
	}
}

update
{
    //print(modules.First().ModuleMemorySize.ToString());
    current.XCoord = Math.Round(current.XCoord, 4);
    current.YCoord = Math.Round(current.YCoord, 4);
    current.ZCoord = Math.Round(current.ZCoord, 4);
}

start
{
    if (vars.Version == "1.318.1.0" )
    {
        return current.mission == "Surface Tension";
    } 
    else if (vars.Version == "2.810.0.0")
    {
        if (current.Objective1 == 0 && current.Objective2 == 0 && current.Objective3 != 0 && current.XCoord == 2808.0002 && 
        current.YCoord >= 41.0156 && current.ZCoord == 1628.0001 && old.XCoord != 2808.0002 && old.YCoord != current.YCoord && old.ZCoord != 1628.0001)
        {
            timer.Run.Offset = TimeSpan.FromSeconds(0); // start the timer at 0 for a fresh save
            return true;
        } else if (current.Objective1 == 0 && current.Objective2 != 0 && current.Objective3 == 3246520743 && current.XCoord == 2681.2439 &&
        current.YCoord == 37.9326 && current.ZCoord == 1482.7017 && old.XCoord != 2681.2439 && old.YCoord != 37.9326 && old.ZCoord != 1482.7017)
        {
            timer.Run.Offset = TimeSpan.FromSeconds(90.17); // start the timer at 1:30.17 when loading a manual save
            return true;
        }

    }
}

split
{
    if (vars.Version != "2.810.0.0") {
        return false;
    } else {
        try
        {
            foreach (var split in vars.splits)
            {
                if (!settings[split.Key])
                    continue;

                if (vars.CompletedSplits.Contains(split.Key))
                    continue;

                var conditions = split.Value;

                if (old.Objective1 == conditions[0] && current.Objective1 == conditions[1])
                {
                    vars.CompletedSplits.Add(split.Key);
                    return true;
                }
            }
        }
        catch (Exception e)
        {
            print("SPLIT BLOCK ERROR: " + e.ToString());
        }
    }

    if (current.Objective1 != old.Objective1 && settings["Debug"])
    {
        return true;
    }
    
}

isLoading
{
    if ((current.SaveIconLoad == 1 || current.BlackScreenLoad != 1 || current.player != 1 || current.playerbackup != 1 || current.cityLoad == 1) &&
    current.mainMenu == false && current.playerbackup != 65537 && current.photoMode != 1 && vars.Version == "2.810.0.0")
    {
        return true;
    } else if(vars.version == "1.318.1.0" && current.loading == 1)
    {
        return true;
    } else
    {
        return false;
    } 
}

onReset
{
    vars.CompletedSplits.Clear();
}
