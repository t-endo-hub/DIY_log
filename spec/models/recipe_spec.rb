require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'レシピ投稿機能' do
    before do
      @user = FactoryBot.create(:user_tanaka)
      @post = FactoryBot.create(:post)
      @recipe = FactoryBot.create(:recipe)
    end
    context 'データが正しく保存される' do
      it '全て入力してあるので保存される' do
        expect(@recipe).to be_valid
      end
    end

    context 'データが正しく保存されない' do
      it 'post_idがnilだと登録できない' do
        @recipe.post_id = ''
        expect(@recipe).to_not be_valid
      end

      it 'contentがnilだと登録できない' do
        @recipe.content = ''
        expect(@recipe).to_not be_valid
        expect(@recipe.errors[:content]).to include('を入力してください')
      end

      it 'contentが151文字以上だと投稿できない' do
        @recipe.content = 'a' * 151
        expect(@recipe).to_not be_valid
      end
    end
  end
end
