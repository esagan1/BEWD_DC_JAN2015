class CharactersController < ApplicationController
  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
  
   if @character.save
      redirect_to @chracter
   else
      render :new
    end
  end


  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    redirect_to @character
  end

  def update
    @character = Character.find(params[:id])
  
    if @character.update(character_params)
      redirect_to @character
    else
      render :edit
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :image_url, :quotes)
  end
end