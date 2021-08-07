class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new
    unless params[:search][:user_id].blank?
      @photos = flickr.photos.search(user_id: params[:search][:user_id])
    else
      @photos = flickr.photos.getRecent
    end
  end
end
