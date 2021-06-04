FactoryBot.define do
  factory :post do
    user_id    {"user.id"}
    title      {Faker::Lorem.sentence(word_count: 2)}
    contents   {Faker::Lorem.paragraph(sentence_count: 3)}
  end
end