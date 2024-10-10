state("Dead Space", "Steam") //12353536

{
  int loading: "Dead Space.exe", 0xB442B8;
  string4 chapter: "Dead Space.exe", 0x002C8B7C, 0xCA4;
  float xcoord: "Dead Space.exe", 0x00B481AC, 0x0, 0x320;
  float ycoord: "Dead Space.exe", 0x00B481AC, 0x0, 0x328;
  float zcoord: "Dead Space.exe", 0x00B481AC, 0x0, 0x324;
  byte InCutscene: "Dead Space.exe", 0xB4BA81;
}

state("Dead Space", "Origin") //12005376 


{
  int loading: "Dead Space.exe", 0xB42338;
  string4 chapter: "Dead Space.exe", 0x0018A2D4, 0xC;
  float xcoord: "Dead Space.exe", 0x00B4622C, 0x0, 0x320;
  float ycoord: "Dead Space.exe", 0x00B4622C, 0x0, 0x328;
  float zcoord: "Dead Space.exe", 0x00B4622C, 0x0, 0x324;
  byte InCutscene: "Dead Space.exe", 0xB49B01;
}

init
{	
  print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
      case (12353536):
			version = "Steam";
			break;
      case (12005376):
			version = "Origin";
			break;
	}
}

start
{
  return current.chapter == "CH01" && current.loading == 0 && old.loading == 1;
}

split
{
   return (
          (current.chapter == "ch02" && old.chapter == "CH01") ||
          (current.chapter == "ch03" && old.chapter == "ch02") ||
          (current.chapter == "ch04" && old.chapter == "ch03") ||
          (current.chapter == "ch05" && old.chapter == "ch04") ||
          (current.chapter == "ch06" && old.chapter == "ch05") ||
          (current.chapter == "ch07" && old.chapter == "ch06") ||
          (current.chapter == "ch08" && old.chapter == "ch07") ||
          (current.chapter == "ch09" && old.chapter == "ch08") ||
          (current.chapter == "ch10" && old.chapter == "ch09") ||
          (current.chapter == "ch11" && old.chapter == "ch10") ||
          (current.chapter == "ch12" && old.chapter == "ch11") ||
          (current.chapter == "ch12" && current.xcoord > -34 && 
           current.xcoord < -32 && current.ycoord > 33 && 
           current.ycoord < 35 && current.InCutscene == 179)
          );
}

isLoading 
{
  return current.loading != 0;
}
