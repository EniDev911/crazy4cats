class Publication < ApplicationRecord
    belongs_to :user
    has_many :reactions
    has_many :users, through: :reactions
    
    validates :kind, acceptance: {
        accept: %w[like dislike]
    }
      
    def self.kinds
      %w[like dislike]
    end
end
