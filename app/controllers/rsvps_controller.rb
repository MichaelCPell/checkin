class RsvpsController < ApplicationController
  def index
    @rsvps = Rsvp.where(status: "success", printed: "not_printed")
  end

  def show
    @rsvp = Rsvp.find(params[:id])
  end

  def new
    @rsvp = Rsvp.new

    @names = Guest.pluck(:full_name)

  end

  def edit
    @rsvp = Rsvp.find(params[:id])
  end

  def create
    fullname = "#{params[:rsvp][:full_name].strip}"
    @guest = Guest.find_by_full_name(fullname)

    if @guest 
      @rsvp = @guest.rsvp || Rsvp.create(status: "success", printed: "not_printed", guest_id: @guest.id)
      @rsvp.save
      render :show
    else
      redirect_to new_guest_path
    end
  end

  def update
    @rsvp = Rsvp.find(params[:id])

    respond_to do |format|
      if @rsvp.update_attributes(params[:rsvp])
        format.html { redirect_to rsvps_path, notice: 'Rsvp was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rsvp.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @rsvp = Rsvp.find(params[:id])
    @rsvp.destroy
  end
end
