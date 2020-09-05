require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    FactoryBot.create(:user_tanaka)
    @post = FactoryBot.create(:post)
  end

  describe '投稿に関するテスト' do
    context '投稿に成功する場合' do
      it '投稿が成功するか' do
        expect(@post).to be_valid
      end
    end
  end

  context '投稿に失敗する場合' do
    it 'titleがnilだと投稿できない' do
      @post.title = ''
      expect(@post).to_not be_valid
    end

    it 'titleが51文字以上だと投稿できない' do
      @post.title = 'a' * 51
      expect(@post).to_not be_valid
    end

    it 'contentが151文字以上だと投稿できない' do
      @post.content = 'a' * 151
      expect(@post).to_not be_valid
    end
  end
end
