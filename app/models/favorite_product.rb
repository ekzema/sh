class FavoriteProduct < ApplicationRecord
  belongs_to :products
  belongs_to :sellers
end
