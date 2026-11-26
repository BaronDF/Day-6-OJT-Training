class TaskDetail < ApplicationRecord
  belongs_to :task

  before_validation :normalize_description

  validates :description, presence: true

  private

  def normalize_description
    self.description = description.strip if description.present?
  end
end
