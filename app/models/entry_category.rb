class EntryCategory < ActiveRecord::Base
  belongs_to :journal_entry
  belongs_to :category
end
