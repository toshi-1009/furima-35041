FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 {Faker::Internet.free_email}
    password              { '123456a' }
    password_confirmation { password }
    first_name            { '山田' }
    last_name             { '太郎' }
    first_name_kana       { 'ヤマダ' }
    last_name_kana        { 'タロウ' }
    birthday              { '1934-02-03' }
  end
end
