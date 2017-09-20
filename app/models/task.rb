class Task < ApplicationRecord
  belongs_to :project
  validates :target, presence: true
end
