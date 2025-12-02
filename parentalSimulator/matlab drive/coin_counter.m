

%This script prompts the user to enter the number of pennies, nickels,
%dimes, quarters, and dollar coins. It then returns the total number of
%coins and their total value


%Convert the script into a function that takes p, n, d, q, and dl as input
%arguments and returns value and count as output arguments

%Save the file with a name corresponding to the name of the
%function

%In the live script, add a call to the function
% 
p = input('Enter the number of pennies: ');
n = input('Enter the number of nickels: ');
d = input('Enter the number of dimes: ');
q = input('Enter the number of quarters: ');
dl = input('Enter the number of dollars: ');

value = (p + 5*n + 10*d + 25*q + 100*dl)/100;
count = p+n+d+q+dl;
   
   
fprintf('You have %d coins that are valued at $%.2f\n',count,value);