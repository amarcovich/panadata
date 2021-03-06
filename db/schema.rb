# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141024231447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "unaccent"

  create_table "adquisicion", force: true do |t|
    t.decimal "codigo"
    t.string  "clasificacion", limit: nil
    t.decimal "cantidad"
    t.string  "unidad",        limit: nil
    t.string  "descripcion",   limit: nil
    t.string  "ses",           limit: nil
    t.string  "categoria_1",   limit: nil
    t.string  "categoria_2",   limit: nil
    t.string  "categoria_3",   limit: nil
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "adquisiciones", force: true do |t|
    t.decimal "codigo"
    t.string  "clasificacion", limit: nil
    t.decimal "cantidad"
    t.string  "unidad",        limit: nil
    t.string  "descripcion",   limit: nil
    t.string  "ses",           limit: nil
    t.string  "categoria_1",   limit: nil
    t.string  "categoria_2",   limit: nil
    t.string  "categoria_3",   limit: nil
    t.date    "created_at"
    t.date    "updated_at"
  end

  create_table "asociaciones", id: false, force: true do |t|
    t.integer "persona_id",              null: false
    t.integer "sociedad_id",             null: false
    t.string  "rol",         limit: nil, null: false
  end

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "compras", id: false, force: true do |t|
    t.string   "acto",              limit: 200,                                                                          null: false
    t.string   "url",               limit: 200
    t.text     "html"
    t.text     "description"
    t.boolean  "visited"
    t.boolean  "parsed"
    t.integer  "category_id"
    t.string   "compra_type",       limit: 100
    t.string   "entidad",           limit: 200
    t.string   "dependencia",       limit: 200
    t.string   "nombre_contacto",   limit: 40
    t.string   "telefono_contacto", limit: 15
    t.string   "objeto",            limit: 200
    t.string   "modalidad",         limit: 200
    t.string   "correo_contacto",   limit: 200
    t.string   "unidad",            limit: 200
    t.string   "provincia",         limit: 50
    t.decimal  "precio",                        precision: 15, scale: 2
    t.decimal  "precio_cd",                     precision: 15, scale: 2
    t.string   "proponente",        limit: 200
    t.datetime "fecha"
    t.integer  "proveedor_id"
    t.date     "created_at"
    t.date     "updated_at"
    t.tsvector "tsv_description"
    t.integer  "entidad_id"
    t.integer  "id",                                                     default: "nextval('compras_id_seq'::regclass)", null: false
  end

  add_index "compras", ["tsv_description"], name: "compras_description", using: :gin
  add_index "compras", ["url"], name: "compras_url_key", unique: true, using: :btree

  create_table "documentos", id: false, force: true do |t|
    t.string   "control",     limit: 100,                                                                             null: false
    t.text     "institucion"
    t.string   "documento",   limit: 100
    t.string   "numero",      limit: 100
    t.text     "favor"
    t.string   "estado",      limit: 100
    t.decimal  "monto",                   precision: 15, scale: 2
    t.text     "html"
    t.datetime "fecha"
    t.date     "created_at"
    t.date     "updated_at"
    t.tsvector "tsv_nombre"
    t.integer  "id",                                               default: "nextval('documentos_id_seq'::regclass)", null: false
  end

  add_index "documentos", ["tsv_nombre"], name: "documentos_nombre", using: :gin

  create_table "entidades", force: true do |t|
    t.string "nombre",     limit: nil
    t.date   "created_at"
    t.date   "updated_at"
  end

  add_index "entidades", ["nombre"], name: "entidades_nombre_key", unique: true, using: :btree

  create_table "exportaciones", force: true do |t|
    t.string   "ruc",                  limit: nil
    t.string   "empresa",              limit: nil
    t.string   "destino",              limit: nil
    t.string   "descripcion",          limit: nil
    t.string   "puerto_entrada",       limit: nil
    t.string   "fraccion_arancelaria", limit: nil
    t.string   "cantidad",             limit: nil
    t.string   "peso_neto",            limit: nil
    t.string   "peso_bruto",           limit: nil
    t.decimal  "valor_fob",                        precision: 15, scale: 2
    t.decimal  "valor_flete",                      precision: 15, scale: 2
    t.decimal  "valor_seguro",                     precision: 15, scale: 2
    t.decimal  "valor_cif",                        precision: 15, scale: 2
    t.decimal  "impuesto_exportacion",             precision: 15, scale: 2
    t.decimal  "impuesto_itbm",                    precision: 15, scale: 2
    t.decimal  "impuesto_petroleo",                precision: 15, scale: 2
    t.decimal  "impuesto_isc",                     precision: 15, scale: 2
    t.decimal  "impuesto_total",                   precision: 15, scale: 2
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.tsvector "tsv_nombre"
  end

  add_index "exportaciones", ["tsv_nombre"], name: "exportaciones_nombre", using: :gin

  create_table "foundations", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "historiales", id: false, force: true do |t|
    t.integer "id",                         null: false
    t.integer "marca_id"
    t.integer "resuelto_id"
    t.string  "tramite",        limit: nil
    t.date    "fecha"
    t.string  "estado",         limit: nil
    t.date    "fecha_resuelto"
    t.string  "edicto",         limit: nil
    t.string  "examinador",     limit: nil
  end

  create_table "importaciones", force: true do |t|
    t.string   "ruc",                  limit: nil
    t.string   "empresa",              limit: nil
    t.string   "procedencia",          limit: nil
    t.string   "descripcion",          limit: nil
    t.string   "puerto_entrada",       limit: nil
    t.string   "fraccion_arancelaria", limit: nil
    t.string   "cantidad",             limit: nil
    t.string   "peso_neto",            limit: nil
    t.string   "peso_bruto",           limit: nil
    t.decimal  "valor_fob",                        precision: 15, scale: 2
    t.decimal  "valor_flete",                      precision: 15, scale: 2
    t.decimal  "valor_seguro",                     precision: 15, scale: 2
    t.decimal  "valor_cif",                        precision: 15, scale: 2
    t.decimal  "impuesto_importacion",             precision: 15, scale: 2
    t.decimal  "impuesto_itbm",                    precision: 15, scale: 2
    t.decimal  "impuesto_petroleo",                precision: 15, scale: 2
    t.decimal  "impuesto_isc",                     precision: 15, scale: 2
    t.decimal  "impuesto_total",                   precision: 15, scale: 2
    t.date     "fecha"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.tsvector "tsv_nombre"
  end

  add_index "importaciones", ["tsv_nombre"], name: "importaciones_nombre", using: :gin

  create_table "marca_titulares", id: false, force: true do |t|
    t.integer "titular_id", null: false
    t.integer "marca_id",   null: false
  end

  create_table "marcas", id: false, force: true do |t|
    t.integer  "id",                             null: false
    t.string   "nombre",             limit: nil
    t.integer  "registro",           limit: 8
    t.string   "solicitud",          limit: nil, null: false
    t.integer  "secuencia"
    t.integer  "clase"
    t.string   "estado",             limit: nil
    t.string   "signo",              limit: nil
    t.string   "actividad",          limit: nil
    t.string   "abogado",            limit: nil
    t.integer  "tomo"
    t.integer  "folio"
    t.integer  "asiento"
    t.integer  "resuelto",           limit: 8
    t.integer  "boletin"
    t.integer  "plazo_pagado"
    t.date     "fecha_solicitud"
    t.date     "fecha_registro"
    t.date     "fecha_vencimiento"
    t.date     "fecha_renovacion"
    t.date     "fecha_resuelto"
    t.text     "capital_text"
    t.text     "representante_text"
    t.text     "html"
    t.tsvector "tsv_nombre"
  end

  add_index "marcas", ["id"], name: "marcas_id_key", unique: true, using: :btree
  add_index "marcas", ["tsv_nombre"], name: "marcas_nombre", using: :gin

  create_table "menciones", id: false, force: true do |t|
    t.integer "id",       null: false
    t.integer "marca_id"
    t.text    "nombre"
  end

  create_table "personas", id: false, force: true do |t|
    t.integer  "id",                     null: false
    t.string   "nombre",     limit: nil
    t.tsvector "tsv_nombre"
  end

  add_index "personas", ["nombre"], name: "personas_nombre_key", unique: true, using: :btree
  add_index "personas", ["tsv_nombre"], name: "personas_nombre", using: :gin

  create_table "prioridades", id: false, force: true do |t|
    t.integer "id",       null: false
    t.integer "marca_id"
    t.text    "nombre"
  end

  create_table "productos", id: false, force: true do |t|
    t.integer "id",       null: false
    t.integer "marca_id"
    t.text    "nombre"
  end

  create_table "proveedores", force: true do |t|
    t.string   "nombre",     limit: nil
    t.date     "created_at"
    t.date     "updated_at"
    t.tsvector "tsv_nombre"
  end

  add_index "proveedores", ["nombre"], name: "proveedores_nombre_key", unique: true, using: :btree
  add_index "proveedores", ["tsv_nombre"], name: "proveedores_nombre", using: :gin

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sociedades", primary_key: "ficha", force: true do |t|
    t.string   "nombre",             limit: nil
    t.float    "capital"
    t.string   "moneda",             limit: nil
    t.string   "agente",             limit: nil
    t.string   "notaria",            limit: nil
    t.date     "fecha_registro"
    t.text     "capital_text"
    t.text     "representante_text"
    t.string   "status",             limit: nil
    t.string   "duracion",           limit: nil
    t.string   "provincia",          limit: nil
    t.boolean  "visited"
    t.text     "html"
    t.tsvector "tsv_nombre"
  end

  add_index "sociedades", ["nombre"], name: "sociedades_nombre_key", unique: true, using: :btree
  add_index "sociedades", ["tsv_nombre"], name: "sociedades_nombre", using: :gin

  create_table "titulares", id: false, force: true do |t|
    t.integer  "id",                     null: false
    t.string   "nombre",     limit: nil, null: false
    t.text     "domicilio"
    t.string   "pais",       limit: nil
    t.string   "estado",     limit: nil
    t.tsvector "tsv_nombre"
  end

  add_index "titulares", ["id"], name: "titulares_id_key", unique: true, using: :btree
  add_index "titulares", ["tsv_nombre"], name: "titulares_nombre", using: :gin

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
