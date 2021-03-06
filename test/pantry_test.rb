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
    centis    = pantry.convert_unit(500)
    millis    = pantry.convert_unit(0.025)
    universal = pantry.convert_unit(75)

    assert_equal ({quantity: 5, units: "Centi-Units"}), centis
    assert_equal ({quantity: 75, units: "Universal Units"}), universal
    assert_equal ({quantity: 25, units: "Milli-Units"}), millis
  end

  def test_convert_units
    r = Recipe.new("Spicy Cheese Pizza")
    r.add_ingredient("Cayenne Pepper", 0.025)
    r.add_ingredient("Cheese", 75)
    r.add_ingredient("Flour", 500)

    pantry = Pantry.new
    actual = pantry.convert_units(r)
    expected = {
      "Cayenne Pepper" => {quantity: 25, units: "Milli-Units"},
      "Cheese"         => {quantity: 75, units: "Universal Units"},
      "Flour"          => {quantity: 5, units: "Centi-Units"}
    }

    assert_equal expected, actual
  end

  def test_shopping_list_creates_array_with_ingredients
    pantry = Pantry.new
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)
    pantry.add_to_shopping_list(r)

    assert_equal ({"Cheese" => 20, "Flour" => 20}), pantry.shopping_list

    r = Recipe.new("Spaghetti")
    r.add_ingredient("Noodles", 10)
    r.add_ingredient("Sauce", 10)
    r.add_ingredient("Cheese", 5)
    pantry.add_to_shopping_list(r)

    assert_equal ({"Cheese" => 25, "Flour" => 20, "Noodles" => 10, "Sauce" => 10}), pantry.shopping_list
  end
end
