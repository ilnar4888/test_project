class RecordingsController < ApplicationController
  def create
  	event = Event.find(params[:event_id])
  	event.users << current_user
  	event.save
  	redirect_to request.referrer || root_path 
  end
end
