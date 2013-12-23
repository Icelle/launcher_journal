class Category < ActiveRecord::Base
  validates :name, presence:true, uniqueness: true

  has_many :entry_categories
  has_many :journal_entries,
    through: :entry_categories,
    inverse_of: :categories


  # @param [String] category_str - space separated categories provided by user
  # @return [Array] array of active record categories
  def self.create_and_find(category_str)
    categories = []
    category_str.downcase.split(" ").each do |c|
      category = Category.find_by_name(c)
      # if not found, create it
      if category.nil?
        category = Category.create({name: c})
      end
      categories.push(category)
    end
    return categories
  end
end
