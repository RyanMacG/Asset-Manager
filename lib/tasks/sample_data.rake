namespace :db do
  desc "Fill database with sample data"
  task  populate: :environment do
    admin= User.create!(name: "Example User",
                        email: "admin@jtcfurnituregroup.com",
                        password: "foobar",
                        password_confirmation: "foobar")
    admin.toggle!(:admin)
    User.create!(name: "Example User",
                 email: "example@jtcfurnituregroup.com",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@jtcfurnituregroup.com"
      password = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 6)
    50.times do
      description = Faker::Lorem.sentence(1)
      serial = "ABC123"
      status = "allocated"
      type   = "laptop"
      users.each { |user| user.assets.create!(asset_description: description, serial_no: serial,
                                              status: status, asset_type: type) }
    end
  end
end