class CreateSuppliers < ActiveRecord::Migration[8.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.text :description
      t.string :email
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
