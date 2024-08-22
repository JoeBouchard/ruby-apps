class AddUserRefToEntries < ActiveRecord::Migration[7.2]
  def change
    add_reference :entries, :user, null: false, foreign_key: true, default: 1
  end
end
