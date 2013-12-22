class EntryCategory < ActiveRecord::Base
  belongs_to :journal_entry,
    inverse_of: :entry_categories
  belongs_to :category,
    inverse_of: :entry_categories
end
