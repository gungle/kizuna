# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100202051958) do

  create_table "families", :force => true do |t|
    t.integer  "group_id",    :null => false
    t.string   "family_name", :null => false
    t.integer  "user_id"
    t.string   "address",     :null => false
    t.string   "tel",         :null => false
    t.string   "fax"
    t.float    "home_lat"
    t.float    "home_lon"
    t.string   "icon_path"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at"
  end

  create_table "groups", :force => true do |t|
    t.string   "group_name",                 :null => false
    t.float    "default_lat"
    t.float    "default_lon"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at"
    t.integer  "public_flag", :default => 0, :null => false
  end

  create_table "maps", :force => true do |t|
    t.integer  "group_id",                    :null => false
    t.string   "pos_title",                   :null => false
    t.text     "pos_explain"
    t.float    "pos_lat",                     :null => false
    t.float    "pos_lon",                     :null => false
    t.string   "picture_path"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at"
    t.integer  "pos_kind",     :default => 0, :null => false
  end

# Could not dump table "sqlite_stat1" because of following StandardError
#   Unknown type '' for column 'tbl'

  create_table "statuses", :force => true do |t|
    t.integer  "user_id",                   :null => false
    t.integer  "status",     :default => 0, :null => false
    t.integer  "position",   :default => 0, :null => false
    t.text     "note"
    t.float    "now_lat"
    t.float    "now_lon"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at"
  end

  create_table "tweets", :force => true do |t|
    t.integer  "parent_id",    :default => 0, :null => false
    t.integer  "user_id"
    t.string   "tweet",                       :null => false
    t.float    "tweet_lat"
    t.float    "tweet_lon"
    t.string   "picture_path"
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at"
    t.integer  "group_id",     :default => 0, :null => false
    t.integer  "children_cnt", :default => 0, :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "family_id",       :null => false
    t.string   "login",           :null => false
    t.string   "password",        :null => false
    t.string   "full_name",       :null => false
    t.date     "birthday",        :null => false
    t.integer  "blood",           :null => false
    t.integer  "sex",             :null => false
    t.string   "tel"
    t.string   "mail",            :null => false
    t.string   "job"
    t.text     "good_field"
    t.text     "medical_history"
    t.string   "icon_path"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at"
    t.string   "full_name_kana"
  end

end
