class StaticPagesController < ApplicationController
  require 'flickr'

  def index
    flickr = Flickr.new
    if !params[:search].present? || params[:search][:user_id].blank?
      @photos = flickr.photos.getRecent
    else
      @photos = flickr.photos.search(user_id: params[:search][:user_id])
    end
  end
end
