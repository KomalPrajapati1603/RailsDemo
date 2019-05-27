class CreateLocatables < ActiveRecord::Migration[5.2]
  def change
    create_table :locatables do |t|
      t.references :location, foreign_key: true
      t.references :locatable, polymorphic: true, index: true

      t.timestamps
    end
  end
end
