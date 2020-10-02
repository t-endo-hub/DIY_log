require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    FactoryBot.create(:user_tanaka)
    FactoryBot.create(:user_yamada)
    @relationship = Relationship.create(user_id: 1, follow_id: 2)
  end

  describe 'フォローに関するテスト' do
    it '成功' do
      expect(@relationship).to be_valid
    end
  end

  context '失敗' do
    it 'followerがnilだと失敗' do
      @relationship.user_id = nil
      expect(@relationship).not_to be_valid
    end

    it 'followedがnilだと失敗' do
      @relationship.follow_id = nil
      expect(@relationship).not_to be_valid
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Userモデルとの関係' do
      let(:target) { :user }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end

    context 'Userモデル(follow)との関係' do
      let(:target) { :follow }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
