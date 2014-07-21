class CreateVisuals < ActiveRecord::Migration
  def change
    create_table :visuals do |t|
      t.string :title
      t.string :image
      t.timestamps
    end
  end
end