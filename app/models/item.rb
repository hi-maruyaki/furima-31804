class Item < ApplicationRecord
  has_one :order
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :days_to_ship
  belongs_to :carriage
  belongs_to :prefecture

  def was_attached?
    self.image.attached? 
  end

  with_options presence: true do
    validates :image
    validates :name, length: {manimum: 1, maximum: 40}
    validates :description, length: { maximum: 1000 }
    validates :price, inclusion: 300..9999999, format: { with: /\A[0-9]+\z/ } 
  end

  with_options presence: true, numericality: { other_than: 1 } do
    validates :status_id
    validates :category_id
    validates :carriage_id
    validates :prefecture_id
    validates :days_to_ship_id
  end

end
