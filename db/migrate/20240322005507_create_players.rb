class CreatePlayers < ActiveRecord::Migration[7.1]
  def change
    create_table :players do |t|
      t.string :username, null: false
      t.string :password
      t.integer :level, null: false, default: 1
      t.integer :sanity, null: false, default: 100
      t.integer :knowledge, null: false, default: 0

      t.timestamps
    end
  end
end
