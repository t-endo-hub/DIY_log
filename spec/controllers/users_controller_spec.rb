require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  before do
    @user = FactoryBot.create(:user_tanaka)
  end
  describe 'ユーザー詳細ページ' do
    context 'ユーザー詳細ぺ-ジが正しく表示される' do
      before do
        sign_in @user
        get :show, params: { id: @user.id }
      end
      it 'リクエストは200 OKとなること' do
        expect(response.status).to eq 200
      end
    end

    context 'ログインしていないユーザーはユーザー詳細ページが正しく表示されない' do
      before do
        get :show, params: { id: @user.id }
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
end
