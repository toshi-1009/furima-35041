class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_state
  belongs_to :shipping_charges
  belongs_to :shipping_area
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :product_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    with_options numericality: { other_than: 1 } do
      validates :category_id
      validates :product_state_id
      validates :shipping_charges_id
      validates :shipping_area_id
      validates :shipping_day_id
    end
    validates :selling_price, format: { with: /\A[0-9]+\z/ }, length: { minimum: 3, maximum: 7 }, numericality: { only_integer: true,
                                                                                                                  greater_than: 299, less_than: 1_000_000 }
    validates :image
  end
end
