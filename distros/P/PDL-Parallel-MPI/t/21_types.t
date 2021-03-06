#!/usr/bin/perl -w -I/accounts/darin/current/blib/arch -I/accounts/darin/current/blib/lib

use PDL;
use PDL::Parallel::MPI;
mpirun(2);

MPI_Init();
$rank = get_rank();
$a=float($rank * ones(2));
print "rank = $rank".$a,"\n";
$a->move( 1 => 0);
print "rank = $rank".$a,"\n";
if ($rank ==0) { 
	print "1..1\n";
	print ($a->at(0) == 1 ? "ok 1\n" : "nok 1\n"); 
}
MPI_Finalize();
