FactoryBot.define do
  factory :user do
    last_name             {Faker::Name.last_name}
    first_name            {Faker::Name.first_name}
    email                 {Faker::Internet.email}
    # password に対し英数字組み合わせ制限などしている場合は手動で値を指定するしかない。
    password              {Faker::Internet.password(min_length: 8)}
    password_confirmation {password}
  end
end