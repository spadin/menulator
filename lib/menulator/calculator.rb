module Menulator
  class Calculator
    attr_writer :target_price

    def initialize(menu_data)
      @items = menu_data[:items]
      @target_price = menu_data[:target_price]
      @combinations = []
    end

    def combinations
      @combinations.map {|combination| combination.sort}.uniq
    end

    def calculate_combinations(sum_total = 0, possible_combination = [])
      @items.inject(sum_total) do |current_total, item|
        current_sum = current_total + item[:price]
        if(current_sum == @target_price)
          @combinations << possible_combination + [item[:title]]
        elsif (current_sum < @target_price)
          calculate_combinations(current_sum, possible_combination + [item[:title]])
        end
        current_total
      end
    end

    def find_price(title)
      i = @items.find do |item|
        item[:title] == title
      end
      i[:price]
    end
  end
end