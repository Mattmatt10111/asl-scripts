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
}

start
{
    return current.chapter == 1 && current.InCutscene == 1 && current.loading == 0;
}

isLoading
{
    return current.loading != 0; || current.InGame == 0;
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
