#Allows us to define objects and insert them into the database for testing purposes
FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com" }
    password "foobar"
    password_confirmation "foobar"
    
    factory :admin do
      admin true
    end
  end
  
  factory :asset do
    asset_description "Lorem ipsum"
    asset_type "Laptop"
    status "Allocated"
    sequence(:serial_no) { |n| "TEST#{n}" }
    comment "Test test test"
    date_purchased "15/05/12"
    user
  end
end