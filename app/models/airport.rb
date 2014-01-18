class Airport < ActiveRecord::Base
  def collection_select_text
    "#{self.name}, (#{self.abbreviation}); #{self.city}, #{self.state}"
  end
end
