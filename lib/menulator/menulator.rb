require 'trollop'

module Menulator
  def self.combinations(path, target_price = nil)
    menu_data  = Parser.menu_data(path)
    calculator = Calculator.new(menu_data)
    calculator.target_price = target_price if target_price
    calculator.calculate_combinations
    calculator.combinations
  end

  def self.cli
    default_file = "./test/data/menu.txt"

    opts = Trollop::options do
      version "menulator 0.0.1 (c) 2013 Sandro Padin"
      
      banner "menulator is a simple program that calculates all possible"
      banner "combination of items from a menu that can be chosen at a"
      banner "target price."
      banner ""
      banner "Usage:"
      banner "  menulator [--target-price 15.05] [--file ./test/data/menu.txt]"
      banner ""
      banner "where [options] are:"

      opt :file, "Menu file path", :default => default_file
      opt :target_price, "Target price for combination", :type => Float
    end

    file = opts[:file]
    target_price = opts[:target_price]
    path = File.expand_path(File.join(file))

    combinations = Menulator.combinations(path, target_price)

    if combinations.empty?
      puts "No possble combinations"
    else
      puts "Possible combinations:"
      combinations.each_with_index do |combination, index|
        puts "\t#{index+1}) #{combination.join(", ")}"
      end
    end
  end
end