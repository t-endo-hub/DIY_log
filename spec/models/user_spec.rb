require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user_tanaka) }
  let(:other) { FactoryBot.build(:user_yamada) }

  describe '新規登録機能' do
    it 'ユーザー新規登録できること' do
      user.save
      expect(user).to be_valid

      add_user = User.find(1)
      expect(add_user.name).to eq('田中太郎')
      expect(add_user.email).to eq('exsample@gmail.com')
    end

    it 'nameがnilだと登録されない' do
      user.name = ''
      expect(user).to_not be_valid
    end

    it 'emailが重複すると登録されない' do
      user.save
      other.email = user.email
      expect(other.save).to be_falsey
    end

    it 'emailがnilだと登録されない' do
      user.email = ''
      expect(user).to_not be_valid
    end

    it 'passwordがnilだと登録されない' do
      user.password = ''
      expect(user).to_not be_valid
    end
  end  
end
