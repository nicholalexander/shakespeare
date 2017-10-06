require 'pry'

class ScenePrinter
  def initialize(lines)
    @lines = lines
  end

  def run
    @lines.each do |line|
      puts line
    end
  end
end


def set_act(line)
  line.split('.')[0].split('ACT').last.strip
end

def set_scene(line)
  line.split('.')[1].split('SCENE')[-1].strip
end

def all_caps?(string)
  string == string.upcase
end

def charachter_change?(line)
  split_line = line.split('.')
  all_caps?(split_line[0]) && split_line.length > 1
end


lines = []
file = File.open("act_1_scene_1.txt")
act = nil
scene = nil

file.each.with_index do |line, index|
  
  line = line.chomp.strip

  if line.empty?
    next
  end

  if line[0..3] == "ACT"
    act = set_act(line)
    scene = set_scene(line)
  end

  if !all_caps?(line.split('.')[0])
    lines[index] = {type: :charachter_continued, line: line}
  elsif charachter_change?(line)
    lines[index] = {type: :charachter, character: line.split('.')[0], line: line.split('.')[1..-1].join(' ')}
  else
    lines[index] = {type: :charachter_continued, line: line}
  end

end

binding.pry


puts 'blurgh'