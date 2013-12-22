require 'spec_helper'

describe JournalEntry do
  it { should have_many(:entry_categories) }
  it { should have_many(:categories) }
  it {should have_valid(:title).when('Fiction')}
  it {should_not have_valid(:title).when('', nil)}
  it {should have_valid(:description).when('Fiction')}
  it {should_not have_valid(:description).when('', nil)}
end
