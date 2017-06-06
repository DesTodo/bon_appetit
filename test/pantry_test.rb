require './lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'

class PantryTest < Minitest::Test

  def test_it_exists
    pantry = Pantry.new

    assert_instance_of Pantry, pantry
  end

  def test_it_has_stock
    pantry = Pantry.new

    assert_equal ({}), pantry.stock
  end

  def test_stock_can_check_ingredients
    pantry = Pantry.new

    assert_equal 0, pantry.stock_check("Cheese")
  end

  def test_restock_adds_ingredient_and_quantity_to_stock
    pantry   = Pantry.new
    expected = pantry.restock("Cheese", 10)

    assert_instance_of Hash, expected
    assert_equal 10, expected["Cheese"]
    assert_equal 10, pantry.stock_check("Cheese")
  end

  def test_restock_adds_quantity_to_existing_ingredient
    pantry    = Pantry.new
    stock     = pantry.restock("Cheese", 10)
    restock_1 = pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")

  end

  def test_pantry_can_convert_units
    r = Recipe.new("Spicy Cheese Pizza")
    pantry = Pantry.new
    pantry.convert_units(r)
    #
    # => {"Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
    #     "Cheese"         => {quantity: 75, units: "Universal Units"},
    #     "Flour"          => {quantity: 5, units: "Centi-Units"}}

  end

end
