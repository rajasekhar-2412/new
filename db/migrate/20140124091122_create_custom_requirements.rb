class CreateCustomRequirements < ActiveRecord::Migration
  def change
    create_table :custom_requirements do |t|
      t.integer :user_id
      t.string :name

      t.timestamps
    end
  end
end
