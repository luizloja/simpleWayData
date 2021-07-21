require 'httparty'

class RequestDataService
  attr_accessor :url, :maximum_tries

  def initialize(url, maximum_tries = 5)
    @url = url
    @maximum_tries = maximum_tries
  end

  def request_data(&block)
    tries = 0
    loop do
      response = HTTParty.send(:get, url)
      next unless response.code == 200

      begin
        json = JSON.parse(response.body)
        return json.map(&block) if block_given?

        return json
      rescue StandardError => e
        tries += 1
        raise Exception, "Error trying to access #{url}" if tries > maximum_tries
      end
    end
  end
end
