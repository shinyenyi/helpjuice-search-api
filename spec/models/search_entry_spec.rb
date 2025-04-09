require 'rails_helper'

RSpec.describe SearchEntry, type: :model do
  it 'is valid with valid attributes' do
    session = SearchSession.create(ip: '127.0.0.1')
    entry = session.search_entries.build(term: 'Test term')
    expect(entry).to be_valid
  end

  it 'is not valid without a term' do
    session = SearchSession.create(ip: '127.0.0.1')
    entry = session.search_entries.build(term: '')
    expect(entry).not_to be_valid
  end
end
