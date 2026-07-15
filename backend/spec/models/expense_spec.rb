require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:category) { Category.create!(name: "Food") }

  it "is invalid when the date is in the future" do
    expense = Expense.new(description: "Lunch", amount: 10.00, category: category, date: Date.current + 1.day)

    expect(expense).not_to be_valid
    expect(expense.errors[:date]).to include("cannot be in the future")
  end

  it "is valid when the date is today or in the past" do
    expense = Expense.new(description: "Lunch", amount: 10.00, category: category, date: Date.current)

    expect(expense).to be_valid
  end
end
