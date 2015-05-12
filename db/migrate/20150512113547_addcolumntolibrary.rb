class Addcolumntolibrary < ActiveRecord::Migration
  def change
    add_column :libraries, :bookable, :boolean
  end
end
