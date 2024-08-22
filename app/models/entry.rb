class Entry < ApplicationRecord
  belongs_to :user

  attribute :message, :string
  attribute :due, :date
  attribute :priority, :integer
end
