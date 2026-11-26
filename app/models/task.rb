class Task < ApplicationRecord
  belongs_to :category, optional: true

  belongs_to :user

  has_many :task_details, dependent: :destroy

  accepts_nested_attributes_for :task_details,
    allow_destroy: true,
    reject_if: :all_blank

  validates :title, presence: true
end
