require_relative 'puppy'


FactoryGirl.define do
  factory :order do
    name 'Cheezy'
    address '123 Main'
    email 'cheezy@me.com'
    pay_type 'Check'
  end

  factory :adoption do
    association :order
    puppy Puppy.find_by_name('Hanna')
  end
end