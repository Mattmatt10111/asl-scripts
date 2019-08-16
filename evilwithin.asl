state("EvilWithin")
{
        int chapter: "evilwithin.exe", 0x2133158;
        int InGame: "evilwithin.exe", 0x9A55EB0;
}

start
{
        return current.chapter == 1 && current.InGame == 1;
}

isLoading
{
        return current.InGame == 0;
}

split
{ 
       return(
           (old.chapter == 1 && current.chapter == 2) ||
           (old.chapter == 2 && current.chapter == 3) ||
           (old.chapter == 3 && current.chapter == 4) ||
           (old.chapter == 4 && current.chapter == 5) ||
           (old.chapter == 5 && current.chapter == 6) ||
           (old.chapter == 6 && current.chapter == 7) ||
           (old.chapter == 7 && current.chapter == 8) ||
           (old.chapter == 8 && current.chapter == 9) ||
           (old.chapter == 9 && current.chapter == 10) ||
           (old.chapter == 10 && current.chapter == 11) ||
           (old.chapter == 11 && current.chapter == 12) ||
           (old.chapter == 12 && current.chapter == 13) ||
           (old.chapter == 13 && current.chapter == 14) ||
           (old.chapter == 14 && current.chapter == 15)
        );
}
