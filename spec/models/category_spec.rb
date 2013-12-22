require 'spec_helper'

describe Category do
  it {should have_valid(:name).when('TDD')}
  it {should_not have_valid(:name).when('', nil)}
  it { should have_many(:entry_categories) }
  it { should have_many(:journal_entries) }

  it "doesn't allow duplicates" do
    FactoryGirl.create(:category, {name: 'TDD'})
    dup = FactoryGirl.build(:category, {name: 'TDD'})
    dup.should_not be_valid
    dup.should have(1).errors_on(:name)

  end
end
