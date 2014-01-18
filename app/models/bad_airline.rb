# == Schema Information
#
# Table name: bad_airlines
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class BadAirline < ActiveRecord::Base
  has_and_belongs_to_many :orders
end
