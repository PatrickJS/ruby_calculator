module CalculatorFactory
  def build sym
    Calculator.const_get(sym_to_module_string(sym)).new
  end

  def sym_to_module_string sym
    sym.to_s.split('_').collect{|e| e.capitalize}.join('')
  end
end

module Calculator
  class DefineMethod
    def initialize
      cal :add, :+
      cal :subtract, :-
      cal :divide, :/
      cal :multiply, :*
      cal :power, :**
    end
  
    def cal(name, sym)
      # you may also use
      # self.class.class_eval do
      Calculator.class_eval do
        define_method name, ->(a, b) { a.send(sym, b) }
      end
    end
  end

  class MethodMissing
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

  class Basic
    def initialize
    end

    def add a, b
      a + b
    end

    def subtract a, b
      a - b
    end

    def divide a, b
      a / b
    end

    def muliply a, b
      a * b
    end

    def power a, b
      a ** b
    end
  end
end
