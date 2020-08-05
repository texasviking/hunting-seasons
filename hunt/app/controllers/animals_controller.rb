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
    @animal = Animal.create(animal_params)

    if @animal.save
      redirect_to animals_path
    else
      render action: 'new'
    end
  end

  def edit
    @animal = Animal.find(params[:id])

  end

  def update
    @animal = Animal.find(params[:id])
    @animal.update(animal_params)

    if @animal.save
      redirect_to animal_path(@animal)
    else
      render action: 'new'
    end



  end

  private


  def animal_params
    params.require(:animal).permit(:name, :state, :category)
  end
end
