class Pet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  belongs_to :user
  has_many :comments
  scope :most_recent, -> { order(id: :desc) }
  scope :breed, -> (breed){ where("breed LIKE ?", "%#{breed}%")}
  scope :sex, -> (sex){ where("sex = ?", "#{sex}")}
  scope :age, -> (age){ where("age = ?", "#{age}")}

  def should_generate_new_friendly_id?
    name_changed?
  end

  def owner
   #User.find_by(id: user_id).name 
  end


end
