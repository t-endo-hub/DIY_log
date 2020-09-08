FactoryBot.define do
  factory :comment do
    comment { 'とても良い感じですね' }
    user_id { 1 }
    post_id { 1 }
  end
end
