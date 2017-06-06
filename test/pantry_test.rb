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

    assert_equal 10, expected["Cheese"]
    assert_instance_of Hash, expected
    assert_equal 10, pantry.stock_check("Cheese")
  end




end
