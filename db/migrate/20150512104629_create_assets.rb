class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :asset_type
      t.integer :asset_id
      t.text :properties

      t.timestamps
    end
  end
end
