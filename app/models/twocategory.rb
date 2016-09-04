class Twocategory < ApplicationRecord
  belongs_to :category
  has_many :threecategories
end
