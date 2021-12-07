FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@exsample'}
    password              {'123abc'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'太朗'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'タロウ'}
    dob                   {'2000/1/1'}
  end
end