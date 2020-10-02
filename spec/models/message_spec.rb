require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'メッセージ機能' do
    before do
      @user = FactoryBot.create(:user_tanaka)
      @room = FactoryBot.create(:room)
      @message = Message.create(user_id: @user.id, room_id: @room.id, content: 'test')
    end
    it 'メッセージを追加できる' do
      expect(@message).to be_valid
    end

    context 'メッセージを追加できない' do
      it 'ユーザーがnilなので追加できない' do
        @message.user_id = nil
        expect(@message).to_not be_valid
      end

      it 'ルームがnilなので追加できない' do
        @message.room_id = nil
        expect(@message).to_not be_valid
      end

      it 'contentがnilなので追加できない' do
        @message.content = nil
        expect(@message).to_not be_valid
      end

      it 'contentが151文字以上なので追加できない' do
        @message.content = 'a' * 151
        expect(@message).to_not be_valid
      end
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

    context 'Roomモデルとの関係' do
      let(:target) { :room }

      it 'N:1となっている' do
        expect(association.macro).to eq :belongs_to
      end
    end
  end
end
