require 'JSON'
require 'pry'

file = File.open("text_data/shakespeare.json")

lines = []

file.each do |line|
  lines << JSON.parse(line)
end

file.close

json = lines.to_json

File.write("text_data/parsed.json", json)