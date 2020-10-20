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
        expect(@user.errors[:name]).to include('を入力してください')
      end

      it 'emailが重複すると登録されない' do
        @other_user = User.create(name: '山田花子', email: 'yamada@email.com', password: 'yamada')
        @other_user.email = @user.email
        expect(@other_user).to_not be_valid
        expect(@other_user.errors[:email]).to include('はすでに存在します')
      end

      it 'emailがnilだと登録されない' do
        @user.email = ''
        expect(@user).to_not be_valid
        expect(@user.errors[:email]).to include('を入力してください')
      end

      it 'passwordがnilだと登録されない' do
        @user.password = ''
        expect(@user).to_not be_valid
        expect(@user.errors[:password]).to include('を入力してください')
      end

      it 'パスワードが5文字以下だと登録されない' do
        @user.password = '1234'
        expect(@user).to_not be_valid
        expect(@user.errors[:password]).to include('は6文字以上で入力してください')
      end

      it 'パスワードと確認が一致していないと登録されない' do
        @user.password_confirmation = '000001'
        expect(@user).to_not be_valid
        expect(@user.errors[:password_confirmation]).to include('とPasswordの入力が一致しません')
      end

      it '自己紹介文が200文字以下でなければ登録されない' do
        @user.discription = 'a' * 201
        @user.valid?
        expect(@user.errors[:discription]).to include('は200文字以内で入力してください')
      end
    end
  end

  describe 'アソシエーションのテスト' do
    let(:association) do
      # context＞it内に下記を記述するのと同じ
      # expect(User.reflect_on_association(:restaurants).macro).to eq :has_many
      # expect(User.reflect_on_association(:followings).class_name).to eq 'User'
      described_class.reflect_on_association(target)
    end

    context 'Postモデルとの関係' do
      let(:target) { :posts }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Postモデルとの関係' do
      let(:target) { :posts }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Likeモデルとの関係' do
      let(:target) { :likes }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Commentモデルとの関係' do
      let(:target) { :comments }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Relationshipモデルとの関係' do
      let(:target) { :relationships }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context '自分がフォローしているユーザーとの関係' do
      let(:target) { :followings }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはUser(Follow)' do
        expect(association.class_name).to eq 'User'
      end
    end

    context '自分がフォローされているユーザーとの関係' do
      let(:target) { :followers }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはUser(reverse_of_relationships)' do
        expect(association.class_name).to eq 'User'
      end
    end

    context 'Entryモデルとの関係' do
      let(:target) { :entries }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Notificationモデル(active_notifications)との関連' do
      let(:target) { :active_notifications }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはNotification' do
        expect(association.class_name).to eq 'Notification'
      end
    end

    context 'Notificationモデル(passive_notifications)との関連' do
      let(:target) { :passive_notifications }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
      it '結合するモデルのクラスはNotification' do
        expect(association.class_name).to eq 'Notification'
      end
    end
  end
end
