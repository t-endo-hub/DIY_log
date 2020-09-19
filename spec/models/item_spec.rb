require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '使用工具機能' do
    before do
      @user = FactoryBot.create(:user_tanaka)
      @post = FactoryBot.create(:post)
      @item = FactoryBot.create(:item)
    end
    context 'データが正しく保存される' do
      it '全て入力してあるので保存される' do
        expect(@item).to be_valid
      end
    end

    context 'データが正しく保存されない' do
      it 'post_idがnilだと登録できない' do
        @item.post_id = nil
        expect(@item).to_not be_valid
      end

      it 'name' do
        @item.name = nil
        expect(@item).to_not be_valid
        expect(@item.errors[:name]).to include("can't be blank")
      end
    end
  end
end
