# ENV['SINATRA_ENV'] ||= "development"

# require 'bundler/setup'
# require 'capybara/dsl'
# Bundler.require(:default, ENV['SINATRA_ENV'])





#   require_all 'app'
# require 'bundler'
# Bundler.require
# ActiveRecord::Base.establish_connection(
# :adapter => 'sqlite3',
# set :database, {adapter: "sqlite3", database: "development.db"} 

#  :database => 'db/development.sqlite'
# )
ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'capybara/dsl'
Bundler.require(:default, ENV['SINATRA_ENV'])


set :database, {adapter: "sqlite3", database: "development.db"} 
require_all 'app'