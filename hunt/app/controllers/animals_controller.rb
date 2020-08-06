class AnimalsController < ApplicationController
  before_action :current_animal, only: [:show, :edit, :update, :destroy]

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
      render action: 'new'
    end
  end

  def edit
  end

  def update
    @animal.update(animal_params)

    if @animal.save
      redirect_to animals_path(@animal)
    else
      render action: 'edit'
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

  def current_animal
    @animal = Animal.find(params[:id])
  end

end
