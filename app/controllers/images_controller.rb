class ImagesController < ApplicationController
  before_action :authorize_request

  def show
    image = PublicImage.new('image.jpg')

    render plain: image.to_base64
  end
end
