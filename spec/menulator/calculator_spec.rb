require 'menulator'

module Menulator
  describe Calculator do
    before do
      menu_data = Parser.menu_data("menu.txt")
      @calculator = Calculator.new(menu_data)
    end

    it "should determine possible combinations to reach target price" do
      combinations = @calculator.calculate_combinations
      @calculator.combinations.class.should == Array
      @calculator.combinations.each do |combination|
        total = combination.inject(0) do |sum, item|
          sum += @calculator.find_price(item)
        end
        expect(total).to eq(@calculator.target_price)
      end
    end
  end
end