class EventsController < ApplicationController
	def index
    	@events = Event.all
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
    	@event = Event.new(events_params)
        @event.save
        redirect_to :action => :index
    end

    private

    def events_params
    	params.require(:event).permit(:name, :description)
    end
end
