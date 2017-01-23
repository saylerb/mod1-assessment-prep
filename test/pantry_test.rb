require_relative '../lib/pantry'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'


class PantryTest < Minitest::Test

  def setup
    @pantry = Pantry.new
  end

  def test_exists
    assert_kind_of Pantry, @pantry
  end

  def test_pantry_has_no_stock
    assert_kind_of Hash, @pantry.stock
  end

  def test_can_check_stock
    assert_equal 0, @pantry.stock_check("Cheese")
  end

  def test_can_restock_the_pantry
    @pantry.restock("Cheese", 10)
    assert_equal 10, @pantry.stock_check("Cheese")
  end

  def test_we_can_add_more_of_exisiting_item
    @pantry.restock("Cheese", 10)
    @pantry.restock("Cheese", 40)
    assert_equal 50, @pantry.stock_check("Cheese")
  end


  def test_we_can_store_recipes_in_shopping_list
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    @pantry.add_to_shopping_list(r)

    assert_kind_of Array, @pantry.recipes_in_shopping_list
    assert_kind_of Recipe, @pantry.recipes_in_shopping_list[0]
    assert_equal 1, @pantry.recipes_in_shopping_list.length
  end

  def test_we_can_store_multiple_recipes_in_shopping_list
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    @pantry.add_to_shopping_list(r)


    r_two = Recipe.new("Waffles")
    r_two.add_ingredient("Eggos", 10)
    r_two.add_ingredient("Syrup", 50)
    @pantry.add_to_shopping_list(r_two)

    assert_kind_of Array, @pantry.recipes_in_shopping_list
    assert_kind_of Recipe, @pantry.recipes_in_shopping_list[0]
    assert_equal 2, @pantry.recipes_in_shopping_list.length
  end


  def test_we_can_check_the_shopping_list
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Cheese", 20)
    r.add_ingredient("Flour", 20)

    @pantry.add_to_shopping_list(r)

    r_two = Recipe.new("Waffles")
    r_two.add_ingredient("Eggos", 10)

    r_two.add_ingredient("Syrup", 50)
    @pantry.add_to_shopping_list(r_two)

    expected = {"Cheese" => 20, "Flour" => 20, "Eggos" => 10, "Syrup" => 50 }

    actual = @pantry.shopping_list_ingredients

    assert_equal expected, actual
  end


end
