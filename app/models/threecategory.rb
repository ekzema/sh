class Threecategory < ApplicationRecord
  belongs_to :twocategory
  has_many :products
end
