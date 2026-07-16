class Expense < ApplicationRecord
  belongs_to :category

  scope :ordered_by_date, -> { order(date: :desc, created_at: :desc) }

  scope :for_month, ->(year:, month:) do
    start_date = Date.new(year, month, 1)
    where(date: start_date.beginning_of_month..start_date.end_of_month)
  end
end
