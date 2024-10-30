state("RDR", "1.00") //1516099072 


{
    int loading: "RDR.exe", 0x02C36700, 0x68;
    string100 RDRautosave: "RDR.exe", 0x022F3030, 0x1542;
    //string100 UNautosave: "RDR.exe", 0x02B02FB0, 0x3262;
    byte otherload: "RDR.exe", 0x02AB3A18, 0x3071;
}


init
{	
    print(modules.First().ModuleMemorySize.ToString());
	switch (modules.First().ModuleMemorySize)
	{
        case (1516099072):
		version = "1.00";
		break;
	}
}


start
{

}


split
{
    return current.RDRautosave == "Exodus in America" && old.RDRautosave != current.RDRautosave;
}

split
{
   return (
          //Red Dead Redemption
          (current.RDRautosave == "Exodus in America" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "New Friends, Old Problems" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Obstacles in Our Path" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "This is Armadillo, USA" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Women and Cattle" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Wild Horses, Tamed Passions" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "A Tempest Looms" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Burning" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Political Realities in Armadillo" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Justice in Pike's Basin" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Spare the Rod, Spoil the Bandit" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Hanging Bonnie MacFarlane" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Assault on Fort Mercer" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Old Swindler Blues" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "You Shall Not Give False Testimony, Except for Profit" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Liars, Cheats and Other Proud Americans" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Can a Swindler Change His Spots?" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Sport of Kings, and Liars" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Exhuming and Other Fine Hobbies" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "A Gentle Drive with Friends" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Let the Dead Bury Their Dead" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "A Frenchman, a Welshman and an Irishman" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Man is Born Unto Trouble" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "On Shaky's Ground" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "We Shall Be Together in Paradise" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Civilization, at Any Price" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Demon Drink" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Empty Promises" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Mexican Caesar" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Cowards Die Many Times" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Gunslinger's Tragedy" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Landon Ricketts Rides Again" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Lucky in Love" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Mexican Wagon Train" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "My Sister's Keeper" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Must a Savior Die?" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Father Abraham" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Captain De Santa's Downfall" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Great Mexican Train Robbery" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Gates of El Presidio" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "An Appointed Time" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Bear One Another's Burdens" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Great Men are Not Always Wise" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "And You Will Know The Truth" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "And The Truth Will Set You Free" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "At Home with Dutch" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "For Purely Scientific Purposes" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Prodigal Son Returns (To Yale)" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Outlaw's Return" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Pestilence" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Old Friends, New Problems" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "By Sweat and Toil" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "A Continual Feast" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "John Marston and Son" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Wolves, Dogs and Sons" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "Spare the Love, Spoil the Child" && old.RDRautosave != current.RDRautosave) ||
          (current.RDRautosave == "The Last Enemy That Shall Be Destroyed" && old.RDRautosave != current.RDRautosave)
          );
}


isLoading
{
    return current.loading == 1 || current.otherload == 1;
}
