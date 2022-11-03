require 'rails_helper'

RSpec.describe 'Customer' do
  describe 'Customer creation' do
    it 'creates user' do
        user_params = {
            "first_name": "Mary",
            "last_name": "Turnip",
            "email": "Mary@gmail.com",
            "address": "123 Oak st"
          }
        post '/api/v1/customers', params: user_params

        expect(response).to be_successful
        expect(response.status).to eq(201)
    end

    it 'fails if duplicate email' do
        user_params = {
            "first_name": "Mary",
            "last_name": "Turnip",
            "email": "Mary@gmail.com",
            "address": "123 Oak st"
          }
        post '/api/v1/customers', params: user_params

        user_params = {
            "first_name": "Mary",
            "last_name": "Turnip",
            "email": "Mary@gmail.com",
            "address": "123 Oak st"
          }
        post '/api/v1/customers', params: user_params

        expect(response).to_not be_successful
        expect(response.status).to eq(401)
        expect(response.body).to eq("{\"error\":\"Duplicate Customer Email\"}")
    end
  end
end