class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :admin, only: [:new, :edit, :update, :destroy]
  before_filter :find_recipe, only: [:edit, :show, :destroy]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 10)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipes_path, notice: "Recipe #{@recipe.name} has been added."
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to recipes_path, notice: "Recipe #{@recipe.name} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    redirect_to recipes_path, alert:  @recipe.name + " has been removed from the system."
  end

  protected
    def find_recipe
      @recipe = Recipe.find(params[:id])
    end

    def admin
      authorize! :index, current_user, message: 'You must be an administrator to perform this action'
    end
end
