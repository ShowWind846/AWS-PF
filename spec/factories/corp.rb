FactoryBot.define do
  factory :corp do
    id                    {999}
    last_name             {"斎藤"}
    first_name            {"真也"}
    email                 {"corp@example.com"}
    password              {"testcorp0141"}
    password_confirmation {password}
  end
end