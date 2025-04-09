class SearchEntry < ApplicationRecord
  belongs_to :search_session
  validates :term, presence: true
end
