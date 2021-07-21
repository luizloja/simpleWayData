require 'sinatra'
require_relative 'request_data_service'

class Server < Sinatra::Base
  before do
    content_type 'application/json'
  end

  get '/' do
    twitter_service = RequestDataService.new('https://takehome.io/twitter')
    json_twitter = twitter_service.request_data { |data| data['tweet'] }

    facebook_service = RequestDataService.new('https://takehome.io/facebook')
    json_facebook = facebook_service.request_data { |data| data['status'] }

    JSON.generate(twitter: json_twitter, facebook: json_facebook)
  rescue Exception => e
    status 500
    JSON.generate(error: e.message)
  end

  get '/test_request' do
    JSON.generate([{ name: 'luiz', age: '38' },
                   { name: 'Augusto', age: '39' },
                   { name: 'Iure', age: '37' }])
  end
end
