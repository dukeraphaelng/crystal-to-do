require "action-controller/logger"
require "secrets-env"

module App
  NAME    = "Spider-Gazelle To-do App"
  VERSION = {{ `shards version "#{__DIR__}"`.chomp.stringify.downcase }}

  Log         = ::Log.for(NAME)
  LOG_BACKEND = ActionController.default_backend

  ENVIRONMENT = ENV["SG_ENV"]? || "development"

  # ENV PORT for Heroku
  DEFAULT_PORT          = (ENV["PORT"]? || ENV["SG_SERVER_PORT"]? || 3000).to_i
  DEFAULT_HOST          = ENV["SG_SERVER_HOST"]? || "0.0.0.0" # "127.0.0.1"
  DEFAULT_PROCESS_COUNT = (ENV["SG_PROCESS_COUNT"]? || 1).to_i

  STATIC_FILE_PATH = ENV["PUBLIC_WWW_PATH"]? || "./www"

  COOKIE_SESSION_KEY    = ENV["COOKIE_SESSION_KEY"]? || "_spider_gazelle_"
  COOKIE_SESSION_SECRET = ENV["COOKIE_SESSION_SECRET"]? || "4f74c0b358d5bab4000dd3c75465dc2c"

  # ENV DATABASE_URL for Heroku
  POSTGRES_URI_PROD = ENV["DATABASE_URL"]? || ENV["POSTGRES_URI"]? || "postgresql://postgres:password@localhost:5432/crystal_to_do_prod"
  POSTGRES_URI_TEST = ENV["POSTGRES_URI"]? || "postgresql://postgres:password@localhost:5432/crystal_to_do_test"

  def self.running_in_production?
    ENVIRONMENT == "production"
  end
end
