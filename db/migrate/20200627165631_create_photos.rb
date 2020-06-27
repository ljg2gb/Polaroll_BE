class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos do |t|
      t.string :link
      t.string :notes
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
