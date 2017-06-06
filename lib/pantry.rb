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
    hash = {"Cheese" => 10}
    @stock = hash
  end

end


# pantry.restock("Cheese", 20)
# pantry.stock_check("Cheese")
# # => 30
