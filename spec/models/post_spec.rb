require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    user = FactoryBot.create(:user_tanaka)
  end
  
  describe '投稿に関するテスト' do
    it '投稿が成功するか' do
      post = FactoryBot.create(:post)
      expect(post).to be_valid
    end
  end

  it 'titleがnilだと投稿できない' do
    post = FactoryBot.create(:post)
    post.title = ""
    expect(post).to_not be_valid
  end

  it 'titleが51文字以上だと登録できない' do
    post = FactoryBot.create(:post)
    post.title = "a" * 51
    expect(post).to_not be_valid
  end

  it 'contentが151文字以上だと登録できない' do
    post = FactoryBot.create(:post)
    post.content = "a" * 151
    expect(post).to_not be_valid
  end
end
