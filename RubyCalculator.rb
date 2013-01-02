#         -*- coding: utf-8 -*-
#
#   Basic Ruby Calculator v0.8.0
#          by gdi2290
#
#   MRI Ruby Version: 1.9.3 p362
#

class Calculator
  attr_accessor :operator_list, :operator, :first_number, :second_number, :result
  def initialize
    @operator_list = [:add, :subtract, :divide, :muliply] << :exponent << :root # Add more operators by removing '#
  end

  def crunch_numbers
    # @operator_list.each do |operator|
      case
      when @operator == 'add'
        self.add(@first_number, @second_number)
      when @operator == 'subtract'
        self.subtract(@first_number, @second_number)
      when @operator == 'divide'
        self.divide(@first_number, @second_number)
      when @operator == 'muliply'
        self.muliply(@first_number, @second_number)
      when @operator == 'exponent'
        self.exponent(@first_number, @second_number)
      when @operator == 'root'
        @first_number = nil
        self.root(@second_number)
      end
  end
  def add(a, b)
    a + b
  end
  def subtract(a, b)
    a - b
  end
  def divide(a, b)
    a / b
  end
  def muliply(a, b)
    a * b
  end
  def exponent(base, exponent)
    base ** exponent
  end
  def root(x)
    Math.sqrt(x)
  end

end

class Screen
  attr_accessor :result, :operator#, :decimal_result
  # def initialize
  #   @decimal_result = []
  # end

  def refresh(time=0.005)
    sleep time
    puts "\e[H\e[2J"
  end
  def show_header(time=0.005, message="\n\tBasic Ruby Calculator\n") # Welcome message
    self.load(37,time, ".")
    self.type_text(message,time)
    self.load(37,time, ".")
  end

  def type_text(message="",time=0.005)
    letters = message.split('')
    letters.each do |letter|
      print letter
      sleep time
    end
  end
  def operation(operator)
      operator.each do |line|
        sleep 0.05
        print "\n   * #{line.capitalize}"
        sleep 0.05
      end
  end
  def convert_operator(operator)
      case
      when operator == 'add'
        ' + '
      when operator == 'subtract'
        ' - '
      when operator == 'divide'
        ' % '
      when operator == 'muliply'
        '*'
      when operator == 'exponent'
          '^'
      when operator == 'root'
        '√'
      end
  end
  # first world problems
  # def add_decimals(answer)
  #   count = 0
  #   number = answer.to_s.split('')
  #   number.each do |num|
  #     count += 1
  #     if count == 4 && answer.odd?
  #       @decimal_result << ','
  #       count = 0
  #     elsif count == 3 && answer.even?
  #       @decimal_result << ','
  #       count = 0
  #     end
  #     @decimal_result << num
  #   end
  #   @decimal_result = @decimal_result.join('')
  # end
  def load(amount, time, symbol, bar=false)
    if bar
      print "\n["end
    amount.times do
      sleep time/2
      print symbol
      sleep time/2
    end
    if bar
     print "]"
     sleep 0.5
    end
  end

end

class Input
  # attr_accessor #:saved_commands, :last_commnd
  # def initialize
  # end

  def command
    gets.chomp
  end
end

calculator    = Calculator.new
screen        = Screen.new
input         = Input.new

loop do
  screen.refresh
  screen.show_header
  screen.operation(calculator.operator_list)
  screen.type_text("\nWhich operation would you like to preform: ")
  calculator.operator = input.command.downcase
  screen.operator = screen.convert_operator(calculator.operator)

  screen.refresh
  screen.show_header(0)
      # quick a dirty way of changing the view of root and exponent
      if calculator.operator == 'root'
      screen.type_text("\nWhich number do you want to square root? ")
      calculator.second_number = input.command.to_i
      elsif calculator.operator == 'exponent'
      screen.type_text("\nWhat is the base number? ")
      calculator.first_number = input.command.to_i

      screen.type_text("What is the exponent number? ")
      calculator.second_number = input.command.to_i
      exponent = calculator.second_number
      else
      #end
  screen.type_text("\nWhat is the first number? ")
  calculator.first_number = input.command.to_i

  screen.type_text("What is the second number? ")
  calculator.second_number = input.command.to_i
  end
  screen.refresh
  screen.show_header(0)
  screen.load(35,0.005,"#", true)


  screen.refresh
  screen.show_header(0)
  calculator.result = calculator.crunch_numbers
  screen.result = calculator.result # for when I add decimals
  screen.type_text("\nYour answer\n#{calculator.first_number}#{screen.operator}#{calculator.second_number} = #{screen.result}")
  screen.type_text("\nWould you like to restart or end the program? ")
  if input.command == "end" then break end
  screen.type_text('Reloading')
  screen.load(10,0.025,'.')
  sleep 0.5
end
  screen.refresh
  screen.type_text("\tGood Bye", 0.05)
  sleep 0.5
  screen.refresh
