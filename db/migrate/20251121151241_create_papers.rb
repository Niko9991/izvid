class CreatePapers < ActiveRecord::Migration[8.0]
  def change
    create_table :papers do |t|
      t.integer :year
      t.string :article
      t.integer :group
      t.string :labtest
      t.string :location_labtest
      t.string :certificate
      t.string :location_certificate
      t.text :comment
      t.integer :labtest_count
      t.integer :certificate_count
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
