module Menulator
  class Calculator
    attr_accessor :target_price

    def initialize(menu_data)
      @items = menu_data[:items]
      @target_price = menu_data[:target_price]
      @combinations = []
    end

    def combinations
      @combinations.collect {|combination| combination.sort}.uniq
    end

    def calculate_combinations(previous_sum = 0, combination = [])
      @items.each do |item|
        current_sum = previous_sum + item[:price]
        current_combination = combination + [item[:title]]
        if(current_sum == target_price)
          @combinations << current_combination
        elsif (current_sum < target_price)
          calculate_combinations(current_sum, current_combination)
        end
      end
    end
  end
end
