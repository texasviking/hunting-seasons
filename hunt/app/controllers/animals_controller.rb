class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
    @animal = Animal.find(params[:id])
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    if @animal.save
      redirect_to animals_path
    else
      render 'new'
    end

  end

  def edit
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :state, :category)
  end

end
