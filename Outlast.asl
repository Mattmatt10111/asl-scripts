state("OLGame")
{
    int isLoading : "OLGame.exe", 0x01FFBCC8, 0x118;
    float coords : "OLGame.exe", 0x02020F38, 0x278, 0x40, 0x454, 0x80;
    int checkpoint : "OLGame.exe", 0x02020C88, 0x3AC;
    int pause : "OLGame.exe", 0x2022C93;
}

start
{
    return current.coords > -16422.93 && current.coords < -16416.11 || current.coords > 9543.68 && current.coords < 9550.54;
}

reset
{
}

split
{
     return current.checkpoint > old.checkpoint && current.isLoading == 0 && current.pause == 0;
}

isLoading
{
    return current.isLoading == 1;
}
