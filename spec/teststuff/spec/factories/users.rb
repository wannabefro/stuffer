# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Stuff"
    email "Me"
    number 23
    stuffed true
    food 'cucumber'
  end
end
