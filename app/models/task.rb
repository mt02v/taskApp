class Task < ApplicationRecord
  # projectに属しているという情報
  belongs_to :project
  validates :title,
    presence: true
end
