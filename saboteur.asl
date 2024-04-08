state("Saboteur")
{
    int mission: "Saboteur.exe", 0x010977AC, 0x14, 0x1A0;
    byte isLoading: "", 0x010964F4, 0xBBD0;
    float xcoord: "Saboteur.exe", 0xE32FE8;
    float ycoord: "Saboteur.exe", 0xE32FF0;
    float zcoord: "Saboteur.exe", 0xE32FEC;
}

state("Saboteur", "GOG")
{
    // GOG 19122752
    int mission: "Saboteur.exe", 0x010AADCC, 0x14, 0x1A0;
    byte isLoading: "", 0x010A9B14, 0xBBD0;
    float xcoord: "Saboteur.exe", 0xE465E8;
    float ycoord: "Saboteur.exe", 0xE465F0;
    float zcoord: "Saboteur.exe", 0xE465EC;
}

state("Saboteur", "Steam")
{
    // Steam 19296256
    int mission: "Saboteur.exe", 0x010AADCC, 0x14, 0x1A0;
    byte isLoading: "", 0x010A9B14, 0xBBD0;
    float xcoord: "Saboteur.exe", 0xE465E8;
    float ycoord: "Saboteur.exe", 0xE465F0;
    float zcoord: "Saboteur.exe", 0xE465EC;
}

init
{   
    print(modules.First().ModuleMemorySize.ToString());
    	switch (modules.First().ModuleMemorySize)
	{
        case (19122752):
			version = "GOG";
			break;
        case (19296256):
			version = "Steam";
			break;
	}
}

start
{
     return current.mission == 0 && current.isLoading == 1;
}

isLoading
{
     return current.isLoading == 1;
}

split
{ 
    return (
        // You will need to end the timer manually for the last split
        (old.mission == 0 && current.mission == 1) ||     // Spark One Up
        (old.mission == 4 && current.mission == 5) ||     // Aurora Race
        (old.mission == 7 && current.mission == 8) ||     // Time Can't Heal All Wounds
        (old.mission == 8 && current.mission == 9) ||     // Slaughterhouse
        (old.mission == 9 && current.mission == 10) ||   // Bottle Shock
        (old.mission == 10 && current.mission == 11) || // Thirty Pieces of Lead
        (old.mission == 11 && current.mission == 12) || // The Black Market
        (old.mission == 12 && current.mission == 13) || // Grand Theft Limo
        (old.mission == 14 && current.mission == 15) || // Liberty or Death & Special Delivery
        (old.mission == 15 && current.mission == 16) || // Buried Secrets
        (old.mission == 16 && current.mission == 17) || // A Trip Up the Coast
        (old.mission == 17 && current.mission == 18) || // Viva La Vengeance 
        (old.mission == 18 && current.mission == 19) || // A Whisper or A Roar
        (old.mission == 19 && current.mission == 20) || // Jailbreak
        (old.mission == 20 && current.mission == 21) || // The Big Gun
        (old.mission == 21 && current.mission == 22) || // Rolling Thunder
        (old.mission == 22 && current.mission == 23) || // South of the Seine
        (old.mission == 24 && current.mission == 25) || // Repo Man & Boiling Point
        (old.mission == 25 && current.mission == 26) || // Lambs to the Slaughter
        (old.mission == 26 && current.mission == 27) || // Dark Reign
        (old.mission == 27 && current.mission == 28) || // Needs of the Few... or the One
        (old.mission == 28 && current.mission == 29) || // From the Ashes
        (old.mission == 29 && current.mission == 30) || // 'C'est ici l'empire de la mort'
        (old.mission == 30 && current.mission == 31) || // Deja Boom
        (current.zcoord > 274.64 && current.zcoord < 274.66 && current.xcoord > -1134.79 && current.xcoord < -1134.77 &&
         current.ycoord > 392.70 && current.ycoord < 392.72 && old.isLoading == 0 && current.isLoading == 1) // Final Split
    );
}
