FactoryBot.define do
  factory :post do
    user_id { 1 }
    post_tag_id { 1 }
    title {'流木で作った椅子'}
    content {'いい感じの流木で作ったいい感じの椅子です'}
    
  end
end
