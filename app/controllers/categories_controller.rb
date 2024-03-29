class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to action: 'index', notice: 'Category was successfully created.' }
        #format.json { render action: 'index', status: :created, location: @category }
      else
        format.html { render action: 'new' }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to action: 'index', notice: 'Category was successfully updated.' }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to action: 'index', notice: 'Category was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def new
    @category = Category.new
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
