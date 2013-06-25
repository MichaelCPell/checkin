class Guest < ActiveRecord::Base
  attr_accessible :attending_with, :company, :email, :first_name, :last_name, :first_last

  has_one :rsvp, foreign_key: "first_last"
end
