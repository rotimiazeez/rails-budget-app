class Category < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true, length: { maximum: 2 }

  belongs_to :user
  has_and_belongs_to_many :activities

  def total_amount
    activities.sum(:amount)
  end
end
