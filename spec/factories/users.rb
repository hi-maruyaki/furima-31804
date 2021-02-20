FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {"丸山"}
    first_name            {"洋行"}
    last_kana             {"マルヤマ"}
    first_kana            {"ヒロユキ"}
    birth_day             {1995-02-23}
  end
end