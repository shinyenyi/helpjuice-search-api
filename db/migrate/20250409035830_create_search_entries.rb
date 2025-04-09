class CreateSearchEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :search_entries do |t|
      t.string :term
      t.references :search_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
