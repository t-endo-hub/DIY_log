require 'rails_helper'

RSpec.describe Users::UsersController, type: :controller do
  context "本人のページの場合" do
    before do
      @user = FactoryBot.create(:user_tanaka)
      get :show, params: { id: @user.id }
    end

    it "リクエストが成功すること" do
      expect(response).to have_http_status "302"
    end
  end

  
end
