class EventController < ApplicationController
  before_action :authenticate_user!
  
  expose :event
  expose :events, ->{ Event.all.order('created_at DESC') }
  
  def index
  end
  
  def new 
  end
  
  def create
  end

  def show
  end

  private
    def store_params
      params.require(:event).permit(:text, :description, :event_image_id)
    end
end
