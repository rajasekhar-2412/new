class CreateCustoms < ActiveRecord::Migration
  def change
    create_table :customs do |t|
      t.integer :user_id
      t.hstore :fields

      t.timestamps
    end
  end
end
