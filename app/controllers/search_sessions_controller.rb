class SearchSessionsController < ApplicationController
    def create
      session = SearchSession.find_or_create_by(ip: request.remote_ip)
      render json: { session_id: session.id }
    end
end
  