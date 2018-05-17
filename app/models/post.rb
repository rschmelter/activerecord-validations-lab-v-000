class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction) }
  validate :clickbait

  def clickbait_words
    clickbait_words = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  end

  def clickbait
    if clickbait_words.none? {|word| word.match self.title}
      errors.add(:title, "Title needs a clickbait word.")
    end
  end

end
