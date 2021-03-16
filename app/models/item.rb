class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :delivery
  has_one_attached :image
  has_one :order

  with_options presence: true do
    validates :image
    validates :name
    validates :text
    validates :price,
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999,
                              message: 'Out of setting range' }
    with_options numericality: { other_than: 0, message: 'Select' } do
      validates :category_id
      validates :condition_id
      validates :postage_id
      validates :prefecture_id
      validates :delivery_id
    end
  end
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
end
