FactoryGirl.define do
  factory :auction do
  item "Corded Telephone"
  details "A fine used electronic device"
  close "5.days.from_now"
  reserve 100
  aasm_state 'published'
  user ""
  end

end
