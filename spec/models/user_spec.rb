require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録機能' do
    context '正しく保存される' do
      before do
        @user = User.new(name: '田中一郎', email: 'tanaka@email.com', password: 'tanaka')
        @user.save
      end
      it '全て入力してあるので保存される' do
        expect(@user).to be_valid
      end
    end

    context 'データが正しく保存されない' do
      before do
        @user = User.new(name: '田中一郎', email: 'tanaka@email.com', password: 'tanaka')
        @user.save
      end
      it 'nameがnilだと登録されない' do
        @user.name = ''
        expect(@user).to_not be_valid
        expect(@user.errors[:name]).to include("can't be blank")
      end

      it 'emailが重複すると登録されない' do
        @other_user = User.create(name: '山田花子', email: 'yamada@email.com', password: 'yamada')
        @other_user.email = @user.email
        expect(@other_user).to_not be_valid
        expect(@other_user.errors[:email]).to include('has already been taken')
      end

      it 'emailがnilだと登録されない' do
        @user.email = ''
        expect(@user).to_not be_valid
        expect(@user.errors[:email]).to include("can't be blank")
      end

      it 'passwordがnilだと登録されない' do
        @user.password = ''
        expect(@user).to_not be_valid
        expect(@user.errors[:password]).to include("can't be blank")
      end

      it 'パスワードが5文字以下だと登録されない' do
        @user.password = '1234'
        expect(@user).to_not be_valid
        expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'パスワードと確認が一致していないと登録されない' do
        @user.password_confirmation = '000001'
        expect(@user).to_not be_valid
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end
  end
end
