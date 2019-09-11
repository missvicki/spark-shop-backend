class Product < ApplicationRecord
  validates_presence_of :name, :unique_code, :price
end
