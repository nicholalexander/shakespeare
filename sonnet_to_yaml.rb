#!/usr/bin/env ruby

# while !the_end do
#   sonnet_number = read line
  
#   sonnet = read 14 lines

#   save to yaml
# end

require 'pry'
require 'yaml'

class Sonnet
  attr_accessor :number, :lines
  def initialize(number, lines)
    @number = number
    @lines = lines
  end
end

@sonnets = []
lines = []
sonnet_number = nil
counter = 0

file = File.new("sonnets.txt", "r")
file.each do |line|  
  
  if line.chomp.strip.empty?
    next
  end
  
  if counter == 0
    sonnet_number = line.chomp.strip.to_i
  elsif counter > 0 && counter < 15
    lines << line.chomp.strip
  end
  
  counter += 1

  if counter == 15
    sonnet = Sonnet.new(sonnet_number, lines)
    @sonnets << sonnet
    lines = []
    counter = 0
  end

end
file.close

yaml_file = File.open("sonnets.yml", "w") { |file| file.write(@sonnets.to_yaml)}