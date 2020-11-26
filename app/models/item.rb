class Item < ApplicationRecord
  belongs_to :user
  has_one    :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_free_status
  belongs_to :prefecture
  belongs_to :scheduled_delivert

  with_options presence: true do
    validates :name
    validates :info
    validates :price
    validates :image
  end
  with_options numericality: { other_than: 0 }  do
    validates :category_id
    validates :sales_status_id
    validates :shipping_free_status_id
    validates :prefecture_id
    validates :scheduled_delivert_id

  end

  validates :price,numericality: {greater_than_or_equal_to:300,less_than_or_equal_to:9_999_999}
  validates :price,format: { with: /\A[0-9]+\z/, message: '半角数字を使用してください' } 
  


end
