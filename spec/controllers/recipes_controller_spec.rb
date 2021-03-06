require 'rails_helper'

RSpec.describe Users::RecipesController, type: :controller do
  before do
    @user = FactoryBot.create(:user_tanaka)
    @post = FactoryBot.create(:post)
    @recipe = FactoryBot.create(:recipe)
  end
  describe 'レシピ一覧ページ' do
    context 'レシピ一覧ページが正しく表示される' do
      before do
        get :index, params: { post_id: @post.id }
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end
  end

  describe 'レシピ投稿ページ' do
    context 'レシピ投稿ページが正しく表示される' do
      before do
        sign_in @user
        get :new, params: { post_id: @post.id }
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていないユーザーはレシピ投稿ページが正しく表示されない' do
      before do
        get :new, params: { post_id: @post.id }
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

  describe '投稿削除' do
    it '投稿削除される' do
      sign_in @user
      expect { @recipe.destroy }.to change { Recipe.count }.by(-1)
    end
  end
end
