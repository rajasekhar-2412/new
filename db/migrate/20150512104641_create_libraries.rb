class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.string :code
      t.string :name

      t.timestamps
    end
  end
end
