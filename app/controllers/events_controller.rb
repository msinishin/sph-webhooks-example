class EventsController < ApplicationController

  def index
    @events = AccountEvent.order("created_at DESC")
  end
end
