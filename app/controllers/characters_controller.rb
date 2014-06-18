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
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character.television_show_id = @television_show.id
    if @character.save
      flash[:notice] = "Success!"
      redirect_to television_show_path(@television_show)
    else
      flash.now[:notice] = "Your character couldn't be saved."
      render 'television_shows/show'
    end
  end

  private

  def character_params
    params.require(:character).permit(:role, :name, :description)
  end
end
