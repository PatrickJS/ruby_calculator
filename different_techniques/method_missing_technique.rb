class Calculator
  def initialize
    @cal={
      add:      ->(a,b) { a + b },
      subtract: ->(a,b) { a - b },
      divide:   ->(a,b) { a / b },
      multiply: ->(a,b) { a * b },
      power:    ->(a,b) { a ** b }
    }
  end
  def method_missing(expression, a, b)
    @cal[expression].call(a,b)
  end
end
