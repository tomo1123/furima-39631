class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  #has_one_attached :image
  
  validates :image, presence: true
  validates :title, presence: true 
  validates :items_text, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :delivery_day_id, presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
  validates :user_id, presence: true
  
  

end


