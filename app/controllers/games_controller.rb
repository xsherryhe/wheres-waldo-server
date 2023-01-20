class GamesController < ApplicationController
  def create
    @image = Image.find(params[:image])
    render json: {}, status: :unprocessable_entity unless @image

    @game = Game.create(image: @image)
    render json: @game, only: %i[id],
           include: { image: { include: { targets: { except: %i[row column] } } } }
  end
end
