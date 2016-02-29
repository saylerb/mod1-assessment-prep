class Recipe
  attr_reader :name, :ingredients
  def initialize(name)
    @name = name
    @ingredients = {}
  end

  def add_ingredient(ingredient, quantity)
    @ingredients[ingredient] = quantity
  end

  def ingredients
    @ingredients.keys.sort
  end

  def amount_required(ingredient)
    @ingredients[ingredient]
  end
end
