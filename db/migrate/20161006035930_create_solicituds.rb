class CreateSolicituds < ActiveRecord::Migration[5.0]
  def change
    create_table :solicituds do |t|
      t.references :usuario_m, foreign_key: true
      t.references :usuario_a, foreign_key: true
      t.references :local, foreign_key: true
      t.references :sala, foreign_key: true
      t.references :implemento, foreign_key: true
      t.string :estado

      t.timestamps
    end
  end
end
