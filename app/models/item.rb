class Item < ApplicationRecord
  belongs_to :user
  #has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :delivery_day

  
  
  validates :image, presence: true
  validates :title, presence: true 
  validates :items_text, presence: true
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true
  validates :delivery_fee_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }, presence: true
  validates :delivery_day_id, numericality: { other_than: 0, message: "can't be blank" },presence: true
  validates :price, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }
 
  

end


