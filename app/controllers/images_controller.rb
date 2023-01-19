class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    render json: @image, include: { targets: { except: %i[row column] } }
  end
end
