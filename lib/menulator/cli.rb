module Menulator
  class CLI
    def self.setup
      default_file = "menu.txt"

      Trollop::options do
        version "menulator 0.0.1 (c) 2013 Sandro Padin"
        
        banner <<-EOF.strip_heredoc
        menulator takes a menu and calculates every combination of menu items
        possible given a target price.
        
        Usage:
          menulator [--target-price 15.05] [--file #{default_file}]

        where [options] are:
        EOF

        opt :file, "Menu file path", :default => default_file
        opt :target_price, "Target price for combination (ex: 15.05)", :type => Float
      end
    end

    def self.run!
      opts = Menulator::CLI.setup
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
end

# Borrowed from:
# https://github.com/rails/rails/blob/master/activesupport/lib/active_support/core_ext/string/strip.rb
class String
  def strip_heredoc
    indent = scan(/^[ \t]*(?=\S)/).min.size || 0
    gsub(/^[ \t]{#{indent}}/, '')
  end
end