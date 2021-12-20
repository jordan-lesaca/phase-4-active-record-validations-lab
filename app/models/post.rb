#post.rb
class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :is_clickbait

    CLICKBAIT_PATTERNS = [
        /Won't Believe/i, 
        /Secret/i, 
        /Top \d/i, 
        /Guess/i
    ]

    def is_clickbait
        if CLICKBAIT_PATTERNS.none? { |p| p.match title}
            errors.add(:title, "must be clickbait")
        end
    end

end

#2 => Can be created with valid data
#2 => Basic Validations
#2 => Is expected to validate that :title cannot be empty/falsy
#2 => Is expected to validate that the length of :content is at least 250
#2 => Is expected to validate that :category is either <"Fiction"> or <"Non-Fiction">

#3 => Custom Validations: title is clickbait
#3 => Is expected to allow :title to be <"You Won't Believe These True Facts">
#3 => Is expected not to allow :title to be <"True Facts">