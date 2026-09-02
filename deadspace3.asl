state("deadspace3")
{
    int InGame: "deadspace3.exe", 0xE43E7C;
    int loading: "deadspace3.exe", 0xEAB630;
    int chapter: "deadspace3.exe", 0xDD1AA4, 0x00008090;
    int InCutscene: "deadspace3.exe", 0x00E79214, 0x130, 0x10C, 0x104, 0x1A4, 0x160;
    int eEvent: "deadspace3.exe", 0xE43EBC;
    float xcoord: "deadspace3.exe", 0xE56148;
    float ycoord: "deadspace3.exe", 0xE56140;
    float zcoord: "deadspace3.exe", 0xE56144;
}

startup
{
    settings.Add("any%", true, "Any% Splits");
    settings.Add("any%newroute", false, "Any% Splits New Route With Cliffs Skip");
    settings.Add("gless", false, "Glitchless Splits");
    settings.Add("cutsceneTiming", true, "Cutscene Speedup Timing Compensation");

    vars.timingReady = false;
    vars.lastComp100us = 0;
    vars.runCompBase100us = 0;
    vars.pendingComp100us = 0L;
    vars.appliedComp100us = 0L;
    vars.bridgeMessageShown = false;
}

init
{
    vars.timingReady = false;
    vars.lastComp100us = 0;
    vars.runCompBase100us = 0;
    vars.pendingComp100us = 0L;
    vars.appliedComp100us = 0L;
    vars.bridgeMessageShown = false;
}

update
{
    if (!settings["cutsceneTiming"])
    {
        vars.pendingComp100us = 0L;
        return true;
    }

    // DS3 Cutscene Speedup production timing bridge (v0.37 timing contract):
    // +0x00 magic "DS3T", +0x04 version 37, +0x08 cumulative NET removed-time compensation in 0.1 ms units.
    var timingModule = modules.FirstOrDefault(m =>
        string.Equals(m.ModuleName, "DS3_CutsceneSpeedup.asi", StringComparison.OrdinalIgnoreCase));

    if (timingModule == null)
    {
        vars.timingReady = false;
        vars.pendingComp100us = 0L;
        return true;
    }

    int magic = memory.ReadValue<int>(timingModule.BaseAddress + 0x14000);
    int bridgeVersion = memory.ReadValue<int>(timingModule.BaseAddress + 0x14004);
    int comp100us = memory.ReadValue<int>(timingModule.BaseAddress + 0x14008);

    if (magic != 0x54335344 || bridgeVersion != 37 || comp100us < 0)
    {
        vars.timingReady = false;
        vars.pendingComp100us = 0L;
        return true;
    }

    if (!vars.timingReady || comp100us < vars.lastComp100us)
    {
        vars.timingReady = true;
        vars.lastComp100us = comp100us;
        vars.runCompBase100us = comp100us;
        vars.pendingComp100us = 0L;

        if (!vars.bridgeMessageShown)
        {
            print("DS3 Cutscene Speedup v1.1.0 timing bridge connected: v0.37 checkpoint replay guard");
            vars.bridgeMessageShown = true;
        }
    }

    bool autoStartSignal = current.chapter == 1 && current.InCutscene == 1 && current.loading == 0;

    if (timer.CurrentPhase == TimerPhase.NotRunning)
    {
        // Keep a baseline immediately before the normal auto-start condition becomes true.
        // If turbo begins between ASL polls, the pre-start injected sequence time is retained
        // and applied once Game Time initializes instead of being silently lost.
        if (!autoStartSignal)
        {
            vars.runCompBase100us = comp100us;
            vars.pendingComp100us = 0L;
        }
        else
        {
            long preStart = (long)comp100us - (long)vars.runCompBase100us;
            vars.pendingComp100us = preStart > 0L ? preStart : 0L;
        }

        vars.lastComp100us = comp100us;
    }
    else if (timer.CurrentPhase == TimerPhase.Running)
    {
        int delta = comp100us - vars.lastComp100us;
        if (delta > 0)
            vars.pendingComp100us += (long)delta;

        vars.lastComp100us = comp100us;
    }
    else
    {
        // Do not create corrected time while LiveSplit itself is manually paused.
        vars.lastComp100us = comp100us;
    }

    return true;
}

start
{
    return current.chapter == 1 && current.InCutscene == 1 && current.loading == 0;
}

isLoading
{
    return current.loading != 0 || current.InGame == 0;
}

gameTime
{
    if (settings["cutsceneTiming"] && vars.timingReady && vars.pendingComp100us > 0L)
    {
        var gt = timer.CurrentTime.GameTime;
        if (gt.HasValue)
        {
            long apply100us = vars.pendingComp100us;
            vars.pendingComp100us = 0L;
            vars.appliedComp100us += apply100us;

            // .NET TimeSpan ticks are 100 ns; one bridge unit is 100 us = 1000 ticks.
            return gt.Value + TimeSpan.FromTicks(apply100us * 1000L);
        }
    }
}

split
{   
    if(settings["any%"]){
return  (old.chapter == 1 && current.chapter == 10) ||
        (old.chapter == 10 && current.chapter == 20) ||
        (old.chapter == 20 && current.chapter == 30) ||
        (old.chapter == 30 && current.chapter == 40) ||
        (old.chapter == 60 && current.chapter == 70) ||
        (old.chapter == 70 && current.chapter == 80) ||
        (old.chapter == 90 && current.chapter == 100) ||
        (old.chapter == 100 && current.chapter == 110) ||
        (old.chapter == 120 && current.chapter == 130) ||
        (old.chapter == 130 && current.chapter == 140) ||
        (old.chapter == 150 && current.chapter == 160) ||
        (old.chapter == 160 && current.chapter == 170) ||
        (old.chapter == 170 && current.chapter == 180) ||
        (old.chapter == 180 && current.chapter == 190) ||
        (current.zcoord > -261 && current.zcoord < -259 && current.chapter == 190 &&
         current.InCutscene == 0 && old.eEvent == 1 && current.eEvent == 0);
    }

    else if(settings["gless"]){
return  (old.chapter == 1 && current.chapter == 10) ||
        (old.chapter == 10 && current.chapter == 20) ||
        (old.chapter == 20 && current.chapter == 30) ||
        (old.chapter == 30 && current.chapter == 40) ||
        (old.chapter == 40 && current.chapter == 50) ||
        (old.chapter == 50 && current.chapter == 60) ||
        (old.chapter == 60 && current.chapter == 70) ||
        (old.chapter == 70 && current.chapter == 80) ||
        (old.chapter == 80 && current.chapter == 90) ||
        (old.chapter == 90 && current.chapter == 100) ||
        (old.chapter == 100 && current.chapter == 110) ||
        (old.chapter == 110 && current.chapter == 120) ||
        (old.chapter == 120 && current.chapter == 130) ||
        (old.chapter == 130 && current.chapter == 140) ||
        (old.chapter == 140 && current.chapter == 150) ||
        (old.chapter == 150 && current.chapter == 160) ||
        (old.chapter == 160 && current.chapter == 170) ||
        (old.chapter == 170 && current.chapter == 180) ||
        (old.chapter == 180 && current.chapter == 190) ||
        (current.zcoord > -261 && current.zcoord < -259 && current.chapter == 190 &&
         current.InCutscene == 0 && old.eEvent == 1 && current.eEvent == 0);
    }

    else if(settings["any%newroute"]){
return  (old.chapter == 1 && current.chapter == 10) ||
        (old.chapter == 10 && current.chapter == 20) ||
        (old.chapter == 20 && current.chapter == 30) ||
        (old.chapter == 30 && current.chapter == 40) ||
        (old.chapter == 60 && current.chapter == 70) ||
        (old.chapter == 70 && current.chapter == 80) ||
        (old.chapter == 90 && current.chapter == 100) ||
        (old.chapter == 100 && current.chapter == 120) ||
        (old.chapter == 110 && current.chapter == 120) ||
        (old.chapter == 130 && current.chapter == 140) ||
        (old.chapter == 150 && current.chapter == 160) ||
        (old.chapter == 160 && current.chapter == 170) ||
        (old.chapter == 170 && current.chapter == 180) ||
        (old.chapter == 180 && current.chapter == 190) ||
        (current.zcoord > -261 && current.zcoord < -259 && current.chapter == 190 &&
         current.InCutscene == 0 && old.eEvent == 1 && current.eEvent == 0);
    }
}
