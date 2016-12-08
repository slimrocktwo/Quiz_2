#!/bin/perl

##CIS 140 QUIZ 2
## Created by Steve Langewicz II
## 12-8-2016

use 5.16.3;
#use warnings;

my ($department, $employeeID, $yearsServed);
my (@serviceTotals);


sub main {
        menu();

}

main();

sub menu{
        departmentPrimer();
        while ($department != 0){
                while (!(defined $employeeID) || $employeeID < 1){
                        print "Enter the Employee ID Number: ";
                        chomp ($employeeID = <STDIN>);
                        if (!(defined $employeeID) || $employeeID < 1 || $employeeID > 5000){
                                say "An Employee ID Number must be between 1 and 5000.";
                                sleep 2;
                                system ("clear");
                                $employeeID = 0;
                        }
                }
                while (!(defined $yearsServed) || $yearsServed < 1){
                        print "Enter the years of service for Employee $employeeID: ";
                        chomp ($yearsServed = <STDIN>);
                        if (!(defined $yearsServed) || $yearsServed < 1 || $yearsServed > 40){
                                say "Years Served must be between 1 and 40.";
                                sleep 2;
                                system ("clear");
                                $yearsServed = 0;
                        }
                }
                @serviceTotals[$department] = @serviceTotals[$department] + $yearsServed;
                say "\n\nDepartment $department has a total of @serviceTotals[$department] combined hours of service.";
                sleep 2;
                system ("clear");
                $department = 99;
                $employeeID = 0;
                $yearsServed = 0;
                departmentPrimer();
        }
}



sub departmentPrimer{
        while ($department == 99 || !(defined $department)){
                print "Enter a department number between 1 and 10, or enter 0 to Quit: ";
                chomp ($department = <STDIN>);
                if (!(defined $department) || $department < 0 || $department > 10){
                        say "Incorrect Entry! Try again.";
                        sleep 2;
                        $department = undef;
                        system ("clear");
                }
        }
}
   
