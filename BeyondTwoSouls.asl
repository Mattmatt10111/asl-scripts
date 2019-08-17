state("BeyondTwoSouls")
{
    int loading : 0x01CA5A90, 0x0, 0x18;
    int level : 0x01CA5120, 0x30, 0x30, 0x98, 0xD0, 0x30, 0x0;
}

start
{
     return old.loading == 0 && current.loading == 1;
}

split
{
   return(
   (old.level == 1 && current.level == 2) ||
   (old.level == 2 && current.level == 3) ||
   (old.level == 3 && current.level == 4) ||
   (old.level == 4 && current.level == 5) ||
   (old.level == 5 && current.level == 6) ||
   (old.level == 6 && current.level == 7) ||
   (old.level == 7 && current.level == 8) ||
   (old.level == 8 && current.level == 9) ||
   (old.level == 9 && current.level == 10) ||
   (old.level == 10 && current.level == 11) ||
   (old.level == 11 && current.level == 12) ||
   (old.level == 12 && current.level == 13) ||
   (old.level == 13 && current.level == 14) ||
   (old.level == 14 && current.level == 15) ||
   (old.level == 15 && current.level == 16) ||
   (old.level == 16 && current.level == 17) ||
   (old.level == 17 && current.level == 18) ||
   (old.level == 18 && current.level == 19) ||
   (old.level == 19 && current.level == 20) ||
   (old.level == 20 && current.level == 21) ||
   (old.level == 21 && current.level == 22) ||
   (old.level == 22 && current.level == 23) ||
   (old.level == 23 && current.level == 24) ||
   (old.level == 24 && current.level == 25)
 );
}

isLoading
{
    return current.loading == 1;
}
