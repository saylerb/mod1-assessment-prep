require_relative '../lib/recipe'
require 'minitest/autorun'
require 'minitest/pride'
require 'pry'

class RecipeTest < Minitest::Test
  def test_it_has_a_name
    r = Recipe.new("Cheese Pizza")
    assert_equal "Cheese Pizza", r.name
  end

  def test_it_can_add_an_ingredient
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500) # all units in grams
    assert_equal ["Flour"], r.ingredients
    r.add_ingredient("Cheese", 1500)
    assert_equal ["Flour", "Cheese"].sort, r.ingredients.sort
  end

  def test_it_tracks_amount_of_a_recipe_required
    r = Recipe.new("Cheese Pizza")
    r.add_ingredient("Flour", 500)
    assert_equal 500, r.amount_required("Flour")
  end
end
