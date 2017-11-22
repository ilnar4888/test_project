class TagsController < ApplicationController
  before_action :authenticate_user!
  def show
    @tag = Tag.find_by(name: params[:id])
    @events = @tag.events
  end
end