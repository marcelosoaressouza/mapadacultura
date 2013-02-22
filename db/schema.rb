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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130222185311) do

  create_table "atividades", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.string   "descricao"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "cidades", :force => true do |t|
    t.string   "nome"
    t.string   "codigo_ibge"
    t.integer  "estado_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "cidades", ["estado_id"], :name => "index_cidades_on_estado_id"

  create_table "entidade_equipamentos", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.text     "descricao"
    t.string   "apresenta"
    t.string   "email"
    t.string   "contato"
    t.string   "site"
    t.string   "logradouro"
    t.string   "complemento"
    t.string   "cidade"
    t.string   "estado"
    t.string   "cep"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "gmaps",               :default => false, :null => false
    t.boolean  "publicar",            :default => false, :null => false
    t.string   "horario"
    t.string   "personalidade"
    t.integer  "tipo_id"
    t.integer  "tipo_entidade_id"
    t.integer  "tipo_equipamento_id"
    t.integer  "atividade_id"
    t.integer  "user_id"
    t.integer  "tipo_finalidade_id"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  add_index "entidade_equipamentos", ["atividade_id"], :name => "index_entidade_equipamentos_on_atividade_id"
  add_index "entidade_equipamentos", ["tipo_entidade_id"], :name => "index_entidade_equipamentos_on_tipo_entidade_id"
  add_index "entidade_equipamentos", ["tipo_equipamento_id"], :name => "index_entidade_equipamentos_on_tipo_equipamento_id"
  add_index "entidade_equipamentos", ["tipo_finalidade_id"], :name => "index_entidade_equipamentos_on_tipo_finalidade_id"
  add_index "entidade_equipamentos", ["tipo_id"], :name => "index_entidade_equipamentos_on_tipo_id"
  add_index "entidade_equipamentos", ["user_id"], :name => "index_entidade_equipamentos_on_user_id"

  create_table "estados", :force => true do |t|
    t.string   "nome"
    t.string   "sigla"
    t.string   "codigo_ibge"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "fotos", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.string   "descricao"
    t.boolean  "publicar",                :default => true, :null => false
    t.integer  "user_id"
    t.integer  "entidade_equipamento_id"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "fotos", ["entidade_equipamento_id"], :name => "index_fotos_on_entidade_equipamento_id"
  add_index "fotos", ["user_id"], :name => "index_fotos_on_user_id"

  create_table "questionario_basico_entidades", :force => true do |t|
    t.string   "inicio_atividades"
    t.text     "principais_atividades"
    t.string   "acoes_desenvolvidas"
    t.string   "frequencia_acoes"
    t.boolean  "produz_eventos",                  :default => false, :null => false
    t.string   "frequencia_producao_eventos"
    t.boolean  "participa_eventos",               :default => false, :null => false
    t.string   "frequencia_participacao_eventos"
    t.integer  "entidade_equipamento_id"
    t.integer  "user_id"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
  end

  add_index "questionario_basico_entidades", ["entidade_equipamento_id"], :name => "index_questionario_basico_entidades_on_entidade_equipamento_id"
  add_index "questionario_basico_entidades", ["user_id"], :name => "index_questionario_basico_entidades_on_user_id"

  create_table "tipo_entidades", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.text     "descricao"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "tipo_equipamentos", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.string   "descricao"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "imagem_file_name"
    t.string   "imagem_content_type"
    t.integer  "imagem_file_size"
    t.datetime "imagem_updated_at"
  end

  create_table "tipo_finalidades", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tipos", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.text     "descricao"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "cpf"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false, :null => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "videos", :force => true do |t|
    t.string   "nome"
    t.string   "slug"
    t.string   "descricao"
    t.boolean  "publicar"
    t.integer  "user_id"
    t.integer  "entidade_equipamento_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  add_index "videos", ["entidade_equipamento_id"], :name => "index_videos_on_entidade_equipamento_id"
  add_index "videos", ["user_id"], :name => "index_videos_on_user_id"

end
