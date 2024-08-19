class Poll < ApplicationRecord
  has_many :votes, dependent: :destroy

  serialize :options, Array, coder: YAML

  validates :name, presence: true, uniqueness: true
  validates :options, presence: true
  validates :color, presence: true, format: { with: /\A#[0-9a-fA-F]{6}\z/, message: "must be a valid hex color" }

  def results
    votes.group(:vote).count
  end
end
