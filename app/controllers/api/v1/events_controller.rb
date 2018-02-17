class Api::V1::EventsController < ApplicationController
	def index
		@events = Event.all
		render json: {data: @events}
	end

	def new
	end

	def create
  	unless event_params.blank?
	  	@event = Event.new(event_params)
	  	if @event.save
	  		render json: { data: @event, message: "Event record has been added successfully" }
	  	else
	  		render json: { data: @event, message: "Invalid Event Record Details", error: @event.errors }
	  	end
	  else
			render json: { data: @event, message: "Invalid Input" }
	  end
	end

	def edit
	end

	def update
		@event = Event.find_by_id(params[:id])
		if @event
			unless event_params.blank?
				@event.assign_attributes(event_params)
				@event.save
				render json: { data: @event, message: "Event record has been updated successfully" }
			else
				render json: { data: @event, message: "Invalid Input" }
			end
		else
			render json: { message: "Event record with id '#{params[:id]}' not found" }
		end
	end

	def show
	end

	def destroy
		@event = Event.find_by_id(params[:id])
		if @event
			@event.destroy
			render json: { data: @event, message: "Event record has been removed successfully" }
		else
			render json: { message: "Event record with id '#{params[:id]}' not found" }
		end
	end

	private

	def event_params
		begin
			params.permit(:description, :event_type, :date, :duration, :host, :location)
		rescue
			{}
		end

	end
end