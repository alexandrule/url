class AddDeleteAtToLinks < ActiveRecord::Migration[6.0]
  def change
    add_column :links, :delete_at, :datetime
  end
end
