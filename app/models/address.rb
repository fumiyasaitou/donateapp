class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates  :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates  :prefecture_id, numericality: { other_than: 1,message:'を選択してください' }
    validates  :city
    validates  :house_number
  end
end
