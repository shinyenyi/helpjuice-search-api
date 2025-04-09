class AddIndexToSearchEntriesTerm < ActiveRecord::Migration[8.0]
  def change
    add_index :search_entries, :term
  end
end
