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
  validates_presence_of :email, :start_airport, :end_airport, 
                        :departure_time_start
  validate :departure_must_be_in_future, :return_time_must_be_after_departure_time
           :airports_must_be_different


  def departure_must_be_in_future
    if self.departure_time_start < Date.today
      errors.add(:departure_time_start, "must be in the future")
    end
  end

  def return_time_must_be_after_departure_time
    if self.return_time_start < self.departure_time_start
      errors.add(:return_time_start, "must be after departure time")
    end
  end

  def airports_must_be_different
    if self.start_airport == self.end_airport
      errors.add(:end_airport, "must be different from start airport")
    end
  end

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
