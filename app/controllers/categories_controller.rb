class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :admin, only: [:new, :edit, :update, :destroy]
  before_filter :find_cat, only: [:edit, :show, :destroy]

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to categories_path, notice: "Category #{@category.name} has been added."
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to categories_path, notice: "Category #{@category.name} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path, alert:  @category.name + " has been removed from the system."
  end

  protected
    def find_cat
      @category = Category.find(params[:id])
    end

    def admin
      authorize! :index, current_user, message: 'You must be an administrator to perform this action'
    end

end
