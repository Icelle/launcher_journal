class JournalEntry < ActiveRecord::Base
  validates :title, presence:true
  validates :description, presence:true

  has_many :entry_categories
  has_many :categories,
    through: :entry_categories,
    inverse_of: :journal_entries
end
