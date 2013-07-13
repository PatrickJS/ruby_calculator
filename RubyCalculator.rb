#       -*- coding: utf-8 -*-
#
#      Ruby Calculator v1.0.0
#          by gdi2290
#
#    MRI Ruby Version: 2.0.0p0
#
class Calculator
  def initialize
    x :add, :+
    x :subtract, :-
    x :divide, :/
    x :multiply, :*
    x :power, :**
  end
  
  def x name, sym
    self.class.class_eval do
      define_method(name, ->(a, b){ a.send(sym, b) })
    end
  end
end
