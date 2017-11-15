class TagsController < ApplicationController
  
  def show
    @tag = Tag.find_by(name: params[:id])
    @events = @tag.events
  end
end