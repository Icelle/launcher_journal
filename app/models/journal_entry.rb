class JournalEntry < ActiveRecord::Base
  validates :title, presence:true
  validates :description, presence:true

  has_many :entry_categories
  has_many :categories,
    through: :entry_categories,
    inverse_of: :journal_entries

  def pp_categories
    (self.categories.map{|c| c.name}).join(" ")
  end
end
