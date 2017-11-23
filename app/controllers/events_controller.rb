class EventsController < ApplicationController
  before_action :authenticate_user!
  expose :event
  expose :events, ->{ requests_events }
  
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

  def edit
  end

  def update
    event.update!(event_params)
    respond_with event
  end

  private
    def event_params
      params.require(:event).permit(:name, :description, :event_image, :all_tags)
    end

    def requests_events
      if params[:query].present?
        Event.includes(:tags).search_by_attributes(params[:query])
      else  
        Event.includes(:tags).all.order('created_at DESC')
      end
    end
end
