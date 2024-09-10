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

    print(current.chapter);
}

startup
{
      Assembly.Load(File.ReadAllBytes("Components/asl-help")).CreateInstance("Basic");
    vars.Helper.GameName = "The Casting of Frank Stone";
}

start
{
    return current.chapter == "The Burning";
}

split
{
   return (
          (current.chapter == "In The Hous" && old.chapter == "The Burning") ||
          (current.chapter == "A Curiosity" && old.chapter == "In The Hous") ||
          (current.chapter == "These Walls" && old.chapter == "A Curiosity") ||
          (current.chapter == "The Phantom" && old.chapter == "These Walls") ||
          (current.chapter == "Beyond The " && old.chapter == "The Phantom") ||
          (current.chapter == "A Perilous " && old.chapter == "Beyond The ") ||
          (current.chapter == "Mystery Man" && old.chapter == "A Perilous ") ||
          (current.chapter == "Hunting Gro" && old.chapter == "Mystery Man") ||
          (current.chapter == "In The Hous" && old.chapter == "Hunting Gro") ||
          (current.chapter == "All Paths M" && old.chapter == "In The Hous") ||
          (current.chapter == "Closing The" && old.chapter == "All Paths M") ||
          (current.chapter == "Murder Mill" && old.chapter == "Closing The") ||
          (current.chapter == "The Massacr" && old.chapter == "Murder Mill")
          );
}

isLoading
{
    
}

    
