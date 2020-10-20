require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'コメント機能' do
    before do
      @user = FactoryBot.create(:user_tanaka)
      @post = FactoryBot.create(:post)
      @comment = FactoryBot.create(:comment)
    end
    context 'データが正しく保存される' do
      it '全て入力してあるので保存される' do
        expect(@comment).to be_valid
      end
    end

    context 'データが正しく保存されない' do
      it 'post_idがnilだと登録できない' do
        @comment.post_id = ''
        expect(@comment).to_not be_valid
      end

      it 'commentがnilだと登録できない' do
        @comment.comment = ''
        expect(@comment).to_not be_valid
        expect(@comment.errors[:comment]).to include('を入力してください')
      end

      it 'commentが151文字以上だと投稿できない' do
        @comment.comment = 'a' * 151
        expect(@comment).to_not be_valid
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

      context 'Postモデルとの関係' do
        let(:target) { :post }

        it 'N:1となっている' do
          expect(association.macro).to eq :belongs_to
        end
      end

      context 'Notificationモデルとの関係' do
        let(:target) { :notifications }

        it '1:Nとなっている' do
          expect(association.macro).to eq :has_many
        end
      end
    end
  end
end
