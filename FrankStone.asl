state("CastingFrankStone-Win64-Shipping")

{

}

init
{	
    IntPtr gEngine = vars.Helper.ScanRel(3, "48 89 05 ???????? 48 85 c9 74 ?? e8 ???????? 48 8d 4d");

    vars.Helper["chapter"] = vars.Helper.MakeString(gEngine, 0x10A8, 0x38, 0x0, 0x30, 0x190, 0x18, 0x380, 0x0);
    vars.Helper["chapter"].FailAction = MemoryWatcher.ReadFailAction.SetZeroOrNull;
}

update
{
    vars.Helper.Update();  //The splitter will not work without this
    vars.Helper.MapPointers();
}

startup
{
      Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
    vars.Helper.GameName = "The Casting of Frank Stone";
}

start
{
    return current.chapter == "The Burning Maw";
}

split
{
   return (
          (current.chapter == "In The House of Darkness" && old.chapter == "The Burning Maw") ||
          (current.chapter == "A Curiosity On Main Street" && old.chapter == "In The House of Darkness") ||
          (current.chapter == "These Walls Have Eyes" && old.chapter == "A Curiosity On Main Street") ||
          (current.chapter == "The Phantom Of Cedar Steel" && old.chapter == "These Walls Have Eyes") ||
          (current.chapter == "Beyond The Gate" && old.chapter == "The Phantom Of Cedar Steel") ||
          (current.chapter == "A Perilous Place" && old.chapter == "Beyond The Gate") ||
          (current.chapter == "Mystery Manor" && old.chapter == "A Perilous Place") ||
          (current.chapter == "Hunting Ground" && old.chapter == "Mystery Manor") ||
          (current.chapter == "In The House Of Madness" && old.chapter == "Hunting Ground") ||
          (current.chapter == "All Paths Must Cross" && old.chapter == "In The House Of Madness") ||
          (current.chapter == "Closing The Noose" && old.chapter == "All Paths Must Cross") ||
          (current.chapter == "Murder Mill" && old.chapter == "Closing The Noose") ||
          (current.chapter == "The Massacre At Gerant Manor" && old.chapter == "Murder Mill")
          );
}

isLoading
{
    
}

    
