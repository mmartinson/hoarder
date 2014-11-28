FactoryGirl.define do
  factory :user do
  sequence(:username) {|n| Faker::Name.last_name+n.to_s}
  email Faker::Internet.email
  password Faker::Internet.password(8)
  end
end
