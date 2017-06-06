require 'pry'

class Pantry
  attr_reader :stock, :restock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient].nil?
      return 0
    end
     @stock[ingredient]
  end

  def restock(ingredient, quantity)
    current_quantity = @stock[ingredient]
    @stock[ingredient] = quantity

    if @stock.include?(ingredient)
       @stock[ingredient] = current_quantity.to_i + quantity.to_i
    end
  return @stock
  end


end
#
#   # Building our recipe
# r = Recipe.new("Spicy Cheese Pizza")
# r.add_ingredient("Cayenne Pepper", 0.025)
# r.add_ingredient("Cheese", 75)
# r.add_ingredient("Flour", 500)
#
# pantry = Pantry.new
#
# # Convert units for this recipe
#
# pantry.convert_units(r)
