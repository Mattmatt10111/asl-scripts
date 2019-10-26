state("deadspace2", "Origin")
{
    int chapter : 0x01C1C0A0, 0x59C, 0x550, 0x80, 0x14, 0xCC;
    int loading: "deadspace2.exe", 0x1C33E5C;
    int scene : 0x01C2131C, 0x10, 0xD4;
    int eEvent : 0x01CA3F00, 0x0, 0x1C8;
}

state("deadspace2", "NoDLC")
{
    int chapter: 0x01C00DDC, 0x1C, 0x8, 0x0, 0x38, 0xFFFFF808;
    int loading: "deadspace2.exe", 0x1C18B5C;
    int scene : 0x01C0601C, 0x10, 0xD4;
    int eEvent : 0x01C00DDC, 0x1C, 0x8, 0x0, 0x38, 0x5E8;
}

state("deadspace2", "RegularSteam")
{
    int chapter: 0x01C4D554, 0x18, 0xFAC;
    int loading: "deadspace2.exe", 0x1C33E5C;
    int scene : 0x01C2131C, 0x10, 0xD4;
    int eEvent : 0x01CA3F00, 0x0, 0x1C8;
}

init
{
    switch (modules.First().ModuleMemorySize) {
        case  33320960: version = "Origin"; break;
        case 54018048: version = "RegularSteam"; break;
        case 54382592: version = "NoDLC"; break;
        default:        version = ""; break;
    }
    vars.counter = 1;
    vars.endCheck = false;
    vars.prevPhase = timer.CurrentPhase;
}

isLoading
{
  return current.loading != 0;
}

update
{
    if (timer.CurrentPhase == TimerPhase.Running && vars.prevPhase == TimerPhase.NotRunning) {
        vars.counter = 1;
        vars.endCheck = false;
    }

    vars.prevPhase = timer.CurrentPhase;
}

split
{
    if (current.chapter > vars.counter) {
        vars.counter = current.chapter;
        return true;
    }
    if (current.chapter == 15 && current.scene == 3) {
        vars.endCheck = true;
    }
    return vars.endCheck && current.chapter == 15 && current.scene == 2 && old.eEvent == 1 && current.eEvent == 0;
}
