class Guest < ActiveRecord::Base
  attr_accessible :attending_with, :company, :email, :first_name, :last_name
end
