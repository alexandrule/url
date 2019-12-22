class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.string :long_url
      t.string :short_url
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
