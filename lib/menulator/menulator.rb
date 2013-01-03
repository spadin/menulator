require 'trollop'

module Menulator
  def self.combinations(path, target_price = nil)
    menu_data  = Parser.menu_data(path)
    calculator = Calculator.new(menu_data)
    calculator.target_price = target_price if target_price
    calculator.calculate_combinations
    calculator.combinations
  end
end