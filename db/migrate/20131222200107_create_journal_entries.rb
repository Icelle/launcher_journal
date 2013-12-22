class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :title, null:false
      t.text :description, null:false

      t.timestamps
    end
  end
end
