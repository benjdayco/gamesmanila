require 'rails_helper'

describe UsersController, :type => :controller do
  
  let(:user) { User.create!(email: 'benjie.dayco@gmail.com', password: 'bolter') }
  let(:user2) { User.create!(email: 'bob@test.com', password: 'tester') }
      
  describe 'GET #show' do
    context 'User is logged in' do
        before do
          sign_in user
        end

      it 'loads correct user details' do
        get :show, id: user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end

      it 'can only see own page' do
        get :show, id: user2.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'No user is logged in' do
      it 'redirects to login' do
        get :show, id: user.id
        expect(response).to redirect_to('/users/sign_in')
      end
    end

  end

end