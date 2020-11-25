FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@example"}
    password              {"0000aaa"}
    password_confirmation {password}
    last_name             {"やまだ"}
    first_name            {"たろう"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"タロウ"}
    birth_date            {"1997-07-15"}

  end
end  