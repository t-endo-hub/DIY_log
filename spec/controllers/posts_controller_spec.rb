require 'rails_helper'

RSpec.describe Users::PostsController, type: :controller do
  before do
    @user = FactoryBot.create(:user_tanaka)
    @post = FactoryBot.create(:post)
  end

  describe '新規投稿ページ' do
    context '新規投稿ぺ-ジが正しく表示される' do
      before do
        sign_in @user
        get :new
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていないユーザーは新規投稿ページが正しく表示されない' do
      before do
        get :new
      end
      it 'リクエストが200 OKにならないこと' do
        expect(response.status).to_not eq 200
      end

      it '302レスポンスが返ってきているか？' do
        expect(response).to have_http_status '302'
      end

      it 'ログイン画面にリダイレクトされているか？' do
        expect(response).to redirect_to '/users/sign_in'
      end
    end
  end

  describe '投稿一覧ページ' do
    context '投稿一覧ぺ-ジが正しく表示される' do
      before do
        get :index
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe '投稿編集ページ' do
    context '投稿編集ページが表示される' do
      before do
        sign_in @user
        get :edit, params: { id: @post.id }
      end
      it 'リクエストは200 OKになること' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていないユーザーは投稿編集ページが正しく表示されない' do
      before do
        get :edit, params: { id: @post.id }
      end
      it 'リクエストが200 OKにならないこと' do
        expect(response.status).to_not eq 200
      end

      it '302レスポンスが返ってきているか？' do
        expect(response).to have_http_status '302'
      end

      it 'ログイン画面にリダイレクトされているか？' do
        expect(response).to redirect_to '/users/sign_in'
      end
    end

    context '自分の投稿以外の編集ページが表示されない' do
      before do
        sign_in FactoryBot.create(:user_yamada)
        @user = User.create(name: '田中', email: 'tanaka@gmail.com', password: '123123')
        get :edit, params: { id: @post.id }
      end
      it 'リクエストが200 OKにならないこと' do
        expect(response.status).to_not eq 200
      end
      it 'マイページにリダイレクトされているか？' do
        expect(response).to redirect_to '/users/users/2'
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
