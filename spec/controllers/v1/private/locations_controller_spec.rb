require 'rails_helper'

describe V1::Private::LocationsController, type: 'controller' do
  let(:token) { 'token' }
  let(:wrong_token) { 'wrong_token' }
  let(:country_code) { 'pl' }
  let(:panel_provider) { create(:panel_provider) }
  let(:country) { create(:country, country_code: country_code, panel_provider: panel_provider) }
  let(:location_group) do
    create(:location_group, country: country, panel_provider: panel_provider)
  end
  let!(:location) do
    create(:location, location_groups: [location_group])
  end

  describe '#index' do
    context 'without a proper auth token' do
      it 'responds with an error if token not provided' do
        get :index, country_code: country_code
        expect(response).not_to be_success
      end

      it 'responds with an error if token is wrong' do
        authorization_headers(wrong_token)
        get :index, country_code: country_code
        expect(response).not_to be_success
      end
    end

    context 'with a proper auth token' do
      before do
        authorization_headers(token)
        get :index, country_code: country_code
      end

      it 'responds successfully' do
        expect(response).to be_success
      end

      it 'should fetch locations for a give country code' do
        location_json = response_json.first
        expect(location_json['id']).to eq(location.id)
        expect(location_json['name']).to eq(location.name)
        expect(location_json['external_id']).to eq(location.external_id)
        expect(location_json['secret_code']).to eq(location.secret_code)
      end
    end
  end
end
