no warnings 'all';
my $f = $ARGV[0];
my $escape = $ARGV[1];
my $num = $ARGV[2];
my $nome = $ARGV[3];
open(FILE, "pdftotext $f $f.txt|") or die "Could not open file: $!";
close(FILE);
open(FILE, "$f.txt") or die "Could not open file: $!";
my ($phrases, $words, $letters) = (0,0,0);

my $numberOfPoints = 0;
my $numberOfLetters = 0;
my $con = 0;

for my $x (<FILE>) {
    if ($con < $num){
        if ($x =~ /$ARGV[1]/){
		no warnings 'all';            
		$con++
        }
    } else{
	no warnings 'all';
    	$numberOfPoints = 0;
    	$numberOfLetters = 0;
    	
    	$numberOfPoints = () = $x =~ /\.(?![0-9])/gi;
        $phrases += $numberOfPoints;
        $numberOfPoints = () = $x =~ /\;\n/gi;
        $phrases += $numberOfPoints;
        $numberOfPoints = () = $x =~ /\?/gi;
        $phrases += $numberOfPoints;
        $numberOfPoints = () = $x =~ /\!/gi;
        $phrases += $numberOfPoints;
        
        $numberOfLetters = () = $x =~ /[A-z]/gi;
        $letters += $numberOfLetters;

        $words += scalar(split(/\s+/, $x));
    }
}

#print(" phrases=$phrases\n words=$words\n letters=$letters\n");
printf (89+((300*$phrases-10*$letters)/$words));
print "\n";
open(my $file, '>>', "Gulpease.txt") or die "Could not open file: $!";
#my $gulpIndex = $nome."->".(89+((300*$phrases-10*$letters)/$words))."\n";
my $gulpIndex = (89+((300*$phrases-10*$letters)/$words))."\n";
printf $file $gulpIndex;
close($file);
close("$f.txt");
unlink "$f.txt";
