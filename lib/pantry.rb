require 'pry'

class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    if @stock[ingredient].nil?
        0
    else
     @stock[ingredient]
    end
  end

  def restock(ingredient, quantity)
    current_quantity   = stock_check(ingredient)
    @stock[ingredient] = current_quantity + quantity

  end

  def convert_unit(number)
    if number > 100
      {quantity: number / 100, units: "Centi-Units"}
    elsif number < 1
      {quantity: 1000 * number, units: "Milli-Units"}
    else
      {quantity: number, units: "Universal Units"}
    end
  end

  def convert_units(recipe)
    # * Centi-Units -- Equals 100 Universal Units
    # * Milli-Units -- Equals 1/1000 Universal Units

    # Then, we'll add a new method, `convert_units`, which takes a `Recipe` and outputs updated units for it following these rules:

    # Return
    # 1. If the recipe calls for more than 100 Units of an ingredient, convert it to Centi-units
    # 2. If the recipe calls for less than 1 Units of an ingredient, convert it to Milli-units
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
