class Pet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :comments
  scope :most_recent, -> { order(id: :desc) }


  def should_generate_new_friendly_id?
    name_changed?
  end

  def owner
    "Owner"
  end
end
