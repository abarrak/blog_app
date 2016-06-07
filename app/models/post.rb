class Post < ActiveRecord::Base
  # associations
  has_many :comments, dependent: :destroy
  
  # validators
  validates :title, presence: true, length: { minimum: 3, maximum: 255 }
  validates :content, presence: true, length: { minimum: 6 }

  # callbacks

  # attributes and logic
  def self.search phrase
  end
end
