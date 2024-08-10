class Poll < ApplicationRecord
  serialize :options, Array, coder: YAML

  validates :name, presence: true, uniqueness: true
  validates :options, presence: true
end
