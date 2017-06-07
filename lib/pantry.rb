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
      {quantity: (1000 * number).to_i, units: "Milli-Units"}
    else
      {quantity: number, units: "Universal Units"}
    end
  end

  def convert_units(recipe)
    converted_values = recipe.ingredients.map do |ingredient|
      [ingredient[0], convert_unit(ingredient[1])]
    end
    converted_values.to_h
  end
end
