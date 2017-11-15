class EventsController < ApplicationController
  before_action :authenticate_user!
  expose :event
  expose :events, ->{ Event.all.order('created_at DESC') }
  
  def index
    render "events/_events"
  end
  
  def new 
  end
  
  def create
    event.save
    respond_with event
  end

  def show
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :event_image, :all_tags)
    end
end
