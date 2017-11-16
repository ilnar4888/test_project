class TagsController < ApplicationController
  before_action :authenticate_user!
  
  expose :tag, -> { Tag.find_by(name: params[:id]) }
  expose :events, -> { tag.events }
  
  def show
  end
end