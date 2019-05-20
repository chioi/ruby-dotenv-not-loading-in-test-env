# frozen_string_literal: true

require 'dotenv/load'
require 'sinatra'
require 'sinatra/reloader' if development?

set :bind, '0.0.0.0'

get ENV['API_URL'] do
  'Hello World!'
end
