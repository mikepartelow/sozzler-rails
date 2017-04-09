module RecipesHelper
  def rating_stars(recipe)
    ('* ' * recipe.rating).html_safe
  end
end
