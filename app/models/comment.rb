class Comment < ActiveRecord::Base
  # associations
  belongs_to :post

  # validators
  validates :commenter, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 3 }
end
