#
#   Basic Ruby Calculator v0.01
#          by gdi2290
#
#    Ruby version: Ruby 1.9.3 p0
#   

# Uhmmm.... lots of things going on here :P
def crunchNumbers(firstNumber= 0, secondNumber= 0, operatorType=3)
  if operatorType == "Subtract" or
     operatorType == "subtract" or
     operatorType == "Minus"    or
     operatorType == "minus"    or
     operatorType == "-"
     answer = firstNumber - secondNumber
     sign = "-"
     stringSign = "subtract from"
  elsif operatorType == "Divide" or
        operatorType == "divide" or 
        operatorType == "/"
     answer = firstNumber / secondNumber
     sign = "/"
     stringSign = "divide from"
  else operatorType == "Add"  or
       operatorType == "add"  or
       operatorType == "Plus" or
       operatorType == "plus" or
       operatorType == "+"  
     answer = firstNumber + secondNumber
     sign = "+"
     stringSign = "add to"
   end
  return answer, sign, stringSign
end

# Welcome message
puts "Welcome to my awesome calculator made by gdi2290 \n" 

# User selects an Operator 
print "Please select your math operator: Add, Subtrack, or Divide? "

# Converts the String operator to a Variable
operator = gets.chomp.to_s
stringSign = crunchNumbers(0,0,operator) # I need another way to grab a default operator

# User selects his or her first number
print "What is the first number? "
firstNumber = gets.chomp.to_f

# User selects his or her second number
print "What is the second number you want to #{stringSign[2]} #{firstNumber}? "
secondNumber = gets.chomp.to_f

# Calculates the answer
answer = crunchNumbers(firstNumber, secondNumber, operator)

# Prints out the answer
puts "#{firstNumber} #{answer[1]} #{secondNumber} = #{answer[0]} \n\n"
puts "The answer is #{answer[0]}"



