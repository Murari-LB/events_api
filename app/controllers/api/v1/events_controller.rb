class Api::V1::EventsController < ApplicationController
	def index
		@events = Event.all
		render json: {data: @events}
	end

	def new
	end

	def create
	  	@event = Event.new(event_params)
	  	if @event.save
	  		render json: { data: @event, message: "Event record has been added successfully" }
	  	else
	  		render json: { data: @event, message: "Invalid Event Record Details", error: @event.errors }
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

	def rsvp_count
		@count = Invitation.where("event_id=? and (confirmed=? or interested =?)",params[:id],true,true).count
		render json: {data: @count}
	end

	def rsvp_cancelled_count
		@count = Invitation.where("event_id=? and (confirmed=? or interested =?)",params[:id],false,false).count
		render json: {data: @count}
	end

	def interested_users
	 	@users =  User.joins(events: :invitations).where("invitations.interested=? and events.id=?", true, params[:id]).group("users.id")
		render json: {data: @users}
	end

	def cancelled_users
		@users = User.joins(events: :invitations).where("invitations.confirmed=?  and events.id=?", false, params[:id]).group("users.id")
		render json: {data: @users}
	end

	User.joins(events: :invitations).where("invitations.confirmed=?  and events.id=?", false, 1)

	def add_user_to_confirmed_attendees
		@invitation = Invitation.new(event_id: params[:id], user_id: params[:user_id], confirmed: true)
		if @invitation.save
			render json: { data: @invitation, message: "User has been added to confirmed attendees list " }
	  	else
	  		render json: { data: @invitation, message: "Invalid Record Details", error: @invitation.errors }
	  	end
	end

	def remove_user_from_confirmed_attendees
		@invitation = Invitation.where(event_id: params[:id], user_id: params[:user_id], confirmed: true).first
		if @invitation && @invitation.update(confirmed: false)
			render json: { data: @invitation, message: "User has been removed from confirmed attendees list " }
	  	else
	  		render json: { data: @invitation, message: "Invalid Record Details", error: @invitation.errors }
	  	end
	end

	def my_calendar
		@calendar_details = User.where(id: params[:id]).first.events.where("date >=?", Date.today).pluck(:date)
		render json: {data: @calendar_details}
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