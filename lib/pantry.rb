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
    ingredients = []
    hash = {ingredient => quantity}
    @stock = hash

    ingredients << @stock.merge({ingredient => quantity})
     if @stock.include?(ingredient)
       @stock[ingredient] += quantity
    end
    return @stock

  end

end
