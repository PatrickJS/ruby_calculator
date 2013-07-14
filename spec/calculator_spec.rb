require 'rspec'
require './lib/calculator.rb'

include Calculator
include CalculatorFactory

# if you run this with rspec --profile you will see pretty output
describe 'Performance' do

  UPPER_LIMIT = 1000
  NUMBER = 1000000

  before :all do
    @first = NUMBER.times.map{ Random.rand(UPPER_LIMIT) + 1 }
    @second = NUMBER.times.map{ Random.rand(UPPER_LIMIT) + 1 }
  end

  def calculate_with calc
    NUMBER.times do |n|
      calc.add(@first[n], @second[n])
      calc.subtract(@first[n], @second[n])
      calc.divide(@first[n], @second[n])
      calc.multiply(@first[n], @second[n])
      calc.power(@first[n], @second[n])
    end
  end

  context MethodMissing do
    it "calculates in" do
      calc = build :method_missing
      calculate_with(calc)
    end
  end

  context DefineMethod do
    it "calculates in" do
      calc = build :define_method
      calculate_with(calc)
    end
  end

  context Basic do
    it "calculates in" do
      calc = build :basic
      calculate_with(calc)
    end
  end
end
