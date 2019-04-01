class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def calculating
    sum(self.rate) / self.count
  end

end
