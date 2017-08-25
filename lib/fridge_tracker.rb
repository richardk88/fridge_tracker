require_relative '../config/environment'
require_relative '../app/models/fridge'

puts "Enter an option:"
puts "A) List all Fridges"
puts "B) Add a Fridge"
puts "C) Delete a Fridge"
puts "D) List all food from inside a fridge"
puts "E) Add a food item to a fridge"
# puts "F) Eat a food item"
# puts "G) View drink items from a fridge"
option = gets.chomp
puts "You selected #{option}"

if option.upcase == 'A'
   Fridge.all.map do |i|
    puts "Location: #{i.location.to_s}"
    puts "Brand: #{i.brand.to_s}"
    puts "Size: #{i.size} cubic ft"
    puts "Has food: #{i.food}"
    puts "Had drinks: #{i.drink}"
  end
end

if option.upcase == 'B'
  puts "location?"
  location = gets.chomp
  puts "brand?"
  brand = gets.chomp
  puts "size?"
  size = gets.chomp
  puts "food? [yes/no]"
  food = gets.chomp
    case food
      when 'y', 'Y', 'yes'
        food = true
      when 'n', 'N', 'no'
        food = false
    end

  puts "drink? [yes/no]"
  drink = gets.chomp
  case drink
    when 'y', 'Y', 'yes'
      drink = true
    when 'n', 'N', 'no'
      drink = false
  end

  Fridge.create(location: "#{location}", brand: "#{brand}", size: size.to_i, food: food, drink: drink)
end

if option.upcase == 'C'
  puts 'Which fridge do you want to delete? [location]'
  Fridge.all.map do |i|
    puts i.location.to_s
  end
  input = gets.chomp
  Fridge.find_by(location: input).destroy
end

if option.upcase == 'D'
  puts "Pick a fridge to look through: "
  Fridge.all.map {|fridge| puts fridge.brand}
    puts "Which brand of fridge do you want to look through?"
    brand = gets.chomp
    Fridge.find_by(brand: brand).foods.map {|food| puts food.name}
end

if option.upcase == 'E'
  Fridge.all.map{|fridge| puts fridge.location}
  puts "Which fridge to you want to put your food in?"
  brand = gets.chomp
  puts "Food name:"
  name = gets.chomp
  puts "Food weight:"
  weight = gets.chomp
  puts "Food considered vegan? [yes/no]"
  vegan = gets.chomp
    case vegan
      when 'y', 'Y', 'yes'
        vegan = true
      when 'n', 'N', 'no'
        vegan = false
    end
  Fridge.find_by(location: location).foods.push(Food.create(name: "#{name}", weight: "#{weight} lbs", vegan: vegan))
end