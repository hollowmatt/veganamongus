class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(params[:ingredient])
    render "format.js.haml"
    #respond_to do |format|
    #  format.html { redirect_to recipe_path(@recipe) }
    #  format.js
    #end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end
  end

end
