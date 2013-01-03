require 'spec_helper'

module Menulator
  describe Menulator do
    describe "#combinations" do
      it "should return an Array with 2 items" do
        Menulator.combinations("menu.txt").class.should == Array
        Menulator.combinations("menu.txt").size.should == 2
      end
    end
  end
end