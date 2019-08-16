state("BeyondTwoSouls")
{
    int loading : "bink2w64.dll", 0x57FFC;
}

isLoading
{
    return current.loading == 1;
}
