require_relative 'widget'

widgets = WidgetGenerator::WidgetManager.generate_widgets

puts "\n::::::::::::::::::::::::::::::::::::\n"
puts "\n:::::::: WIDGET GENERATOR 5000 ::::::::\n"
puts "\n::::::::::::::::::::::::::::::::::::\n"

puts
puts "...print each widget as a hash..."
widgets.each do |widget|
    puts widget.to_hash
end

puts
puts "...print each widget as a string..."
widgets.each do |widget|
    puts widget.to_s
end

puts
puts "...print each widget as JSON..."
widgets.each do |widget|
    puts widget.to_jzon
end

puts "\n::::::::::::::::::::::::::::::::::::\n"
puts "\n:::::::::::::: fin :::::::::::::::::\n"
puts "\n::::::::::::::::::::::::::::::::::::\n"


