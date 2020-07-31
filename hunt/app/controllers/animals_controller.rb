class AnimalsController < ApplicationController
  def index
    @animals = Animal.all
  end

  def show
  end

  def new
  end

  def edit
  end
end
