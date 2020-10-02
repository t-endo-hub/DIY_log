require 'rails_helper'

RSpec.describe Material, type: :model do
  describe '材料機能' do
    before do
      @user = FactoryBot.create(:user_tanaka)
      @post = FactoryBot.create(:post)
      @material = FactoryBot.create(:material)
    end
    context 'データが正しく保存される' do
      it '全て入力してあるので保存される' do
        expect(@material).to be_valid
      end
    end

    context 'データが正しく保存されない' do
      it 'post_idがnilだと登録できない' do
        @material.post_id = ''
        expect(@material).to_not be_valid
      end

      it 'nameがnilだと登録できない' do
        @material.name = ''
        expect(@material).to_not be_valid
        expect(@material.errors[:name]).to include("を入力してください")
      end
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Postモデルとの関係' do
      let(:target) { :post }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
