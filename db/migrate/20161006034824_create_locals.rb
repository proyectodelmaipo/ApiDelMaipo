class CreateLocals < ActiveRecord::Migration[5.0]
  def change
    create_table :locals do |t|
      t.references :usuario_a, foreign_key: true
      t.string :nombre
      t.string :foto
      t.float :calificacion
      t.string :descripcion
      t.timestamps :horario
      t.text :direccion
      t.string :lozalizacion

      t.timestamps
    end
  end
end
