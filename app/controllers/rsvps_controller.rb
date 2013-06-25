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
      @rsvp = @guest.rsvp || @guest.build_rsvp(status: "success", printed: "not_printed")
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
