require 'rails_helper'

describe V1::Private::TargetGroupsController, type: 'controller' do
  let(:token) { 'token' }
  let(:wrong_token) { 'wrong_token' }
  let(:country_code) { 'pl' }
  let(:panel_provider) { create(:panel_provider) }
  let(:country) { create(:country, country_code: country_code, panel_provider: panel_provider) }
  let!(:target_group) do
    create(:target_group, panel_provider: panel_provider, countries: [country])
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

      it 'should fetch target group for a give country code' do
        tg_json = response_json.first
        expect(tg_json['id']).to eq(target_group.id)
        expect(tg_json['name']).to eq(target_group.name)
        expect(tg_json['external_id']).to eq(target_group.external_id)
        expect(tg_json['secret_code']).to eq(target_group.secret_code)
        expect(tg_json['children']).to eq([])
      end
    end
  end
end
