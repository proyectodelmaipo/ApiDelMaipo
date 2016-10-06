class CreateImplementos < ActiveRecord::Migration[5.0]
  def change
    create_table :implementos do |t|
      t.references :local, foreign_key: true
      t.string :nombre
      t.string :marca
      t.integer :cantidad

      t.timestamps
    end
  end
end
