class CreateSalas < ActiveRecord::Migration[5.0]
  def change
    create_table :salas do |t|
      t.references :local, foreign_key: true
      t.string :nombre
      t.string :foto
      t.integer :valor
      t.text :descripcion
      t.text :calendario

      t.timestamps
    end
  end
end
