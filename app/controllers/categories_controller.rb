class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    @categories = Category.all
  end

  def new
    authorize! :index, current_user, :message => 'You must be an administrator to perform this action.'
  end

  def create
  end

  def show
  end

  def edit
    authorize! :index, current_user, :message => 'You must be an administrator to perform this action.'
  end

  def update
  end
end
