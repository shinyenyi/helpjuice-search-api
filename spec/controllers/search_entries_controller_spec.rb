require 'rails_helper'

RSpec.describe SearchEntriesController, type: :controller do
  let!(:session) { SearchSession.create(ip: '127.0.0.1') }

  describe 'POST #create' do
    it 'saves a new term' do
      post :create, params: { term: 'Hello world', search_session_id: session.id }
      expect(SearchEntry.count).to eq(1)
      expect(SearchEntry.last.term).to eq('Hello world')
    end

    it 'updates the last entry when a new term starts with the last term' do
      session.search_entries.create!(term: 'Hello world')
      post :create, params: { term: 'Hello world again', search_session_id: session.id }
      expect(SearchEntry.count).to eq(1)
      expect(SearchEntry.last.term).to eq('Hello world again') # Ensure the term is updated
    end

    it 'creates a new entry when the new term does not start with the last entry' do
      session.search_entries.create!(term: 'Hello world')
      post :create, params: { term: 'Goodbye world', search_session_id: session.id }
      expect(SearchEntry.count).to eq(2)
      expect(SearchEntry.last.term).to eq('Goodbye world') # Ensure new entry is saved
    end
  end
end
