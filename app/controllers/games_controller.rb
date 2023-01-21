class GamesController < ApplicationController
  def create
    @image = Image.find(params[:image])
    render json: false, status: :unprocessable_entity unless @image

    @game = Game.create(image: @image)
    render json: @game
  end
end
