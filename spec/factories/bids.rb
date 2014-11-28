FactoryGirl.define do
  factory :bid do
    user nil
    auction nil
    sequence(:price) {|n| 10+n}
  end

end
