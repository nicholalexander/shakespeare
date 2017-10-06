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
    counter == 0
    next
  end

  if counter == 0
    sonnet_number = line.chomp.strip.to_i
  else
    lines << line.chomp.strip
  end

  counter += 1

  case sonnet_number
  when 99
    line_count = 16
  when 126
    line_count = 13
  else
    line_count = 15
  end
  
  if counter == line_count
    sonnet = Sonnet.new(sonnet_number, lines)
    @sonnets << sonnet
    lines = []
    counter = 0
  end


end
file.close

yaml_file = File.open("sonnets.yml", "w") { |file| file.write(@sonnets.to_yaml)}