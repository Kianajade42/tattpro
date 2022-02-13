
# ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'capybara/dsl'
Bundler.require
# (:default, "development.db")


set :database, {adapter: "sqlite3", database: "development.db"} 
require_all 'app'