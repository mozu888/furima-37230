class BuyDelivery
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :municipality, :address, :building, :call_number, :user_id, :item_id
  with_options presence: true do
    validetes :token
    validetes :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validetes :municipality
    validetes :address
    validetes :call_number, format: {with: /\A[0-9]{10,11}\z/}
  end
  validetes :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  def save
    
  end
end