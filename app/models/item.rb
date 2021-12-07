class Item < ApplicationRecord
  belongs_to :user
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :status
  has_one_attached :image

  with_options presence: ture
    validates :item_name
    validates :explanation
    validates :price

  with_options numericality: { other_than: 1 , message: "can't be blank"}
    validates :category_id
    validates :delivery_day_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :status_id
end
