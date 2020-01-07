class CategoriesController < ApplicationController
  def show
    category = Category.find(params[:id])
    @diaries = category.diaries
  end
end
