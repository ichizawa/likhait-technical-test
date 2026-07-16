class Expense < ApplicationRecord
  belongs_to :category

  validates :date, presence: true
  validate :date_cannot_be_in_future

  scope :ordered_by_date, -> { order(date: :desc, created_at: :desc) }

  scope :for_month, ->(year:, month:) do
    start_date = Date.new(year, month, 1)
    where(date: start_date.beginning_of_month..start_date.end_of_month)
  end

  private

  def date_cannot_be_in_future
    return if date.blank?
    return unless date > Date.current

    errors.add(:date, "cannot be in the future")
  end
end
