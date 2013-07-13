class Calculator
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
