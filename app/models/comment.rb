class Comment < ApplicationRecord
  belongs_to :list

  validates :comment, presence: true
end
