class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id, null: false
      t.text :lyrics, null: false
      t.string :track_type
    end

    add_index :tracks, :album_id
  end
end
