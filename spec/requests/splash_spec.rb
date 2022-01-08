require 'rails_helper'

RSpec.describe '/splash', type: :request do
  describe 'GET /index' do
    before(:each) do
      get root_path
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end

    it 'displays the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should show the action buttons' do
      expect(response.body).to include('LOGIN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
