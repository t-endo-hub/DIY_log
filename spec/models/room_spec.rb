require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'アソシエーションのテスト' do
    let(:association) do
      described_class.reflect_on_association(target)
    end

    context 'Messageモデルとの関係' do
      let(:target) { :messages }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end

    context 'Entryモデルとの関係' do
      let(:target) { :entries }

      it '1:Nとなっている' do
        expect(association.macro).to eq :has_many
      end
    end
  end
end
