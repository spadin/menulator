require 'menulator'

module Menulator
  describe Calculator do
    before do
      path = File.join("test","data","menu.txt")
      menu_data = Parser.menu_data(path)
      @calculator = Calculator.new(menu_data)
    end

    it "should determine possible combinations to reach target price" do
      combinations = @calculator.calculate_combinations
      combinations.should == []
    end
  end
end