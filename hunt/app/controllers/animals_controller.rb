class AnimalsController < ApplicationController
  before_action :find_animal, only: [:show, :edit, :update, :destroy]

  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.create(animal_params)

    if @animal.save
      redirect_to animals_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render :edit
    end
  end

  def destroy
    @animal.destroy
    redirect_to animals_path
  end
  
  private

  def animal_params
    params.require(:animal).permit(:name, :state, :category)
  end

  def find_animal
    @animal = Animal.find(params[:id])
  end

end
