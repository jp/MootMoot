class GalleryController < ApplicationController
  def view
    @galleries = Gallery.all

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @galleries.to_json(:include => {:pictures => {}}) }
    end
  end
end
