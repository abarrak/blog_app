class Comment < ActiveRecord::Base
  # associations
  belongs_to :post, touch: true

  # validators
  validates :commenter, presence: true, length: { minimum: 3 }
  validates :text, presence: true, length: { minimum: 3 }

  # callbacks
  after_touch { |comment| puts "comment #{comment} was altered." }
  after_destroy :log_destroyed_comments

  # custom methods
  private

    def log_destroyed_comments
      puts "commen #{self} is destroyed as part of deleting its parent post"
    end
end
