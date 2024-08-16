class CreateEntries < ActiveRecord::Migration[7.2]
  def change
    create_table :entries do |t|
      t.text :message
      t.date :due
      t.integer :priority

      t.timestamps
    end
  end
end
