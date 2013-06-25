class Rsvp < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :status, :printed, :guest_id
  attr_reader :first_name, :last_name

  belongs_to :guest
end
