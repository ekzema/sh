class Product < ApplicationRecord
  belongs_to :category
  belongs_to :twocategory
  belongs_to :threecategory
end
