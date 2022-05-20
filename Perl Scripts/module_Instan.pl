#/******************************************************************************
#*
#* Module: module_instan 
#*
#* File Name: module_instan
#*
#* Description: Script file to instantiate   any verilog module
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
      if(index($info,"\/\/") !=-1){
     # $var = substr $var ,0,index($var);
     $info =~ s/\/\/(.*)//;
      # say "ad";
    }
      # edit1 remove comments 
      #print ($info);
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

my $modeuleNameIN = $modeuleName . "Inatanse";
my $InstanseFile = $modeuleNameIN .".v";
# say $InstanseFile;
# say $moduleDefinition;


open my $fhTB, '>', $InstanseFile
  or die "Can't open file : $!";



# for ( @inout_Array){
#   say $fhTB ("$_;");
# }



say $fhTB "\n";
my $i = 0;
my @inout_Wires = @inout_Array;
# @inout_Wires =~ s/,/;/g;
for ( @inout_Wires){
  $i = $i+1;
  $_ =~ s/(reg|wire)\s{1,}//;
  # $_ =~ s/\[(.*)\]//;
  # $_ =~ s/ //g; 
  $_ =~ s/( |\t|)//g;
  # $_ =~ s/\s+$//;
     say $fhTB "wire $_;";
}
say $fhTB ("\n\n\n");
# inistaniate the module
print $fhTB $modeuleName ;

#parmeters
$i = 0;
print $fhTB "  #( ";
for ( @parameter_array){
  $i = $i+1;
  $_ =~ s/( |\t|)//g;
  $_ =~ /^(.*)=(.*)/g;
  if($i < scalar @parameter_array ){ 
     say $fhTB ".$1($1),";
  }
  else{
    say $fhTB ".$1($1) ) ";
  }
  
}
say $fhTB "";
print $fhTB "$modeuleName";
print $fhTB "Unit (";
my $len = scalar @inout_Array;
# say $;
# say "(length(@inout_Array))";

$i = 0;
my @inout_ArrayCopy = @inout_Array; 
for ( @inout_ArrayCopy){
  $i = $i+1;
  $_ =~ s/(reg|wire)\s{1,}//g;
  $_ =~ s/\[(.*)\]//g;
  $_ =~ s/ //g;
  $_ =~ s/\t//g;
  if($i < scalar @inout_Array ){ 
     say $fhTB "\t.$_($_),";
  }
  else{
    say $fhTB "\t.$_($_)";
  }
}

say $fhTB ");";

close $fhTB or die "Couldn't Close File : $!";

close $fh or die "Couldn't Close File : $!";


