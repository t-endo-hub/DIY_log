FactoryBot.define do
  factory :user do
    name      { testuser }
    email     { exsample @gmail.com }
    password  { 123_456 }
  end
end
