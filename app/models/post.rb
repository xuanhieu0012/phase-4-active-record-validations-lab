class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction" ]}
    validate :click_bait?

    def click_bait?
        array =[
            /Won't Believe/i,
            /Secret/i,
            /Top \d/i,
            /Guess/i
          ]
        if array.none?{|t| t.match title}
            errors.add(:title, "it must be click bait")
        end
    end
end
