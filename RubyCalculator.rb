#
#   Basic Ruby Calculator v0.01
#          by gdi2290
#
#   Ruby version: Ruby 1.9.3 p327
#

def crunch_numbers(first_number= 0, second_number= 0, operatorType=3)
  if operatorType == 'Subtract' or
     operatorType == 'subtract' or
     operatorType == 'Minus'    or
     operatorType == 'minus'    or
     operatorType == "-"
     answer = first_number - second_number
     sign = '-'
     string_sign = "subtract from"
  elsif operatorType == 'Divide' or
        operatorType == 'divide' or
        operatorType == "\/"
     answer = first_number / second_number
     sign = '/'
     string_sign = 'divide from'
  else operatorType == 'Add'  or
       operatorType == 'add'  or
       operatorType == 'Plus' or
       operatorType == 'plus' or
       operatorType == '+'
     answer = first_number + second_number
     sign = '+'
     string_sign = "add to"
   end
  return answer, sign, string_sign
end

# Welcome message
puts "Welcome to my Basic Calculator\n"

# User selects an Operator
puts "Please select your Math operator: Add, Subtrack, or Divide? "

# Converts the String operator to a Variable
user_imput = gets.chomp.to_s
string_sign = crunch_numbers(0,0,user_input) # I need another way to grab a default operator

# User selects his or her first number
print "What is the first number? "
first_number = gets.chomp.to_f

# User selects his or her second number
print "What is the second number you want to #{string_sign[2]} #{first_number}? "
second_number = gets.chomp.to_f

# Calculates the answer
answer = crunch_numbers(first_number, second_number, user_input)

# Prints out the answer
puts "#{first_number} #{answer[1]} #{second_number} = #{answer[0]} \n\n"
puts "The answer is #{answer[0]}"



