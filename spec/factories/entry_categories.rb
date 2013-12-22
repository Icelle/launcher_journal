# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :entry_category do
    journal_entry nil
    category nil
  end
end
