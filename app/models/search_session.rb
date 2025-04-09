class SearchSession < ApplicationRecord
  has_many :search_entries, dependent: :destroy
end
