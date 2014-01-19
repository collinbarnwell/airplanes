class Airport < ActiveRecord::Base
  has_many :orders

  def collection_select_text
    "#{self.name}, (#{self.abbreviation}); #{self.city}, #{self.state}"
  end
end
