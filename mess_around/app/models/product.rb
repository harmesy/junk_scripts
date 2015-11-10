class Product < ActiveRecord::Base
  validates :description, presence: true
  validates :price, presence: true, numercality: { greater_than_or_equal_to: 0 }
  validates :title, presence: true, uniqueness: true
end
