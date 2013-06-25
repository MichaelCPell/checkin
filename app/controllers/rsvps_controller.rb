class RsvpsController < ApplicationController
  def index
    @rsvps = Rsvp.where(status: "success", printed: "not_printed")
  end

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def new
    @rsvp = Rsvp.new
  end

  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  def create
    key = "#{params[:rsvp][:first_name].strip}_#{params[:rsvp][:last_name].strip}".downcase
    @guest = Guest.find_by_first_last(key)

    if @guest 
      @rsvp = Rsvp.find_by_first_last(@guest.first_last) || Rsvp.create(status: "success", printed: "not_printed", first_last: @guest.first_last)
      @rsvp.save
      render :show
    else
      redirect_to new_guest_path
    end
  end

  def update
    @rsvp = Rsvp.find(params[:id])
  end

  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy
  end
end
