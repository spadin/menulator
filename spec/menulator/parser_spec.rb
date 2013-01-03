require 'spec_helper'

TEST_DATA =<<-EOS
$15.05
mixed fruit,$2.15
french fries,$2.75
side salad,$3.35
hot wings,$3.55
mozzarella sticks,$4.20
sampler plate,$5.80
EOS

module Menulator
  describe Parser do
    before do
      Parser.any_instance.stub(:read).and_return(TEST_DATA)
      @parser = Parser.new("menu.txt")
    end

    it "should load a menu file" do
      @parser.text.should_not == ""
    end

    it "should parse the menu file" do
      menu_data = @parser.parse
      menu_data[:target_price].should == 15.05
    end

    it "should return the menu data in a single call" do
      menu_data = Parser.menu_data(@path)
      menu_data[:target_price].should == 15.05
    end
  end
end