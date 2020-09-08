FactoryBot.define do
  factory :user do
  end

  factory :user_tanaka, class: 'User' do
    name      { '田中太郎' }
    email     { 'tanaka@gmail.com' }
    password  { '123456' }
  end

  factory :user_yamada, class: 'User' do
    name      { '山田花子' }
    email     { 'yamada@gmail.com' }
    password  { '000000' }
  end
end
