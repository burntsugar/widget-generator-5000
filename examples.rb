require_relative 'lib/widget_generator'

puts "\n:::::::::::::::::::::::::::::::::::::::\n"
puts "\n:::::::: WIDGET GENERATOR 5000 ::::::::\n"
puts "\n:::::::::::::::::::::::::::::::::::::::\n"

# Gets the 100 generated widgets array...
puts "\nGetting the 100 generated widgets array..."
widgets = WidgetGenerator::WidgetManager.generate_widgets

# Show the number of widgets in the array...
puts "\nShow the number of widgets in the array..."
puts widgets.length

# Create a new Widget instance
puts "\nCreating a new Widget instance..."
extra_widget = WidgetGenerator::Widget.new(5000,"Extra Widget","A very useful thing",35,5,9,2,0.3)

# Now we have 100 widgets in the "widgets" array, as well as 1 widget called "extra_widget". 101 in total. Let's be sure...
puts "\nNow we have 100 widgets in the 'widgets' array, as well as 1 widget called 'extra_widget'. 101 in total. Let's be sure..."

# Show the number of widgets in memory...
puts "\nShow the number of widgets in memory..."
puts WidgetGenerator::Widget.get_instance_count

# 0ther stuff...
puts "\nOther stuff..."

puts "\nPrint the first 10 widgets..."
# Print the first 10 widgets...
counter = 0
10.times do
    puts widgets[counter]
    counter += 1
end

puts "\nPrint the last 10 widgets..."
# Print the last 10 widgets...
counter = widgets.length - 1
10.times do
    puts widgets[counter]
    counter -= 1
end

puts "\nPrint the middle 10 widgets..."
# Print the middle 10 widgets...
middle_index = ((widgets.length - 1) / 2) - 5
counter = middle_index
10.times do
    puts widgets[counter]
    counter += 1
end

puts "\nPrint widgets in the array - each as a hash..."
# Print widgets in the array - each as a hash...
widgets.each do |widget|
    puts widget.to_hash
end

puts
puts "\nPrint widgets in the array - each as json..."
puts WidgetGenerator::WidgetManager.serialize_widgets_to_jzon(widgets)

puts
puts "\nPrint widgets in the array - for MongoDB..."
# Print widgets in the array - for MongoDB...
puts WidgetGenerator::WidgetManager.serialize_widgets_for_mongodb(widgets)

puts "\n::::::::::::::::::::::::::::::::::::\n"
puts "\n:::::::::::::: fin :::::::::::::::::\n"
puts "\n::::::::::::::::::::::::::::::::::::\n"