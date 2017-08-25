FridgeFood.destroy_all
FridgeDrink.destroy_all
Fridge.destroy_all
Food.destroy_all
Drink.destroy_all

fridgeA = Fridge.create(location: 'Kitchen', brand: 'Samsung', size: 27, food: true, drink: true)

steak = Food.create(name: 'Steak', weight: 3, vegan: false)
watermelon = Food.create(name: 'Watermelon', weight: 8, vegan:true)
pizza = Food.create(name: 'Pizza', weight: 6, vegan: false)

sprite = Drink.create(name: 'Sprite', size: 6, alcoholic: false)
vitamin_water = Drink.create(name: 'Vitamin Water', size: 5, alcoholic: false)
gatorade = Drink.create(name: 'Gatorade', size: 5, alcoholic: false)

fridgeA.foods = [
    steak,
    watermelon,
    pizza
]

fridgeA.drinks = [
    sprite,
    vitamin_water,
    gatorade
]


