require 'rails_helper'

RSpec.describe 'Customer' do
  describe 'Customer creation' do
    it 'creates user' do
        sub_params = {
            "title": "Green Tea Selection",
            "price": "$10.00",
            "status": "active",
            "frequency": "once a month"
          }
        post '/api/v1/subscriptions', params: sub_params

        expect(response).to be_successful
        expect(response.status).to eq(201)
    end

    it 'fails if duplicate title' do
        sub_params = {
            "title": "Green Tea Selection",
            "price": "$10.00",
            "status": "active",
            "frequency": "once a month"
          }
        post '/api/v1/subscriptions', params: sub_params

        sub_params = {
            "title": "Green Tea Selection",
            "price": "$10.00",
            "status": "active",
            "frequency": "once a month"
          }
        post '/api/v1/subscriptions', params: sub_params

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response.body).to eq("{\"error\":\"Duplicate Title\"}")
    end
  end
end