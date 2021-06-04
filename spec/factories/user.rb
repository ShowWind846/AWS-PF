FactoryBot.define do
  factory :user do
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
  end

  factory :testuser, class: User do
    id                    {999}
    last_name             {"田中"}
    first_name            {"たかし"}
    email                 {"test@example.com"}
    password              {"test0141"}
    password_confirmation {password}
  end
end