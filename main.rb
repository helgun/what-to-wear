require_relative "item"

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

items.each do |item|
  if item.fits_for_temperature?(user_input)
      ready_to_wear << item
  end
end

ready_to_wear.uniq!{ |item| item.type }

puts "Предлагаем сегодня надеть:"
ready_to_wear.each do |item|
 puts "#{item.name} (#{item.type}) #{item.temperature_range.min}..#{item.temperature_range.max}"
end
