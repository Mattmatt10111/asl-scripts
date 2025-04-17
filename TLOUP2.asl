state("tlou-ii", "v1.1.10411.0746") //161869824 

{
    double IGT: "tlou-ii.exe", 0x09395260, 0x80, 0xBA8;
    string18 chapter: "tlou-ii.exe", 0x09341A30, 0x2C;
    string15 chapterreset: "tlou-ii.exe", 0x09341A30, 0x2C;

}

state("tlou-ii", "v1.2.10416.0553") //BECA4C2311BE02CF0062C7A21519B935 

{
    double   IGT:                          "tlou-ii.exe", 0x093952E0, 0x80, 0xBA8;
    string18 chapter:                    "tlou-ii.exe", 0x09341F80, 0x2C;
    string15 chapterreset:               "tlou-ii.exe", 0x09341F80, 0x2C;
    // Jackson
    string8  prologue:                  "tlou-ii.exe", 0x09341F80, 0x36;
    string9  wakingup:                  "tlou-ii.exe", 0x09341F80, 0x36;
    string12 theoverlook:               "tlou-ii.exe", 0x09341F80, 0x36;
    string6  patrol:                    "tlou-ii.exe", 0x09341F80, 0x36;
    string9  thehorde:                  "tlou-ii.exe", 0x09341F80, 0x36;
    string10 thechalet:                 "tlou-ii.exe", 0x09341F80, 0x36;
    string10 packingup:                 "tlou-ii.exe", 0x09341F80, 0x36;
    // Seattle Day 1 Ellie
    string8  thegate:                   "tlou-ii.exe", 0x09341F80, 0x3C;
    string8  downtown:                  "tlou-ii.exe", 0x09341F80, 0x3C;
    string20 eastbrookelementary:       "tlou-ii.exe", 0x09341F80, 0x3C;
    string12 capitolhill:               "tlou-ii.exe", 0x09341F80, 0x3C;
    string10 channel13:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string11 thetunnels:                "tlou-ii.exe", 0x09341F80, 0x3C;
    string11 thetheater:                "tlou-ii.exe", 0x09341F80, 0x3C;
    string9  thebirthdaygift:           "tlou-ii.exe", 0x09341F80, 0x3C;
    // Seattle Day 2 Ellie
    string9  hillcrest:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string15 findingstrings:            "tlou-ii.exe", 0x09341F80, 0x3C;
    string14 theseraphites:             "tlou-ii.exe", 0x09341F80, 0x3C;
    string19 stmaryhospital:            "tlou-ii.exe", 0x09341F80, 0x3C;
    // Seattle Day 3 Ellie
    string20 roadtotheaquarium:         "tlou-ii.exe", 0x09341F80, 0x3C;
    string16 thefloodedcity:            "tlou-ii.exe", 0x09341F80, 0x3C;
    string12 infiltration:              "tlou-ii.exe", 0x09341F80, 0x3C;
    // The Park
    string15 trackinglesson:            "tlou-ii.exe", 0x09341F80, 0x37;
    // Seattle Day 1 Abby
    string11 thestadium:                "tlou-ii.exe", 0x09341F80, 0x3C;
    string7  onfoot:                    "tlou-ii.exe", 0x09341F80, 0x3C;
    string16 theforwardbase:            "tlou-ii.exe", 0x09341F80, 0x3C;
    string12 theaquarium:               "tlou-ii.exe", 0x09341F80, 0x3C;
    string17 hostileterritory:          "tlou-ii.exe", 0x09341F80, 0x3C;
    string12 wintervisit:               "tlou-ii.exe", 0x09341F80, 0x3C;
    string10 theforest:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string9  thecoast:                  "tlou-ii.exe", 0x09341F80, 0x3C;
    // Seattle Day 2 Abby
    string21 returntothecoast:          "tlou-ii.exe", 0x09341F80, 0x3C;
    string12 theshortcut:               "tlou-ii.exe", 0x09341F80, 0x3C;
    string11 thedescent:                "tlou-ii.exe", 0x09341F80, 0x3C;
    string11 groundzero:                "tlou-ii.exe", 0x09341F80, 0x3C;
    string22 returntotheaquarium:       "tlou-ii.exe", 0x09341F80, 0x3C;
    // Seattle Day 3 Abby
    string9  themarina:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string9  theisland:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string9  theescape:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string16 theconfrontation:          "tlou-ii.exe", 0x09341F80, 0x3C;
    // The Farm
    string7  thefarm:                   "tlou-ii.exe", 0x09341F80, 0x37;
    // Santa Barbara
    string14 constance:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string14 pushinginland:             "tlou-ii.exe", 0x09341F80, 0x3C;
    string9  theresort:                 "tlou-ii.exe", 0x09341F80, 0x3C;
    string8  thebeach:                  "tlou-ii.exe", 0x09341F80, 0x3C;
    // The Farm
    string8  epilogue:                  "tlou-ii.exe", 0x09341F80, 0x37;

}

startup
{
    Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
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
    string md5 = "";
    try {
        md5 = (string)vars.Helper.GetMD5Hash();
    } catch {
        // Failed to open file for MD5 computation.
    }
    
    switch (md5) {
	        case "BECA4C2311BE02CF0062C7A21519B935":
			version = "v1.2.10416.0553";
			break;		
            default:
    switch ((int)vars.Helper.GetMemorySize()) 
	{
        case (161869824 ):
			version = "v1.1.10411.0746";
			break;
	}   
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
        return (
        (current.wakingup == "Waking Up" && old.prologue == "Prologue") ||
        (current.theoverlook == "The Overlook" && old.wakingup == "Waking Up") ||
        (current.patrol == "Patrol" && old.theoverlook == "The Overlook") ||
        (current.thehorde == "The Horde" && old.patrol == "Patrol") ||
        (current.thechalet == "The Chalet" && old.thehorde == "The Horde") ||
        (current.packingup == "Packing Up" && old.thechalet == "The Chalet") ||
        (current.thegate == "The Gate" && old.packingup == "Packing Up") ||
        (current.downtown == "Downtown" && old.thegate == "The Gate" ) ||
        (current.eastbrookelementary == "East Brook Elementary" && old.downtown == "Downtown") ||
        (current.capitolhill == "Capitol Hill" && old.eastbrookelementary == "East Brook Elementary") ||
        (current.channel13 == "Channel 13" && old.capitolhill == "Capitol Hill") ||
        (current.thetunnels == "The Tunnels" && old.channel13 == "Channel 13") ||
        (current.thetheater == "The Theater" && old.thetunnels == "The Tunnels") ||
        (current.thebirthdaygift == "The Birthday Gift" && old.thetheater == "The Theater") ||
        (current.hillcrest == "Hill Crest" && old.thebirthdaygift == "The Birthday Gift") ||
        (current.findingstrings == "Finding Strings" && old.hillcrest == "Hill Crest") ||
        (current.theseraphites == "The Seraphites" && old.findingstrings == "Finding Strings") ||
        (current.stmaryhospital == "St. Mary's Hospital" && old.theseraphites == "The Seraphites") ||
        (current.roadtotheaquarium == "Road To The Aquarium" && old.stmaryhospital == "St. Mary's Hospital") ||
        (current.thefloodedcity == "The Flooded City" && old.roadtotheaquarium == "Road To The Aquarium") ||
        (current.infiltration == "Infiltration" && old.thefloodedcity == "The Flooded City") ||
        (current.trackinglesson == "Tracking Lesson" && old.infiltration == "Infiltration") ||
        (current.thestadium == "The Stadium" && old.trackinglesson == "Tracking Lesson") ||
        (current.onfoot == "On Foot" && old.thestadium == "The Stadium") ||
        (current.theforwardbase == "The Forward Base" && old.onfoot == "On Foot") ||
        (current.theaquarium == "The Aquarium" && old.theforwardbase == "The Forward Base") ||
        (current.hostileterritory == "Hostile Territory" && old.theaquarium == "The Aquarium") ||
        (current.wintervisit == "Winter Visit" && old.hostileterritory == "Hostile Territory") ||
        (current.theforest == "The Forest" && old.wintervisit == "Winter Visit") ||
        (current.thecoast == "The Coast" && old.theforest == "The Forest") ||
        (current.returntothecoast == "Return To The Coast" && old.thecoast == "The Coast") ||
        (current.theshortcut == "The Shortcut" && old.returntothecoast == "Return To The Coast") ||
        (current.thedescent == "The Descent" && old.theshortcut == "The Shortcut") ||
        (current.groundzero == "Ground Zero" && old.thedescent == "The Descent") ||
        (current.returntotheaquarium == "Return To The Aquarium" && old.groundzero == "Ground Zero") ||
        (current.themarina == "The Marina" && old.returntotheaquarium == "Return To The Aquarium") ||
        (current.theisland == "The Island" && old.themarina == "The Marina") ||
        (current.theescape == "The Escape" && old.theisland == "The Island") ||
        (current.theconfrontation == "The Confrontation" && old.theescape == "The Escape") ||
        (current.thefarm == "The Farm" && old.theconfrontation == "The Confrontation") ||
        (current.constance == "2425 Constance" && old.thefarm == "The Farm") ||
        (current.pushinginland == "Pushing In Land" && old.constance == "2425 Constance") ||
        (current.theresort == "The Resort" && old.pushinginland == "Pushing In Land") ||
        (current.thebeach == "The Beach" && old.theresort == "The Resort") ||
        (current.epilogue == "Epilogue" && old.thebeach == "The Beach")
      );  
}

//reset
//{
//    return current.chapterreset == "NEW MANUAL SAVE" && current.IGT == 0;
//}

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
