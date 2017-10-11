require 'erb'
require 'YAML'

class Sonnet
  attr_accessor :number, :lines
  def initialize(number, lines)
    @number = number
    @lines = lines
  end

  def serialize
    {
      number: "#{@number}",
      lines: "#{@lines.to_json}"
    }
  end
end

file = File.open('sonnet_template.erb')
template = file.read

@sonnets = YAML.load_file('sonnets.yml')

@sonnets.each do |sonnet|
  @number = sonnet.number
  @lines = sonnet.lines
  output = ERB.new(template).result
  File.write("sonnets_output/#{@number}.html.erb", output)
end




