class AddAvailableAtToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :active, :boolean, default: true
    add_column :links, :available_at, :datetime
  end
end
