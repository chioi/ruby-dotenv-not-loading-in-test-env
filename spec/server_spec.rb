# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require 'uri'
require 'server'
require 'rspec'
require 'rack/test'

RSpec.describe 'Chat server API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'Says hello' do
    get ENV['API_URL']
    expect(last_response).to be_ok
    expect(last_response.body).to eq('Hello World!')
  end
end
