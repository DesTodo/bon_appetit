require './lib/pantry'
require './lib/recipe'
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
    pantry.restock("Cheese", 10)
    pantry.restock("Milk", 50)

    assert_equal 10, pantry.stock_check("Cheese")
    assert_equal 50, pantry.stock_check("Milk")
    assert_equal  0, pantry.stock_check("Soda")
  end

  def test_restock_adds_quantity_to_existing_ingredient
    pantry    = Pantry.new
    pantry.restock("Cheese", 10)
    pantry.restock("Cheese", 20)

    assert_equal 30, pantry.stock_check("Cheese")
  end

  def test_convert_unit
    pantry = Pantry.new
    # Example Input: .25
    centis    = pantry.convert_unit(500)
    millis    = pantry.convert_unit(0.025)
    universal = pantry.convert_unit(75)
    # * Centi-Units -- Equals 100 Universal Units
    # * Milli-Units -- Equals 1/1000 Universal Units

    # 1. If the recipe calls for more than 100 Units of an ingredient, convert it to Centi-units
    # 2. If the recipe calls for less than 1 Units of an ingredient, convert it to Milli-units

    # Example Return: {quantity: 25, units: "Milli-Units"}
    assert_equal ({quantity: 5, units: "Centi-Units"}), centis
    assert_equal ({quantity: 75, units: "Universal Units"}), universal
    assert_equal ({quantity: 25, units: "Milli-Units"}), millis

  end

  def test_convert_units
    # Building our recipe
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)

    # Convert units for this recipe
    pantry = Pantry.new
    actual = pantry.convert_units(r)
    expected = {
      "Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
      "Cheese"         => {quantity: 75, units: "Universal Units"},
      "Flour"          => {quantity: 5, units: "Centi-Units"}
    }

    assert_equal actual, expected
  end
end
