FactoryBot.define do
  factory :corp do
    id                    {999}
    last_name             {"ζθ€"}
    first_name            {"ηδΉ"}
    email                 {"corp@example.com"}
    password              {"testcorp0141"}
    password_confirmation {password}
  end
end