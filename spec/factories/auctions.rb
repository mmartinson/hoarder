FactoryGirl.define do
  factory :auction do
  item "Corded Telephone"
  details "A fine used electronic device"
  reserve 100
  close_time 5.days.from_now
  end

end
