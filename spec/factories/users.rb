
FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email {Faker::Internet.email}
    password              {"test1234"}
    password_confirmation {password}
    last_name             {"山田"}
    first_name            {"太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birthday              {"2020-01-01"}
  end

  factory :user_with_random_password, parent: :user do
    password { Faker::Internet.password(min_length: 8) }
    password_confirmation { password }
  end
end

