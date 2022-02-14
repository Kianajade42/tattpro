
require 'sinatra'
require 'bundler/setup'
require 'capybara/dsl'
Bundler.require



set :database, {adapter: "sqlite3", database: "development.db"} 
require_all 'app'