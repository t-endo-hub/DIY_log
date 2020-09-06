require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user_tanaka)
    @post = FactoryBot.create(:post)
  end
  describe 'GET #new' do
    it '正常にレスポンスが返ってきているか？' do
      sign_in @user
      get :new
      expect(response).to have_http_status(:success)
    end

    context '他のユーザーの場合' do
      it '正常にレスポンスが返ってきていないか？' do
        get :new
        expect(response).to_not be_success
      end

      it '302レスポンスが返ってきているか？' do
        get :new
        expect(response).to have_http_status '302'
      end

      it 'ログイン画面にリダイレクトされているか？' do
        get :new
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe 'GET #show' do
    it '正常にレスポンスが返ってきているか？' do
      sign_in @user
      get :show, params: { id: @post.id }
      expect(response).to have_http_status(:success)
    end

    # sign_inがないので未ログイン
    context '他のユーザーの場合' do
      it '正常にレスポンスが返ってきていないか？' do
        get :show, params: { id: @post.id }
        expect(response).to_not be_success
      end

      it '302レスポンスが返ってきているか？' do
        get :show, params: { id: @post.id }
        expect(response).to have_http_status '302'
      end

      it 'ログイン画面にリダイレクトされているか？' do
        get :show, params: { id: @post.id }
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe 'GET #edit' do
    it '正常にレスポンスが返ってきているか？' do
      sign_in @user
      get :edit, params: { id: @post.id }
      expect(response).to have_http_status(:success)
    end

    context '他のユーザーの場合' do
      it '正常にレスポンスが返ってきていないか？' do
        get :edit, params: { id: @post.id }
        expect(response).to_not be_success
      end

      it '302レスポンスが返ってきているか？' do
        get :edit, params: { id: @post.id }
        expect(response).to have_http_status '302'
      end

      it 'ログイン画面にリダイレクトされているか？' do
        get :edit, params: { id: @post.id }
        expect(response).to redirect_to '/users/sign_in'
      end
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
