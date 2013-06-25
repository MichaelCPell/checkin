class Rsvp < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :status, :printed
  attr_reader :first_name, :last_name

  belongs_to :guest, foreign_key: "first_last"
end
