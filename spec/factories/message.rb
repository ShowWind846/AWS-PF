FactoryBot.define do
  before do
    visit new_user_session_path
  end
  factory :message do
    user_id {Faker::Number.number(digits: 1)}
    room_id {Faker::Number.number(digits: 1)}
    message {Faker::Lorem.sentences(number: 1)}
  end
end