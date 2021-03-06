class CreateHosts < ActiveRecord::Migration[5.0]
  def change
    create_table :hosts do |t|
      t.string :name, limit: 255
      t.text :url
      t.integer :probe_interval
      t.integer :active, default: 1, null: false, limit: 2

      t.timestamps
    end
  end
end

