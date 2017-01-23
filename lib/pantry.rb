class Pantry

  attr_reader :stock, :recipes_in_shopping_list

  def initialize
    @stock = Hash.new { |hash, key| hash[key] = 0 }
    @recipes_in_shopping_list = Array.new
  end

  def stock_check(item)
    if @stock[item].nil?
      0
    else
      @stock[item]
    end
  end

  def restock(name, amount)
    @stock[name] += amount
  end

  def add_to_shopping_list(recipe)
    @recipes_in_shopping_list << recipe
  end

  def shopping_list_ingredients
     @recipes_in_shopping_list.each_with_object({}) do |recipe, acc|
      acc.merge!(recipe.ingredients_data)
    end
  end

end
