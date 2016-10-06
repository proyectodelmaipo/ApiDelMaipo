# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161006035930) do

  create_table "IMPLEMENTOS", primary_key: "ID_IMPLEMENTO", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ID_LOCAL"
    t.integer "ID_SOLICITUD"
    t.string  "NOMBRE",       limit: 100
    t.string  "MARCA",        limit: 100
    t.integer "CANTIDAD"
    t.index ["ID_IMPLEMENTO"], name: "IMPLEMENTOS_PK", unique: true, using: :btree
    t.index ["ID_LOCAL"], name: "TIENE_2_FK", using: :btree
    t.index ["ID_SOLICITUD"], name: "CONTIENE_FK", using: :btree
  end

  create_table "LOCAL", primary_key: "ID_LOCAL", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer  "ID_ARRENDADOR"
    t.string   "NOMBRE",        limit: 100
    t.text     "FOTO",          limit: 16777215
    t.float    "CALIFICACION",  limit: 24
    t.text     "DESCRIPCION",   limit: 16777215
    t.datetime "HORARIO"
    t.text     "DIRECCION",     limit: 16777215
    t.text     "LOCALIZACION",  limit: 16777215
    t.index ["ID_ARRENDADOR"], name: "TIENE_FK", using: :btree
    t.index ["ID_LOCAL"], name: "LOCAL_PK", unique: true, using: :btree
  end

  create_table "SALAS", primary_key: "ID_SALA", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ID_LOCAL"
    t.string  "NOMBRE",      limit: 100
    t.text    "FOTO",        limit: 16777215
    t.integer "VALOR"
    t.text    "DESCRIPCION", limit: 16777215
    t.text    "CALENDARIO",  limit: 16777215
    t.index ["ID_LOCAL"], name: "TIENE_1_FK", using: :btree
    t.index ["ID_SALA"], name: "SALAS_PK", unique: true, using: :btree
  end

  create_table "SOLICITUD", primary_key: "ID_SOLICITUD", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.integer "ID_MUSICO"
    t.integer "ID_SALA"
    t.text    "ESTADO",    limit: 16777215
    t.index ["ID_MUSICO"], name: "TIENE_4_FK", using: :btree
    t.index ["ID_SALA"], name: "TIENE_5_FK", using: :btree
    t.index ["ID_SOLICITUD"], name: "SOLICITUD_PK", unique: true, using: :btree
  end

  create_table "USUARIO_A", primary_key: "ID_ARRENDADOR", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "NOMBRE",   limit: 100
    t.string  "EMAIL",    limit: 100
    t.integer "TELEFONO"
    t.string  "CLAVE",    limit: 100
    t.index ["ID_ARRENDADOR"], name: "USUARIO_A_PK", unique: true, using: :btree
  end

  create_table "USUARIO_M", primary_key: "ID_MUSICO", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string  "NOMBRE",       limit: 100
    t.string  "EMAIL",        limit: 100
    t.integer "TELEFONO"
    t.string  "CLAVE",        limit: 100
    t.float   "CALIFICACION", limit: 24
    t.integer "RADIO"
    t.index ["ID_MUSICO"], name: "USUARIO_M_PK", unique: true, using: :btree
  end

  create_table "implementos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "local_id"
    t.string   "nombre"
    t.string   "marca"
    t.integer  "cantidad"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["local_id"], name: "index_implementos_on_local_id", using: :btree
  end

  create_table "locals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "usuario_a_id"
    t.string   "nombre"
    t.string   "foto"
    t.float    "calificacion", limit: 24
    t.string   "descripcion"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.text     "direccion",    limit: 65535
    t.string   "lozalizacion"
    t.index ["usuario_a_id"], name: "index_locals_on_usuario_a_id", using: :btree
  end

  create_table "salas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "local_id"
    t.string   "nombre"
    t.string   "foto"
    t.integer  "valor"
    t.text     "descripcion", limit: 65535
    t.text     "calendario",  limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["local_id"], name: "index_salas_on_local_id", using: :btree
  end

  create_table "solicituds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "usuario_m_id"
    t.integer  "usuario_a_id"
    t.integer  "local_id"
    t.integer  "sala_id"
    t.integer  "implemento_id"
    t.string   "estado"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["implemento_id"], name: "index_solicituds_on_implemento_id", using: :btree
    t.index ["local_id"], name: "index_solicituds_on_local_id", using: :btree
    t.index ["sala_id"], name: "index_solicituds_on_sala_id", using: :btree
    t.index ["usuario_a_id"], name: "index_solicituds_on_usuario_a_id", using: :btree
    t.index ["usuario_m_id"], name: "index_solicituds_on_usuario_m_id", using: :btree
  end

  create_table "usuario_as", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "telefono"
    t.string   "clave"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuario_ms", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "email"
    t.integer  "telefono"
    t.string   "clave"
    t.float    "calificacion", limit: 24
    t.integer  "radio"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "LOCAL", "USUARIO_A", column: "ID_ARRENDADOR", primary_key: "ID_ARRENDADOR", name: "FK_LOCAL_TIENE_USUARIO_"
  add_foreign_key "SALAS", "LOCAL", column: "ID_LOCAL", primary_key: "ID_LOCAL", name: "FK_SALAS_TIENE_1_LOCAL"
  add_foreign_key "SOLICITUD", "SALAS", column: "ID_SALA", primary_key: "ID_SALA", name: "FK_SOLICITU_TIENE_5_SALAS"
  add_foreign_key "SOLICITUD", "USUARIO_M", column: "ID_MUSICO", primary_key: "ID_MUSICO", name: "FK_SOLICITU_TIENE_4_USUARIO_"
  add_foreign_key "implementos", "locals"
  add_foreign_key "locals", "usuario_as"
  add_foreign_key "salas", "locals"
  add_foreign_key "solicituds", "implementos"
  add_foreign_key "solicituds", "locals"
  add_foreign_key "solicituds", "salas"
  add_foreign_key "solicituds", "usuario_as"
  add_foreign_key "solicituds", "usuario_ms"
end
