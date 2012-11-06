class RecipesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :admin, only: [:new, :edit, :update, :destroy]
  before_filter :find_recipe, only: [:edit, :show, :destroy]
  before_filter :find_cat, only: [:new, :edit]

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 10)
  end

  def new
    if Category.count == 0
      redirect_to new_category_path, notice: "Cannot add a recipe until at least one Category exists."
    end
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user = current_user
    if @recipe.save
      redirect_to recipe_path(@recipe), notice: "Recipe #{@recipe.name} has been added, pleasd add ingredients"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    if Category.count == 0
      redirect_to new_category_path, notice: "No Category exists, please add one before attempting to edit a recipe."
    end
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to recipe_path(@recipe),
                  notice: "Recipe #{@recipe.name} has been updated, feel free to modify the ingredients"
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

    def find_cat
      @categories = Category.all
    end
end
