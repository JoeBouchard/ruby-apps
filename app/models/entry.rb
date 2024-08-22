class Entry < ApplicationRecord
  attribute :message, :string
  attribute :due, :date
  attribute :priority, :integer
end
