require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns http success' do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

  describe 'Post #create' do
    before do
      @post = FactoryBot.build(:post)
    end

    context '@postが保存できた時' do
      it 'データベースの値が保存される' do
        expect(@post.save).to be_truthy
      end
    end
  end
end
