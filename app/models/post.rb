class Post < ActiveRecord::Base
    validate :clickbait
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction),
        message: "%{value} is not a valid category" }


        def clickbait
            if title.present? && !["Won't Believe", "Secret", "Top [number]", "Guess"].any? {|i| title.include? i}
                errors.add(:title, "Not Click Bait")
            end
        end

end
