require_relative 'request_data_service'
RSpec.describe 'Request Data' do
  let(:service) { RequestDataService.new('http://localhost:3000/test_request') }

  it ' number of records is 3 ' do
    data = service.request_data
    expect(data.size).to eq(3)
  end

  it ' data struct is name and age ' do
    data = service.request_data
    expect(data[0]).to have_key('name')
    expect(data[0]).to have_key('age')
  end

  it ' data specific field ' do
    data = service.request_data { |data| data['age'] }
    expect(data).to eq(%w[38 39 37])
  end
end
