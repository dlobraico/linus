# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :issue do
    volume 1
    issue 1
    printing_deadline "2012-05-27 15:29:56"
    distribution "2012-05-27 15:29:56"
  end
end
