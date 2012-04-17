#Allows us to define objects and insert them into the database for testing purposes
FactoryGirl.define do
  factory :user do
    name "Ryan MacGillivray"
    email "ryan.macgillivray@jtcfurnituregroup.com"
    password "foobar"
    password_confirmation "foobar"
  end
end