function [ value ] = roman3( in_string )
%Accepts a character array representing a Roman number
%Returns the equivalent decimal integer

%start with the last numeral

sl = numel(in_string);

%find its value
value = digit_val(in_string(sl));

%keep track of the value of the last numeral
last_digit = value;

%keep track of how many consecutive matching numerals there have been
rc = 1;

%Look at all numerals from the second to last, back to the first
for place = sl-1:-1:1
    next_digit = digit_val(in_string(place));

    %If the next digit is greater than the last one, add its value
    if  next_digit > last_digit
        value = value + next_digit;
        rc = 0;
        
    %If the next digit is less than the last one, subtract its value
    elseif next_digit < last_digit
            value = value - next_digit;
            
            %If the next digit is the same as the previous one, increment
            %the number of consecutive matching numerals; if that number
            %doesn't exceed three, add the vaue of the numeral; otherwise,
            %the number isn't valid - return 0
    else
            rc = rc + 1;
            if rc > 3
                value = 0;
                return;
            else
                value = value + next_digit;
                rc = 0;
            end
        
    end
    last_digit = next_digit;
end
end

function [digval] = digit_val(digit_char)

digits = ['I', 'V', 'X', 'L', 'C', 'M'];
digit_vals = [1, 5, 10, 50, 100, 1000];

for i = 1:size(digits,2)
    if digit_char == digits(i)
        digval = digit_vals(i);
    end
end
end

