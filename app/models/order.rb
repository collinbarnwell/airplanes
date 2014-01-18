# == Schema Information
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  max_price  :float
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
  has_and_belongs_to_many :bad_airlines
  
  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_format_of :email, with: EmailRegex
  validates_numericality_of :max_price, greater_than_or_equal_to: 20.0, less_than_or_equal_to: 2000.0
  # validates :departure_time, greater_than: Time.now
  # validates :return_time, greater_than: Time.now
  # validate that return is after departure
end
