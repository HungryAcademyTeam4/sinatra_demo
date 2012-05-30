class MakeMessage < ActiveRecord::Migration
  def up
    create_table :messages do |t|
      t.integer :id
      t.datetime :created_at
      t.string :body
    end
  end

  def down
    remove_column :accounts, :ssl_enabled
  end
end