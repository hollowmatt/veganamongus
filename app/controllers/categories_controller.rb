class CategoriesController < ApplicationController
  #before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    #authorize! :index, current_user, :message => 'You must be an administrator to perform this action.'
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
    @category = Category.find(params[:id])
  end

  def edit
    #authorize! :index, current_user, :message => 'You must be an administrator to perform this action.'
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      redirect_to category_path(@category), notice: "Category #{@category.name} has been updated."
    else
      render 'edit'
    end
  end

  def destroy
    @category = Category.find(params[:id])
    Category.find(params[:id]).destroy
    redirect_to categories_path, alert:  @category.name + " has been removed from the system."
  end
end
