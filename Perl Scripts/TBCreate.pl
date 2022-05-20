# /******************************************************************************
#*
#* Module: TBcreate 
#*
#* File Name: TBcreate
#*
#* Description: Script file to generate Test Bench for any verilog module
#*
#* Author: Ahmed Emad
#******************************************************************************/


use strict;
use warnings;
use diagnostics;

# say prints a line followed by a newline
use feature 'say';
 
# Use a Perl version of switch called given when
use feature "switch";



#argumets 
#ARGV[0] Verilog module

my $file_name = $ARGV[0];


open my $fh, '<', $file_name
  or die "Can't open file : $!";


my $flag = 1;
my $moduleDefinition;
my $modeuleName;
my $parameterList;
my $inout_List;
# Loop To get module Deinition 
while((my $info = <$fh>)){
  if(!$flag){
    last;
  }
  # Delete newline
  chomp($info);
  #print($info);
  # finds module definition
  if(index($info,"module")!=-1){
    # string Module Definition 
    $moduleDefinition = $info;
    while((my $info = <$fh>)){
    if(!$flag){
      last;
      }
      chomp($info);
      #print ($info);
       if(index($info,"\/\/") !=-1){
     # $var = substr $var ,0,index($var);
     $info =~ s/\/\/(.*)//;
      # say "ad";
    }
      if(index($info,";")!=-1){
        $moduleDefinition = $moduleDefinition . $info;
        $flag = 0;
      }else{
        $moduleDefinition = $moduleDefinition . $info;
      }
    }

  }
}
# say $moduleDefinition;
$moduleDefinition=~ s/\(\s{1,}/\(/g ;
$moduleDefinition=~ s/\s{1,}\)/\)/g ;
$moduleDefinition=~ s/\)\s{1,}\(/\)\(/g ;

# say $moduleDefinition;
$moduleDefinition =~ /^(.*)module\s{1,}(.*)\s{1,}#\(parameter\s{1,}(.*)\)\((.*)\);/;

$modeuleName = $2;
$parameterList = $3;
$inout_List = $4;
# say $modeuleName ;
# say $parameterList ;
# say $inout_List ;
# Remove space 
$modeuleName  =~ s/ //;
# Replace Input With Ref & output with wire
$inout_List =~ s/reg//g;
$inout_List =~ s/input/reg/g;
$inout_List =~ s/output/wire/g;

# Split turns a string into an array
my @parameter_array = split /,/, $parameterList;
# for ( @parameter_array){
#   say $_;
# }

# # Split turns a string into an array
my @inout_Array = split /,/, $inout_List;
# for ( @inout_Array){
#   say $_;
# }

my $modeuleNameTB = $modeuleName . "TB";
my $TbFile = $modeuleNameTB .".v";
# say $TbFile;
# say $moduleDefinition;


open my $fhTB, '>', $TbFile
  or die "Can't open file : $!";

print $fhTB <<"Donate";

`timescale 1ns / 1ps

module $modeuleNameTB;
Donate

for ( @inout_Array){
  say $fhTB ("$_;");
}



say $fhTB "\n";

# inistaniate the module
print $fhTB $modeuleName ;

#parmeters
my $i = 0;
print $fhTB "  #( ";
for ( @parameter_array){
  $i = $i+1;
  $_ =~ s/( |\t)//g;
  $_ =~ /^(.*)=(.*)/;
  if($i < scalar @parameter_array ){ 
     print $fhTB ".$1($2),";
  }
  else{
    print $fhTB ".$1($2) ) ";
  }
  
}
say $fhTB "UUT (";
my $len = scalar @inout_Array;
# say $;
# say "(length(@inout_Array))";
$i = 0;
my @inout_ArrayCopy = @inout_Array; 
for ( @inout_ArrayCopy){
  $i = $i+1;
  $_ =~ s/(reg|wire)\s{1,}//;
  $_ =~ s/\[(.*)\]//;
  $_ =~ s/( |\t)//g;
  if($i < scalar @inout_Array ){ 
     say $fhTB ".$_($_),";
  }
  else{
    say $fhTB ".$_($_)";
  }
}

say $fhTB ");";
say $fhTB "parameter CLK_PERIOD =20;";
# define clock
say $fhTB "always #(CLK_PERIOD/2) clk = ~clk ;";

say $fhTB "initial begin";

# define inputs
say $fhTB "\n";
say $fhTB "\n";

for ( @inout_Array)
{
  if($_ =~ /reg/){
  $_ =~ s/(reg)\s{1,}//;
  $_ =~ s/\[(.*)\]//;
  $_ =~ s/( |\t)//g;
  say $fhTB "$_ =    ;"
  }
}
say $fhTB "#20;";
say $fhTB "\n";
say $fhTB "\n";

say $fhTB "#500;";
say $fhTB "\$finish;";
say $fhTB "end";

say $fhTB "endmodule";
close $fhTB or die "Couldn't Close File : $!";

close $fh or die "Couldn't Close File : $!";
