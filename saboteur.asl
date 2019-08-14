state("Saboteur")
{
    int mission: "Saboteur.exe", 0x010977AC, 0x14, 0x1A0;
    bool isLoading: "", 0x010964F4, 0xBBD0;
}

state("Saboteur", "GOG")
{
    // GOG
    int mission: "Saboteur.exe", 0x010AADCC, 0x14, 0x1A0;
    bool isLoading: "", 0x010A9B14, 0xBBD0;
}

init
{   
    version = "";
    if (modules.First().ModuleMemorySize == 19122752) {
        version = "GOG";
    }
}

start
{
     return current.mission == 0 && current.isLoading;
}

isLoading
{
     return current.isLoading;
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
        (old.mission == 30 && current.mission == 31)    // Deja Boom 
    );
}
