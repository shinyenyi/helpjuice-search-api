require 'rails_helper'

RSpec.describe SearchSession, type: :model do
  describe 'associations' do
    it 'has many search entries' do
      association = described_class.reflect_on_association(:search_entries)
      expect(association.macro).to eq(:has_many)
    end

    it 'destroys associated search entries when deleted' do
      session = SearchSession.create(ip: '127.0.0.1')
      session.search_entries.create(term: 'Hello world')
      session.search_entries.create(term: 'Goodbye world')

      expect {
        session.destroy
      }.to change(SearchEntry, :count).by(-2)  # Expecting 2 entries to be deleted
    end
  end
end
