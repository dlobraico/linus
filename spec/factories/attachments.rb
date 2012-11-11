# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :attachment do
    description "MyText"
    file "MyString"
    attachable nil
  end
end
