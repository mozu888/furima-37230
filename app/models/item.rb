class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery_day
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :status
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name
    validates :explanation
    validates :image
    validates :price, numericality: { only_integer: true}, inclusion: { in: 300..9_999_999 }
  end
  with_options numericality: { other_than: 1 , message: "can't be blank"} do
    validates :category_id
    validates :delivery_day_id
    validates :delivery_fee_id
    validates :prefecture_id
    validates :status_id
  end
  has_one :buy
end
