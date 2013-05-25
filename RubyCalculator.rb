#       -*- coding: utf-8 -*-
#
#      Ruby Calculator v1.0.0
#          by gdi2290
#
#    MRI Ruby Version: 2.0.0p0
#

def calculator(expression, *arguments)
  {
    add:      -> (*args) { args[0] + args[1] },
    subtract: -> (*args) { args[0] - args[1] },
    divide:   -> (*args) { args[0] / args[1] },
    multiply: -> (*args) { args[0] * args[1] },
    power:    -> (*args) { args[0] ** args[1] }
  }[expression].call(*arguments)
end
