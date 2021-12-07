class DeliveryDay < ApplicationRecord
  self.date = [
    { id: 1, name: '---' },
    { id: 1, name: '3日で発送' },
    { id: 1, name: '4~7日で発送' },
  ]
  include ActiveHash::Assotiations
  has_many :items
end
