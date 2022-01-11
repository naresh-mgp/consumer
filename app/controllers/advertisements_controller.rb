class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.list
  end
end
