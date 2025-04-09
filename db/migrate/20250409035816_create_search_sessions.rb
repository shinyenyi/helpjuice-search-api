class CreateSearchSessions < ActiveRecord::Migration[8.0]
  def change
    create_table :search_sessions do |t|
      t.string :ip

      t.timestamps
    end
  end
end
