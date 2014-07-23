class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :firstname
      t.string :lastname
      t.string :company     
      t.string :title
      t.string :email
      t.string :mobile
      t.boolean :is_admin, :default => false
      t.string :avatar
      t.string :password_digest
      t.timestamps
    end
  end
end
