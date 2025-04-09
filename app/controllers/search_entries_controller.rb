class SearchEntriesController < ApplicationController
    def create
      session = SearchSession.find(params[:search_session_id])
      term = params[:term].strip

      last_entry = session.search_entries.last

			# Check if the current term starts with the last entry
			if last_entry && term.start_with?(last_entry.term)
				# Update the last entry to the new term if it is not already the same
				if last_entry.term != term
					last_entry.update(term: term)
					render json: { status: "updated", term: term }
				else
					render json: { status: "not_saved", reason: "duplicate entry" }
				end
			else
				# Create a new entry since the term does not start with the last entry
				session.search_entries.create!(term: term)
				render json: { status: "saved", term: term }
			end
    end
  
    def index
      render json: SearchEntry.group(:term).order('count_all DESC').count
    end
end