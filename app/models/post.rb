class Post < ActiveRecord::Base
  # associations
  has_many :comments, dependent: :destroy

  # validators
  validates :title, presence: true, length: { minimum: 3, maximum: 255 },
                    format: { without: /hell|stupid|damn/, message: 'bad words not allowed !' }
  validates :content, presence: true, length: { minimum: 6 },
                      format: { without: /hell|stupid|damn/, message: 'bad words not allowed !' }

  # callbacks
  # after_initialize { |post| p "You have initialized an object! #{post}" }
  # after_find       { |post| puts "You have found an object! #{post}" }
  after_touch      { |post| puts "good for logging and non-repudiation" }


  # attributes and custom methods
  private

    def self.search phrase
    end

end
