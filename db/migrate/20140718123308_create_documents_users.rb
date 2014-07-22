class CreateDocumentsUsers < ActiveRecord::Migration
  def change
    create_table :documents_users do |t|
      t.integer :user_id
      t.integer :document_id
      t.timestamps
    end
  end
end
