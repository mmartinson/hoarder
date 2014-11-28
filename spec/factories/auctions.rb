FactoryGirl.define do
  factory :auction do
  item "Corded Telephone"
  details "A fine used electronic device"
  reserve 100
  close Date.yesterday
  aasm_state 'published'
  association :user, factory: :user 
  end

end
