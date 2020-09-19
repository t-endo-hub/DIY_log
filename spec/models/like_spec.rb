require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'いいね機能' do
    before do
      @user = FactoryBot.create(:user_tanaka)
      @post = FactoryBot.create(:post)
      @like = Like.create(user_id: @user.id, post_id: @post.id)
    end
    context 'いいねできる' do
      it 'ユーザー、投稿が存在しているのでいいねできる' do
        expect(@like).to be_valid
      end
    end

    context 'いいねできない' do
      it 'ユーザーが存在しないのでいいねできない' do
        @like.user_id = nil
        expect(@like).to_not be_valid
      end

      it '投稿が存在しないのでいいねできない' do
        @like.post_id = nil
        expect(@like).to_not be_valid
      end
    end
  end
end
