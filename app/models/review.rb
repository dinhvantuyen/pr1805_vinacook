class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def average_rate
    sum(rate / count)
  end

end
