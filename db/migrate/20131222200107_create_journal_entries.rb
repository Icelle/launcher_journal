class CreateJournalEntries < ActiveRecord::Migration
  def change
    create_table :journal_entries do |t|
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
