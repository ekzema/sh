class Twocategory < ApplicationRecord
  belongs_to :category
  has_many :products

  has_many :threecategories, :dependent => :destroy

  accepts_nested_attributes_for :threecategories,
                                :allow_destroy => true,
                                :reject_if => :all_blank
end
