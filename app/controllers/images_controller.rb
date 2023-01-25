class ImagesController < ApplicationController
  def index
    @images = Image.all.order(id: :asc)
    render json: @images
  end
end
