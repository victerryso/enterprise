class AddPagenumberToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :pagenumber, :integer
  end
end
