require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user_tanaka)
    @post = FactoryBot.create(:post)
  end

  describe '新規投稿機能' do
    context '正しく保存される' do
      it '全て入力してあるので保存される' do
        expect(@post).to be_valid
      end
    end
  end

  context '投稿に失敗する場合' do
    it 'user_idがnilだと登録できない' do
      @post.user_id = ''
      expect(@post).to_not be_valid
    end

    it 'titleがnilだと投稿できない' do
      @post.title = ''
      expect(@post).to_not be_valid
      expect(@post.errors[:title]).to include("can't be blank")
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
