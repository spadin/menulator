require 'menulator'

module Menulator
  describe Parser do
    before do
      @path = File.join("test","data","menu.txt")
      @parser = Parser.new(@path)
    end

    it "should load a menu file" do
      @parser.text.should_not == ""
    end

    it "should parse the menu file as " do
      menu_data = @parser.parse
      menu_data[:target_price].should == 15.05
    end

    it "should return the menu data in a single call" do
      menu_data = Parser.menu_data(@path)
      menu_data[:target_price].should == 15.05
    end
  end
end