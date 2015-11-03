namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    require 'populator'
    require 'faker'
    
    30.times do |n|
      email = "user-#{n+1}@example.com"
      password = "password"
      User.create!( email: email,
                    password: password)
    end

    Post.populate 100 do |post|
        post.body = Faker::Hacker.say_something_smart,
        post.user_id = Random.rand(1...30)
    end    

  end
end