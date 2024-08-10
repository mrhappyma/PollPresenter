class Poll < ApplicationRecord
  has_many :votes, dependent: :destroy

  serialize :options, Array, coder: YAML

  validates :name, presence: true, uniqueness: true
  validates :options, presence: true

  def results
    votes.group(:vote).count
  end
end
