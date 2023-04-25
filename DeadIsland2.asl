state("DeadIsland-Win64-Shipping")
{
    int pause: "DeadIsland-Win64-Shipping.exe", 0x0798B360, 0x90, 0x10, 0x80, 0x40, 0xC0, 0x38, 0x5448;
    int loading: "DeadIsland-Win64-Shipping.exe", 0x6FDBA70;
}

init
{
    refreshRate = 30;
}

isLoading
{
    return current.pause > 0 || current.loading == 1;
}
