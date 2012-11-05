class IngredientsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(params[:ingredient])
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.create(params[:ingredient])
    @ingredient.destroy
    respond_to do |format|
      format.html { redirect_to recipe_path(@recipe) }
      format.js
    end
  end


end
