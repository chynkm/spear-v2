class CreatePorts < ActiveRecord::Migration[5.0]
  def change
    create_table :ports do |t|
      t.text :host
      t.integer :port
      t.string :name, limit: 255
      t.integer :probe_interval
      t.integer :active, default: 1, null: false, limit: 2

      t.timestamps
    end
  end
end

