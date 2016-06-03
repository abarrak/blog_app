class Comment < ActiveRecord::Base
  # associations
  belongs_to :post

  # validators
  validates :commenter, presence: true
  validates :text, presence: true
end
