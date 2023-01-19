class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
    render json: @image, include: { targets: { only: %i[id name] } }
  end
end
