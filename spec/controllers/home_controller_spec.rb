require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe "ホーム画面について" do
    it "ログインしていない場合、root_pathで表示される" do
      get "top"
      expect(response).to have_http_status(200)
    end
  end
end
