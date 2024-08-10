class Vote < ApplicationRecord
  belongs_to :poll

  validates :vote, presence: true
end
