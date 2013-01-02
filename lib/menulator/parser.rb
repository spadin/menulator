module Menulator
  class Parser
    attr_reader :text

    def initialize(path)
      @text = read(path)
    end

    def read(path)
      File.read(path)
    end

    def parse
      menu_data = Hash.new
      menu_data[:items] = []
      @text.split("\n").each_with_index do |line, idx|
        if idx == 0
          menu_data[:target_price] = Float(line.gsub("$",""))
        else
          lineitem = line.split(",$")
          menu_data[:items] << {
            :title => lineitem[0],
            :price => Float(lineitem[1])
          }
        end
      end
      menu_data
    end

    def self.menu_data(path)
      parser = self.new(path)
      parser.parse
    end
  end
end