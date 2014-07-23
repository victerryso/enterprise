class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.string :title
      t.text :content
      t.integer :user_id
      t.integer :document_id
      t.timestamps
    end
  end
end
