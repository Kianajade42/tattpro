class CreateTattoos < ActiveRecord::Migration[6.0]
  def change
    create_table :tattoos do |t|
      t.string :name
      t.string :client
      t.string :placement
      t.string :description
      t.integer :user_id
    end
  end
end
