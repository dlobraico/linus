# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :submission do
    headline "MyString"
    byline "MyString"
    body "MyText"
  end
end
