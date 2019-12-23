class CreateVisits < ActiveRecord::Migration[6.0]
  def change
    create_table :visits do |t|
      t.references :link, null: false, foreign_key: true
      t.string :browser_name
      t.string :device_name
    end
  end
end
