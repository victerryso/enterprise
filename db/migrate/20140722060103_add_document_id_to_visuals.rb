class AddDocumentIdToVisuals < ActiveRecord::Migration
  def change
    add_column :visuals, :document_id, :integer
  end
end
