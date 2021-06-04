FactoryBot.define do
  factory :post do
    user_id    {"user.id"}
    title      {"新製品が発売になりました。"}
    contents   {Faker::Lorem.paragraph(sentence_count: 3)}
  end
end