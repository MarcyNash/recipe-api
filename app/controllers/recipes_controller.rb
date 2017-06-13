# frozen_string_literal: true

class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = current_user.Recipe.all

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
      render json: @recipe, status: :created, location: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = current_user.Recipe.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def recipe_params
    params.require(:recipe).permit(:name, :location, :comment)
  end
end