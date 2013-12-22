class CreateEntryCategories < ActiveRecord::Migration
  def change
    create_table :entry_categories do |t|
      t.references :journal_entry, index: true
      t.references :category, index: true

      t.timestamps
    end

    # add composite index - each journal_entry/category pair must be unique
    add_index(:entry_categories, [:journal_entry_id, :category_id], {unique: true})
    # add_index(table_name, column_names, options): Adds a new index with the name of the column. Other options include :name, :unique (e.g. { name: 'users_name_index', unique: true }) and :order (e.g. { order: { name: :desc } }).
  end
end
