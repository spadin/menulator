require 'spec_helper'

module Menulator
  describe Calculator do
    before do
      @menu_data = Parser.menu_data("menu.txt")
      @calculator = Calculator.new(@menu_data)
    end

    def find_price(title)
      items = @menu_data[:items]
      i = items.find do |item|
        item[:title] == title
      end
      i[:price]
    end

    it "should determine possible combinations to reach target price" do
      @calculator.calculate_combinations
      @calculator.combinations.class.should == Array
      @calculator.combinations.each do |combination|
        total = combination.inject(0) do |sum, item|
          sum += find_price(item)
        end
        expect(total).to eq(@calculator.target_price)
      end
    end
  end
end