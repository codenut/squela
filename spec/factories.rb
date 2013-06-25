FactoryGirl.define do

  factory :user_detail do 
    fullname 'John Doe'
  end

  factory :user do 
    email 'user@test.com'
    password 'usertest'
    password_confirmation 'usertest'
    association :user_detail
  end

  factory :project do |p|
    p.name 'Test Project'
  end
end
