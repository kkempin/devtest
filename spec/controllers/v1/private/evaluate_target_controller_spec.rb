require 'rails_helper'

describe V1::Private::EvaluateTargetController, type: 'controller' do
  let(:token) { 'token' }
  let(:wrong_token) { 'wrong_token' }
  let(:country_code) { 'pl' }
  let(:panel_provider) { create(:panel_provider, code: 'Panel1') }
  let(:country) { create(:country, country_code: country_code, panel_provider: panel_provider) }
  let!(:target_group) do
    create(:target_group, panel_provider: panel_provider, countries: [country])
  end

  describe '#index' do
    context 'without a proper auth token' do
      it 'responds with an error if token not provided' do
        post :create, country_code: country_code
        expect(response).not_to be_success
      end

      it 'responds with an error if token is wrong' do
        authorization_headers(wrong_token)
        post :create, country_code: country_code
        expect(response).not_to be_success
      end
    end

    context 'with a proper auth token' do

      context 'without all neccessary params' do
        before do
          authorization_headers(token)
        end

        it 'without country_code' do
          expect {
            post :create, target_group_id: target_group.id, locations: [{id: 1, panel_size: 200}]
          }.to raise_error(RailsParam::Param::InvalidParameterError)
        end

        it 'without target_group_id' do
          expect {
            post :create, country_code: country_code, locations: [{id: 1, panel_size: 200}]
          }.to raise_error(RailsParam::Param::InvalidParameterError)
        end

        it 'without locations' do
          expect {
            post :create, country_code: country_code, target_group_id: target_group.id
          }.to raise_error(RailsParam::Param::InvalidParameterError)
        end

        it 'with wrong locations structure' do
          expect {
            post :create,
              country_code: country_code,
              target_group_id: target_group.id,
              locations: [{id: 1}]
          }.to raise_error(RailsParam::Param::InvalidParameterError)
        end

      end

      context 'with all valid params' do
        before do
          authorization_headers(token)
          post :create,
              country_code: country_code,
              target_group_id: target_group.id,
              locations: [{id: 1, panel_size: 200}]
        end

        it 'responds successfully' do
          expect(response).to be_success
        end

        it 'should calculate proper price' do
          VCR.use_cassette("google_pl") do
            expect(response.body).to eq('76')
          end
        end
      end
    end
  end
end
