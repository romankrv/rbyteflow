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

ActiveRecord::Schema.define(:version => 20110911022038) do

  create_table "actionrecord", :force => true do |t|
    t.integer  "user_id",                  :null => false
    t.string   "action_key", :limit => 40, :null => false
    t.datetime "date",                     :null => false
    t.string   "type",       :limit => 1,  :null => false
  end

  add_index "actionrecord", ["user_id"], :name => "actionrecord_user_id"

  create_table "auth_group", :force => true do |t|
    t.string "name", :limit => 80, :null => false
  end

  add_index "auth_group", ["name"], :name => "auth_group_name_key", :unique => true

  create_table "auth_group_permissions", :force => true do |t|
    t.integer "group_id",      :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_group_permissions", ["group_id", "permission_id"], :name => "auth_group_permissions_group_id_key", :unique => true
  add_index "auth_group_permissions", ["group_id"], :name => "auth_group_permissions_group_id"
  add_index "auth_group_permissions", ["permission_id"], :name => "auth_group_permissions_permission_id"

  create_table "auth_message", :force => true do |t|
    t.integer "user_id", :null => false
    t.text    "message", :null => false
  end

  add_index "auth_message", ["user_id"], :name => "auth_message_user_id"

  create_table "auth_permission", :force => true do |t|
    t.string  "name",            :limit => 50,  :null => false
    t.integer "content_type_id",                :null => false
    t.string  "codename",        :limit => 100, :null => false
  end

  add_index "auth_permission", ["content_type_id", "codename"], :name => "auth_permission_content_type_id_key", :unique => true
  add_index "auth_permission", ["content_type_id"], :name => "auth_permission_content_type_id"

  create_table "auth_user", :force => true do |t|
    t.string   "username",          :limit => 30,  :null => false
    t.string   "first_name",        :limit => 30,  :null => false
    t.string   "last_name",         :limit => 30,  :null => false
    t.string   "email",             :limit => 75,  :null => false
    t.string   "password",          :limit => 128, :null => false
    t.boolean  "is_staff",                         :null => false
    t.boolean  "is_active",                        :null => false
    t.boolean  "is_superuser",                     :null => false
    t.datetime "last_login",                       :null => false
    t.datetime "date_joined",                      :null => false
    t.string   "site",              :limit => 200, :null => false
    t.string   "email_new",         :limit => 75,  :null => false
    t.string   "persistence_token"
  end

  add_index "auth_user", ["username"], :name => "auth_user_username_key", :unique => true

  create_table "auth_user_groups", :force => true do |t|
    t.integer "user_id",  :null => false
    t.integer "group_id", :null => false
  end

  add_index "auth_user_groups", ["group_id"], :name => "auth_user_groups_group_id"
  add_index "auth_user_groups", ["user_id", "group_id"], :name => "auth_user_groups_user_id_key", :unique => true
  add_index "auth_user_groups", ["user_id"], :name => "auth_user_groups_user_id"

  create_table "auth_user_user_permissions", :force => true do |t|
    t.integer "user_id",       :null => false
    t.integer "permission_id", :null => false
  end

  add_index "auth_user_user_permissions", ["permission_id"], :name => "auth_user_user_permissions_permission_id"
  add_index "auth_user_user_permissions", ["user_id", "permission_id"], :name => "auth_user_user_permissions_user_id_key", :unique => true
  add_index "auth_user_user_permissions", ["user_id"], :name => "auth_user_user_permissions_user_id"

  create_table "blog_post", :force => true do |t|
    t.integer  "site_id",                        :null => false
    t.integer  "author_id",                      :null => false
    t.string   "name",            :limit => 256, :null => false
    t.string   "slug",            :limit => 256, :null => false
    t.text     "text",                           :null => false
    t.string   "render_method",   :limit => 15,  :null => false
    t.text     "html",                           :null => false
    t.datetime "date",                           :null => false
    t.datetime "upd_date",                       :null => false
    t.boolean  "is_draft",                       :null => false
    t.boolean  "enable_comments",                :null => false
    t.string   "tags",                           :null => false
    t.string   "language",        :limit => 8
  end

  add_index "blog_post", ["author_id"], :name => "blog_post_author_id"
  add_index "blog_post", ["language"], :name => "blog_post_language"
  add_index "blog_post", ["site_id", "slug", "date"], :name => "blog_post_site_id_key", :unique => true
  add_index "blog_post", ["site_id"], :name => "blog_post_site_id"
  add_index "blog_post", ["slug"], :name => "blog_post_slug"
  add_index "blog_post", ["slug"], :name => "blog_post_slug_like"

  create_table "comment_nodes", :force => true do |t|
    t.integer  "user_id",          :null => false
    t.datetime "pub_date",         :null => false
    t.datetime "upd_date",         :null => false
    t.text     "body",             :null => false
    t.text     "body_html",        :null => false
    t.integer  "reply_to_id"
    t.boolean  "approved",         :null => false
    t.integer  "content_type_id",  :null => false
    t.integer  "object_id",        :null => false
    t.integer  "lft",              :null => false
    t.integer  "rght",             :null => false
    t.integer  "commentable_id"
    t.string   "commentable_type"
  end

  add_index "comment_nodes", ["commentable_id"], :name => "comment_nodes_commentable_id"
  add_index "comment_nodes", ["commentable_type"], :name => "comment_nodes_commentable_type"
  add_index "comment_nodes", ["content_type_id"], :name => "comment_nodes_content_type_id"
  add_index "comment_nodes", ["lft"], :name => "comment_nodes_lft"
  add_index "comment_nodes", ["object_id"], :name => "comment_nodes_object_id"
  add_index "comment_nodes", ["user_id"], :name => "comment_nodes_user_id"

  create_table "django_admin_log", :force => true do |t|
    t.datetime "action_time",                    :null => false
    t.integer  "user_id",                        :null => false
    t.integer  "content_type_id"
    t.text     "object_id"
    t.string   "object_repr",     :limit => 200, :null => false
    t.integer  "action_flag",     :limit => 2,   :null => false
    t.text     "change_message",                 :null => false
  end

  add_index "django_admin_log", ["content_type_id"], :name => "django_admin_log_content_type_id"
  add_index "django_admin_log", ["user_id"], :name => "django_admin_log_user_id"

  create_table "django_content_type", :force => true do |t|
    t.string "name",      :limit => 100, :null => false
    t.string "app_label", :limit => 100, :null => false
    t.string "model",     :limit => 100, :null => false
  end

  add_index "django_content_type", ["app_label", "model"], :name => "django_content_type_app_label_key", :unique => true

  create_table "django_flatpage", :force => true do |t|
    t.string  "url",                   :limit => 100, :null => false
    t.string  "title",                 :limit => 200, :null => false
    t.text    "content",                              :null => false
    t.boolean "enable_comments",                      :null => false
    t.string  "template_name",         :limit => 70,  :null => false
    t.boolean "registration_required",                :null => false
  end

  add_index "django_flatpage", ["url"], :name => "django_flatpage_url"
  add_index "django_flatpage", ["url"], :name => "django_flatpage_url_like"

  create_table "django_flatpage_sites", :force => true do |t|
    t.integer "flatpage_id", :null => false
    t.integer "site_id",     :null => false
  end

  add_index "django_flatpage_sites", ["flatpage_id", "site_id"], :name => "django_flatpage_sites_flatpage_id_key", :unique => true
  add_index "django_flatpage_sites", ["flatpage_id"], :name => "django_flatpage_sites_flatpage_id"
  add_index "django_flatpage_sites", ["site_id"], :name => "django_flatpage_sites_site_id"

  create_table "django_session", :id => false, :force => true do |t|
    t.string   "session_key",  :limit => 40, :null => false
    t.text     "session_data",               :null => false
    t.datetime "expire_date",                :null => false
  end

  add_index "django_session", ["expire_date"], :name => "django_session_expire_date"

  create_table "django_site", :force => true do |t|
    t.string "domain", :limit => 100, :null => false
    t.string "name",   :limit => 50,  :null => false
  end

  create_table "openidconsumer_association", :force => true do |t|
    t.text    "server_url", :null => false
    t.string  "handle",     :null => false
    t.text    "secret",     :null => false
    t.integer "issued",     :null => false
    t.integer "lifetime",   :null => false
    t.text    "assoc_type", :null => false
  end

  create_table "openidconsumer_nonce", :force => true do |t|
    t.string  "server_url",               :null => false
    t.integer "timestamp",                :null => false
    t.string  "salt",       :limit => 40, :null => false
  end

  create_table "openidconsumer_userassociation", :force => true do |t|
    t.string  "openid_url", :null => false
    t.integer "user_id",    :null => false
  end

  add_index "openidconsumer_userassociation", ["user_id"], :name => "openidconsumer_userassociation_user_id"

  create_table "openidserver_djangoiduser", :id => false, :force => true do |t|
    t.integer "user_id", :null => false
  end

  create_table "openidserver_djangoiduser_trusted_roots", :force => true do |t|
    t.integer "djangoiduser_id", :null => false
    t.integer "trustedroot_id",  :null => false
  end

  add_index "openidserver_djangoiduser_trusted_roots", ["djangoiduser_id", "trustedroot_id"], :name => "openidserver_djangoiduser_trusted_roots_djangoiduser_id_key", :unique => true
  add_index "openidserver_djangoiduser_trusted_roots", ["djangoiduser_id"], :name => "openidserver_djangoiduser_trusted_roots_djangoiduser_id"
  add_index "openidserver_djangoiduser_trusted_roots", ["trustedroot_id"], :name => "openidserver_djangoiduser_trusted_roots_trustedroot_id"

  create_table "openidserver_oidstoreassociation", :force => true do |t|
    t.string  "server_url",               :null => false
    t.string  "handle",     :limit => 78, :null => false
    t.text    "secret",                   :null => false
    t.integer "issued",                   :null => false
    t.integer "lifetime",                 :null => false
    t.string  "assoc_type", :limit => 64, :null => false
  end

  add_index "openidserver_oidstoreassociation", ["server_url", "handle"], :name => "openidserver_oidstoreassociation_server_url_key", :unique => true

  create_table "openidserver_oidstorenonce", :id => false, :force => true do |t|
    t.string  "nonce",   :limit => 8, :null => false
    t.integer "expires",              :null => false
  end

  create_table "openidserver_oidstoresetting", :id => false, :force => true do |t|
    t.string "setting", :limit => 128, :null => false
    t.text   "value",                  :null => false
  end

  create_table "openidserver_trustedroot", :force => true do |t|
    t.string "root", :limit => 200, :null => false
  end

  add_index "openidserver_trustedroot", ["root"], :name => "openidserver_trustedroot_root_key", :unique => true

  create_table "pingback", :force => true do |t|
    t.string   "url",             :limit => 200, :null => false
    t.datetime "date",                           :null => false
    t.boolean  "approved",                       :null => false
    t.string   "title",           :limit => 100, :null => false
    t.text     "content",                        :null => false
    t.integer  "content_type_id",                :null => false
    t.integer  "object_id",                      :null => false
  end

  add_index "pingback", ["content_type_id"], :name => "pingback_content_type_id"

  create_table "pingback_client", :force => true do |t|
    t.string   "url",             :limit => 200, :null => false
    t.datetime "date",                           :null => false
    t.boolean  "success",                        :null => false
    t.integer  "content_type_id",                :null => false
    t.integer  "object_id",                      :null => false
  end

  add_index "pingback_client", ["content_type_id"], :name => "pingback_client_content_type_id"

  create_table "pingback_directoryping", :force => true do |t|
    t.string   "url",             :limit => 200, :null => false
    t.datetime "date",                           :null => false
    t.boolean  "success",                        :null => false
    t.integer  "content_type_id",                :null => false
    t.integer  "object_id",                      :null => false
  end

  add_index "pingback_directoryping", ["content_type_id"], :name => "pingback_directoryping_content_type_id"

  create_table "portfolio_category", :force => true do |t|
    t.string   "status",            :limit => 20,  :null => false
    t.string   "language",          :limit => 8,   :null => false
    t.integer  "order",                            :null => false
    t.integer  "creator_id",                       :null => false
    t.integer  "editor_id",                        :null => false
    t.datetime "publish",                          :null => false
    t.datetime "unpublish"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
    t.string   "name",              :limit => 250, :null => false
    t.string   "slug",              :limit => 250, :null => false
    t.string   "description",       :limit => 250, :null => false
    t.integer  "translation_of_id"
  end

  add_index "portfolio_category", ["creator_id"], :name => "portfolio_category_creator_id"
  add_index "portfolio_category", ["editor_id"], :name => "portfolio_category_editor_id"
  add_index "portfolio_category", ["language"], :name => "portfolio_category_language"
  add_index "portfolio_category", ["language"], :name => "portfolio_category_language_like"
  add_index "portfolio_category", ["name"], :name => "portfolio_category_name"
  add_index "portfolio_category", ["name"], :name => "portfolio_category_name_like"
  add_index "portfolio_category", ["order"], :name => "portfolio_category_order"
  add_index "portfolio_category", ["publish"], :name => "portfolio_category_publish"
  add_index "portfolio_category", ["slug"], :name => "portfolio_category_slug_key", :unique => true
  add_index "portfolio_category", ["status"], :name => "portfolio_category_status"
  add_index "portfolio_category", ["status"], :name => "portfolio_category_status_like"
  add_index "portfolio_category", ["translation_of_id"], :name => "portfolio_category_translation_of_id"

  create_table "portfolio_category_sites", :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "site_id",     :null => false
  end

  add_index "portfolio_category_sites", ["category_id", "site_id"], :name => "portfolio_category_sites_category_id_key", :unique => true
  add_index "portfolio_category_sites", ["category_id"], :name => "portfolio_category_sites_category_id"
  add_index "portfolio_category_sites", ["site_id"], :name => "portfolio_category_sites_site_id"

  create_table "portfolio_client", :force => true do |t|
    t.string   "status",            :limit => 20,  :null => false
    t.string   "language",          :limit => 8,   :null => false
    t.integer  "order",                            :null => false
    t.integer  "creator_id",                       :null => false
    t.integer  "editor_id",                        :null => false
    t.datetime "publish",                          :null => false
    t.datetime "unpublish"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
    t.string   "name",              :limit => 250, :null => false
    t.string   "slug",              :limit => 250, :null => false
    t.string   "description",       :limit => 250, :null => false
    t.integer  "translation_of_id"
  end

  add_index "portfolio_client", ["creator_id"], :name => "portfolio_client_creator_id"
  add_index "portfolio_client", ["editor_id"], :name => "portfolio_client_editor_id"
  add_index "portfolio_client", ["language"], :name => "portfolio_client_language"
  add_index "portfolio_client", ["language"], :name => "portfolio_client_language_like"
  add_index "portfolio_client", ["name"], :name => "portfolio_client_name"
  add_index "portfolio_client", ["name"], :name => "portfolio_client_name_like"
  add_index "portfolio_client", ["order"], :name => "portfolio_client_order"
  add_index "portfolio_client", ["publish"], :name => "portfolio_client_publish"
  add_index "portfolio_client", ["slug"], :name => "portfolio_client_slug_key", :unique => true
  add_index "portfolio_client", ["status"], :name => "portfolio_client_status"
  add_index "portfolio_client", ["status"], :name => "portfolio_client_status_like"
  add_index "portfolio_client", ["translation_of_id"], :name => "portfolio_client_translation_of_id"

  create_table "portfolio_client_sites", :force => true do |t|
    t.integer "client_id", :null => false
    t.integer "site_id",   :null => false
  end

  add_index "portfolio_client_sites", ["client_id", "site_id"], :name => "portfolio_client_sites_client_id_key", :unique => true
  add_index "portfolio_client_sites", ["client_id"], :name => "portfolio_client_sites_client_id"
  add_index "portfolio_client_sites", ["site_id"], :name => "portfolio_client_sites_site_id"

  create_table "portfolio_element", :force => true do |t|
    t.string   "status",            :limit => 20,  :null => false
    t.string   "language",          :limit => 8,   :null => false
    t.integer  "order",                            :null => false
    t.integer  "creator_id",                       :null => false
    t.integer  "editor_id",                        :null => false
    t.datetime "publish",                          :null => false
    t.datetime "unpublish"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
    t.string   "name",              :limit => 250, :null => false
    t.string   "photo",             :limit => 100, :null => false
    t.string   "url",               :limit => 250, :null => false
    t.string   "description",       :limit => 250, :null => false
    t.text     "body",                             :null => false
    t.integer  "portfolio_id",                     :null => false
    t.integer  "translation_of_id"
  end

  add_index "portfolio_element", ["creator_id"], :name => "portfolio_element_creator_id"
  add_index "portfolio_element", ["editor_id"], :name => "portfolio_element_editor_id"
  add_index "portfolio_element", ["language"], :name => "portfolio_element_language"
  add_index "portfolio_element", ["language"], :name => "portfolio_element_language_like"
  add_index "portfolio_element", ["name"], :name => "portfolio_element_name"
  add_index "portfolio_element", ["name"], :name => "portfolio_element_name_like"
  add_index "portfolio_element", ["order"], :name => "portfolio_element_order"
  add_index "portfolio_element", ["portfolio_id"], :name => "portfolio_element_portfolio_id"
  add_index "portfolio_element", ["publish"], :name => "portfolio_element_publish"
  add_index "portfolio_element", ["status"], :name => "portfolio_element_status"
  add_index "portfolio_element", ["status"], :name => "portfolio_element_status_like"
  add_index "portfolio_element", ["translation_of_id"], :name => "portfolio_element_translation_of_id"

  create_table "portfolio_element_sites", :force => true do |t|
    t.integer "element_id", :null => false
    t.integer "site_id",    :null => false
  end

  add_index "portfolio_element_sites", ["element_id", "site_id"], :name => "portfolio_element_sites_element_id_key", :unique => true
  add_index "portfolio_element_sites", ["element_id"], :name => "portfolio_element_sites_element_id"
  add_index "portfolio_element_sites", ["site_id"], :name => "portfolio_element_sites_site_id"

  create_table "portfolio_history", :force => true do |t|
    t.string   "status",            :limit => 20,  :null => false
    t.string   "language",          :limit => 8,   :null => false
    t.integer  "order",                            :null => false
    t.integer  "creator_id",                       :null => false
    t.integer  "editor_id",                        :null => false
    t.datetime "publish",                          :null => false
    t.datetime "unpublish"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
    t.string   "name",              :limit => 250, :null => false
    t.string   "photo",             :limit => 100, :null => false
    t.string   "description",       :limit => 250, :null => false
    t.text     "body",                             :null => false
    t.datetime "release_date",                     :null => false
    t.integer  "portfolio_id",                     :null => false
    t.integer  "translation_of_id"
  end

  add_index "portfolio_history", ["creator_id"], :name => "portfolio_history_creator_id"
  add_index "portfolio_history", ["editor_id"], :name => "portfolio_history_editor_id"
  add_index "portfolio_history", ["language"], :name => "portfolio_history_language"
  add_index "portfolio_history", ["language"], :name => "portfolio_history_language_like"
  add_index "portfolio_history", ["name"], :name => "portfolio_history_name"
  add_index "portfolio_history", ["name"], :name => "portfolio_history_name_like"
  add_index "portfolio_history", ["order"], :name => "portfolio_history_order"
  add_index "portfolio_history", ["portfolio_id"], :name => "portfolio_history_portfolio_id"
  add_index "portfolio_history", ["publish"], :name => "portfolio_history_publish"
  add_index "portfolio_history", ["release_date"], :name => "portfolio_history_release_date"
  add_index "portfolio_history", ["status"], :name => "portfolio_history_status"
  add_index "portfolio_history", ["status"], :name => "portfolio_history_status_like"
  add_index "portfolio_history", ["translation_of_id"], :name => "portfolio_history_translation_of_id"

  create_table "portfolio_history_sites", :force => true do |t|
    t.integer "history_id", :null => false
    t.integer "site_id",    :null => false
  end

  add_index "portfolio_history_sites", ["history_id", "site_id"], :name => "portfolio_history_sites_history_id_key", :unique => true
  add_index "portfolio_history_sites", ["history_id"], :name => "portfolio_history_sites_history_id"
  add_index "portfolio_history_sites", ["site_id"], :name => "portfolio_history_sites_site_id"

  create_table "portfolio_portfolio", :force => true do |t|
    t.string   "status",            :limit => 20,  :null => false
    t.string   "language",          :limit => 8,   :null => false
    t.integer  "order",                            :null => false
    t.integer  "creator_id",                       :null => false
    t.integer  "editor_id",                        :null => false
    t.datetime "publish",                          :null => false
    t.datetime "unpublish"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
    t.string   "name",              :limit => 250, :null => false
    t.string   "slug",              :limit => 250, :null => false
    t.string   "photo",             :limit => 100, :null => false
    t.string   "photo_thumb",       :limit => 100, :null => false
    t.string   "photo_thumb_main",  :limit => 100, :null => false
    t.string   "description",       :limit => 250, :null => false
    t.text     "body",                             :null => false
    t.string   "url",               :limit => 250, :null => false
    t.integer  "client_id"
    t.boolean  "on_main",                          :null => false
    t.datetime "release_date",                     :null => false
    t.integer  "translation_of_id"
  end

  add_index "portfolio_portfolio", ["client_id"], :name => "portfolio_portfolio_client_id"
  add_index "portfolio_portfolio", ["creator_id"], :name => "portfolio_portfolio_creator_id"
  add_index "portfolio_portfolio", ["editor_id"], :name => "portfolio_portfolio_editor_id"
  add_index "portfolio_portfolio", ["language"], :name => "portfolio_portfolio_language"
  add_index "portfolio_portfolio", ["language"], :name => "portfolio_portfolio_language_like"
  add_index "portfolio_portfolio", ["name"], :name => "portfolio_portfolio_name"
  add_index "portfolio_portfolio", ["name"], :name => "portfolio_portfolio_name_like"
  add_index "portfolio_portfolio", ["order"], :name => "portfolio_portfolio_order"
  add_index "portfolio_portfolio", ["publish"], :name => "portfolio_portfolio_publish"
  add_index "portfolio_portfolio", ["release_date"], :name => "portfolio_portfolio_release_date"
  add_index "portfolio_portfolio", ["slug"], :name => "portfolio_portfolio_slug_key", :unique => true
  add_index "portfolio_portfolio", ["status"], :name => "portfolio_portfolio_status"
  add_index "portfolio_portfolio", ["status"], :name => "portfolio_portfolio_status_like"
  add_index "portfolio_portfolio", ["translation_of_id"], :name => "portfolio_portfolio_translation_of_id"

  create_table "portfolio_portfolio_category", :force => true do |t|
    t.integer "portfolio_id", :null => false
    t.integer "category_id",  :null => false
  end

  add_index "portfolio_portfolio_category", ["category_id"], :name => "portfolio_portfolio_category_category_id"
  add_index "portfolio_portfolio_category", ["portfolio_id", "category_id"], :name => "portfolio_portfolio_category_portfolio_id_key", :unique => true
  add_index "portfolio_portfolio_category", ["portfolio_id"], :name => "portfolio_portfolio_category_portfolio_id"

  create_table "portfolio_portfolio_sites", :force => true do |t|
    t.integer "portfolio_id", :null => false
    t.integer "site_id",      :null => false
  end

  add_index "portfolio_portfolio_sites", ["portfolio_id", "site_id"], :name => "portfolio_portfolio_sites_portfolio_id_key", :unique => true
  add_index "portfolio_portfolio_sites", ["portfolio_id"], :name => "portfolio_portfolio_sites_portfolio_id"
  add_index "portfolio_portfolio_sites", ["site_id"], :name => "portfolio_portfolio_sites_site_id"

  create_table "portfolio_portfolio_type", :force => true do |t|
    t.integer "portfolio_id", :null => false
    t.integer "type_id",      :null => false
  end

  add_index "portfolio_portfolio_type", ["portfolio_id", "type_id"], :name => "portfolio_portfolio_type_portfolio_id_key", :unique => true
  add_index "portfolio_portfolio_type", ["portfolio_id"], :name => "portfolio_portfolio_type_portfolio_id"
  add_index "portfolio_portfolio_type", ["type_id"], :name => "portfolio_portfolio_type_type_id"

  create_table "portfolio_type", :force => true do |t|
    t.string   "status",            :limit => 20,  :null => false
    t.string   "language",          :limit => 8,   :null => false
    t.integer  "order",                            :null => false
    t.integer  "creator_id",                       :null => false
    t.integer  "editor_id",                        :null => false
    t.datetime "publish",                          :null => false
    t.datetime "unpublish"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.datetime "deleted_at"
    t.string   "name",              :limit => 250, :null => false
    t.string   "slug",              :limit => 250, :null => false
    t.string   "description",       :limit => 250, :null => false
    t.integer  "translation_of_id"
  end

  add_index "portfolio_type", ["creator_id"], :name => "portfolio_type_creator_id"
  add_index "portfolio_type", ["editor_id"], :name => "portfolio_type_editor_id"
  add_index "portfolio_type", ["language"], :name => "portfolio_type_language"
  add_index "portfolio_type", ["language"], :name => "portfolio_type_language_like"
  add_index "portfolio_type", ["name"], :name => "portfolio_type_name"
  add_index "portfolio_type", ["name"], :name => "portfolio_type_name_like"
  add_index "portfolio_type", ["order"], :name => "portfolio_type_order"
  add_index "portfolio_type", ["publish"], :name => "portfolio_type_publish"
  add_index "portfolio_type", ["slug"], :name => "portfolio_type_slug_key", :unique => true
  add_index "portfolio_type", ["status"], :name => "portfolio_type_status"
  add_index "portfolio_type", ["status"], :name => "portfolio_type_status_like"
  add_index "portfolio_type", ["translation_of_id"], :name => "portfolio_type_translation_of_id"

  create_table "portfolio_type_sites", :force => true do |t|
    t.integer "type_id", :null => false
    t.integer "site_id", :null => false
  end

  add_index "portfolio_type_sites", ["site_id"], :name => "portfolio_type_sites_site_id"
  add_index "portfolio_type_sites", ["type_id", "site_id"], :name => "portfolio_type_sites_type_id_key", :unique => true
  add_index "portfolio_type_sites", ["type_id"], :name => "portfolio_type_sites_type_id"

  create_table "reversion_revision", :force => true do |t|
    t.datetime "date_created", :null => false
    t.integer  "user_id"
    t.text     "comment",      :null => false
  end

  add_index "reversion_revision", ["user_id"], :name => "reversion_revision_user_id"

  create_table "reversion_version", :force => true do |t|
    t.integer "revision_id",                  :null => false
    t.text    "object_id",                    :null => false
    t.integer "content_type_id",              :null => false
    t.string  "format",                       :null => false
    t.text    "serialized_data",              :null => false
    t.text    "object_repr",                  :null => false
    t.integer "type",            :limit => 2, :null => false
    t.integer "object_id_int"
  end

  add_index "reversion_version", ["content_type_id"], :name => "reversion_version_content_type_id"
  add_index "reversion_version", ["object_id_int"], :name => "reversion_version_object_id_int"
  add_index "reversion_version", ["revision_id"], :name => "reversion_version_revision_id"
  add_index "reversion_version", ["type"], :name => "reversion_version_type"

  create_table "robots_rule", :force => true do |t|
    t.string  "robot",                                     :null => false
    t.decimal "crawl_delay", :precision => 3, :scale => 1
  end

  create_table "robots_rule_allowed", :force => true do |t|
    t.integer "rule_id", :null => false
    t.integer "url_id",  :null => false
  end

  add_index "robots_rule_allowed", ["rule_id", "url_id"], :name => "robots_rule_allowed_rule_id_key", :unique => true
  add_index "robots_rule_allowed", ["rule_id"], :name => "robots_rule_allowed_rule_id"
  add_index "robots_rule_allowed", ["url_id"], :name => "robots_rule_allowed_url_id"

  create_table "robots_rule_disallowed", :force => true do |t|
    t.integer "rule_id", :null => false
    t.integer "url_id",  :null => false
  end

  add_index "robots_rule_disallowed", ["rule_id", "url_id"], :name => "robots_rule_disallowed_rule_id_key", :unique => true
  add_index "robots_rule_disallowed", ["rule_id"], :name => "robots_rule_disallowed_rule_id"
  add_index "robots_rule_disallowed", ["url_id"], :name => "robots_rule_disallowed_url_id"

  create_table "robots_rule_sites", :force => true do |t|
    t.integer "rule_id", :null => false
    t.integer "site_id", :null => false
  end

  add_index "robots_rule_sites", ["rule_id", "site_id"], :name => "robots_rule_sites_rule_id_key", :unique => true
  add_index "robots_rule_sites", ["rule_id"], :name => "robots_rule_sites_rule_id"
  add_index "robots_rule_sites", ["site_id"], :name => "robots_rule_sites_site_id"

  create_table "robots_url", :force => true do |t|
    t.string "pattern", :null => false
  end

  create_table "south_migrationhistory", :force => true do |t|
    t.string   "app_name",  :null => false
    t.string   "migration", :null => false
    t.datetime "applied",   :null => false
  end

  create_table "tag", :force => true do |t|
    t.string "name", :limit => 50, :null => false
  end

  add_index "tag", ["name"], :name => "tag_name_key", :unique => true

  create_table "tagged_item", :force => true do |t|
    t.integer "tag_id",          :null => false
    t.integer "content_type_id", :null => false
    t.integer "object_id",       :null => false
  end

  add_index "tagged_item", ["content_type_id"], :name => "tagged_item_content_type_id"
  add_index "tagged_item", ["object_id"], :name => "tagged_item_object_id"
  add_index "tagged_item", ["tag_id", "content_type_id", "object_id"], :name => "tagged_item_tag_id_key", :unique => true
  add_index "tagged_item", ["tag_id"], :name => "tagged_item_tag_id"

  create_table "thumbnail_kvstore", :id => false, :force => true do |t|
    t.string "key",   :limit => 200, :null => false
    t.text   "value",                :null => false
  end

  create_table "watchlist_subscription", :force => true do |t|
    t.integer  "user_id",         :null => false
    t.datetime "date",            :null => false
    t.integer  "content_type_id", :null => false
    t.integer  "object_id",       :null => false
  end

  add_index "watchlist_subscription", ["content_type_id"], :name => "watchlist_subscription_content_type_id"
  add_index "watchlist_subscription", ["object_id"], :name => "watchlist_subscription_object_id"
  add_index "watchlist_subscription", ["user_id", "content_type_id", "object_id"], :name => "watchlist_subscription_user_id_key", :unique => true
  add_index "watchlist_subscription", ["user_id"], :name => "watchlist_subscription_user_id"

end
