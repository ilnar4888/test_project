class RecordingsController < ApplicationController
  before_action :authenticate_user!

  expose :event, -> { Event.find(params[:event_id]) }
  
  def create
  	event.users << current_user
  	event.save
  	redirect_to request.referrer || root_path 
  end
end
