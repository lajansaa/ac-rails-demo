class EventsController < ApplicationController
	before_action :set_event, :only => [:show, :edit, :update, :destroy]

	def index
    	@events = Event.page(params[:page]).per(5)
    end

    def new
    	@event = Event.new
    end

    def create
    	#@event = Event.new(params[:event])
    	#params: {:xxx => "yyy", "event" => {}}
    	#params is a hash
    	#event is a hash within the params hash
    	#but by default rails don't just allow any values of events to be sent
    	#so...
    	@event = Event.new(event_params)
        

    	if @event.save
    		flash[:notice] = "event was successfully created"
    		redirect_to events_path
    	else
    		render :action => :new
    	end
    end

    def show
    end

     def edit
    end

    def update
    	if @event.update(event_params)
 			flash[:notice] = "event was successfully update"
 			redirect_to event_path(@event)
 		else
 			render :action => :edit
 		end
    end

	def destroy
		@event.destroy
		flash[:alert] = "event was successfully deleted"
		redirect_to events_path
	end

    private

    def event_params
    	params.require(:event).permit(:name, :description)
    end

    def set_event
    	@event = Event.find(params[:id])
    end
end
