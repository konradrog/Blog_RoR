class Comment < ApplicationRecord
  validates :commenter, presence: true, format: { with: /@/}
  validates :body, presence: true, length: { minimum: 6, maximum: 500 }

  belongs_to :article

  
end
