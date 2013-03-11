#!usr/bin/env perl

use 5.010;


#open CONFIG, 'dino'; #like STDIN
#open CONFIG, '<dino'; #like STDIN (default)
#open BEDROCK, '>fred'; #like STDOUT
#open LOG, '>>logfile'; # appending

#my $selected_output = 'my_output';
#open LOG, "> $selected_output"; #space after > is necessary if selected_output is >passwd

open CONFIG, '<', 'dino'; #modern perl
open CONFIG, '<', 'dino'; # opening again will close the previous

#open BEDROCK, '>', $file_name;
#open LOG , '>>', &logfile_name;
$file_name = 'bedrock';

open BEDROCK, '>:utf8', $file_name; #utf8 encoding only available with 3 arguments version

# % perl -MEncode -le "print for Encode->encodings(':all')" 

open BEDROCK, '>:crlf', $file_name; #windows encoding CR_LF


binmode STDOUT; #don't transalte line endings
binmode STDERR; #don't transalte line endings

binmode STDOUT, ':encoding(UTF-8)';


my $success = open LOG, '>>', 'logfile'; #check whether file is opened successfully

if(! $success)
{
	#open failed
	die "Cannot create logfile: $!"; # human-readable complaint message is available in Perl’s special variable $!
	#do not use @! when system failure happens...
	die "Cannot create logfile: \n"; #won't print out line number and file;
}

warn "just warning \n"; # don't exit program..


use autodie;
#open LOG, '<', 'nonexistfile'; # no error handling required.. auto die..

if( ! open PASSWD, "/etc/passwd"){
	die "die... ";
}

while(<PASSWD>) #file read
{
	chomp;
	say LOG $_;
	printf STDERR "%d percent complete\n", $i++;
}

select BEDROCK; #default output filehandle
print "I hope mr slate doesn't find out about this\n";
print "Wilma!\n";

close BEDROCK; 


#send errors to my private error log

if(! open STDERR, ">>./error.log") {
	die " can't open file $!";
}
say $!;





