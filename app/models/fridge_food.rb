class FridgeFood < ApplicationRecord
  belongs_to :fridge
  belongs_to :food
end
