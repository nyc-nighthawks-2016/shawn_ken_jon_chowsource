class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :edit, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def new
    @categories = Category.all
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @categories = Category.all
    if @recipe.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    @recipe.update(recipe_params)
    redirect_to @recipe
  end

  def edit
  end

  def destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name , :difficulty, :description, :instructions, :user_id, :category_id)
  end
end
