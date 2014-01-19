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
  belongs_to :start_airport, class_name: 'Airport'
  belongs_to :end_airport, class_name: 'Airport'

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates_format_of :email, with: EmailRegex
  validates_numericality_of :max_price, greater_than_or_equal_to: 20.0, less_than_or_equal_to: 2000.0
  # validates :departure_time, greater_than: Time.now
  # validates :return_time, greater_than: Time.now
  # validate that return is after departure
  # validate destinations can't be the same
  validates_presence_of :email, :max_price, :start_airport, :end_airport, 
                        :departure_time_start, :departure_time_end


  def should_buy_now?(current_price)
    if Time.now > self.start_airport - 15.days
      true
    elsif Time.now > self.start_airport - 28.days
      if !self.best_price.nil?
        return true if current_price < self.best_price
        return false
      else
        return true if Time.now.tuesday?
      end
    elsif Time.now > self.start_airport - 56.days
      if self.best_price.nil?
        self.update_attributes(best_price: current_price) if Time.now.tuesday?
        return false
      else
        return true if current_price < self.best_price
      end
    else
      return false
    end
  end
end
