require 'spec_helper'

describe EntryCategory do
  it { should belong_to :journal_entry }
  it { should belong_to :category }
end
