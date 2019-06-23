require "./item.rb"

current_path = File.dirname(__FILE__)
items_folder = "/data/"
files = Dir.glob(current_path + items_folder + "/*.txt")

items = []
ready_to_wear = []

files.each do |file|
  f = File.readlines(file, chomp: true)
  item_name = f[0]
  item_type = f[1]
  item_temperature = f[2]
  items << Item.new(item_name.chomp, item_type.chomp, item_temperature.chomp)
end

puts "Сколько градусов за окном? (можно с минусом)"
user_input = gets.to_i

for item in items
  if item.temperature.include?(user_input)
      ready_to_wear << [item.type, item.name, item.temperature]
  end
end

puts "Предлагаем сегодня надеть:"
ready_to_wear.uniq(&:first).each do |item|
  puts "#{item[1]} (#{item[0]}) #{item[2].min}..#{item[2].max}"
end