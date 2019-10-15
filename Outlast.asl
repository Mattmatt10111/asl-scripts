state("OLGame")
{
	// unknown/default version
}

state("OLGame", "Patch2")
{
    int isLoading : "OLGame.exe", 0x01FFBCC8, 0x118;
    float xcoord : "OLGame.exe", 0x02020F38, 0x278, 0x40, 0x454, 0x80;
    float ycoord : "OLGame.exe", 0x2020F38, 0x278, 0x40, 0x454, 0x84;
    float zcoord : "OLGame.exe", 0x2020F38, 0x278, 0x40, 0x454, 0x88;
    int checkpoint : "OLGame.exe", 0x02020C88, 0x3AC;
    int pause : "OLGame.exe", 0x2022C93;
    int InControl : "OLGame.exe", 0x02020F38, 0x248, 0x60, 0x30, 0x278, 0x54;
}

start
{
     return current.xcoord > -16422.93 && current.xcoord < -16416.11 || current.xcoord > 9543.68 && current.xcoord < 9550.54;
}

init
{
     vars.prevPhase = timer.CurrentPhase;
      vars.finalSplit = false;
       vars.finalSplitCounter = 0;
	switch (modules.First().ModuleMemorySize)
	{
		case 35831808:
			version = "Patch2";
			break;
	}
}

update
{
    if (vars.finalSplit) {
        vars.finalSplitCounter++;
    }
    if (timer.CurrentPhase == TimerPhase.Running && vars.prevPhase == TimerPhase.NotRunning) {
        vars.finalSplit = false;
        vars.finalSplitCounter = 0;
    }
    vars.prevPhase = timer.CurrentPhase;
}

reset
{
}

split
{
    if (Math.Abs(-4098.51 - current.zcoord) < 0.01 && current.InControl == 0) {
        vars.finalSplit = true;
  }
    if (vars.finalSplit && vars.finalSplitCounter == 8)
   {
    return true;
  }
    if (current.checkpoint > old.checkpoint && current.pause == 0) 
  {
    return true;
 }
}

isLoading
{
     return current.isLoading == 1;
}
