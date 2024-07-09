//Blade II ASL
//Supports auto start, auto split and final split

//emu-help tool created by jujstme - https://github.com/Jujstme
//emu-help scripts by TheDementedSalad, addresses and functions by Mattmatt

state("LiveSplit") {}

startup
{
	//Creates a persistent instance of the PS2 class (for PS2 emulators)
	//If you want to change it to another emulator type, change the "PS2" to say "PS1" if the splitter is for a PS1 Emu game
	Assembly.Load(File.ReadAllBytes("Components/emu-help-v2")).CreateInstance("PS2");

	// You can look up for known IDs on https://psxdatacenter.com/
	vars.Helper.Load = (Func<dynamic, bool>)(emu => 
    {
		//Address of Gamecode
		emu.MakeString("U_Gamecode", 10, 0x49D135);		//SLUS-20360
		//Everything Else
		emu.Make<int>("U_InCutscene", 0x49E56C);
		emu.Make<int>("U_cutsceneLoad", 0x49E8EC);
        emu.Make<float>("U_zcoord", 0x543A2C);
		emu.Make<int>("U_LevelID", 0x49DE50);
		emu.Make<byte>("U_CoreState", 0x92CECE);
        return true;
    });

		settings.Add("ng+", true, "New Game +");
		settings.Add("ng", false, "New Game");
}

init
{

}

update
{
	// get a casted (to dictionary) reference to current
	// so we can manipulate it using dynamic keynames
	var cur = current as IDictionary<string, object>;

	// list of pc address names to be recreated when on emu
	var names = new List<string>() { 
		"InCutscene",
		"zcoord",
		"LevelID",
		"CoreState",
		"cutsceneLoad",
	};

	// (placeholder) have some logic to work out the version and create the prefix
	string ver = null;

	// assign version based on gamecode
	if (current.U_Gamecode == "SLUS-20360") ver = "U_";

	// if in a supported version of the game...
	if (ver == null) return false;
	// loop through each desired address...
	foreach(string name in names) {
		// set e.g. current.GameTime to the value at e.g. current.US_GameTime
		cur[name] = cur[ver + name];
	}
}

onStart
{

}

start
{
		if(settings["ng+"]){
return current.cutsceneLoad == 1 && old.cutsceneLoad == 0 && current.LevelID == 1;
    }

		if(settings["ng"]){
return current.cutsceneLoad == 1 && old.cutsceneLoad == 0 && current.LevelID == 21;
    }
}

split
{
	if(settings["ng+"]){
return (current.LevelID == old.LevelID + 1) ||
    (current.LevelID == 20 && current.InCutscene == 1 && old.InCutscene == 0 && current.CoreState == 1);
    }

		if(settings["ng"]){
return (current.LevelID == old.LevelID + 1) ||
       (current.LevelID == 1 && old.LevelID == 21) ||
    (current.LevelID == 20 && current.InCutscene == 1 && old.InCutscene == 0 && current.CoreState == 1);
    }
}

shutdown
{
    // Please don't remove this line from this block
	vars.Helper.Dispose();
}
