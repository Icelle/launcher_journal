class Category < ActiveRecord::Base
  validates :name, presence:true, uniqueness: true

  has_many :entry_categories
  has_many :journal_entries,
    through: :entry_categories,
    inverse_of: :categories
end
