class Rsvp < ActiveRecord::Base
  attr_accessible :status, :printed, :guest_id
  attr_reader :full_name, :company

  belongs_to :guest
end
