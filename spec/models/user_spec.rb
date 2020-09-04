require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録機能' do
    it 'ユーザー新規登録できること' do
      user = User.new(
        name: '田中太郎',
        email: 'exsample@gmail.com',
        password: '123456'
      )

      expect(user).to be_valid

      user.save

      add_user = User.find(1)
      expect(add_user.name).to eq('田中太郎')
      expect(add_user.email).to eq('exsample@gmail.com')
    end
  end
end
