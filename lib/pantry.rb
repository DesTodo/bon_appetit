require 'pry'

class Pantry
  attr_reader :stock, :shopping_list
  def initialize
    @stock = {}
    @shopping_list = {}
  end

  def stock_check(ingredient)
    check_ingredients(@stock, ingredient)
  end

  def shopping_list_check(ingredient)
    check_ingredients(@shopping_list, ingredient)
  end

  def check_ingredients(list, ingredient)
    if list[ingredient].nil?
        0
    else
      list[ingredient]
    end
  end

  def restock(ingredient, quantity)
    quantity += stock_check(ingredient)
    @stock[ingredient] = quantity
  end

  def add_item_to_shopping_list(ingredient, quantity)
    quantity += shopping_list_check(ingredient)
    @shopping_list[ingredient] = quantity
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
    converted_values = recipe.ingredients.map do |product, quantity|
      [product, convert_unit(quantity)]
    end
    converted_values.to_h
  end


  def add_to_shopping_list(recipe)
    recipe.ingredients.each do |product, quantity|
      add_item_to_shopping_list(product, quantity)
    end
  end

  def print_shopping_list
    @shopping_list.each do |product, quantity|
      puts "* #{product}: #{quantity}"
    end
  end
end
